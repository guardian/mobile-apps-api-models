namespace * com.gu.mobile.mapi.models

enum RowType {
    LAYOUT,
    CAROUSEL,
    THRASHER
}

enum CardType {
    ARTICLE,
    COMPACT
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
    3: optional string cleanCaption
    4: optional string cleanCredit
    5: optional string credit
    6: required i32 height
    7: required string orientation
    8: required string urlTemplate
    9: required i32 width
}

struct BlueprintArticle {
    1: optional string byline
    2: optional list<Image> images
    3: required Links links
    4: optional string kicker
    5: optional string title
    6: optional string trailText
}

struct BlueprintCard {
    1: required list<BlueprintArticle> articles
    2: optional Palette palette
    3: optional Palette paletteDark
    4: required CardType type
    5: optional list<BlueprintArticle> sublinks
}

struct BlueprintColumn {
    1: required list<BlueprintCard> cards
    2: optional Palette palette
    3: optional Palette paletteDark
    4: required i32 preferredWidth
}

struct Thrasher {
    1: required string uri
}

struct BlueprintRow {
    1: optional list<BlueprintColumn> columns
    2: optional Palette palette
    3: optional Palette paletteDark
    4: optional i32 preferredNumberOfColumns
    5: optional Thrasher thrasher
    6: required RowType type
}

struct BlueprintCollection {
    1: required string id
    2: optional Palette palette
    3: optional Palette paletteDark
    4: required list<BlueprintRow> rows
    5: optional string title
}