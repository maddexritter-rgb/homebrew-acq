class AcqEdit < Formula
  desc "Agent-driven native editing and local clip review"
  homepage "https://github.com/maddexritter-rgb/acq-edit"
  version "0.2.0-preview.12"
  url "https://github.com/maddexritter-rgb/acq-edit/releases/download/v0.2.0-preview.12/acq-edit-0.2.0-preview.12.tar.gz"
  sha256 "1bf2a4338a282238e63838a04406baa8c58f951f48bafebd25b812484222a0a6"
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
      Alternatives: premiere / claude. Sign into your selected agent first.
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
