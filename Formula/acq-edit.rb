require_relative "../lib/acq_private_release"

class AcqEdit < Formula
  desc "Agent-driven native editing and local clip review"
  homepage "https://github.com/maddexritter-rgb/acq-edit"
  version "0.2.0-preview.3"
  url "https://github.com/maddexritter-rgb/acq-edit/releases/download/v0.2.0-preview.3/acq-edit-0.2.0-preview.3.tar.gz", using: AcqPrivateRelease
  sha256 "8add8a531f9542e149195684ef9ad722445e62c5d3693fbb4a0305c0fb158c0f"
  license :cannot_represent

  depends_on :macos
  depends_on "node@24"
  depends_on "python@3.11"
  depends_on "ffmpeg"
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
      Open the shown folder in Codex or Claude Code and ask for guided setup.
      Direct setup: acq-edit onboard filmcraft codex
      Alternatives: premiere / claude. Sign into your selected agent first.
      FilmCraft also needs Rust and Xcode Command Line Tools.
      Private team assets require your GitHub login.
      Settings, native runtimes and projects live outside Homebrew's Cellar.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/acq-edit version").strip
  end
end
