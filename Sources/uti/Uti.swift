import AppKit

/*
Inspired by 

https://rderik.com/blog/managing-uti-and-url-schemes-via-launch-services-api-from-swift/
https://github.com/Lord-Kamina/SwiftDefaultApps
https://www.droidwin.com/cannot-change-default-browser-for-webloc-files-in-ventura-fix/
*/
@main
public struct Uti {

  public static func main() {

    /*
      UTI to open webloc files. You can use the `mdls` command to find an UTI for a file

        $ mdls -name kMDItemContentType -name kMDItemContentTypeTree -name kMDItemKind ~/Desktop/amazon.webloc
        kMDItemContentType     = "com.apple.web-internet-location"
        kMDItemContentTypeTree = (
            "com.apple.web-internet-location",
            "com.apple.internet-location",
            "public.stored-url",
            "public.data",
            "public.item"
        )
        kMDItemKind            = "Web internet location"

    */
    let uti = "com.apple.web-internet-location"

    /*
      Bundle ID of the handler app. You can use the `default` command to find an app's bundle ID

        $ defaults read /Applications/Firefox.app/Contents/Info.plist CFBundleIdentifier

        Firefox : org.mozilla.firefox
        Safari  : com.apple.Safari
        Chrome  : com.google.Chrome
        Brave   : com.brave.Browser
    */
    let handler = "org.mozilla.firefox"

    guard let result = LSCopyDefaultRoleHandlerForContentType(uti as CFString, .all) else {
        print("handler not found for UTI: \(uti)")
        return
    }
    
    let currentHandler = result.takeRetainedValue() as String
    print("handler for \(uti) is \(currentHandler)")
    
    if (currentHandler != handler) {
        let result = LSSetDefaultRoleHandlerForContentType(uti as CFString, .viewer, handler as CFString)
        guard result != 0 else {
            print("Couldn't set handler with bundle id: \(handler) for UTI: \(uti)")
            return
        }
        print("Successfully set handler with bundle id: \(handler) for UTI: \(uti)")
    }
    
  }
}
