# Geoserver OSM OCI

## Introduction
A containerized [Geoserver](https://geoserver.org/) instance configured to serve [OpenStreetMap](www.openstreetmap.org) data with a layer mimicking the OSM-bright style. The repo is based on the most excellent [osm-styles](https://github.com/geosolutions-it/osm-styles) repo by [GeoSolutions](https://www.geosolutionsgroup.com/) but has been modifed to be container-centric. We make use of the [GeoServer CSS extension](https://docs.geoserver.org/latest/en/user/styling/css/install.html) in order to display the included styles, as well as the [Pregeneralized Features extension](https://docs.geoserver.org/stable/en/user/data/vector/featurepregen.html) to improve performance by rendering simplified views at lower zoom levels.

## Stack Setup
A sample stack configuration is shown in the included [docker-compose file](./docker-compose.yml). We use the [official container](https://docs.geoserver.org/main/en/user/installation/docker.html) to run the Geoserver instance as well as a [PostGIS container](https://hub.docker.com/r/postgis/postgis) to store the high-resolution OSM data. The remaining configuration steps require the stack to be running.

1. Run the stack:

``` console
[user@i7-desktop geoserver-osm-oci]$ docker-compose up -d
[+] Running 2/3
 ⠼ Network geoserver-osm-oci_default            Created
 ✔ Container geoserver-osm-oci-geoserver-1     Started
 ✔ Container geoserver-osm-oci-postgis-1       Started
[user@i7-desktop geoserver-osm-oci]$ 
```

## Low-resolution GeoPackage
This contains simplified layers designed to be viewed at low zoom levels.

1. Download the pregeneralized `.gpkg` file [here](https://www.dropbox.com/s/bqzxzkpmpybeytr/osm-lowres.gpkg?dl=1).
2. Copy this file into `/opt/geoserver_data/data/` on the Geoserver container:

``` console
[user@i7-desktop geoserver-osm-oci]$ docker-compose cp osm-lowres.gpkg geoserver:/opt/geoserver_data/data
[+] Copying 1/1
 ✔ geoserver-osm-oci-geoserver-1 copy osm-lowres.gpkg to geoserver-osm-oci-geoserver-1:/opt/geoserver_data/data    Copied
[user@i7-desktop geoserver-osm-oci]$ 
```

## OSM PostGIS database

We use [Imposm 3](https://github.com/omniscale/imposm3) to import the OSM data into the PostGIS database and pregeneralize it. The included [mapping.yml](./mapping.yml) file is used to specify how `imposm` should pregeneralize and import the data. Note that `imposm` runs only on Linux.

1. Download the latest binary release of Imposm 3 from [here](https://github.com/omniscale/imposm3/releases/).
2. Extract the binary from the downloaded `.tar.gz` archive:

``` console
[user@i7-desktop geoserver-osm-oci]$ tar -xvzf imposm-0.11.1-linux-x86-64.tar.gz 
imposm-0.11.1-linux-x86-64/
imposm-0.11.1-linux-x86-64/README.md
imposm-0.11.1-linux-x86-64/imposm3
imposm-0.11.1-linux-x86-64/imposm
imposm-0.11.1-linux-x86-64/lib/
imposm-0.11.1-linux-x86-64/lib/libleveldb.so.1.22.0
imposm-0.11.1-linux-x86-64/lib/libgeos-3.7.3.so
imposm-0.11.1-linux-x86-64/lib/libgeos_c.so
imposm-0.11.1-linux-x86-64/lib/libgeos.so
imposm-0.11.1-linux-x86-64/lib/libleveldb.so
imposm-0.11.1-linux-x86-64/lib/libgeos_c.so.1
imposm-0.11.1-linux-x86-64/lib/libleveldb.so.1
imposm-0.11.1-linux-x86-64/mapping.json
[user@i7-desktop geoserver-osm-oci]$ 
```

3. Download the desired OSM data from the Geofabrik [download server](https://download.geofabrik.de/) in `.pbf` format. For these instructions we use only the South Africa data for ease of demonstration. In this case the `.pbf` file totaled 313MB in size.
4. The data can now be imported into PostGIS. Using just the South Africa data, the import process required 800MB of cache and took 6 minutes to complete. The resulting PostGIS database was 2.2GB. Run the import as follows:

``` console
[user@i7-desktop geoserver-osm-oci]$ imposm-0.11.1-linux-x86-64/imposm import \
    -connection postgis://geoserver:geoserver@localhost/geoserver \
    -mapping mapping.yml \
    -read south-africa-latest.osm.pbf \
    -write \
    -optimize \
    -overwritecache
[2024-01-29T19:03:26+02:00] 0:00:00 [step] Starting: Imposm
[2024-01-29T19:03:26+02:00] 0:00:00 [step] Starting: Reading OSM data
[2024-01-29T19:03:27+02:00] 0:00:01 [info] reading south-africa-latest.osm.pbf with data till 2024-01-28 23:20:37 +0200 SAST
...
[2024-01-29T19:09:23+02:00] 0:05:56 [step] Finished: Importing OSM data in 5m19.335229723s
[2024-01-29T19:09:23+02:00] 0:05:56 [step] Finished: Imposm in 5m56.598869476s
[user@i7-desktop geoserver-osm-oci]$
```



## GeoServer configuration

Now we isntall the [Pregeneralized Features extension](https://docs.geoserver.org/stable/en/user/data/vector/featurepregen.html) and copy the files necessary to define the `osm` workspace, it's four stores, it's layers, layer groups, and styles.

1. Download and unzip the version of the Pregeneralized Features extension corresponding to the Geoserver version being used, and then copy the `.jar` files to `/opt/additional_libs/` on the Geoserver container:
``` console
[user@i7-desktop geoserver-osm-oci]$ unzip geoserver-2.25-SNAPSHOT-feature-pregeneralized-plugin.zip 
Archive:  geoserver-2.25-SNAPSHOT-feature-pregeneralized-plugin.zip
  inflating: gt-feature-pregeneralized-31-SNAPSHOT.jar  
  inflating: gs-feature-pregeneralized-2.25-SNAPSHOT.jar  
   creating: licenses/
  inflating: licenses/GPL.html       
  inflating: licenses/NOTICE.html    
  inflating: licenses/GEOTOOLS_NOTICE.html  
  inflating: licenses/LGPL.html      
  inflating: README.txt              
  inflating: LICENSE.html            
  inflating: README.html
[user@i7-desktop geoserver-osm-oci]$ docker-compose cp gs-feature-pregeneralized-2.25-SNAPSHOT.jar geoserver:/opt/additional_libs/
[+] Copying 1/0
 ✔ geoserver-osm-oci-geoserver-1 copy gs-feature-pregeneralized-2.25-SNAPSHOT.jar to geoserver-osm-oci-geoserver-1:/opt/additional_libs/ Copied
[user@i7-desktop geoserver-osm-oci]$ docker-compose cp gt-feature-pregeneralized-31-SNAPSHOT.jar geoserver:/opt/additional_libs/
[+] Copying 1/0
 ✔ geoserver-osm-oci-geoserver-1 copy gt-feature-pregeneralized-31-SNAPSHOT.jar to geoserver-osm-oci-geoserver-1:/opt/additional_libs/ Copied
[gwejones@i7-desktop geoserver-osm-oci]$
```

2. Copy the workspaces directory into `/opt/geoserver_data/` on the Geoserver container:
``` console
[user@i7-desktop geoserver-osm-oci]$ docker-compose cp workspaces/ geoserver:/opt/geoserver_data/
[+] Copying 1/0
 ✔ geoserver-osm-oci-geoserver-1 copy workspaces/ to geoserver-osm-oci-geoserver-1:/opt/geoserver_data/ Copied
[user@i7-desktop geoserver-osm-oci]$       
```

3. The files `pregeneralized.xml` and `pregeneralized_lowres.xml` are required to determine the schema used by the `osm_pregeneralized` data store. Copy these into `/opt/geoserver_data/` on the Geoserver container:
``` console
[user@i7-desktop geoserver-osm-oci]$ docker-compose cp pregeneralized_lowres.xml geoserver:/opt/geoserver_data/
[+] Copying 1/0
 ✔ geoserver-osm-oci-geoserver-1 copy pregeneralized_lowres.xml to geoserver-osm-oci-geoserver-1:/opt/geoserver_data/ Copied
[user@i7-desktop geoserver-osm-oci]$ docker-compose cp pregeneralized.xml geoserver:/opt/geoserver_data/
[+] Copying 1/0
 ✔ geoserver-osm-oci-geoserver-1 copy pregeneralized.xml to geoserver-osm-oci-geoserver-1:/opt/geoserver_data/ Copied
[user@i7-desktop geoserver-osm-oci]$ 
```

4. Restart the stack:
``` console
[user@i7-desktop geoserver-osm-oci]$ docker-compose restart
[+] Restarting 2/2
 ✔ Container geoserver-osm-oci-postgis-1    Started
 ✔ Container geoserver-osm-oci-geoserver-1  Started
[user@i7-desktop geoserver-osm-oci]$
```

5. Access the web administration page at [localhost:8080/geoserver/](http://localhost:8080/geoserver/) using the default username `admin` and password `geoserver`. Ensure that there are no warnings indicated in the **Stores** page. If the PostGIS database details used differ from those described in this repo, then you will need to manually reconfigure the `osm` store here. You can optionally delete all the other autogenerated sample workspaces shown in the **Workspaces** page except for the `osm` one.

6. To ensure everything is working, you can preview one of the layer groups using the **OpenLayers** link for the respective layer group on the **Layer Preview** page.

## TODO

1. Include instructions on how to reproduce `osm-lowres.gpkg`, if such instructions can be found anywhere.
2. Include instructions detailing how Windows users could use [Imposm](https://github.com/omniscale/imposm3) - in line with my new-years resolution to be kinder to those people.