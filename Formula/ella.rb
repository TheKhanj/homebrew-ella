class Ella < Formula
  desc "A process manager for running and managing services"
  homepage "https://github.com/thekhanj/ella"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_darwin_arm64.tar.gz"
      sha256 "14bbca6c8e6fb56c56bec7067ee3c15b9f111d71d23d985442fb85a953cf611b"
    else
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_darwin_amd64.tar.gz"
      sha256 "7d3bfbf70441eb2f12698d7e49869f6b5343470f796e90e9c80bc7c07ec5ddb0"
    end
  end

  def install
    bin.install "ella"
    doc.install "fsm/service.png"
    doc.install "fsm/service-deactivating.png"
    man1.install "man/ella.1.gz"
    bash_completion.install "completion.sh"
  end

  test do
    assert_match "ella version", shell_output("#{bin}/ella -version")
  end
end
