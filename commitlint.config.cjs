// Commitlint config consumed by
// clouddrove/github-shared-workflows/.github/workflows/pr-checks.yml.
// The `fix` type is the only one accepted for merges — every merge must be
// either a bug fix or a scaffold correction opened by an agent.
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [2, 'always', [
      'fix', 'feat', 'docs', 'ci', 'chore', 'test', 'refactor',
      'style', 'perf', 'build', 'revert',
    ]],
    'scope-empty': [0],
    'subject-case': [0],
    'subject-min-length': [2, 'always', 3],
    'header-max-length': [2, 'always', 120],
  },
};
