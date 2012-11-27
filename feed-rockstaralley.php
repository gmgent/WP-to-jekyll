<?php
/*
Template Name: ROCKSTARALLEY
*/

$numposts = 5;

function yoast_rss_date( $timestamp = null ) {
  $timestamp = ($timestamp==null) ? time() : $timestamp;
  echo date(DATE_RSS, $timestamp);
}

function yoast_rss_text_limit($string, $length, $replacer = '...') {
  $string = strip_tags($string);
  if(strlen($string) > $length)
    return (preg_match('/^(.*)\W.*$/', substr($string, 0, $length+1), $matches) ? $matches[1] : substr($string, 0, $length)) . $replacer;
  return $string;
}

$posts = query_posts( array ( 'category_name' => 'Rockstaralley', 'posts_per_page' => $numposts ) );


$lastpost = $numposts - 1;

header("Content-Type: application/rss+xml; charset=UTF-8");
echo '<?xml version="1.0"?>';
?><rss version="2.0" xml:base="http://blog.kristeraxel.com/topics/rockstaralley/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:dc="http://purl.org/dc/elements/1.1/">
<channel>
  <title>RockstarAlley by Krister Axel</title>
  <link>http://rockstaralley.com/</link>
  <description>The latest posts from the RockstarAlley podcast.</description>
  <itunes:image href="http://kristeraxel.com/art/rockstaralley2_99.jpg" />
  <itunes:owner>
    <itunes:name>Krister Axel</itunes:name>
    <itunes:email>krister.axel@gmail.com</itunes:email>
  </itunes:owner>
  <itunes:category text="Music"/>
  <itunes:category text="Independent"/>
  <language>en-us</language>
  <pubDate><?php yoast_rss_date( strtotime($ps[$lastpost]->post_date_gmt) ); ?></pubDate>
  <lastBuildDate><?php yoast_rss_date( strtotime($ps[$lastpost]->post_date_gmt) ); ?></lastBuildDate>
<?php foreach ($posts as $post) { ?>
	
	
  <item>
    <title><?php echo get_the_title($post->ID); ?></title>
	<link><?php 	
				define('REGEX_URL','((https?:\/\/|www\.)([-\w\.]+)+(:\d+)?(\/([\w\/_\.-]*(\?\S+)?)?)?)');

				$input = $post->post_content;

				if(preg_match(REGEX_URL, $input, $url)) {
					 $this_link = $url[0];
				   echo $this_link;
				} else {
				   $this_link = "none";
				   echo $this_link;
				} 
			?></link>
    <description><?php echo '<![CDATA['.yoast_rss_text_limit($post->post_content, 500).']]>';  ?></description>
	<itunes:subtitle><?php echo yoast_rss_text_limit($post->post_content, 60);  ?></itunes:subtitle>
    <itunes:summary><?php echo yoast_rss_text_limit($post->post_content, 500);  ?></itunes:summary>
	<category domain="http://blog.kristeraxel.com/topics/rockstaralley/">RockstarAlley</category>
	<enclosure url="<?php echo $this_link; ?>" type="audio/mpeg" />
	<itunes:author>Krister Axel</itunes:author>
	<itunes:image href="http://kristeraxel.com/art/rockstaralley2_99.jpg" />
    <pubDate><?php yoast_rss_date( strtotime($post->post_date_gmt) ); ?></pubDate>
	<dc:creator>Krister Axel</dc:creator>
	<guid isPermaLink="false"><?php echo get_permalink($post->ID); ?></guid>
  </item>

<?php } ?>
</channel>
</rss>