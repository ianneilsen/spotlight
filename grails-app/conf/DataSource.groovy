//datasource
dataSource {
    pooled = true
    dbCreate = "update"

    //h2 settings
    //driverClassName = "org.h2.Driver"
    //username = "sa"
    //password = ""

    //mysql5-5
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"

    loggingSql = true


}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
      //h2 settings
         //url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
         //show_sql=true
      //MySQL setting
          dbCreate = "create-drop"
          url = "jdbc:mysql://localhost:3306/spotlightdev?useUnicode=yes&characterEncoding=UTF-8"
            username = "spotlight"
            password = "rh1-SPOTLIGHTdb"

        }
    }
    test {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://localhost:5432/spottest"
        }
    }
    production {
        dataSource {
        //h2 prod settings
            //dbCreate = "update"
            //url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=20000"
        //MySQL settings
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/spotlightprod?useUnicode=yes&characterEncoding=UTF-8"      //todo -deployment change hostname to correct hostname when testing finished
            //http://spotlight-dev-stage.cloud.eng.bne.redhat.com/
            username = "spotlight"
            password = "rh1-SPOTLIGHTdb"

            pooled = true
            properties {
                maxActive = 100
                maxIdle = 25
                minIdle = 5
                initialSize = 10
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
            }
           // properties {
           //    maxActive = -1
           //    minEvictableIdleTimeMillis=1800000
           //    timeBetweenEvictionRunsMillis=1800000
           //    numTestsPerEvictionRun=3
           //    testOnBorrow=true
           //    testWhileIdle=true
           //    testOnReturn=true
           //   validationQuery="SELECT 1" }
            }
        }
    }