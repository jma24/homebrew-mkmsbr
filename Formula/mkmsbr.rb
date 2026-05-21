class Mkmsbr < Formula
  desc "Library and CLI for Microsoft-compatible MBR and FAT32/NTFS boot records"
  homepage "https://github.com/jma24/mkmsbr"
  url "https://github.com/jma24/mkmsbr/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "6ccabb95245d015d3c3bf117d9497d6843c1ac99eea70352a9493100f61efaeb"
  license "MIT"
  head "https://github.com/jma24/mkmsbr.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "mkmsbr #{version}", shell_output("#{bin}/mkmsbr --version")
    assert_match "Clean-room", shell_output("#{bin}/mkmsbr --help")
  end
end
