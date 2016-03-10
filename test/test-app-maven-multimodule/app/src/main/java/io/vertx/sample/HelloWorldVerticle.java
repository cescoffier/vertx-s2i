package io.vertx.sample;

import io.vertx.core.AbstractVerticle;
import io.vertx.sample.lib.MyLib;

public class HelloWorldVerticle extends AbstractVerticle {

  @Override
  public void start() {
    vertx.createHttpServer()
      .requestHandler(req -> req.response().end(MyLib.hello()))
      .listen(8080);
  }
}
