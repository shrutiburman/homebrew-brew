require "language/node"

class Twiliodraft < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/channels/draft/twilio-v3.0.0-draft.3/twilio-v3.0.0-draft.3.tar.gz"
  version "3.0.0-draft.3"
  sha256 "64dabffcae3ad7586527a35cad807d38cb671687a075156614931690af32dc34"
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