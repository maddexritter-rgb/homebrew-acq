class AcqEdit < Formula
  desc "Agent-driven native editing and local clip review"
  homepage "https://github.com/maddexritter-rgb/acq-edit"
  version "0.2.0-preview.15"
  url "https://github.com/maddexritter-rgb/acq-edit/releases/download/v0.2.0-preview.15/acq-edit-0.2.0-preview.15.tar.gz"
  sha256 "f3e68198d4a3c977aafc977fad7bf933b506d8b6d96c701137bf54815f2b8b70"
  license :cannot_represent

  depends_on :macos
  depends_on "node@24"
  depends_on "python@3.11"
  # FFmpeg is provisioned by guided setup, preserving existing tap providers.
  depends_on "fontconfig"
  depends_on "gh"
  depends_on "git"
  depends_on "rclone"
  depends_on "yt-dlp"

  def install
    libexec.install Dir["*", ".[^.]*"]
    (bin/"acq-edit").write <<~SH
      #!/bin/bash
      export PATH="#{Formula["node@24"].opt_bin}:#{Formula["python@3.11"].opt_bin}:$PATH"
      exec "#{Formula["python@3.11"].opt_bin}/python3.11" "#{libexec}/scripts/acq_edit.py" "$@"
    SH
  end

  def caveats
    <<~EOS
      Start with: acq-edit onboard guide
      Check existing FFmpeg first: acq-edit media-check
      If absent: acq-edit media-check --install-missing
      Open the shown folder in Codex or Claude Code and ask for guided setup.
      Direct setup: acq-edit onboard filmcraft codex
      Alternatives: premiere / claude. Editing stays in your existing signed-in chat.
      No second agent CLI login is required. Background workers are opt-in.
      Frame setup: get the shared Adobe client ID and secret from Maddex.
      Sign into your own Adobe account and use your own Monday API token; no new app needed.
      Paste Drive file/folder links into chat; drive-login guides Google browser sign-in.
      Premiere 26.3.0 and 26.5.2 are enabled; setup detects the installed host.
      Existing owned panel: onboard premiere-panel --update-owned
      Both editors: onboard each, then route commands with --engine filmcraft or premiere.
      Your agent can use --non-interactive after gathering your choices.
      FilmCraft uses a prebuilt runtime on Apple silicon with macOS 15.7+.
      Rust is needed only for an explicitly selected source build.
      Public source and team assets download without a GitHub account.
      Settings, native runtimes and projects live outside Homebrew's Cellar.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/acq-edit version").strip
  end
end
