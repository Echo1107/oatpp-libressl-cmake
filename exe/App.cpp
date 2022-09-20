
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

  auto client = MyApiClient::createShared({"synyi-portal-frontend-566-v3-master.synyi.sy", 443});
  auto res1 = client->doPostTest()->readBodyToString();

  std::cout << "res1: " << res1->c_str() << std::endl;

  auto client2 = MyApiClient::createShared({"map-concept-bootstrap-714-develop.sy/", 80});
  auto res2 = client2->doGetVersion()->readBodyToString();

  std::cout << "res2: " << res2->c_str() << std::endl;

  /* Print how much objects were created during app running, and what have left-probably leaked */
  /* Disable object counting for release builds using '-D OATPP_DISABLE_ENV_OBJECT_COUNTERS' flag for better performance */
  std::cout << "\nEnvironment:\n";
  std::cout << "objectsCount = " << oatpp::base::Environment::getObjectsCount() << "\n";
  std::cout << "objectsCreated = " << oatpp::base::Environment::getObjectsCreated() << "\n\n";

  oatpp::base::Environment::destroy();

  return 0;
}
