local function ext_opts(virtual_text)
  return {
    -- these ext_opts are applied when the node is not active, but
    -- the snippet still is.
    passive = {
      -- add virtual text on the line of the node, behind all text.
      virt_text = {{virtual_text, "Visual"}}
    },
  }
end

return ext_opts
