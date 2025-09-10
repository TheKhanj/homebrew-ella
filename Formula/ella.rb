class Ella < Formula
  desc "A process manager for running and managing services"
  homepage "https://github.com/thekhanj/ella"
  version "0.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_darwin_arm64.tar.gz"
      sha256 "d9cd899dd3f50a9905153cab54bd3e579bfc8fa9ecdb2258c0cdbb885c9fbcf0"
    else
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_darwin_amd64.tar.gz"
      sha256 "8745003e139676ebfb14c936130df708ddd72d53eda7d64338433fecffbe586d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_linux_arm64.tar.gz"
      sha256 "d72cdd80e51d17a7e73e036336fb09ff42ab98ee6a6a4d87e0642f92cf30e6ea"
    else
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_linux_amd64.tar.gz"
      sha256 "e0b50898c8dc57cadcfae6f09355e3895ea9f6c66a1129833c1a44b5802d7744"
    end
  end

  def install
    bin.install "ella"
    doc.install "fsm/service.png"
    man1.install "man/ella.1.gz"
    bash_completion.install "completion.sh"
  end

  test do
    assert_match "ella version", shell_output("#{bin}/ella -version")
  end
end
