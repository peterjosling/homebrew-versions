cask 'firefox-beta' do
  version '45.0b10'
  sha256 'a3ce3b5c0d42ea50a205e6d5e4575dd56dcc58f0306ee6c30327d0efed3f9c69'

  url "https://download.mozilla.org/?product=firefox-#{version}-SSL&os=osx&lang=en-US"
  name 'Mozilla Firefox'
  homepage 'https://www.mozilla.org/en-US/firefox/channel/#beta'
  license :mpl

  app 'Firefox.app'

  zap delete: [
                '~/Library/Application Support/Firefox',
                '~/Library/Caches/Firefox',
              ]

  caveats <<-EOS.undent
  The Mac App Store version of 1Password won't work with a Homebrew-cask-linked Mozilla Firefox. To bypass this limitation, you need to either:
    + Move Mozilla Firefox to your /Applications directory (the app itself, not a symlink).
    + Install 1Password from outside the Mac App Store (licenses should transfer automatically, but you should contact AgileBits about it).
  EOS
end
