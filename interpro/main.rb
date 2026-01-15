# encoding: UTF-8
require "sketchup.rb"

module PH
  module Interpro
    extend self

    def state
      @state ||= {count: 0}
    end

    def ping
      state[:count] += 1
      UI.messagebox("Ping OK (v2). Count = #{state[:count]}")
    end

    def cmd_ping
      @cmd_ping ||= UI::Command.new("Ping") { ping }
    end

    def setup_ui
      menu = UI.menu("Extensions")
      menu.add_item("Interpro: Ping") { ping }

      tb = UI::Toolbar.new("Interpro")
      tb.add_item(cmd_ping)
      tb.restore
    end

    setup_ui
    puts "[Interpro] Ping ready"
  end
#Hi Trinh
end
