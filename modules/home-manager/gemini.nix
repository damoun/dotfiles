{ ... }:
{
  home.file.".gemini/GEMINI.md".text = ''
    # Personal Preferences

    ## Git Workflow
    - Always start working in a dedicated branch branched off from a freshly fetched `origin/main`.
    - Commit often and in small, logical increments.
    - Never use `git add .`, `git add -A`, or similar commands. Always selectively add specific files.
    - Finalize changes by pushing the branch and opening a Pull Request.
  '';

  home.file.".gemini/policies/shell-safety.toml".text = ''
    # Deny reading kubernetes secrets
    [[rule]]
    toolName = "run_shell_command"
    commandRegex = "kubectl.*(secret|secrets)"
    decision = "deny"
    priority = 900
    denyMessage = "Reading Kubernetes secrets is prohibited by policy."

    # Allow read-only git commands
    [[rule]]
    toolName = "run_shell_command"
    commandRegex = "git (status|log|show|diff|branch|ls-files|rev-parse|fetch|checkout)"
    decision = "allow"
    priority = 100

    # Allow read-only gh (GitHub CLI) commands
    [[rule]]
    toolName = "run_shell_command"
    commandRegex = "gh (issue|pr|repo|status|auth) (list|view|status|check)"
    decision = "allow"
    priority = 100

    # Allow read-only kubectl commands
    [[rule]]
    toolName = "run_shell_command"
    commandRegex = "kubectl (get|describe|logs|cluster-info|api-resources|explain|version|top)"
    decision = "allow"
    priority = 100

    # Allow kustomize build
    [[rule]]
    toolName = "run_shell_command"
    commandPrefix = "kustomize build"
    decision = "allow"
    priority = 100

    # Allow read-only helm commands
    [[rule]]
    toolName = "run_shell_command"
    commandRegex = "helm (list|get|status|history|search|show|version)"
    decision = "allow"
    priority = 100

    # Allow read-only tofu (OpenTofu) commands
    [[rule]]
    toolName = "run_shell_command"
    commandRegex = "tofu (plan|fmt|show|state list|state show|version|providers|validate)"
    decision = "allow"
    priority = 100

    # Allow general read-only utilities
    [[rule]]
    toolName = "run_shell_command"
    commandPrefix = ["ls", "cat", "grep", "find", "pwd", "du", "df", "head", "tail", "wc", "jq"]
    decision = "allow"
    priority = 100
  '';
}
