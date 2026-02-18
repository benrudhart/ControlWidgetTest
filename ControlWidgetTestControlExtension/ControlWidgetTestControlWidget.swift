import AppIntents
import Foundation
import SwiftUI
import WidgetKit

struct ControlWidgetTestControlWidget: ControlWidget {
    static let kind = "com.benrudhart.ControlWidgetTest.control"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: ControlWidgetTestControlProvider()) { state in
            ControlWidgetToggle(
                "Toggle",
                isOn: state.isOn,
                action: ToggleControlWidgetIntent()
            ) { isOn in
                Label(
                    isOn ? "on" : "off",
                    systemImage: isOn ? "checkmark.shield" : "xmark.shield"
                )
                .font(.system(size: 40)) // doesn't work, is ignored
                .tint(.red) // doesn't work, is ignored
                .foregroundStyle(.yellow) // doesn't work, is ignored
            }
        }
        .displayName("Control")
        .description("Simple on/off control")
    }
}

private struct ControlWidgetTestControlState: Equatable {
    let isOn: Bool
}

private struct ControlWidgetTestControlProvider: ControlValueProvider {
    var previewValue: ControlWidgetTestControlState {
        ControlWidgetTestControlState(isOn: UserDefaults.appGroup.bool(forKey: UserDefaults.isOnKey))
    }

    func currentValue() async throws -> ControlWidgetTestControlState {
        ControlWidgetTestControlState(isOn: UserDefaults.appGroup.bool(forKey: UserDefaults.isOnKey))
    }
}
