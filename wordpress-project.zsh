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

	UNIQUE_PHRASE="$RANDOM$PROJECT_NAME$RANDOM"

	echo "<?php
		define('DB_NAME', '$PROJECT_NAME-wp');
		define('DB_USER', 'root');
		define('DB_PASSWORD', 'root');
		define('DB_HOST', 'localhost');
		define('DB_CHARSET', 'utf8');
		define('DB_COLLATE', '');

		define('AUTH_KEY',         '$UNIQUE_PHRASE');
		define('SECURE_AUTH_KEY',  '$UNIQUE_PHRASE');
		define('LOGGED_IN_KEY',    '$UNIQUE_PHRASE');
		define('NONCE_KEY',        '$UNIQUE_PHRASE');
		define('AUTH_SALT',        '$UNIQUE_PHRASE');
		define('SECURE_AUTH_SALT', '$UNIQUE_PHRASE');
		define('LOGGED_IN_SALT',   '$UNIQUE_PHRASE');
		define('NONCE_SALT',       '$UNIQUE_PHRASE');

		$table_prefix  = 'wp_';

		define('WP_DEBUG', false);

		if ( !defined('ABSPATH') )
			define('ABSPATH', dirname(__FILE__) . '/');

		require_once(ABSPATH . 'wp-settings.php');
	" > wp-config.php

	rm -rf wp-config-sample.php

	mkdir -p tmp
	curl "https://github.com/mikemccarron/Wordpress-Starter-Theme/archive/master.zip" -L -o tmp/basetheme.zip
	unzip tmp/basetheme.zip

	# mv tmp/starter-theme wp-content/themes/

	# rm -rf tmp
}