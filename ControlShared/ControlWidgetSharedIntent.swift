import AppIntents
import Foundation

extension UserDefaults {
    static let isOnKey = "control_widget_is_on"

    static var appGroup: UserDefaults {
        let appGroup = "group.com.benrudhart.ControlWidgetTest"
        return UserDefaults(suiteName: appGroup)!
    }
}

@available(iOS 18.0, *)
public struct ToggleControlWidgetIntent: SetValueIntent {
    public static var title: LocalizedStringResource = "Toggle Control"
    public static var description = IntentDescription("Toggle ControlWidgetTest control")
    public static var openAppWhenRun = false
    public static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed

    @Parameter(title: "On")
    public var value: Bool

    public init() {
        self.value = UserDefaults.appGroup.bool(forKey: UserDefaults.isOnKey)
    }

    public init(value: Bool) {
        self.value = value
    }

    @MainActor
    public func perform() async throws -> some IntentResult {
        UserDefaults.appGroup.set(value, forKey: UserDefaults.isOnKey)
        return .result()
    }
}
