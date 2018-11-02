# Apollo构建笔记 1.1.2

* 本笔记为精简步骤, 想了解更详细的内容, 请阅读官方文档https://github.com/ctripcorp/apollo
* 注意: 新版本(1.0.0+)的客户端有一些变动
```text
上一个版本0.10.2中, 客户端需要自行编译, 1.0.0以后客户端改用公共版本!!! 
1.0.0以后客户端需要添加配置文件apollo-env.properties, 配置每个环境的MetaServer地址!!! 
调整本地缓存路径的启动参数改为-Dapollo.cacheDir!!!
指定当前MetaServer地址的启动参数改为-Dapollo.meta!!!
```

### 数据库

* MySql中创建两个用户:`apolloconfigdb` `apolloportaldb`
* 使用root用户执行`sv-notes/sql/apolloconfigdb.sql` 和 `sv-notes/sql/apolloportaldb.sql`
* 给`apolloconfigdb` `apolloportaldb`两个用户分别分配`ApolloConfigDB` `ApolloPortalDB`的权限
* 调整两张表中的配置`ApolloConfigDB.ServerConfig` `ApolloPortalDB.ServerConfig`
* 通常需要调整的配置: `eureka.service.url` `apollo.portal.envs` `organizations` `configView.memberOnly.envs`

### 配置和编译

* 修改`sv-note/build.sh` 或 `sv-note/build.bat` 中的配置, 配置`数据库连接`和`配置中心IP端口`
* 运行`sv-note/build.sh` 或 `sv-note/build.bat`

### 部署服务

* 提取apollo-configservice/target/apollo-configservice-x.x.x-github.zip
* 提取apollo-adminservice/target/apollo-adminservice-x.x.x-github.zip
* 提取apollo-portal/target/apollo-portal-x.x.x-github.zip
* 上传服务器, 解压
* 修改script/startup.sh中的配置(日志路径/监听端口/启动参数等)
* 修改config/application-github.properties中的配置(数据库连接等)
* 修改config/apollo-env.properties中的配置(MetaServer/Eureka地址等)
* 修改apollo-*.conf中的配置(日志路径)
* startup.sh启动
* Windows可以用cmder启动, 全都启在同一台机器上时, portal的监听端口要修改

### 管理界面登录

* 假如portal本地启动, 端口修改为8070, 则地址为:http://localhost:8070/
* 登录用户名`apollo`, 密码`admin`

<br>
<br>
<br>

# Apollo客户端使用

### 客户端工程配置

* Classpath下新建配置文件`/META-INF/config/app.properties`, app.id指定应用id, 与配置中心后台对应
* `P.S.`原版的配置路径是`/META-INF/app.properties`, 修改过源码
* `P.S.`可以在`DefaultApplicationProvider`中修改这个配置的路径, 重新编译部署到Nexus即可

> app.id=test-service

* Classpath下(或SpringBoot应用的config目录下)新建配置文件`/apollo-env.properties`
* 配置每个环境对应的MetaServer地址(也是ConfigServer地址)
> dev.meta=http://1.1.1.1:8080
> fat.meta=http://apollo.fat.xxx.com
> uat.meta=http://apollo.uat.xxx.com
> pro.meta=http://apollo.xxx.com

* 增加启动参数, env为环境(dev/fat/uat/pro), apollo.meta为ConfigService的IP端口, apollo.cacheDir指定本地缓存路径
* `P.S.`可以在`ConfigUtil`中修改本地缓存路径逻辑, 重新编译部署到Nexus即可

> -Denv=dev -Dapollo.meta=http://127.0.0.1:8080 -Dapollo.cacheDir=/beeb/ap/config

### 客户端工程依赖

* Maven依赖

```text
    <dependency>
        <groupId>com.ctrip.framework.apollo</groupId>
        <artifactId>apollo-client</artifactId>
        <version>1.1.0</version>
    </dependency>
```

* Gradle依赖

```gradle
    compile 'com.ctrip.framework.apollo:apollo-client:1.1.0'
```

### 配置

* Spring boot 配置
* EnableApolloConfig还可以配置多个namespace, 还可以指定顺序, 详见官方文档

```text
@Configuration
@EnableApolloConfig
public class AppConfig {
  ...
}
```

* Spring XML 配置
* 还可以配置多个namespace, 还可以指定顺序, 详见官方文档

```text
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:apollo="http://www.ctrip.com/schema/apollo"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.ctrip.com/schema/apollo http://www.ctrip.com/schema/apollo.xsd">
    <apollo:config/>
    <bean class="com.ctrip.framework.apollo.spring.TestXmlBean">
        <property name="timeout" value="${timeout:100}"/>
        <property name="batch" value="${batch:200}"/>
    </bean>
</beans>
```

* 注意

```text

需要注意的是，如果之前有使用org.springframework.beans.factory.config.PropertyPlaceholderConfigurer的，请
替换成org.springframework.context.support.PropertySourcesPlaceholderConfigurer。Spring 3.1以后就不建议
使用PropertyPlaceholderConfigurer了，要改用PropertySourcesPlaceholderConfigurer。

如果之前有使用<context:property-placeholder>，请注意xml中引入的spring-context.xsd版本需要是3.1以上（一般只
要没有指定版本会自动升级的），建议使用不带版本号的形式引入，如：http://www.springframework.org/schema/context/spring-context.xsd

```

* 高级:在Spring Boot初始bootstrap阶段注入配置
* 即在Spring的postProcessBeanFactory阶段注入配置到Spring的Environment中，早于bean的初始化阶段
* 配置方法详见官方文档

### 获得配置

* 注解方式获取
* 在Apollo 0.10.0版本之后, 这种方式(PlaceHolder)支持运行时自动更新, 每次拿到的值都是最新值

```text
public class TestJavaConfigBean {

  @Value("${timeout:100}")
  private int timeout;
  
  ...

}
```

* XML中获取
* 在Apollo 0.10.0版本之后, 这种方式(PlaceHolder)支持运行时自动更新, 每次拿到的值都是最新值

```text
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
    <bean class="com.ctrip.framework.apollo.spring.TestXmlBean">
        <property name="timeout" value="${timeout:100}"/>
        <property name="batch" value="${batch:200}"/>
    </bean>
</beans>
```

* 还有其他的使用方式(例如:ConfigurationProperties中使用), 详见官方文档

### 高级

* 声明@ApolloConfig获得Config实例手动操作
* 声明@ApolloConfigChangeListener监听配置变化事件
* 例如:

> 使用slate-common的MultiHostOkHttpClient(LoadBalancedHostManager)时, 可以用@ApolloConfigChangeListener监听配置变化, <br>
> 当配置变化时, 调用LoadBalancedHostManager.setHosts()方法设置新的后端地址. <br>

```text
@Component
public class TestApolloAnnotationBean {
  @ApolloConfig
  private Config config; //inject config for namespace application
  @ApolloConfig("application")
  private Config anotherConfig; //inject config for namespace application
  @ApolloConfig("FX.apollo")
  private Config yetAnotherConfig; //inject config for namespace FX.apollo
 
  @Value("${batch:100}")
  private int batch;
  
  //config change listener for namespace application
  @ApolloConfigChangeListener
  private void someOnChange(ConfigChangeEvent changeEvent) {
    //update injected value of batch if it is changed in Apollo
    if (changeEvent.isChanged("batch")) {
      batch = config.getIntProperty("batch", 100);
    }
  }
 
  //config change listener for namespace application
  @ApolloConfigChangeListener("application")
  private void anotherOnChange(ConfigChangeEvent changeEvent) {
    //do something
  }
 
  //config change listener for namespaces application and FX.apollo
  @ApolloConfigChangeListener({"application", "FX.apollo"})
  private void yetAnotherOnChange(ConfigChangeEvent changeEvent) {
    //do something
  }

  //example of getting config from Apollo directly
  //this will always return the latest value of timeout
  public int getTimeout() {
    return config.getIntProperty("timeout", 200);
  }

  //example of getting config from injected value
  //the program needs to update the injected value when batch is changed in Apollo using @ApolloConfigChangeListener shown above
  public int getBatch() {
    return this.batch;
  }
}
```

# 多环境部署

* 默认支持的环境有:dev,fat,uat,pro
* 一般情况下, portal应用和数据库部署一套, config/admin应用和数据库每个环境一套
* 修改`sv-notes/sql/apolloportaldb.sql`后初始化apolloportaldb库, 或修改数据库apolloportaldb中的apollo.portal.envs记录

```text
INSERT INTO `ServerConfig` (`Key`, `Value`, `Comment`)
VALUES
    ('apollo.portal.envs', 'dev,uat,pro', '可支持的环境列表');
```

* 修改`sv-note/build.sh` 或 `sv-note/build.bat` 中的配置, 配置`数据库连接`和`配置中心IP端口`
* 重新打包, 部署即可

### P.S.

* `sv-note/build.sh` 和 `sv-note/build.bat`中的数据库配置决定了portal/admin/config三个服务的数据库连接
* `sv-note/build.sh` 和 `sv-note/build.bat`中的配置中心IP端口决定了apollo-client/portal连接的配置中心地址
* ApolloConfigDB库ServerConfig表的eureka.service.url配置决定了admin/config两个服务的注册中心
