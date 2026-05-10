class Aiwitch < Formula
  desc "Multi-account / multi-profile switcher for AI CLIs (Codex, Claude Code, ...)"
  homepage "https://github.com/baedonguri/aiwitch"
  url "https://github.com/baedonguri/aiwitch/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "6290d231e11868f8c764dd6a4f86bc9c1bf670f276da7615c81b16f408f2d0c1"
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
