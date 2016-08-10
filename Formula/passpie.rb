class Passpie < Formula
  include Language::Python::Virtualenv

  desc "Manage login credentials from the terminal"
  homepage "https://github.com/marcwebbie/passpie"
  url "https://files.pythonhosted.org/packages/f3/68/0b60f45c2604c7aabea83407085447c33ecab2991f03a43cdac11334ce38/passpie-1.5.4.tar.gz"
  sha256 "3d58faca452dad5ddbb6000af16b0ef3c6591eae61423c87b64252faf1106e3c"
  head "https://github.com/marcwebbie/passpie.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "9d6bb3bd7ffd59287ca6e8f1f73cc2054aa5878eff613a5dcd15ef990be41f18" => :el_capitan
    sha256 "1c1413eca1bdd41c58f980fd488e50d811cc59929df67d2d1cb4fd1cb6d9707e" => :yosemite
    sha256 "f11202dd86fd4abd985bbe1f8f7c6e9aa5870c40a72388843b27944c37ca606e" => :mavericks
  end

  depends_on :python if MacOS.version <= :snow_leopard
  depends_on :gpg

  resource "click" do
    url "https://files.pythonhosted.org/packages/7a/00/c14926d8232b36b08218067bcd5853caefb4737cda3f0a47437151344792/click-6.6.tar.gz"
    sha256 "cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/75/5e/b84feba55e20f8da46ead76f14a3943c8cb722d40360702b2365b91dec00/PyYAML-3.11.tar.gz"
    sha256 "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
  end

  resource "rstr" do
    url "https://files.pythonhosted.org/packages/34/73/bf268029482255aa125f015baab1522a22ad201ea5e324038fb542bc3706/rstr-2.2.4.tar.gz"
    sha256 "64a086a7449a576de7f40327f8cd0a7752efbbb298e65dc68363ee7db0a1c8cf"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/db/40/6ffc855c365769c454591ac30a25e9ea0b3e8c952a1259141f5b9878bd3d/tabulate-0.7.5.tar.gz"
    sha256 "9071aacbd97a9a915096c1aaf0dc684ac2672904cd876db5904085d6dac9810e"
  end

  resource "tinydb" do
    url "https://files.pythonhosted.org/packages/6c/2e/0df79439cf5cb3c6acfc9fb87e12d9a0ff45d3c573558079b09c72b64ced/tinydb-3.2.1.zip"
    sha256 "7fc5bfc2439a0b379bd60638b517b52bcbf70220195b3f3245663cb8ad9dbcf0"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"passpie", "-D", "passpiedb", "init", "--force", "--passphrase", "s3cr3t"
    system bin/"passpie", "-D", "passpiedb", "add", "foo@bar", "--random"
    system bin/"passpie", "-D", "passpiedb", "copy", "--passphrase", "s3cr3t", "foo@bar", "--to", "stdout"
  end
end
