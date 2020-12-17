cask "font-sf-mono-nerd-font" do
  version :latest
  sha256 :no_check

  repo = "github.com/kube/sf-mono-ligaturized/"
  url "https://#{repo}/trunk/ligaturized", verified: repo, using: :svn
  name "SF Mono Nerd Font"
  name "San Francisco Mono Nerd Font"
  desc "Monospaced variant of San Francisco designed by Apple"
  homepage "https://developer.apple.com/fonts"

  depends_on macos: ">= :sierra"
  depends_on formula: "nerd-fonts-patcher"

  glob = "SF*Mono*.[ot]tf"

  preflight do
    Dir.chdir staged_path do
      glob.prepend "{#{Dir.pwd},/System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts}/"
      Pathname.glob(glob).each do |font|
        ext = font.extname
        rename = font.basename(ext).to_s.titlecase.sub "Sf", "SF"
        rename += " Nerd Font Complete#{ext}"

        stdout = `#{HOMEBREW_PREFIX}/bin/font-patcher #{font} --complete --quiet`

        generated = stdout.scan(/Generated: (.+)$/).flatten.first + ext

        FileUtils.mv generated, "#{Dir.home}/Library/Fonts/#{rename}"
      end
    end
  end

  uninstall delete: "~/Library/Fonts/#{glob}"
end
