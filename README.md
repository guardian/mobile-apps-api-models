<img src="https://img.shields.io/github/v/release/guardian/mobile-apps-api-models?label=thrift%20model">
<img src="https://img.shields.io/maven-central/v/com.gu/mobile-apps-api-models_2.12?label=scala%202.12">
<img src="https://img.shields.io/github/v/tag/guardian/mapi-models-swift?label=swift">

# Mobile Apps Api Models

These models are used to communicate between MAPI and the native apps. 
This repository currently defines the thrift [schema](thrift/collection.thrift) for "blueprint" collections.

## Releases

Use the GitHub UI to release models for Scala and Swift. 
The release process generates models representing the thrift schema, 
which can then be imported and used in the relevant platform.

For Scala, the release process results in a deployment to [Maven](https://repo1.maven.org/maven2/com/gu/mobile-apps-api-models_2.12/).
For Swift, the release process results in a tagged updated to a Swift [package](https://github.com/guardian/mapi-models-swift).

To release via the GitHub UI, visit [this](https://github.com/guardian/mobile-apps-api-models/releases/new) page.
- Create a tag version in the format vX.X.X that represents the version you'd like to release.
The tag will be created as part of the process so doesn't need to exist before creating a release.
- Define a release title and any useful release notes.
- Ensure the box "Set as pre-release" is _**not**_ checked and the checkbox "Set as the latest release" _**is**_ checked.
- When clicking the "Publish release" button a GitHub workflow will be triggered to publish the various release artefacts.

<img src="./docs/images/release.png">


## Non-production releases

### Scala

Preference should be given to running the `publishLocal` sbt command to generate test releases
(if the testing flow only requires local testing).

Otherwise, if testing is required e.g. in CODE, a snapshot version can be released via the github UI.

The steps you should take are:
- Push the branch with the changes you want to release to Github.
- [Click here](https://github.com/guardian/mobile-apps-api-models/releases/new?prerelease=true) to create prerelease using Github releases. You should see a view like this:

<img src="./docs/images/scala-pre-release.png">

You must then:
- Set the Target to your branch.
- Create a tag for the snapshot release (the tag will be created as part of the pre-release if it doesn't already exist).
- The tag should ideally have format "vX.X.X-SNAPSHOT" (the workflow will account for a missing `v` or `-SNAPSHOT`).
- Double-check that the "Set as pre-release" box is ticket.
- To automatically release the snapshot to sonatype, click the "Publish release" button.
- You should be able to find the snapshot release [here](https://oss.sonatype.org/content/repositories/snapshots/com/gu/)
