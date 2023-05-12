import ComposableArchitecture
import TelemetryClient

extension AnalyticsClient: DependencyKey {
    public static var liveValue = AnalyticsClient(
        configure: { appID in
            let configuration = TelemetryManagerConfiguration(appID: appID)
            #if DEBUG
            configuration.testMode = true
            #else
            configuration.testMode = false
            #endif
            TelemetryManager.initialize(with: configuration)
        },
        updatePermission: { event in
            switch event {
            case .disable:
                TelemetryManager.terminate()
            case .enable(appID: let appID):
                let configuration = TelemetryManagerConfiguration(appID: appID)
                #if DEBUG
                configuration.testMode = true
                #else
                configuration.testMode = false
                #endif
                TelemetryManager.initialize(with: configuration)
            }
        },
        send: { key, value in
            TelemetryManager.send(key, with: value)
        }
    )

    public static var previewValue = AnalyticsClient(
        configure: { _ in },
        updatePermission: { _ in },
        send: { _, _ in }
    )

    public static var testValue = AnalyticsClient(
        configure: unimplemented("\(Self.self).configure"),
        updatePermission: unimplemented("\(Self.self).updatePermission"),
        send: unimplemented("\(Self.self).send")
    )
}
