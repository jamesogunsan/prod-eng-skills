# Anti-Pattern Review Checklist

- Are there giant functions or modules doing unrelated work?
- Are globals, module state, or hidden side effects making behavior harder to reason about?
- Are broad exceptions, silent fallbacks, or incomplete tests hiding defects?
- Does the code require comments to explain avoidable complexity?
- Would a smaller boundary or helper remove the smell more effectively than style cleanup?
