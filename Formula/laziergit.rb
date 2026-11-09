class Laziergit < Formula
  desc "Native macOS app with lazygit's functionality"
  homepage "https://github.com/Siemko/laziergit"
  version "0.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/Siemko/laziergit/releases/download/v0.2.0/laziergit-0.2.0-darwin-arm64.tar.gz"
    sha256 "858833e36d1c81611b5418cbfb1d58437971c70272e17a8706a28b649c923fa2"
  end
  on_intel do
    url "https://github.com/Siemko/laziergit/releases/download/v0.2.0/laziergit-0.2.0-darwin-amd64.tar.gz"
    sha256 "34bd5aa314015467444ad1e45215ada1c58806e1580adc833069e5638d18f553"
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
