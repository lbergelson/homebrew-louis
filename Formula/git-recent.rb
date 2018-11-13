class GitRecent < Formula
  desc "git-recent displays the most recently checkout out git branches/tags/commits"
  homepage "https://gist.github.com/lbergelson/9b80449952eea27a13308d0cf0921a58"
  url "https://gist.github.com/lbergelson/9b80449952eea27a13308d0cf0921a58/archive/f126e24ff2a58c58ed4d5545512a1dd1b21f1931.tar.gz"
  sha256 "002b4bbf7bbecc0562e457b4823749523fbaa96d1a3c9be4e06d6dcedbb2230b"
  version "1.0.0"

  depends_on "git"

  def install
	bin.install "git-recent"
  end

  test do
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "git", "init"
    system "touch", "newfile"
    system "git", "add", "newfile"
    system "git", "commit", "-am", "\"a commit\""
    system "git", "checkout", "master"
    assert_equal "\e[0;32mmaster\e[0m", shell_output("#{bin}/git-recent").strip
  end
end
