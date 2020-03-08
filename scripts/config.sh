#!/bin/sh -e
# (c) 2018-2019 Cloudera, Inc. All rights reserved.
#
#  This code is provided to you pursuant to your written agreement with Cloudera, which may be the terms of the
#  Affero General Public License version 3 (AGPLv3), or pursuant to a written agreement with a third party authorized
#  to distribute this code.  If you do not have a written agreement with Cloudera or with an authorized and
#  properly licensed third party, you do not have any rights to this code.
#
#  If this code is provided to you under the terms of the AGPLv3:
#   (A) CLOUDERA PROVIDES THIS CODE TO YOU WITHOUT WARRANTIES OF ANY KIND;
#   (B) CLOUDERA DISCLAIMS ANY AND ALL EXPRESS AND IMPLIED WARRANTIES WITH RESPECT TO THIS CODE, INCLUDING BUT NOT
#       LIMITED TO IMPLIED WARRANTIES OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE;
#   (C) CLOUDERA IS NOT LIABLE TO YOU, AND WILL NOT DEFEND, INDEMNIFY, OR HOLD YOU HARMLESS FOR ANY CLAIMS ARISING
#       FROM OR RELATED TO THE CODE; AND
#   (D) WITH RESPECT TO YOUR EXERCISE OF ANY RIGHTS GRANTED TO YOU FOR THE CODE, CLOUDERA IS NOT LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, PUNITIVE OR CONSEQUENTIAL DAMAGES INCLUDING, BUT NOT LIMITED
#       TO, DAMAGES RELATED TO LOST REVENUE, LOST PROFITS, LOSS OF INCOME, LOSS OF BUSINESS ADVANTAGE OR
#       UNAVAILABILITY, OR LOSS OR CORRUPTION OF DATA.

# Incorporate helper functions
#. /opt/commons/commons.sh

#export properties_file='/opt/c2/c2-1.0.0-SNAPSHOT/conf/c2.properties'

# Nothing to do, all ENV overrides are applied by the application
# Default to binding to any interface


scripts_dir='/opt/scripts'

[ -f "${scripts_dir}/common.sh" ] && . "${scripts_dir}/common.sh"

prop_replace 'efm.server.address' "${EFM_SERVER_ADDRESS:-0.0.0.0}"

prop_replace 'efm.nifi.registry.enabled' "${NIFI_REGISTRY_ENABLED:-false}"

prop_replace 'efm.nifi.registry.url' "${NIFI_REGISTRY:-http://localhost:18080}"

prop_replace 'efm.nifi.registry.bucketId' "${NIFI_REGISTRY_BUCKETID}"

prop_replace 'efm.nifi.registry.bucketName' "${NIFI_REGISTRY_BUCKETNAME}"

prop_replace 'efm.heartbeat.content.maxCountToKeep' "${EFM_HEARTBEAT_CONT_MAXCOUNT2KEEP}"

prop_replace 'efm.coap.server.host' "${EFM_COAP_SERVER_HOST:-0.0.0.0}"

prop_replace 'efm.coap.server.port' "${EFM_COAP_SERVER_PORT:-8989}"

prop_replace 'efm.db.url' "${EFM_DB_URL:-jdbc:h2:./database/efm;AUTOCOMMIT=OFF;DB_CLOSE_ON_EXIT=FALSE;LOCK_MODE=3}"

prop_replace 'efm.db.driverClass' "${EFM_DB_DRIVER:-org.h2.Driver}"

prop_replace 'efm.db.username' "${EFM_DB_USERNAME:-efm}"

prop_replace 'efm.db.password' "${EFM_DB_PASSWORD}"

prop_replace 'efm.db.maxConnections' "${EFM_DB_MAX_CONN:-5}"

prop_replace 'efm.db.sqlDebug' "${EFM_DB_SQL_DEBUG:-false}"

prop_replace 'logging.level.com.cloudera.cem.efm' "${LOG_LEVEL_CEM_EFM:-INFO}"


wget -P ${EFM_HOME}/lib/ https://sunileman.s3.amazonaws.com/mysql-driver/mysql-connector-java-8.0.19.jar



