class Shoes
  module Swt
    # Class is used by edit_box and edit_line
    class InputBox
      include Common::Child
      include Common::Clear
      include Common::Toggle
      include ::Shoes::BackendDimensionsDelegations

      attr_reader :real, :dsl

      def initialize(dsl, parent, text_options)
        @dsl          = dsl
        @parent       = parent
        @text_options = text_options

        @real = ::Swt::Widgets::Text.new(@parent.real, text_options)
        @real.set_size dsl.width, dsl.height
        @real.set_text dsl.initial_text.to_s
        @real.add_modify_listener do |event|
          @dsl.call_change_listeners
        end
      end

      def text
        @real.text
      end

      def text=(value)
        @real.text = value
      end

      def move(left, top)
        unless @real.disposed?
          @real.set_location left, top
        end
      end

      def enabled(value)
        @real.enable_widget value
      end

    end
  end
end
