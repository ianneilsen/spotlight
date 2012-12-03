////////////datasource
dataSource {
    pooled = true
    dbCreate = "update"
    //h2 settings
/*    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""*/

    //postgres settings
    driverClassName = "org.postgresql.Driver"
    dialect = org.hibernate.dialect.PostgreSQLDialect
    //dialect = net.sf.hibernate.dialect.PostgreSQLDialect
    username = "spotlight"
    password = "redhat"
    loggingSql = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
////////////////////////////// environment specific settings
environments {
    development {
        dataSource {
         //h2 settings
/*          dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"*/
         //postgresql setting
            dbCreate = "create-drop"
            url = "jdbc:postgresql://localhost:5432/spotdev"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            /*dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://localhost:5432/spottest"*/
        }
    }
    production {
        dataSource {
        //h2 prod settings
            /*dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"*/
        //postgresql settings
            dbCreate = "update"
            url = "jdbc:postgresql://localhost:5432/spotprod"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1" }

            }
        }
    }

