# Private ACQ Edit Homebrew tap

Install with the existing Homebrew or Workbrew `brew` command:

```sh
brew install gh
gh auth login
gh auth setup-git
brew tap maddexritter-rgb/acq https://github.com/maddexritter-rgb/homebrew-acq.git
brew install maddexritter-rgb/acq/acq-edit
acq-edit onboard filmcraft codex
```

Your GitHub account needs read access to this tap and `maddexritter-rgb/acq-edit`.
For Workbrew-admin deployments, allow this private tap and configure the secret
`HOMEBREW_GITHUB_API_TOKEN` with read access to the source-release repository.
The individual user completes agent sign-in and personal API-key entry after installation.
See [onboarding](https://github.com/maddexritter-rgb/acq-edit/blob/main/docs/ONBOARDING.md).

The formula copies immutable release source only. Mutable runtimes, fonts, team assets,
credentials and projects are installed per user through explicit onboarding.
No editor project is opened or modified by package installation.
