class Ops < Formula
  desc "LocalOps CLI - cloud native deployment platform for SaaS, BYOC, and on-prem"
  homepage "https://github.com/localopsco/lops-cli"
  version "3.0.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.3/ops-darwin-arm64.tar.gz"
      sha256 "9412284c209cb1944c55d879d3d650ec04166b13e5f845b2e584fedaff54baf4"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.3/ops-darwin-amd64.tar.gz"
      sha256 "b6fb0653a71150909ad921a0402cc948b947081ec6476b4d4583cc5857df8cda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.3/ops-linux-arm64.tar.gz"
      sha256 "168561147f195dc4ebf21f271779c3771b5f991fd21ef5ea148c196d13419057"
    end

    on_intel do
      url "https://github.com/localopsco/lops-cli/releases/download/v3.0.3/ops-linux-amd64.tar.gz"
      sha256 "d69fe775196a49c8b09df5e3abc95342e9031c791f7952fe49bb9ec3c46b66a3"
    end
  end

  def install
    bin.install "ops"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ops version", 2)
  end
end
