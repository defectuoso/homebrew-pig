class Pig < Formula
  desc "Pi coding agent harness rebuilt in Go"
  homepage "https://pi-in-go.dev/"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MichaelKinsy/PiG/releases/download/v#{version}/pig-#{version}-darwin-arm64.tar.gz"
      sha256 "b243e00305e2c7d3d5de12743bb4654cf6324a6282b0c2e0671cc29bfbde3a99"
    end

    on_intel do
      url "https://github.com/MichaelKinsy/PiG/releases/download/v#{version}/pig-#{version}-darwin-amd64.tar.gz"
      sha256 "1a836381d46ca14e72c9b28e4d33c247de115cf4f980e4879587c3fa4ff4387a"
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
