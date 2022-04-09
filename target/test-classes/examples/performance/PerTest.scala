package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerfTest extends Simulation {

  val protocol = karateProtocol(
    // "/cats/{id}" -> Nil,
    // "/cats" -> pauseFor("get" -> 15, "post" -> 25)
  )

//   protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  protocol.runner.karateEnv("perf")

  val createArticle = scenario("Create and Delete Article").exec(karateFeature("classpath:examples/performance/createArticle.feature"))
//   val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

  setUp(
      createArticle.inject(atOnceUsers(10)).protocols(protocol)
    // createArticle.inject(rampUsers(10) during (5 seconds)).protocols(protocol),
    // delete.inject(rampUsers(5) during (5 seconds)).protocols(protocol)
  )

}