defmodule AustinLvnWeb.HomeLive do
  use AustinLvnWeb, :live_view
  use LiveViewNative.LiveView,
    formats: [:swiftui],
    layouts: [
      swiftui: {AustinLvnWeb.Layouts.SwiftUI, :app}
    ]
end