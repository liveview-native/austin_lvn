defmodule AustinLvnWeb.Layouts.SwiftUI do
  use LiveViewNative.Component,
    format: :swiftui

  import LiveViewNative.Stylesheet.Component,
    only: [
      csrf_token: 1,
      embed_stylesheet: 1
    ]

  embed_templates "layouts_swiftui/*"
end
