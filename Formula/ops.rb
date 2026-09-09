class Ops < Formula
  desc "LocalOps CLI - cloud native deployment platform for SaaS, BYOC, and on-prem"
  homepage "https://github.com/localopsco/lops-cli"
  version "3.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.1.0/ops-darwin-arm64.tar.gz"
      sha256 "0886f641d550449b62f0c1894df5c0f0e8b409b246705eac35033b19d3fed7ca"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.1.0/ops-darwin-amd64.tar.gz"
      sha256 "7b35e76887af7fea1af3191cf65e4a57c2952f23e2efee1c7419ce8abc84fc4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.1.0/ops-linux-arm64.tar.gz"
      sha256 "c30848d5523732d1dd2dc568765653bfbbd29de9f77ffa6e576460e189382aa3"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.1.0/ops-linux-amd64.tar.gz"
      sha256 "f790724fd99f73f080bf4d9121549e8bca504e0542141c4dc0bcb9e4a7808940"
    end
  end

  def install
    bin.install "ops"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ops version", 2)
  end
end
