defmodule AustinLvnWeb.HomeLive.SwiftUI do
  use LiveViewNative.Component,
    format: :swiftui,
    as: :render,
    layout: {AustinLvnWeb.Layouts.SwiftUI, :app}
end