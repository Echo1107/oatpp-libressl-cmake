
#ifndef MyApiClient_hpp
#define MyApiClient_hpp

#include "oatpp/web/client/ApiClient.hpp"
#include "oatpp/core/data/mapping/type/Object.hpp"
#include "oatpp/core/macro/codegen.hpp"
#include "oatpp-libressl/server/ConnectionProvider.hpp"
#include "oatpp-libressl/client/ConnectionProvider.hpp"
#include "oatpp-libressl/Config.hpp"
#include "oatpp/web/client/HttpRequestExecutor.hpp"
#include "oatpp/parser/json/mapping/ObjectMapper.hpp"

#include OATPP_CODEGEN_BEGIN(ApiClient)

class MyApiClient : public oatpp::web::client::ApiClient
{
public:
  MyApiClient(const std::shared_ptr<oatpp::web::client::RequestExecutor> &requestExecutor, const std::shared_ptr<oatpp::data::mapping::ObjectMapper> &objectMapper) : oatpp::web::client::ApiClient(requestExecutor, objectMapper) {}

  static std::shared_ptr<MyApiClient> createShared(const oatpp::network::Address &address)
  {

    auto config = oatpp::libressl::Config::createShared();
    tls_config_insecure_noverifycert(config->getTLSConfig());
    tls_config_insecure_noverifyname(config->getTLSConfig());

    // auto connectionProvider = oatpp::libressl::client::ConnectionProvider::createShared(config, {"httpbin.org", 443});
    auto connectionProvider = oatpp::libressl::client::ConnectionProvider::createShared(config, address);
    auto requestExecutor = oatpp::web::client::HttpRequestExecutor::createShared(connectionProvider);
    auto objectMapper = oatpp::parser::json::mapping::ObjectMapper::createShared();
    return std::make_shared<MyApiClient>(requestExecutor, objectMapper);
  }

  // API_CLIENT_INIT(MyApiClient)

  API_CALL("GET", "/api/map_concept/version", doGetVersion)

  API_CALL("POST", "/be/am/api/health/alive", doPostTest)

};

#include OATPP_CODEGEN_END(ApiClient)

#endif /* MyApiClient_hpp */
