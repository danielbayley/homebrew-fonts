cask "font-with-a-syntax-highlighter" do
  version "2024.11.18,c60e12e"
  sha256 "bfdd98afb71c1dc35a91dd82b698bbdea97f450bff11931d02dd7c2d02e3390f"

  owner  = "hlotvonen"
  repo   = token.split("-").map(&:capitalize).join
  repository = "github.com/#{owner}/#{repo}"
  branch = "main"

  url "https://#{repository}/tarball/#{branch}",
      verified: repository
  name "Font with a Syntax Highlighter"
  desc "Font with built-in syntax highlighting"
  homepage "https://blog.glyphdrawing.club/#{desc.downcase.tr " ", "-"}"

  livecheck do
    url "https://#{repository}/commits/#{branch}"
    strategy :page_match do |page|
      months = Regexp.union Date::ABBR_MONTHNAMES.compact
      regex  = />.*?(#{months}\s+\d{1,2},\s+\d{4})<.*?>(\h{7})</
      page.scan(regex).map do |(date, commit_hash)|
        date = Date.parse date
        date = date.strftime "%Y.%-m.%d"
        "#{date},#{commit_hash}"
      end
    end
  end

  staged_path.glob("*/*.otf") { font _1 }
end
