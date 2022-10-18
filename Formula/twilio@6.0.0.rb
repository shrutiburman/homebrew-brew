require "language/node"

class TwilioAT600 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-dev.s3.amazonaws.com/twilio-v6.0.0/twilio-v6.0.0.tar.gz"
  version "6.0.0"
  sha256 "8ca6eed331e4ae622cd7a2b6e24ba35cf8ca8bf4bb6d0a3bc3f1a4674e884fd5"
  depends_on "node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    pid = spawn("node #{libexec}/welcome.js")
    Process.wait pid
  end
end
