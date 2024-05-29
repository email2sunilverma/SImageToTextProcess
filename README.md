# SImageToTextProcess

Project provides basic idea and approach to implement the **Recognizing Text in Images** by using apple provided framwork **Visson**.

# HOW To Use
* Drag and drop the file **SImageProcessor** in your project
* Call the method **if let image = UIImage(named: "EmailImg") {
                    SImageProcessor.processImage(image: image) { results in
                        if let text = results?.joined(separator: ", ") {
                            imageText = text
                        }
                    }
                }**

* Or

* Call method Async **if let image = UIImage(named: "ImageWithText") {
                        let results = try? await SImageProcessor.processImage(in: image)
                        if let text = results?.joined(separator: ", ") {
                            imageText = text
                        }
                    }**

# Author   

* [Sunil Verma](https://github.com/email2sunilverma)
* [Web](https://sites.google.com/view/sunil-kumar-verma/)


# License
SNotificationCenter is available under the MIT license. See the LICENSE file for more info.

## Other Libraries

* [SPopupMenu](https://github.com/email2sunilverma/SPopupMenu):- Simple UI for create the POP list for menu with Text, Text With Icon, Muliti Seelction.
* [SNotificationCenter](https://github.com/email2sunilverma/SNotificationCenter):- Notification and Observer design patern.
* [SSideMenu](https://github.com/email2sunilverma/SSideMenu):- Project provides basic idea and approach for building Slider side menu in SwiftUI.
*  [SwiftCombine](https://github.com/email2sunilverma/SwiftCombine):- Project provides basic idea and approach to implement the Swift api call via Pubs/Subs by Combibe framwork, reusable class for api request.
