#!/usr/bin/env ruby

directories ["lib", "source"]

clearing :on

guard :shell do
  watch(/^lib|^source/) do
    `bin/build`
  end
end
