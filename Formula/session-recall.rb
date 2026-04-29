class SessionRecall < Formula
  desc "Session memory recall for AI coding agents"
  homepage "https://github.com/yelob/auto-memory"
  url "https://github.com/yelob/auto-memory.git",
      tag:      "v0.2.0",
      revision: "22719404f6986db989deecb757d303a8c36be16b"
  license "MIT"

  def install
    libexec.install Dir["src/*"]
    (bin/"session-recall").write <<~SCRIPT
      #!/bin/bash
      export PYTHONPATH="#{libexec}${PYTHONPATH:+:$PYTHONPATH}"
      exec python3 -m session_recall "$@"
    SCRIPT
  end

  test do
    assert_match "usage", shell_output("#{bin}/session-recall --help", 2)
  end
end
