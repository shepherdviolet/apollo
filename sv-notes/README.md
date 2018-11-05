# Apollo构建笔记(1.1.2)

* 本笔记为精简步骤, 想了解更详细的内容, 请阅读官方文档https://github.com/ctripcorp/apollo

### 客户端(apollo-client)版本变动

##### 0.10.2.SV -> 1.1.2.SV 

* (必要)0.10.2的客户端需要自行编译, 1.0.0+的客户端改用公共版本(Maven中心库)
* (必要)增加必要配置文件`classpath:apollo-env.properties`, 配置每个环境的MetaServer地址
* (必要)环境配置文件路径从自定义的classpath:META-INF/config/app.properties改回官方的`/META-INF/app.properties`, 原路径无效
* (可选)指定MetaServer地址的启动参数从-Denv_meta改为`-Dapollo.meta`, 原方式仍有效
* (可选)指定缓存路径的启动参数从自定义的-Dmeta_cache改为官方的`-Dapollo.cacheDir`, 原方式无效

## 名词解释

* `MetaServer`: 即Eureka, Apollo的`MetaServer`与`ConfigService`部署在同一个JVM中, 共用一个监听端口(默认8080), 因此`MetaServer`的地址就是`ConfigService`的地址

## 创建数据库

* MySql中创建两个用户:`apolloconfigdb` `apolloportaldb`
* 使用root用户执行`sv-notes/sql/apolloconfigdb.sql` 和 `sv-notes/sql/apolloportaldb.sql`
* 给`apolloconfigdb` `apolloportaldb`两个用户分别分配`ApolloConfigDB` `ApolloPortalDB`的权限
* 调整`ApolloConfigDB.ServerConfig` `ApolloPortalDB.ServerConfig`两张表中的配置

> 常用配置: `eureka.service.url` `apollo.portal.envs` `organizations` `configView.memberOnly.envs` <br>
> `eureka.service.url`: 配置`MetaServer`地址, 多个用逗号分隔

## 配置和编译

* 修改`sv-note/build.sh` 或 `sv-note/build.bat` 中的配置

> 调整`数据库连接` `MetaServer地址`

* 运行`sv-note/build.sh` 或 `sv-note/build.bat`

## 部署

* 提取`apollo-configservice/target/apollo-configservice-x.x.x-github.zip`
* 提取`apollo-adminservice/target/apollo-adminservice-x.x.x-github.zip`
* 提取`apollo-portal/target/apollo-portal-x.x.x-github.zip`
* 上传服务器, 解压 (下面的配置必须在Linux上修改)
* 修改`script/startup.sh`中的配置(日志路径/启动参数等)
* 修改`config/application-github.properties`中的配置(数据库连接)
* 修改`config/apollo-env.properties`中的配置(MetaServer地址)
* 修改`apollo-*.conf`中的配置(日志路径)
* `script/startup.sh`启动(Windows可以用cmder启动)

## 管理端登录

* 管理端默认地址为: http://hostname:8070/
* 超管用户名`apollo`, 默认密码`admin`

<br>
<br>
<br>

# Apollo客户端入门

## 必要配置

* 新建配置文件`classpath:apollo-env.properties`
* 配置每个环境对应的MetaServer地址

> dev.meta=http://devconfigservice:8080 <br>
> fat.meta=http://fatconfigservice:8080 <br>
> uat.meta=http://uatconfigservice:8080 <br>
> pro.meta=http://proconfigservice:8080 <br>

* 新建配置文件`classpath:META-INF/app.properties`
* app.id: 指定应用id, 与管理端的应用id对应
* 提示: 源码`DefaultApplicationProvider`中可以修改配置路径

> app.id=test-service

* 增加启动参数`-Denv`
* env: (必要)指定环境(dev/fat/uat/pro)
* apollo.meta: (可选)指定当前用的MetaServer地址
* apollo.cacheDir: (可选)指定本地缓存路径

> -Denv=dev -Dapollo.meta=http://127.0.0.1:8080 -Dapollo.cacheDir=/app/config/test-service

## 依赖

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

## 启用Apollo

* Spring boot 配置
* EnableApolloConfig可以配置多个namespace, 可以指定顺序, 详见官方文档

```text
@Configuration
@EnableApolloConfig
public class AppConfig {
  ...
}
```

* Spring XML 配置
* 可以配置多个namespace, 可以指定顺序, 详见官方文档

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

> 即在Spring的postProcessBeanFactory阶段注入配置到Spring的Environment中, 早于bean的初始化阶段. 
> 配置方法详见官方文档

## 获取配置

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

## 高级

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
* `sv-note/build.sh` 和 `sv-note/build.bat`中的配置中心IP端口决定了portal连接的配置中心地址
* ApolloConfigDB库ServerConfig表的eureka.service.url配置决定了admin/config两个服务的注册中心
