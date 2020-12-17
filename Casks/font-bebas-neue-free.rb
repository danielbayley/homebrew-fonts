cask "font-bebas-neue-free" do
  version "1.1"
  sha256 "70ebf3277c96f767ab1fa045db399028b6ab21d5d3564e95610b170124d2c2ad"

  share = "dropbox.com/s/wwsj880970hmg8f"
  url "https://#{share}/BebasNeue.zip?dl=1", verified: share
  name "Bebas Neue"
  desc "Sans serif font family based on the original by Ryoichi Tsunekawa"
  homepage "https://fontfabric.com/bebas-neue"

  font "BebasNeue/OTF/BebasNeue-Bold.otf"
  font "BebasNeue/OTF/BebasNeue-Book.otf"
  font "BebasNeue/OTF/BebasNeue-Light.otf"
  font "BebasNeue/OTF/BebasNeue-Regular.otf"
  font "BebasNeue/OTF/BebasNeue-Thin.otf"

  caveats do
    license "#{staged_path}/License/#{@cask.name.first} - SIL Open Font License #{version}.pdf"
  end
end
