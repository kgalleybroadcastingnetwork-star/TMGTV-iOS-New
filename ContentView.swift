import SwiftUI
import WebKit

struct ContentView: View {
    @State private var isLoading = true
    var body: some View {
        ZStack(alignment: .top) {
            TMGWebView(isLoading: $isLoading)
                .ignoresSafeArea(edges: .bottom)
            if isLoading {
                ProgressView().padding(10)
                    .background(.ultraThinMaterial, in: Capsule())
                    .padding(.top, 8)
            }
        }
    }
}

struct TMGWebView: UIViewRepresentable {
    @Binding var isLoading: Bool

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = [.audio, .video]
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Resources") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        } else if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        var parent: TMGWebView
        init(_ parent: TMGWebView) { self.parent = parent }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
        }
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if navigationAction.targetFrame == nil, let url = navigationAction.request.url {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
    }
}
