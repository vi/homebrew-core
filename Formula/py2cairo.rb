class Py2cairo < Formula
  desc "Python 2 bindings for the Cairo graphics library"
  homepage "https://cairographics.org/pycairo/"
  url "https://github.com/pygobject/pycairo/releases/download/v1.16.1/pycairo-1.16.1.tar.gz"
  sha256 "47a14a6a2f8dadb649229f099ac712a5f3d0a22e14877165a203d8a0de09ad63"

  bottle do
    cellar :any
    sha256 "18115ec322d4ec37658f7cd303ce5948770781b2094401da014eed20c66ec6a2" => :high_sierra
    sha256 "58d9619667ec16a2ae85c5709a852dfebdbebb404382214431668994b7bf11de" => :sierra
    sha256 "3e96db6be8dd1969b3bd9853bec8ea7b324a43a40f0ecdfd85386c392300f468" => :el_capitan
  end

  depends_on "pkg-config" => :build
  depends_on "cairo"
  depends_on "python" if MacOS.version <= :snow_leopard

  def install
    system "python", *Language::Python.setup_install_args(prefix)
  end

  test do
    system "python", "-c", "import cairo; print(cairo.version)"
  end
end
