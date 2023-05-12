import TelemetryClient

public struct AnalyticsClient {
    public var configure: @Sendable (_ configuration: TelemetryManagerConfiguration) async -> Void
    public var enable: @Sendable (_ configuration: TelemetryManagerConfiguration, _ enable: Bool) async -> Void
    public var send: @Sendable (String, [String: String]) async -> Void
}
