import TelemetryClient

public struct AnalyticsClient {
    public enum PermissionEvent: Equatable {
        case enable(appID: String)
        case disable
    }

    public var configure: @Sendable (_ appID: String) async -> Void
    public var updatePermission: @Sendable (_ event: PermissionEvent) async -> Void
    public var send: @Sendable (_ key: String, _ value: [String: String]) async -> Void
}
