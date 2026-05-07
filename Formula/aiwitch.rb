class Aiwitch < Formula
  desc "Multi-account / multi-profile switcher for AI CLIs (Codex, Claude Code, ...)"
  homepage "https://github.com/baedonguri/aiwitch"
  url "https://github.com/baedonguri/aiwitch/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2d4aa1e53ed47f9b7cc5172f75135f2f78f600e266bca445705eaa484d8faf09"
  license "MIT"
  head "https://github.com/baedonguri/aiwitch.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aiwitch --version")
    assert_match "aiwitch()", shell_output("#{bin}/aiwitch shell init zsh")
    assert_match "function aiwitch", shell_output("#{bin}/aiwitch shell init fish")
  end
end
