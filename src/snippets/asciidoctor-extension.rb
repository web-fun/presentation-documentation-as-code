Asciidoctor::Extensions.register do
  block_macro :lorem do
    name_positional_attributes 'size'
    process do |parent, target, attrs|
      lorem = Middleman::Extensions::Lorem::LoremObject
      method = target.to_sym
      if lorem.respond_to? method
        content = lorem.send(method, attrs.fetch('length', 1).to_i.abs)
        create_paragraph parent, content, {}
      else
        warn 'Unknown lorem target for lorem block macro'
        nil
      end
    end
  end
end
