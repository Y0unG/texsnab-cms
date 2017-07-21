<!DOCTYPE html>
<html>
<head>
<base href="{$config->root_url}/"/>
<link href="design/{$settings->theme|escape}/css/style.css" rel="stylesheet" type="text/css" media="screen"/>
<script src="js/jquery/jquery.js"  type="text/javascript"></script>
<script src="design/{$settings->theme|escape}/js/app.js"  type="text/javascript"></script>
<script src="/js/baloon/js/baloon.js" type="text/javascript"></script>
<link   href="/js/baloon/css/baloon.css" rel="stylesheet" type="text/css" />
{literal}
<style>
	body {background:#fff}
	#iframe {padding:15px}
</style>
{/literal}
</head>
<body>
<div id="iframe">
{$content}
</div>
</body>
</html>