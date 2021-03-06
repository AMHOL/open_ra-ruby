# frozen_string_literal: true

module Openra
  module Commands
    module Utils
      def utf8(string)
        string.force_encoding('UTF-8')
      end

      # https://github.com/OpenRA/OpenRA/blob/bleed/OpenRA.Game/CPos.cs#L24
      def cell(pos)
        return if pos.zero?

        {
          x: pos >> 20,
          y: ((pos >> 4) & 0xFFF0) >> 4,
          layer: pos & 0xFF
        }
      end

      def time(msec)
        sec = msec / 1000
        mm, ss = sec.divmod(60)
        hh, mm = mm.divmod(60)

        {
          formatted: '%02d:%02d:%02d' % [hh, mm, ss],
          msec: msec.to_i
        }
      end
    end
  end
end
