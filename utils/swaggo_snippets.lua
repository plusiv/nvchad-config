
local ls = require("luasnip")
-- some shorthands...
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt


local ext_opts = require("custom.utils.utils")

local swaggo = {}

swaggo.SwaggoAppBase = function()
  return {t({"",
      "//  @title          "}, { node_ext_opts=ext_opts("Add base info:") }), i(1, "Swagger Example API"), t({"",
      "//  @version        "}), i(2, "1.0"), t({"",
      "//  @description    "}), i(3, "This is a sample server celler server."), t({"",
      "//  @termsOfService "}), i(4, "http://swagger.io/terms/"),
  }
end


swaggo.SwaggoAppContact = function()
  return {
    t({"",
      "//  @contact.name   "}, { node_ext_opts=ext_opts("Add contact info:") }), i(1, "API Support"), t({"",
      "//  @contact.url    "}), i(2, "http://www.swagger.io/support"), t({"",
      "//  @contact.email  "}), i(3, "support@swagger.io")
    }
end

swaggo.SwaggoAppLicense = function()
  return {
    t({"",
    "//  @license.name   "}, { node_ext_opts=ext_opts("Add license info:") }), i(1, "Apache 2.0"), t({"",
    "//  @license.url    "}), i(2, "http://www.apache.org/licenses/LICENSE-2.0.html"),
  }
end

swaggo.SwaggoAppHostInfo = function()
  return {
    t({"",
    "//  @host           "}, { node_ext_opts=ext_opts("Add host info:") } ), i(1, "localhost:8080"), t({"",
    "//  @BasePath       "}), i(2, "/api/v1")
  }
end

swaggo.SwaggoAppSecurityInfo = function()
  local basicAuth = {
    t({"",
      "//  @securityDefinitions.basic "}), i(1, "BasicAuth")
  }

  local apiKeyAuth = {
    t({"",
      "//  @securityDefinitions.apikey "}), i(1, "ApiKeyAuth"), t({"",
      "//  @in                         "}), i(2, "header"), t({"",
      "//  @name                       "}), i(3, "Authorization"), t({"",
      "//  @description                "}), i(4, "Description for what is this security definition being used"),
  }

  local oauth2ApplicationAuth = {
    t({"",
      "//  @securitydefinitions.oauth2.application "}), i(1, "OAuth2Application"), t({"",
      "//  @tokenUrl                               "}), i(2, "https://example.com/oauth/token"), t({"",
      "//  @scope.write                            "}), i(3, "Grants write access"), t({"",
      "//  @scope.admin                            "}), i(4, "Grants read and write access to administrative information"),
    }

  local oauth2ImplicitAuth = {
    t({"",
      "//  @securitydefinitions.oauth2.implicit "}), i(1, "OAuth2Implicit"), t({"",
      "//  @authorizationUrl                      "}), i(2, "https://example.com/oauth/authorize"), t({"",
      "//  @scope.write                            "}), i(3, "Grants write access"), t({"",
      "//  @scope.admin                            "}), i(4, "Grants read and write access to administrative information"),
  }

  local oauth2PasswordAuth = {
    t({"",
      "//  @securitydefinitions.oauth2.password "}), i(1, "OAuth2Password"), t({"",
      "//  @tokenUrl                               "}), i(2, "https://example.com/oauth/token"), t({"",
      "//  @scope.read                             "}), i(3, "Grants read access"), t({"",
      "//  @scope.write                            "}), i(4, "Grants write access"), t({"",
      "//  @scope.admin                            "}), i(5, "Grants read and write access to administrative information"),
  }

  local oauth2AccessCodeAuth = {
    t({"",
      "//  @securitydefinitions.oauth2.accessCode "}), i(1, "OAuth2AccessCode"), t({"",
      "//  @tokenUrl                               "}), i(2, "https://example.com/oauth/token"), t({"",
      "//  @authorizationUrl                      "}), i(3, "https://example.com/oauth/authorize"), t({"",
      "//  @scope.admin                            "}), i(4, "Grants read and write access to administrative information"),
  }

  return {
    t("", { node_ext_opts=ext_opts("Add security info:") }),
    c(1, {basicAuth, apiKeyAuth, oauth2ApplicationAuth, oauth2ImplicitAuth, oauth2PasswordAuth, oauth2AccessCodeAuth, t(nil)})
  }

end


swaggo.SwaggoControllerBase = function()

  local mimeTypes = function()
    return {
    t("json"),
    t("xml"),
    t("plain"),
    t("html"),
    t("mpfd"),
    t("x-www-form-urlencoded"),
    t("json-api"),
    t("json-stream"),
    t("octet-stream"),
    t("png"),
    t("jpeg"),
    t("gif")
    }
  end

  local paramTypes = function()
    return {
      t("query"),
      t("path"),
      t("boddy"),
      t("header"),
      t("formData"),
    }
  end

  local dataTypes = function()
    return {
      t("query"),
      t("path"),
      t("boddy"),
      t("header"),
      t("formData"),
    }
  end

  local methodsTypes = function ()
    return {
      t("get"),
      t("post"),
      t("put"),
      t("delete"),
      t("patch")
    }
  end

  return fmt([[
      // {controllerName} godoc
      //
      //  @Summary        {summary}
      //  @Description    {description}
      //  @Tags           {tags}
      //  @Accept         {accept}
      //  @Produce        {produce}
      //  @Param          {paramName}  {paramType}    {paramDataType}  {paramIsMandatory}  "{paramComment}"
      //  @Success        {successCode} {successCodeType} {successCodeDataType} "{successCodeComment}"
      //  @Failure        {code400} {codeType400} {codeDataType400} "{codeComment400}"
      //  @Failure        {code404} {codeType404} {codeDataType404} "{codeComment404}"
      //  @Failure        {code500} {codeType500} {codeDataType500} "{codeComment500}"
      //  @Router         {path} [{method}]
  ]], {
        controllerName = i(1, "ControllerName"),
        summary = i(2, "Method summary"),
        description = i(3, "Description"),
        tags = i(4, "default"),
        accept = c(5, mimeTypes()),
        produce = c(6, mimeTypes()),
        paramName = i(7, "id"),
        paramType = c(8, paramTypes()),
        paramDataType = c(9, dataTypes()),
        paramIsMandatory = c(10, {t("false"), t("true")}),
        paramComment = c(11, {i(1, "comment"), t(nil)}),
        successCode = i(12, "200"),
        successCodeType = i(13, "{object}"),
        successCodeDataType = i(14, "model.MyModel"),
        successCodeComment = c(15, {i(1, "comment"), t(nil)}),
        code400 = i(16, "400"),
        codeType400 = i(17, "{object}"),
        codeDataType400 = i(18, "httputil.HTTPError"),
        codeComment400 = c(19, {i(1, "comment"), t(nil)}),
        code404 = i(20, "404"),
        codeType404 = i(21, "{object}"),
        codeDataType404 = i(22, "httputil.HTTPError"),
        codeComment404 = c(23, {i(1, "comment"), t(nil)}),
        code500 = i(24, "500"),
        codeType500 = i(25, "{object}"),
        codeDataType500 = i(26, "httputil.HTTPError"),
        codeComment500 = c(27, {i(1, "comment"), t(nil)}),
        path = i(28, "/path"),
        method = c(29, methodsTypes())
      })
end



return swaggo
