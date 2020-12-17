cask "font-consolas-ligaturized-nerd-font" do
  version "2"
  sha256 :no_check

  name, repo = token.match(/font-((.+)-nerd-font)/).captures

  url "https://github.com/somq/#{repo}/trunk/Consolas-FiraCode_v#{version.major}", using: :svn
  appcast "https://github.com/tonsky/FiraCode/releases.atom"
  name name.titlecase
  desc "Standard Consolas font with FiraCode v#{version.major} ligatures"
  homepage "https://github.com/somq/#{repo}"

  depends_on formula: "nerd-fonts-patcher"

  ext = ".ttf"

  preflight do
    Dir.chdir staged_path do
      Pathname.glob("Consolasligaturizedv#{version.major}*#{ext}").each do |font|
        stdout = `#{HOMEBREW_PREFIX}/bin/font-patcher #{font} --complete --quiet`

        generated, = stdout.scan(/Generated: (.+)$/).flatten

        rename = generated.delete("v#{version}").squish.titlecase + ext

        FileUtils.mv generated + ext, "#{Dir.home}/Library/Fonts/#{rename}"
      end
    end
  end

  uninstall delete: "~/Library/Fonts/#{repo.titlecase}*#{ext}"
end
