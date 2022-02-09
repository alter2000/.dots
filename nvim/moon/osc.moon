to_osc52 = s ->
  b64 = to_base64 s
  if os.getenv 'TMUX'
    return "\ePtmux;\e\e]52;c;"..b64.."\x07\e\\"
  else return "\e]52;c;"..b64.."\x07"
