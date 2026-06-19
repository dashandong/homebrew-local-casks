cask "eudic" do
  version "2026.05.19"
  sha256 "c7b4981233e368a699528765bc7daec6461433b7c225402777e5834cf0088da5"

  url "https://static.eudic.net/pkg/eudicmac.dmg?v=#{version.dots_to_hyphens}",
      verified:   "static.frdic.com/pkg/",
      user_agent: :fake

  name "Eudic"
  name "欧路词典"
  desc "English dictionary"
  homepage "https://www.eudic.net/v4/en/app/download"

  livecheck do
    url :homepage
    strategy :page_match do |page|
      page.scan(%r{https://static\.eudic\.net/pkg/eudicmac\.dmg\?v=(\d{4}-\d{2}-\d{2})}i)
          .flatten
          .map { |v| v.tr("-", ".") }
    end
  end

  app "Eudic.app"

  uninstall quit: [
    "com.eusoft.eudic",
    "com.eusoft.eudic.LightPeek",
  ]

  zap trash: [
    "~/Library/Application Scripts/com.eusoft.eudic.QuickLook",
    "~/Library/Application Scripts/group.com.eusoft.eudic",
    "~/Library/Application Support/com.eusoft.eudic",
    "~/Library/Caches/com.eusoft.eudic",
    "~/Library/Caches/com.eusoft.eudic.LightPeek",
    "~/Library/Containers/com.eusoft.eudic.QuickLook",
    "~/Library/Eudb_en",
    "~/Library/Group Containers/group.com.eusoft.eudic",
    "~/Library/HTTPStorages/com.eusoft.eudic",
    "~/Library/HTTPStorages/com.eusoft.eudic.binarycookies",
    "~/Library/HTTPStorages/com.eusoft.eudic.LightPeek",
    "~/Library/Preferences/com.eusoft.eudic.LightPeek.plist",
    "~/Library/Preferences/com.eusoft.eudic.plist",
    "~/Library/Preferences/group.com.eusoft.eudic.plist",
    "~/Library/WebKit/com.eusoft.eudic",
    "~/Library/WebKit/com.eusoft.eudic.LightPeek",
  ]
end
