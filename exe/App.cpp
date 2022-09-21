
#include "./MyApiClient.hpp"

#include "oatpp-libressl/Callbacks.hpp"

#include <iostream>

/**
 *  main
 */
int main(int argc, const char *argv[])
{
  std::cout << "hello world" << std::endl;

  oatpp::base::Environment::init();

  oatpp::libressl::Callbacks::setDefaultCallbacks();

  // auto client = MyApiClient::createShared({"172.16.127.100", 20130},true);
  // auto code = client->doGetTest1()->getStatusCode();

  auto client = MyApiClient::createShared({"httpbin.org", 443}, true);
  auto connection = client->getConnection();
  OATPP_ASSERT(connection);

  auto response = client->doGetTest2(connection);
  auto code = response->getStatusCode();

  std::cout << "response code: " << code << std::endl;

  /* Print how much objects were created during app running, and what have left-probably leaked */
  /* Disable object counting for release builds using '-D OATPP_DISABLE_ENV_OBJECT_COUNTERS' flag for better performance */
  std::cout << "\nEnvironment:\n";
  std::cout << "objectsCount = " << oatpp::base::Environment::getObjectsCount() << "\n";
  std::cout << "objectsCreated = " << oatpp::base::Environment::getObjectsCreated() << "\n\n";

  oatpp::base::Environment::destroy();

  return 0;
}
