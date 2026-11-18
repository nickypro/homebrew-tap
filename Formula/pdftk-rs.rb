class PdftkRs < Formula
  desc "Rust port of pdftk, the PDF toolkit: one small static binary, no Java"
  homepage "https://github.com/nickypro/pdftk-rs"
  version "0.1.0"
  license "GPL-2.0-or-later"
  revision 1

  conflicts_with "pdftk-java", because: "both install a `pdftk` executable"

  on_macos do
    on_arm do
      url "https://github.com/nickypro/pdftk-rs/releases/download/v0.1.0/pdftk-rs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "3d3e1578e12ce53573500dfaf12647478b87d1953892de8cb58b261a2e230db5"
    end
    on_intel do
      url "https://github.com/nickypro/pdftk-rs/releases/download/v0.1.0/pdftk-rs-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "1d4690162d4eb9546f2ec13224259a1b3038f1f2d3e0ea0a38e07ce149b7cabb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nickypro/pdftk-rs/releases/download/v0.1.0/pdftk-rs-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b2ca89abd42ae5330ea723ce1abb79ebfe100887713355c8ffcb5877f41cacaf"
    end
    on_intel do
      url "https://github.com/nickypro/pdftk-rs/releases/download/v0.1.0/pdftk-rs-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8fa9faa71b2d7eacc6e6a2ac7bfcaa138b4790a144ba22c52cd8ce01ad5041da"
    end
  end

  def install
    bin.install "pdftk-rs"
    # Drop-in replacement: also answer to the original name.
    bin.install_symlink "pdftk-rs" => "pdftk"
    doc.install "README.md"
  end

  test do
    assert_match "pdftk-rs #{version}", shell_output("#{bin}/pdftk-rs --version")
    assert_match "pdftk-rs #{version}", shell_output("#{bin}/pdftk --version")
  end
end
