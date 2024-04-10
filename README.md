# AWS EC2 - integración con terraform - terraform docs - github actions - Grafana.

### Configuración AWS EC2 CON TERRAFORM 

- En este proyecto se realizó la configuracion de terraform y la EC2 de forma modularizada en varios archivos .tf
- Se creo la vpc, grupos de seguirdad, instancia y los diferentes secrets para el acceso ala EC2 DE AWS con github actions y la actualización automática de la ip publica porconexión por SSH.


### USO DE TERRAFORM DOCS
- Se instaló terraform docs con choco desde un ordenador windows por powershell.

![chocoinstallterraformdocs](https://github.com/GuidoSantiagoReta/prueba-ami/assets/46303885/10db1b23-8728-477b-ae94-a9daa4813d86)


### EJECUTAR TERRAFORM DOCS EN EL PROYECTO Y CREAR EL DOCUMENTO

```
terraform-docs markdown . > Terraformdocs.md

```
# AWS - TERRAFORM - GRAFANA (PROCEDIMIENTO) 

1- En linea de comandos por medio del comando $ aws configure , ingresar acces_key y secret_key correspondientes.

2- En el archivo github.tf modificar los valores del repositorio como token, owner y repository.

3- Ejecutar los comandos para construir la infraestructura:

```
$ terraform init 
$ terraform plan 
$ terraform apply

# Se solicitara ingresar el token de Github en consola para cargar las secrets en el repositorio

```
## Instalar Grafana en una instancia EC2 de AWS y configurarlo para monitorear métricas de AWS CloudWatch:

- Abrir la consola de EC2 o SSH: Inicia sesión en tu instancia EC2 a través de la consola de AWS o mediante SSH.
- Cambiar a usuario root: Ejecuta sudo su para cambiar al usuario root.
- Crear el repositorio de Grafana: Navega a /etc/yum.repos.d/ y crea un archivo llamado grafana.repo con el comando vi grafana.repo.
- Agregar contenido al archivo grafana.repo: Ingresa el siguiente contenido en el archivo grafana.repo y guárdalo con :wq!.

```
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt

```
- Instalar Grafana: Ejecuta sudo yum -y install grafana para instalar Grafana.
- Iniciar el servidor de Grafana: Utiliza los comandos sudo systemctl start grafana-server y systemctl status grafana-server para iniciar el servidor y verificar su estado.
- Acceder a Grafana: Abre un navegador y accede a la dirección IP pública o DNS público de tu instancia EC2 seguido de :3000 (por ejemplo, http://<tu-ip-publica>:3000). El usuario y contraseña por defecto son admin y admin, pero se recomienda cambiarlos.
- Configurar fuentes de datos en Grafana: En la página de inicio de Grafana, ve a Configuración > Fuentes de datos y selecciona "Agregar fuente de datos".
- Buscar y configurar CloudWatch: Busca "CloudWatch" en la lista de fuentes de datos disponibles, ingresa tus credenciales de AWS (clave de acceso y clave secreta) en la configuración de CloudWatch.
- Importar dashboards de AWS EC2 y AWS EBS: Puedes importar dashboards predefinidos para EC2 y EBS desde AWS, o crear tus propios dashboards.
- Seleccionar dashboards en Grafana: En la página de inicio de Grafana, selecciona Dashboards y elige EC2 o EBS según tus necesidades.
- Siguiendo estos pasos, podrás instalar y configurar Grafana en una instancia EC2 de AWS para monitorear métricas de AWS CloudWatch, permitiéndote visualizar y analizar el rendimiento y la salud de tus recursos de AWS de manera efectiva.
