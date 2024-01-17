defmodule AustinLvnWeb.Router do
  use AustinLvnWeb, :router

  pipeline :browser do
    # plug :accepts, ["html"]
    # LVN - Required, comment out the above line and replace
    # with the line below to enable the Router to accept
    # incoming connections for the swiftui format
    plug :accepts, ["html", "swiftui"]
    plug :fetch_session
    plug :fetch_live_flash
    # plug :put_root_layout, html: {AustinLvnWeb.Layouts, :root}
    # LVN - required, comment out the above line and replace
    # with the line below to instruct the Router where the root
    # layout template is for the swiftui format
    plug :put_root_layout,
      html: {AustinLvnWeb.Layouts, :root},
      swiftui: {AustinLvnWeb.Layouts.SwiftUI, :root}

    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AustinLvnWeb do
    pipe_through :browser

    live "/", HomeLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", AustinLvnWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:austin_lvn, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: AustinLvnWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
