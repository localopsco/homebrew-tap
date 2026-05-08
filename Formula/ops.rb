class Ops < Formula
  desc "LocalOps CLI - cloud native deployment platform for SaaS, BYOC, and on-prem"
  homepage "https://github.com/localopsco/lops-cli"
  version "3.0.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.2/ops-darwin-arm64.tar.gz"
      sha256 "6b5cf2e0265b43e1f6f05b2bcf442c5ddbfdfec229df811783d447a38eb0c2e4"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.2/ops-darwin-amd64.tar.gz"
      sha256 "9dcbe44187de3607f793f93e25b95736275459bb6d5b1921e2195c7d65c3e5d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.2/ops-linux-arm64.tar.gz"
      sha256 "ce2c45ac68f853657db4afa84b9b676344aa3c1ebb0ee7f85cec404bf0722767"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.2/ops-linux-amd64.tar.gz"
      sha256 "9529e7c3bcdf7256ceecebbb142004d3564b0bf1362949c87ecc5ce27b6a85bb"
    end
  end

  def install
    bin.install "ops"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ops version", 2)
  end
end
