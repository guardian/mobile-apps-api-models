namespace * com.gu.mobile.mapi.models

enum RowType {
    LAYOUT,
    CAROUSEL,
    THRASHER
}

enum CardType {
    ARTICLE,
    PODCAST,
    VIDEO
}

enum MediaType {
    VIDEO,
    AUDIO,
    IMAGE
}

struct Palette {
    1: required string accentColour
    2: required string background
    3: required string commentCount
    4: required string elementBackground
    5: required string headline
    6: required string immersiveKicker
    7: required string main
    8: required string mediaBackground
    9: required string mediaIcon
    10: required string metaText
    11: required string pill
    12: required string pillar
    13: required string secondary
    14: required string shadow
    15: required string topBorder
}

struct Links {
    1: required string relatedUri
    2: required string shortUrl
    3: required string uri
    4: required string webUri
}

struct Image {
    1: optional string altText
    2: optional string caption
    3: optional string credit
    4: required i32 height
    5: required string orientation
    6: required string urlTemplate
    7: required i32 width
}

struct Article {
    1: required string id
    2: optional string byline
    3: optional list<Image> images
    4: required Links links
    5: optional string kicker
    6: required string title
    7: optional string trailText
    8: optional i16 rating
    9: optional i32 commentCount
    10: optional string publishedDate
    11: optional string lastUpdatedDate
    12: optional MediaType mediaType
    13: optional i32 durationInSeconds
    14: optional Image profileImage
    15: optional list<LiveEvent> events
    16: optional Palette paletteLight
    17: optional Palette paletteDark
}

struct LiveEvent {
    1: required string id
    2: required string title
    3: required string body
    4: optional string publishedDate
    5: optional string lastUpdatedDate
}

struct Card {
    1: required list<Article> articles
    2: optional Palette paletteLight
    3: optional Palette paletteDark
    4: required CardType type
    5: optional bool boosted
    6: optional bool compact
    7: optional list<Article> sublinks
}

struct Column {
    1: required list<Card> cards
    2: optional Palette paletteLight
    3: optional Palette paletteDark
    4: required i32 preferredWidth
}

struct Thrasher {
    1: required string uri
}

struct Row {
    1: optional list<Column> columns
    2: optional Palette paletteLight
    3: optional Palette paletteDark
    4: optional i32 preferredNumberOfColumns
    5: optional Thrasher thrasher
    6: required RowType type
}

struct Collection {
    1: required string id
    2: optional Palette paletteLight
    3: optional Palette paletteDark
    4: required list<Row> rows
    5: optional string title
}