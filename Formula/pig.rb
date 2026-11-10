class Pig < Formula
  desc "Pi coding agent harness rebuilt in Go"
  homepage "https://pi-in-go.dev/"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MichaelKinsy/PiG/releases/download/v#{version}/pig-#{version}-darwin-arm64.tar.gz"
      sha256 "d87c65e03acec77c8fa3ced323c27f27386b69bdeca80fde56008c85d47ad1a4"
    end

    on_intel do
      url "https://github.com/MichaelKinsy/PiG/releases/download/v#{version}/pig-#{version}-darwin-amd64.tar.gz"
      sha256 "6c744b3b1368fb8272dfa64033f06c0207822dede05f1ac0df838e960d7e3ac1"
    end
  end

  livecheck do
    url "https://github.com/MichaelKinsy/PiG.git"
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "pig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pig --version")
  end
end
