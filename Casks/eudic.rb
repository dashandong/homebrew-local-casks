cask "eudic" do
  version "2026.08.25"
  sha256 "8f4621edb79f75e6d33904a1290392606bf4bebe936fa9b288fad41db4836f69"

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
