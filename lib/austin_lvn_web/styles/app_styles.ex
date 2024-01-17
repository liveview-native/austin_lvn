defmodule AustinLvnWeb.AppStyles do
  use LiveViewNative.Stylesheet, :swiftui

  ~SHEET"""
  "color-"<> color do
    color(to_ime(color))
  end
  """
end