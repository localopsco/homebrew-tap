class Ops < Formula
  desc "LocalOps CLI - cloud native deployment platform for SaaS, BYOC, and on-prem"
  homepage "https://github.com/localopsco/lops-cli"
  version "3.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.2.0/ops-darwin-arm64.tar.gz"
      sha256 "ba7e4123a331530401011933eb7323aabc2a545a9c42b4c7bd738d0bf6e2a566"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.2.0/ops-darwin-amd64.tar.gz"
      sha256 "6ba59d2253e8da516c381b83be1387197c4147bcc6b2f0fafabbaa8f5ffd53b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.2.0/ops-linux-arm64.tar.gz"
      sha256 "cd194e120478fe669ef19880fcf3aafba69b2d6a37939eba161c7c27288920a5"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.2.0/ops-linux-amd64.tar.gz"
      sha256 "beac6b688f92edc9666fea206c4e651eb03ad5d828b606c9b8f3ba86dc40f8dc"
    end
  end

  def install
    bin.install "ops"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ops version", 2)
  end
end
