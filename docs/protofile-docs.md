# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [proto/collection.proto](#proto_collection-proto)
    - [Article](#com-gu-mobile-mapi-models-Article)
    - [Branding](#com-gu-mobile-mapi-models-Branding)
    - [Card](#com-gu-mobile-mapi-models-Card)
    - [Collection](#com-gu-mobile-mapi-models-Collection)
    - [Column](#com-gu-mobile-mapi-models-Column)
    - [FollowUp](#com-gu-mobile-mapi-models-FollowUp)
    - [Image](#com-gu-mobile-mapi-models-Image)
    - [Links](#com-gu-mobile-mapi-models-Links)
    - [LiveEvent](#com-gu-mobile-mapi-models-LiveEvent)
    - [Palette](#com-gu-mobile-mapi-models-Palette)
    - [RenderingPlatformSupport](#com-gu-mobile-mapi-models-RenderingPlatformSupport)
    - [Row](#com-gu-mobile-mapi-models-Row)
    - [Thrasher](#com-gu-mobile-mapi-models-Thrasher)
    - [Video](#com-gu-mobile-mapi-models-Video)
  
    - [Card.CardType](#com-gu-mobile-mapi-models-Card-CardType)
    - [FollowUp.FollowUpType](#com-gu-mobile-mapi-models-FollowUp-FollowUpType)
    - [MediaType](#com-gu-mobile-mapi-models-MediaType)
    - [Row.RowType](#com-gu-mobile-mapi-models-Row-RowType)
  
- [Scalar Value Types](#scalar-value-types)



<a name="proto_collection-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## proto/collection.proto
collection.proto


<a name="com-gu-mobile-mapi-models-Article"></a>

### Article



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  |  |
| byline | [string](#string) | optional |  |
| images | [Image](#com-gu-mobile-mapi-models-Image) | repeated |  |
| links | [Links](#com-gu-mobile-mapi-models-Links) |  |  |
| kicker | [string](#string) | optional |  |
| title | [string](#string) |  |  |
| trail_text | [string](#string) | optional |  |
| rating | [int32](#int32) | optional |  |
| comment_count | [int32](#int32) | optional |  |
| published_date | [google.protobuf.Timestamp](#google-protobuf-Timestamp) | optional |  |
| last_updated_date | [google.protobuf.Timestamp](#google-protobuf-Timestamp) | optional |  |
| media_type | [MediaType](#com-gu-mobile-mapi-models-MediaType) | optional |  |
| duration | [google.protobuf.Duration](#google-protobuf-Duration) | optional | Only expected for video or audio content. |
| profile_image | [Image](#com-gu-mobile-mapi-models-Image) | optional | MAPI will never return both images and a profile_image. |
| events | [LiveEvent](#com-gu-mobile-mapi-models-LiveEvent) | repeated |  |
| palette_light | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |
| palette_dark | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |
| apple_podcast_url | [string](#string) | optional | Only applicable to podcasts. |
| google_podcast_url | [string](#string) | optional | Only applicable to podcasts. |
| spotify_podcast_url | [string](#string) | optional | Only applicable to podcasts. |
| videos | [Video](#com-gu-mobile-mapi-models-Video) | repeated |  |
| is_live | [bool](#bool) | optional | This is an indicator as to whether a live blog is still blogging, or if it&#39;s been closed. |
| pocket_cast_podcast_url | [string](#string) | optional | Only applicable to podcasts. |
| rendered_item_prod | [RenderingPlatformSupport](#com-gu-mobile-mapi-models-RenderingPlatformSupport) | optional |  |
| rendered_item_beta | [RenderingPlatformSupport](#com-gu-mobile-mapi-models-RenderingPlatformSupport) | optional |  |






<a name="com-gu-mobile-mapi-models-Branding"></a>

### Branding



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| branding_type | [string](#string) |  |  |
| sponsor_name | [string](#string) |  |  |
| logo | [string](#string) |  |  |
| sponsor_uri | [string](#string) |  |  |
| label | [string](#string) |  |  |
| about_uri | [string](#string) |  |  |






<a name="com-gu-mobile-mapi-models-Card"></a>

### Card



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [Card.CardType](#com-gu-mobile-mapi-models-Card-CardType) |  |  |
| article | [Article](#com-gu-mobile-mapi-models-Article) |  |  |
| boosted | [bool](#bool) | optional | Boosted cards show a boosted headline size and a main image that spans full width on mobile. |
| compact | [bool](#bool) | optional | Compact cards don&#39;t show all the information that non-compact cards do, and tend to appear in a carousel. |
| sublinks | [Article](#com-gu-mobile-mapi-models-Article) | repeated |  |
| html_fallback | [string](#string) | optional |  |
| branding | [Branding](#com-gu-mobile-mapi-models-Branding) | optional | Individual cards can be branded (and not be part of a branded container). Cards that are branded tend to show the sponsor logo and should be returned with a different palette. |
| premium_content | [bool](#bool) | optional | Individual cards can be defined as &#34;premium content&#34;. If premium_content is true then it implies the card should be hidden from signed-in users (for example if the card has been paid for by an external sponsor). |
| sublinks_palette_light | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |
| sublinks_palette_dark | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |






<a name="com-gu-mobile-mapi-models-Collection"></a>

### Collection



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  |  |
| palette_light | [Palette](#com-gu-mobile-mapi-models-Palette) | optional | A palette at the collection level is currently mapped from MAPI&#39;s &#34;navigation style&#34;. It&#39;s specified when the look and feel of an entire container should be changed, for example when a container is &#34;branded&#34; because the content has been paid for. |
| palette_dark | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |
| rows | [Row](#com-gu-mobile-mapi-models-Row) | repeated | MAPI can technically return a list of empty rows. This might be because MAPI doesn&#39;t support the specific content that&#39;s included in the collection. In this case it&#39;s assumed the client will hide the entire collection from the reader. |
| title | [string](#string) | optional |  |
| branding | [Branding](#com-gu-mobile-mapi-models-Branding) | optional | We define branding at the collection level because certain containers require a different look and feel, for example content published by Guardian Labs. |
| premium_content | [bool](#bool) | optional | A container can be defined as &#34;premium&#34;. Currently this is just for the Crosswords container for which only premium users are allowed to access (although it is visible to all users). Note that the Crosswords container is not curated by Editorial in the fronts tool but instead created on the fly by MAPI. |
| follow_up | [FollowUp](#com-gu-mobile-mapi-models-FollowUp) | optional |  |






<a name="com-gu-mobile-mapi-models-Column"></a>

### Column



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| cards | [Card](#com-gu-mobile-mapi-models-Card) | repeated | By default, if there are multiple cards in the cards array then it&#39;s expected that the client will display these as stacked vertical elements. |
| palette_light | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |
| palette_dark | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |
| preferred_width | [int32](#int32) |  | The card(s) in the column assume this preferred width. |






<a name="com-gu-mobile-mapi-models-FollowUp"></a>

### FollowUp
The follow up message contains links to get more information about the collection.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [FollowUp.FollowUpType](#com-gu-mobile-mapi-models-FollowUp-FollowUpType) |  |  |
| uri | [string](#string) |  |  |
| blueprint_uri | [string](#string) | optional | At the time of creation MAPI couldn&#39;t support blueprint versions of the follow-on link so this field was marked as optional. As part of the migration work, MAPI will eventually support blueprint endpoints for all follow on links. |






<a name="com-gu-mobile-mapi-models-Image"></a>

### Image



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| alt_text | [string](#string) | optional |  |
| caption | [string](#string) | optional |  |
| credit | [string](#string) | optional |  |
| height | [int32](#int32) | optional |  |
| url_template | [string](#string) |  |  |
| width | [int32](#int32) | optional |  |






<a name="com-gu-mobile-mapi-models-Links"></a>

### Links



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| related_uri | [string](#string) |  |  |
| short_url | [string](#string) |  |  |
| uri | [string](#string) |  |  |
| web_uri | [string](#string) |  |  |






<a name="com-gu-mobile-mapi-models-LiveEvent"></a>

### LiveEvent
This message is only applicable to live blogs.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  |  |
| title | [string](#string) |  |  |
| body | [string](#string) |  |  |
| published_date | [google.protobuf.Timestamp](#google-protobuf-Timestamp) | optional |  |
| last_updated_date | [google.protobuf.Timestamp](#google-protobuf-Timestamp) | optional |  |






<a name="com-gu-mobile-mapi-models-Palette"></a>

### Palette



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| accent_colour | [string](#string) |  |  |
| background | [string](#string) |  |  |
| comment_count | [string](#string) |  |  |
| element_background | [string](#string) |  |  |
| headline | [string](#string) |  |  |
| immersive_kicker | [string](#string) |  |  |
| main | [string](#string) |  |  |
| media_background | [string](#string) |  |  |
| media_icon | [string](#string) |  |  |
| meta_text | [string](#string) |  |  |
| pill | [string](#string) |  |  |
| pillar | [string](#string) |  |  |
| secondary | [string](#string) |  |  |
| shadow | [string](#string) |  |  |
| top_border | [string](#string) |  |  |






<a name="com-gu-mobile-mapi-models-RenderingPlatformSupport"></a>

### RenderingPlatformSupport
The rendering platform support object is required to support opening AR articles on native clients.
We don&#39;t return this message if the corresponding article cannot be rendered by the server (instead
only by legacy article templates).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| min_bridget_version | [string](#string) |  |  |
| uri | [string](#string) |  |  |






<a name="com-gu-mobile-mapi-models-Row"></a>

### Row



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| columns | [Column](#com-gu-mobile-mapi-models-Column) | repeated |  |
| palette_light | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |
| palette_dark | [Palette](#com-gu-mobile-mapi-models-Palette) | optional |  |
| preferred_number_of_columns | [int32](#int32) |  | Tablet devices support a 4 column display, whereas mobile devices support a 2 column display. If a mobile device receives a row with a preferred number of columns greater than 2, the additional columns are &#34;wrapped&#34; onto an extra row (a bit like CSS flex-wrap). |
| thrasher | [Thrasher](#com-gu-mobile-mapi-models-Thrasher) | optional |  |
| type | [Row.RowType](#com-gu-mobile-mapi-models-Row-RowType) |  |  |
| title | [string](#string) | optional |  |






<a name="com-gu-mobile-mapi-models-Thrasher"></a>

### Thrasher
This is a special type of container on a front that is delivered via editorial tools.
Thrashers are used to promote either features or commercial content.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| uri | [string](#string) |  |  |






<a name="com-gu-mobile-mapi-models-Video"></a>

### Video



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| alt_text | [string](#string) | optional |  |
| caption | [string](#string) | optional |  |
| credit | [string](#string) | optional |  |
| height | [int32](#int32) | optional |  |
| orientation | [string](#string) | optional |  |
| url | [string](#string) |  |  |
| width | [int32](#int32) | optional |  |





 


<a name="com-gu-mobile-mapi-models-Card-CardType"></a>

### Card.CardType


| Name | Number | Description |
| ---- | ------ | ----------- |
| CARD_TYPE_ARTICLE | 0 |  |
| CARD_TYPE_PODCAST | 1 |  |
| CARD_TYPE_VIDEO | 2 |  |
| CARD_TYPE_CROSSWORD | 3 |  |
| CARD_TYPE_DISPLAY | 4 | Display cards have their own separate design (see figma designs for ref). |
| CARD_TYPE_MOSTVIEWED | 5 |  |



<a name="com-gu-mobile-mapi-models-FollowUp-FollowUpType"></a>

### FollowUp.FollowUpType


| Name | Number | Description |
| ---- | ------ | ----------- |
| FOLLOW_UP_TYPE_LIST | 0 |  |
| FOLLOW_UP_TYPE_FRONT | 1 |  |
| FOLLOW_UP_TYPE_INAPP | 2 |  |



<a name="com-gu-mobile-mapi-models-MediaType"></a>

### MediaType


| Name | Number | Description |
| ---- | ------ | ----------- |
| MEDIA_TYPE_VIDEO | 0 |  |
| MEDIA_TYPE_AUDIO | 1 |  |
| MEDIA_TYPE_IMAGE | 2 |  |



<a name="com-gu-mobile-mapi-models-Row-RowType"></a>

### Row.RowType


| Name | Number | Description |
| ---- | ------ | ----------- |
| ROW_TYPE_LAYOUT | 0 | Layout is the &#34;default&#34; way of laying out rows and columns. |
| ROW_TYPE_CAROUSEL | 1 |  |
| ROW_TYPE_THRASHER | 2 |  |


 

 

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

