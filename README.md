
# Docker Environment Magento 2

# 1. Why use this docker service?

To have a consistent environment across all your projects or for all your developers working on the same project.

# 2. When I shouldn't use this docker service?

You shouldn't use this docker service as your production environment nor for Magento 1 projects;

# 3. How to use
The first thing is **never to clone this repository**; unless you intend to help the development.

1. Download the last version;
2. Extract the content to your global project folder or whathever folder you want;
3. Clone your project into the [web] folder;
4. Connect to PHP container and run magento installation;

# 4. Extra:

- unThe [dump] folder is mapped into Database container. If you already have a database dump, you can copy it into that folder, connect to database container and import it there.

- there is a alias for [php bin/magento] command on PHP container, so you can run magento scripts like this: 'magento setup:upgrade'.