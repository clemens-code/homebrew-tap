cask "kimai-clock" do
  version "1.7.0"
  sha256 "c685d04da2be94e2145587ff237eebcb1414a928f9019b35d1c1c1dd814353fb"

  url "https://github.com/clemens-code/kimai-clock/releases/download/v#{version}/KimaiClock.dmg"
  name "KimaiClock"
  desc "Track and manage Kimai 2 time entries from the menu bar"
  homepage "https://github.com/clemens-code/kimai-clock"

  depends_on macos: :sequoia

  app "KimaiClock.app"

  # not notarized (no Apple Developer account) -> drop the quarantine flag so Gatekeeper allows the launch
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/KimaiClock.app"],
        writable_paths: ["{{appdir}}/KimaiClock.app"]
  end

  uninstall quit: "de.foraum.KimaiClock"
end
