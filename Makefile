SHELL := /bin/bash

.DEFAULT_GOAL := help

# color control sequences captured at parse time
GREEN := $(shell tput setaf 2 2>/dev/null || printf '\033[32m')
YELLOW := $(shell tput setaf 3 2>/dev/null || printf '\033[33m')
RED := $(shell tput setaf 1 2>/dev/null || printf '\033[31m')
BOLD := $(shell tput bold 2>/dev/null || printf '\033[1m')
RESET := $(shell tput sgr0 2>/dev/null || printf '\033[0m')

UNAME_S := $(shell uname -s 2>/dev/null)
ifeq ($(UNAME_S),Darwin)
DETECTED_OS := macos
else
DETECTED_OS := unknown
endif

BREW_PACKAGES := skaffold k6 k9s htop grafanactl uv opencode openskills openspec
BREW_CASK_PACKAGES := ghostty
SKILL_DIRS := $(sort $(dir $(wildcard plugins/*/skills/*/SKILL.md)))
CLAUDE_SKILLS_DIR := $(HOME)/.claude/skills
VSCODE_PATH_LINE := export PATH="$$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
OPENSPEC_TELEMETRY_LINE := export OPENSPEC_TELEMETRY=0
DO_NOT_TRACK_LINE := export DO_NOT_TRACK=1
SKILL ?=

.PHONY: help setup teardown list-skills add-skills-opencode add-skill-opencode remove-skills-opencode remove-skill-opencode add-skills-claude add-skill-claude remove-skills-claude remove-skill-claude

help:
	@printf "$(BOLD)$(GREEN)Available targets:$(RESET)\n"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "help" "$(RESET)" "Show this help message"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "setup" "$(RESET)" "Install the tools listed in SETUP.md for macOS"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "teardown" "$(RESET)" "Uninstall the tools listed in SETUP.md"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "list-skills" "$(RESET)" "Show the plugin skills that will be installed"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "add-skills-opencode" "$(RESET)" "Install all repo plugin skills into global OpenCode via openskills"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "add-skill-opencode" "$(RESET)" "Install one skill into global OpenCode with SKILL=<path-or-url>"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "remove-skills-opencode" "$(RESET)" "Remove all repo plugin skills from global OpenCode"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "remove-skill-opencode" "$(RESET)" "Remove one OpenCode skill with SKILL=<path-or-name>"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "add-skills-claude" "$(RESET)" "Install all repo plugin skills into global Claude"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "add-skill-claude" "$(RESET)" "Install one local skill into global Claude with SKILL=<path>"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "remove-skills-claude" "$(RESET)" "Remove all repo plugin skills from global Claude"
	@printf "  %s%-20s%s %s\n" "$(GREEN)" "remove-skill-claude" "$(RESET)" "Remove one Claude skill with SKILL=<path-or-name>"
	@printf "\n  %sNote:%s Claude installs are namespaced as <plugin>--<skill-dir> to avoid collisions.\n" "$(YELLOW)" "$(RESET)"

list-skills:
	@printf "$(BOLD)$(GREEN)Repo skills:$(RESET)\n"
	@for skill_dir in $(SKILL_DIRS); do \
		printf "  %s%s%s\n" "$(GREEN)" "$$skill_dir" "$(RESET)"; \
	done

setup:
	@if [ "$(DETECTED_OS)" = "macos" ]; then \
		if ! command -v brew >/dev/null 2>&1; then \
			printf "$(RED)Homebrew is not installed. Install Homebrew first: https://brew.sh/$(RESET)\n"; \
			exit 1; \
		fi; \
		printf "$(BOLD)$(GREEN)Installing macOS dependencies with Homebrew...$(RESET)\n"; \
		for pkg in $(BREW_PACKAGES); do \
			if brew list "$$pkg" >/dev/null 2>&1; then \
				printf "$(YELLOW)Already installed: $$pkg$(RESET)\n"; \
			else \
				printf "$(GREEN)Installing: $$pkg$(RESET)\n"; \
				brew install "$$pkg"; \
			fi; \
		done; \
		for pkg in $(BREW_CASK_PACKAGES); do \
			if brew list --cask "$$pkg" >/dev/null 2>&1; then \
				printf "$(YELLOW)Already installed: $$pkg$(RESET)\n"; \
			else \
				printf "$(GREEN)Installing cask: $$pkg$(RESET)\n"; \
				brew install --cask "$$pkg"; \
			fi; \
		done; \
		touch "$$HOME/.zshrc"; \
		if ! grep -Fqx '$(VSCODE_PATH_LINE)' "$$HOME/.zshrc"; then \
			printf '%s\n' '$(VSCODE_PATH_LINE)' >> "$$HOME/.zshrc"; \
			printf "$(GREEN)Added Visual Studio Code CLI path to ~/.zshrc$(RESET)\n"; \
		else \
			printf "$(YELLOW)Visual Studio Code CLI path already present in ~/.zshrc$(RESET)\n"; \
		fi; \
		if ! grep -Fqx '$(OPENSPEC_TELEMETRY_LINE)' "$$HOME/.zshrc"; then \
			printf '%s\n' '$(OPENSPEC_TELEMETRY_LINE)' >> "$$HOME/.zshrc"; \
			printf "$(GREEN)Added OPENSPEC_TELEMETRY=0 to ~/.zshrc$(RESET)\n"; \
		else \
			printf "$(YELLOW)OPENSPEC_TELEMETRY=0 already present in ~/.zshrc$(RESET)\n"; \
		fi; \
		if ! grep -Fqx '$(DO_NOT_TRACK_LINE)' "$$HOME/.zshrc"; then \
			printf '%s\n' '$(DO_NOT_TRACK_LINE)' >> "$$HOME/.zshrc"; \
			printf "$(GREEN)Added DO_NOT_TRACK=1 to ~/.zshrc$(RESET)\n"; \
		else \
			printf "$(YELLOW)DO_NOT_TRACK=1 already present in ~/.zshrc$(RESET)\n"; \
		fi; \
	else \
			printf "$(RED)Unsupported OS. This Makefile currently supports macOS only.$(RESET)\n"; \
			exit 1; \
	fi

teardown:
	@if [ "$(DETECTED_OS)" = "macos" ]; then \
		if ! command -v brew >/dev/null 2>&1; then \
			printf "$(YELLOW)Homebrew is not installed, nothing to remove.$(RESET)\n"; \
			exit 0; \
		fi; \
		printf "$(BOLD)$(GREEN)Removing macOS dependencies...$(RESET)\n"; \
		for pkg in $(BREW_PACKAGES); do \
			if brew list "$$pkg" >/dev/null 2>&1; then \
				printf "$(GREEN)Uninstalling: $$pkg$(RESET)\n"; \
				brew uninstall "$$pkg"; \
			else \
				printf "$(YELLOW)Not installed: $$pkg$(RESET)\n"; \
			fi; \
		done; \
		for pkg in $(BREW_CASK_PACKAGES); do \
			if brew list --cask "$$pkg" >/dev/null 2>&1; then \
				printf "$(GREEN)Uninstalling cask: $$pkg$(RESET)\n"; \
				brew uninstall --cask "$$pkg"; \
			else \
				printf "$(YELLOW)Not installed: $$pkg$(RESET)\n"; \
			fi; \
		done; \
		if [ -f "$$HOME/.zshrc" ]; then \
			tmp_file="$$(mktemp)"; \
			grep -Fvx '$(VSCODE_PATH_LINE)' "$$HOME/.zshrc" | grep -Fvx '$(OPENSPEC_TELEMETRY_LINE)' | grep -Fvx '$(DO_NOT_TRACK_LINE)' > "$$tmp_file" || true; \
			mv "$$tmp_file" "$$HOME/.zshrc"; \
			printf "$(GREEN)Removed setup-added shell lines from ~/.zshrc if they were present$(RESET)\n"; \
		fi; \
	else \
		printf "$(RED)Unsupported OS. This Makefile currently supports macOS only.$(RESET)\n"; \
		exit 1; \
	fi

add-skills-opencode:
	@if ! command -v npx >/dev/null 2>&1; then \
		printf "$(RED)npx is required to install OpenCode skills. Install Node.js first.$(RESET)\n"; \
		exit 1; \
	fi
	@printf "$(BOLD)$(GREEN)Installing repo skills into global OpenCode...$(RESET)\n"
	@for skill_dir in $(SKILL_DIRS); do \
		local_skill="./$${skill_dir#./}"; \
		printf "$(GREEN)Installing %s into global OpenCode$(RESET)\n" "$$local_skill"; \
		npx openskills install --global "$$local_skill"; \
	done

add-skill-opencode:
	@if ! command -v npx >/dev/null 2>&1; then \
		printf "$(RED)npx is required to install OpenCode skills. Install Node.js first.$(RESET)\n"; \
		exit 1; \
	fi
	@skill='$(SKILL)'; \
	if [ -z "$$skill" ]; then \
		printf "$(RED)Usage: make add-skill-opencode SKILL=<local-path-or-github-url>$(RESET)\n"; \
		exit 2; \
	fi; \
	if [[ "$$skill" == https://github.com/*/tree/* ]]; then \
		printf "$(RED)GitHub tree URLs are not supported. Use a local path or cloneable repo URL instead.$(RESET)\n"; \
		exit 2; \
	fi; \
	if [[ "$$skill" != http://* && "$$skill" != https://* && "$$skill" != ./* && "$$skill" != /* ]]; then \
		skill="./$$skill"; \
	fi; \
	printf "$(BOLD)$(GREEN)Installing one skill into global OpenCode...$(RESET)\n"; \
	printf "$(GREEN)Installing %s into global OpenCode$(RESET)\n" "$$skill"; \
	npx openskills install --global "$$skill"

remove-skills-opencode:
	@if ! command -v npx >/dev/null 2>&1; then \
		printf "$(RED)npx is required to remove OpenCode skills. Install Node.js first.$(RESET)\n"; \
		exit 1; \
	fi
	@printf "$(BOLD)$(GREEN)Removing repo skills from global OpenCode...$(RESET)\n"
	@for skill_dir in $(SKILL_DIRS); do \
		skill_name="$$(grep -E '^name:' "$$skill_dir/SKILL.md" | cut -d: -f2- | xargs)"; \
		if [ -n "$$skill_name" ]; then \
			printf "$(GREEN)Removing %s from global OpenCode$(RESET)\n" "$$skill_name"; \
			npx openskills remove "$$skill_name" || true; \
		fi; \
	done

remove-skill-opencode:
	@if ! command -v npx >/dev/null 2>&1; then \
		printf "$(RED)npx is required to remove OpenCode skills. Install Node.js first.$(RESET)\n"; \
		exit 1; \
	fi
	@skill='$(SKILL)'; \
	if [ -z "$$skill" ]; then \
		printf "$(RED)Usage: make remove-skill-opencode SKILL=<local-path-or-name>$(RESET)\n"; \
		exit 2; \
	fi; \
	if [[ "$$skill" == http://* || "$$skill" == https://* ]]; then \
		printf "$(RED)remove-skill-opencode expects a local skill path or installed skill name.$(RESET)\n"; \
		exit 2; \
	fi; \
	if [[ -d "$$skill" || -f "$$skill/SKILL.md" || "$$skill" == ./* || "$$skill" == /* || "$$skill" == plugins/* ]]; then \
		if [[ "$$skill" != ./* && "$$skill" != /* ]]; then \
			skill="./$$skill"; \
		fi; \
		if [ ! -f "$$skill/SKILL.md" ]; then \
			printf "$(RED)Skill path not found: %s$(RESET)\n" "$$skill"; \
			exit 1; \
		fi; \
		skill_name="$$(grep -E '^name:' "$$skill/SKILL.md" | cut -d: -f2- | xargs)"; \
	else \
		skill_name="$$skill"; \
	fi; \
	if [ -z "$$skill_name" ]; then \
		printf "$(RED)Could not determine the OpenCode skill name to remove.$(RESET)\n"; \
		exit 1; \
	fi; \
	printf "$(BOLD)$(GREEN)Removing one skill from global OpenCode...$(RESET)\n"; \
	printf "$(GREEN)Removing %s from global OpenCode$(RESET)\n" "$$skill_name"; \
	npx openskills remove "$$skill_name"

add-skills-claude:
	@mkdir -p "$(CLAUDE_SKILLS_DIR)"
	@printf "$(BOLD)$(GREEN)Installing repo skills into global Claude...$(RESET)\n"
	@for skill_dir in $(SKILL_DIRS); do \
		local_skill="./$${skill_dir#./}"; \
		plugin_name="$${local_skill#./plugins/}"; \
		plugin_name="$${plugin_name%%/*}"; \
		skill_name="$$(basename "$$local_skill")"; \
		namespaced_name="$$plugin_name--$$skill_name"; \
		dest_dir="$(CLAUDE_SKILLS_DIR)/$$namespaced_name"; \
		rm -rf "$$dest_dir"; \
		cp -R "$$local_skill" "$$dest_dir"; \
		printf "$(GREEN)Installed %s into %s$(RESET)\n" "$$namespaced_name" "$$dest_dir"; \
	done

add-skill-claude:
	@skill='$(SKILL)'; \
	if [ -z "$$skill" ]; then \
		printf "$(RED)Usage: make add-skill-claude SKILL=<local-skill-path>$(RESET)\n"; \
		exit 2; \
	fi; \
	if [[ "$$skill" == http://* || "$$skill" == https://* ]]; then \
		printf "$(RED)add-skill-claude only supports local skill paths.$(RESET)\n"; \
		exit 2; \
	fi; \
	if [[ "$$skill" != ./* && "$$skill" != /* ]]; then \
		skill="./$$skill"; \
	fi; \
	if [ ! -d "$$skill" ]; then \
		printf "$(RED)Skill path not found: %s$(RESET)\n" "$$skill"; \
		exit 1; \
	fi; \
	mkdir -p "$(CLAUDE_SKILLS_DIR)"; \
	plugin_name="$${skill#./plugins/}"; \
	plugin_name="$${plugin_name%%/*}"; \
	skill_name="$$(basename "$$skill")"; \
	namespaced_name="$$plugin_name--$$skill_name"; \
	dest_dir="$(CLAUDE_SKILLS_DIR)/$$namespaced_name"; \
	rm -rf "$$dest_dir"; \
	cp -R "$$skill" "$$dest_dir"; \
	printf "$(GREEN)Installed %s into %s$(RESET)\n" "$$namespaced_name" "$$dest_dir"

remove-skills-claude:
	@mkdir -p "$(CLAUDE_SKILLS_DIR)"
	@printf "$(BOLD)$(GREEN)Removing repo skills from global Claude...$(RESET)\n"
	@for skill_dir in $(SKILL_DIRS); do \
		local_skill="./$${skill_dir#./}"; \
		plugin_name="$${local_skill#./plugins/}"; \
		plugin_name="$${plugin_name%%/*}"; \
		skill_name="$$(basename "$$local_skill")"; \
		namespaced_name="$$plugin_name--$$skill_name"; \
		dest_dir="$(CLAUDE_SKILLS_DIR)/$$namespaced_name"; \
		if [ -d "$$dest_dir" ]; then \
			rm -rf "$$dest_dir"; \
			printf "$(GREEN)Removed %s from %s$(RESET)\n" "$$namespaced_name" "$(CLAUDE_SKILLS_DIR)"; \
		else \
			printf "$(YELLOW)Not installed: %s$(RESET)\n" "$$namespaced_name"; \
		fi; \
	done

remove-skill-claude:
	@skill='$(SKILL)'; \
	if [ -z "$$skill" ]; then \
		printf "$(RED)Usage: make remove-skill-claude SKILL=<local-path-or-namespaced-name>$(RESET)\n"; \
		exit 2; \
	fi; \
	if [[ "$$skill" == http://* || "$$skill" == https://* ]]; then \
		printf "$(RED)remove-skill-claude only supports a local skill path or namespaced install name.$(RESET)\n"; \
		exit 2; \
	fi; \
	if [[ -d "$$skill" || -f "$$skill/SKILL.md" || "$$skill" == ./* || "$$skill" == /* || "$$skill" == plugins/* ]]; then \
		if [[ "$$skill" != ./* && "$$skill" != /* ]]; then \
			skill="./$$skill"; \
		fi; \
		if [ ! -d "$$skill" ]; then \
			printf "$(RED)Skill path not found: %s$(RESET)\n" "$$skill"; \
			exit 1; \
		fi; \
		plugin_name="$${skill#./plugins/}"; \
		plugin_name="$${plugin_name%%/*}"; \
		skill_name="$$(basename "$$skill")"; \
		namespaced_name="$$plugin_name--$$skill_name"; \
	else \
		namespaced_name="$$skill"; \
	fi; \
	dest_dir="$(CLAUDE_SKILLS_DIR)/$$namespaced_name"; \
	if [ -d "$$dest_dir" ]; then \
		rm -rf "$$dest_dir"; \
		printf "$(GREEN)Removed %s from %s$(RESET)\n" "$$namespaced_name" "$(CLAUDE_SKILLS_DIR)"; \
	else \
		printf "$(YELLOW)Not installed: %s$(RESET)\n" "$$namespaced_name"; \
	fi
