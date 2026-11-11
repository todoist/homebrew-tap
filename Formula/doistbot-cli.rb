class DoistbotCli < Formula
  desc "Local self-review CLI for Doistbot"
  homepage "https://github.com/todoist/doistbot-app"
  # doistbot-cli-tarball-url
  url "https://registry.npmjs.org/@todoist/doistbot-cli/-/doistbot-cli-1.0.16.tgz"
  # doistbot-cli-tarball-sha256
  sha256 "be68d0dd1920111114ba12b5e6b0dc856f64968c48e6225603d476fe345a2df5"
  license "UNLICENSED"

  depends_on "node"

  def install
    system Formula["node"].opt_bin/"npm", "install", *std_npm_args

    bin.mkpath
    libexec.glob("bin/*").each do |file|
      (bin/file.basename).write_env_script file, PATH: "#{Formula["node"].opt_bin}:$PATH"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/doistbot --version")
    assert_match version.to_s, shell_output("#{bin}/db --version")
  end
end
