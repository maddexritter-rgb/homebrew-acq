# ACQ Edit Homebrew / Workbrew tap

Use the existing Homebrew or Workbrew `brew` command:

```sh
brew tap maddexritter-rgb/acq https://github.com/maddexritter-rgb/homebrew-acq.git
brew install maddexritter-rgb/acq/acq-edit
acq-edit onboard guide
```

The tap, source release and team asset bundle are currently public. A GitHub account is not
required to download them. Managed Workbrew policies may require your organization's tap approval;
use the existing installation and its policy, not a second Homebrew install.

Open the shown toolkit folder in Codex or Claude Code and ask the agent to guide setup. It gathers
your editor/storage choices, installs the selected integration, opens private key entry and helps
with Frame/Monday sign-in. See [onboarding](https://github.com/maddexritter-rgb/acq-edit/blob/main/docs/ONBOARDING.md).

For updates:

```sh
brew update
brew upgrade maddexritter-rgb/acq/acq-edit
acq-edit onboard guide
```

Onboard FilmCraft and Premiere separately when both are wanted; route subsequent commands with
`--engine filmcraft` or `--engine premiere`. Runtime and configuration directories are separate;
assets and credentials are shared. The agent can use `--non-interactive` and `--fresh-runtime`
when appropriate. Existing project paths and the earlier single-engine configuration are preserved.

The formula installs immutable source. Mutable runtimes, fonts, assets, credentials and projects
live outside the Cellar. Installing/upgrading the formula does not open or modify editor projects.
New native-only completion and cross-editor reconstruction remain subject to the qualification
limits in the [issue ledger](https://github.com/maddexritter-rgb/acq-edit/blob/main/docs/SESSION_REPAIR_LEDGER.md).
