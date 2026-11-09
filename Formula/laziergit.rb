class Laziergit < Formula
  desc "Native macOS app with lazygit's functionality"
  homepage "https://github.com/Siemko/laziergit"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/Siemko/laziergit/releases/download/v0.1.0/laziergit-0.1.0-darwin-arm64.tar.gz"
    sha256 "f4ecd82a76dfddb18aec51bcebe21d74107c3ef434920a5e305461d85e2bb2e0"
  end
  on_intel do
    url "https://github.com/Siemko/laziergit/releases/download/v0.1.0/laziergit-0.1.0-darwin-amd64.tar.gz"
    sha256 "2601f1c77f4d32d829c94fc7c70516401a788cc87d109988935460fcf22f2221"
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
