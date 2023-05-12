import ComposableArchitecture
import TelemetryClient

extension AnalyticsClient: DependencyKey {
    public static let liveValue = AnalyticsClient(
        configure: { configuration in
            #if DEBUG
            configuration.testMode = true
            #else
            configuration.testMode = false
            #endif
            TelemetryManager.initialize(with: configuration)
        },
        enable: { configuration, enable in
            configuration.analyticsDisabled = !enable
        },
        send: { value, info in
            TelemetryManager.send(value, with: info)
        }
    )

    public static let previewValue: AnalyticsClient = {
        AnalyticsClient(
            configure: { _ in },
            enable: { _, _ in },
            send: { _, _ in }
        )
    }()
}
