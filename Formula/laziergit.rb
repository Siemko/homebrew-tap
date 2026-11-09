class Laziergit < Formula
  desc "Native macOS app with lazygit's functionality"
  homepage "https://github.com/Siemko/laziergit"
  version "0.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/Siemko/laziergit/releases/download/v0.3.0/laziergit-0.3.0-darwin-arm64.tar.gz"
    sha256 "bb642113af543d50954c4d0973271205999b76009d94bf12ad1d0d3211b0106f"
  end
  on_intel do
    url "https://github.com/Siemko/laziergit/releases/download/v0.3.0/laziergit-0.3.0-darwin-amd64.tar.gz"
    sha256 "a5d5dc25917f35be107ec92cdc57daa029f5c0d8e3b0e7b59498b132270cceb3"
  end

  depends_on macos: :monterey

  def install
    # Homebrew unpacks into the tarball's one top-level directory, the app.
    (prefix/"laziergit.app").install "Contents"
    bin.write_exec_script prefix/"laziergit.app/Contents/MacOS/laziergit"
  end

  def caveats
    <<~EOS
      Run laziergit in a repository, or put the app in Applications:
        ln -sf #{opt_prefix}/laziergit.app /Applications/laziergit.app
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/laziergit --version")
  end
end
