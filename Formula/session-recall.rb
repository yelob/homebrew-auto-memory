class SessionRecall < Formula
  include Language::Python::Virtualenv

  desc "Session memory recall for AI coding agents"
  homepage "https://github.com/yelob/auto-memory"
  url "https://github.com/yelob/auto-memory.git",
      tag:      "v0.2.0",
      revision: "22719404f6986db989deecb757d303a8c36be16b"
  license "MIT"

  depends_on "python@3"

  def install
    virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", *std_pip_args(prefix: libexec), "."
    bin.install_symlink libexec/"bin/session-recall"
  end

  test do
    assert_match "usage", shell_output("#{bin}/session-recall --help", 2)
  end
end
