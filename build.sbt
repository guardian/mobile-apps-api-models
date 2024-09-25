import ReleaseTransformations.*
import sbtversionpolicy.withsbtrelease.ReleaseVersion.fromAggregatedAssessedCompatibilityWithLatestRelease

ThisBuild / organization := "com.gu"
ThisBuild / scalaVersion := "2.13.15"
ThisBuild / licenses += ("Apache-2.0", url("https://www.apache.org/licenses/LICENSE-2.0.html"))

crossScalaVersions := Seq(scalaVersion.value, "2.12.20", "3.3.3")

lazy val scalaModels = project.in(file("."))
  .settings(
    name := "mobile-apps-api-models-v0",

    libraryDependencies ++= Seq(
      "com.thesamet.scalapb" %% "scalapb-runtime" % scalapb.compiler.Version.scalapbVersion % "protobuf"
    ),

    Compile / scalacOptions ++= Seq("-release:11"),

    Compile / PB.targets := Seq(
      scalapb.gen() -> (Compile / sourceManaged).value / "scalapb"
    ),

    Compile / PB.protoSources := Seq(baseDirectory.value / "./proto"),
    releaseCrossBuild := true,
    releaseProcess := Seq[ReleaseStep](
      checkSnapshotDependencies,
      inquireVersions,
      runClean,
      runTest,
      setReleaseVersion,
      commitReleaseVersion,
      tagRelease,
      setNextVersion,
      commitNextVersion
    )
  )
