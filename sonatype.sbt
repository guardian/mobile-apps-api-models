ThisBuild / publishTo := sonatypePublishToBundle.value

ThisBuild / scmInfo := Some(ScmInfo(
  url("https://github.com/guardian/mobile-apps-api-models"),
  "scm:git:git@github.com:guardian/mobile-apps-api-models.git"
))

ThisBuild / homepage := Some(url("https://github.com/guardian/mobile-apps-api-models"))

ThisBuild / developers := List(Developer(
  id = "Guardian",
  name = "Guardian",
  email = null,
  url = url("https://github.com/guardian")
))