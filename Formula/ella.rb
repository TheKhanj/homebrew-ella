class Ella < Formula
  desc "A process manager for running and managing services"
  homepage "https://github.com/thekhanj/ella"
  version "0.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_darwin_arm64.tar.gz"
      sha256 "18adf333c5c7e4f9f26b23c68386dc8cb48825714cfb594133cdfc2d4758129f"
    else
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_darwin_amd64.tar.gz"
      sha256 "96c83f17ff17a9a0ec18522277924b485f8e23fa2befb67ce12c66164277e09a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_linux_arm64.tar.gz"
      sha256 "bade9193e6578b822eb3d3fa4692c5aa082f8e04bb152af91308d9db0e45e916"
    else
      url "https://github.com/thekhanj/ella/releases/download/v#{version}/ella_v#{version}_linux_amd64.tar.gz"
      sha256 "335cbae035b2a53ff5d63c624ba0e51193efdd584f4e24aa9e41f731669236b3"
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
