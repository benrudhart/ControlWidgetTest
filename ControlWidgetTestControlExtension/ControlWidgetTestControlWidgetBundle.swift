import SwiftUI
import WidgetKit

@main
struct ControlWidgetTestControlWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        ControlWidgetTestControlWidget()
    }
}
