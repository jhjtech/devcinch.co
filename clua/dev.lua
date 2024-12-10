local function refresh()
  package.loaded.server = nil
  package.loaded.views = nil
  package.loaded.style = nil
  package.loaded.s3 = nil
  package.loaded.html = nil
  package.loaded.files = nil
  package.loaded.snippets = nil
  return nil
end
return {refresh = refresh}
