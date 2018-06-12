# Setup new WordPress project

function new_wp(){
	echo -e "What is this projects name? \c"
	read PROJECT_NAME
	mkdir $PROJECT_NAME && cd $PROJECT_NAME

	mkdir -p tmp
	curl "https://wordpress.org/latest.zip" -L -o tmp/wordpress.zip
	unzip tmp/wordpress.zip

	pushd wordpress
	mv * ../
	popd
	rm -rf wordpress
	rm -rf tmp
	rm -rf wp-content/themes/twentyfourteen/
	rm -rf wp-content/themes/twentyfifteen/
	rm -rf wp-content/themes/twentysixteen/
	rm -rf wp-content/themes/twentyseventeen/

	RANDOM1="$$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";
	RANDOM2="^$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";
	RANDOM3="&$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";
	RANDOM4="*$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";
	RANDOM5="($RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";
	RANDOM6=")$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";
	RANDOM7="@$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";
	RANDOM8="$$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM";

	echo "<?php
		define('WP_SITEURL', 'http://' . \$_SERVER['HTTP_HOST']);
		define('WP_HOME', 'http://' . \$_SERVER['HTTP_HOST']);

		switch (\$_SERVER['HTTP_HOST']) {
			case 'local':
				define('DB_NAME', '');
				define('DB_USER', 'root');
				define('DB_PASSWORD', 'root');
				define('DB_HOST', 'localhost');
			break;

			case 'dev':
				define('DB_NAME', '');
				define('DB_USER', 'root');
				define('DB_PASSWORD', 'root');
				define('DB_HOST', 'localhost');
			break;

			case 'com':
				define('DB_NAME', '');
				define('DB_USER', 'root');
				define('DB_PASSWORD', 'root');
				define('DB_HOST', 'localhost');
			break;
		}

		define('DB_CHARSET', 'utf8');
		define('DB_COLLATE', '');

		define('AUTH_KEY',         '$RANDOM1');
		define('SECURE_AUTH_KEY',  '$RANDOM2');
		define('LOGGED_IN_KEY',    '$RANDOM3');
		define('NONCE_KEY',        '$RANDOM4');
		define('AUTH_SALT',        '$RANDOM5');
		define('SECURE_AUTH_SALT', '$RANDOM6');
		define('LOGGED_IN_SALT',   '$RANDOM7');
		define('NONCE_SALT',       '$RANDOM8');

		\$table_prefix  = 'wp_';

		if (isset(\$_GET['debug'])) {
			define('WP_DEBUG', true);
		}
		else{
			define('WP_DEBUG', false);
		}

		if ( !defined('ABSPATH') )
			define('ABSPATH', dirname(__FILE__) . '/');

		require_once(ABSPATH . 'wp-settings.php');
	?>" > wp-config.php

	rm -rf wp-config-sample.php

	mkdir -p tmp
	curl "https://github.com/mikemccarron/Wordpress-Starter-Theme/archive/master.zip" -L -o tmp/basetheme.zip
	pushd tmp
	unzip basetheme.zip

	pushd Wordpress-Starter-Theme-master
	mv starter-theme ../../wp-content/themes/
	popd

	cd ../
	rm -rf wp-content/plugins/
	rm -rf tmp
	cd ../
	echo 'Congratulation, you’re new Wordpress build has been installed.'
}