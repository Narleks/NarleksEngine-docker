FROM phpdockerio/php74-fpm
WORKDIR "/application"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php7.4-memcached php7.4-mysql php7.4-pgsql php7.4-redis php7.4-sqlite3 php7.4-bcmath php7.4-bz2 php7.4-gd \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install curl
RUN apt-get update \
    && apt-get -y install curl
	
# Install git
RUN apt-get update \
    && apt-get -y install git \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin && \
    echo "alias composer='composer'" >> /root/.bashrc
	
RUN cd /tmp \
	&& curl -o ioncube.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xvvzf ioncube.tar.gz \
    && mv ioncube/ioncube_loader_lin_7.4.so /usr/lib/php/20190902/ \
    && rm -Rf ioncube.tar.gz ioncube \
    && echo "zend_extension=/usr/lib/php/20190902/ioncube_loader_lin_7.4.so" > /etc/php/7.4/fpm/conf.d/00-ioncube.ini
	
RUN apt update && apt install curl php-cli php-mbstring git unzip -y \
	&& curl -sS https://getcomposer.org/installer -o composer-setup.php \
	&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer


	

		
