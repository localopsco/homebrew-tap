class Ops < Formula
  desc "LocalOps CLI - cloud native deployment platform for SaaS, BYOC, and on-prem"
  homepage "https://github.com/localopsco/lops-cli"
  version "3.0.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.4/ops-darwin-arm64.tar.gz"
      sha256 "7b4b2e72d07965948770d3c633ca79628f38b37ce62fd62ae7650871b620a51e"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.4/ops-darwin-amd64.tar.gz"
      sha256 "4d1acc576bbec691f2a549a8353b6f0308bdfad1aaf0f53b0c13ae29af65c937"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.4/ops-linux-arm64.tar.gz"
      sha256 "001ad99146d6a61e0107db2bde8b5e66f5db0209c8a75ba8476a2c436e97d7ba"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.4/ops-linux-amd64.tar.gz"
      sha256 "d2da4ae4c1d81cbced6ee07aadf84283400fd1da9baefcbe4826928470f7346a"
    end
  end

  def install
    bin.install "ops"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ops version", 2)
  end
end
