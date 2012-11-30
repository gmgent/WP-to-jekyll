---
layout: blog
title: fun with eval
permalink: 2012/09/fun-with-eval
postday: 09/16 2012
posttime: 13_46
categories: [code]
---

this is why I love eval. Because it makes my life easy.

<code>
  <pre>
        Gmg.list_of_optional_redemption_fields.each do |new_field|
          underscored_field = new_field.underscore
          value = original_line.field(new_field).strip
          eval "return_items.#{underscored_field} = '#{value}'"
        end
  </pre>
</code>
