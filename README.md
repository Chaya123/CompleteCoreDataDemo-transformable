# CompleteCoreDataDemo-transformable

1.实现了一个完整的笔试小项目，使用CoreData。

2.在实现功能外，为了扩充对CoreData的了解，又增加了除了CoreData能存储的一些标准的数据类型的实现，如NSArray、NSDictionary、UIImage、Class等类型。


CoreData存储数据注意事项：

1.使用CoreData支持的数据类型，如Interger16\Interger32\Interger64类型，可以直接建立对应的实体属性int16_t\int32_t\int64_t age，这样就可以直接使用不需要转换，当然也可以存为NSString类型等，只是在存取时有个转换过程。

2.对于支持NSKeyedArchiver转化并且实现了NSCoding协议的类型，如NSArray、NSDictionary等类型，就只需要将Type选择为transformer就行了。

3.对于不能直接使用NSKeyedArchiver的类型，如UIImage，我们就需要自定义一个NSValuetransformer了，不然虽然不会报错，可取值是nil。以下是存储图片的步骤。
![image](https://github.com/Chaya123/CompleteCoreDataDemo-transformable/blob/master/CompleteCoreDataDemo/Screenshots/UIImageType.png)
![image](https://github.com/Chaya123/CompleteCoreDataDemo-transformable/blob/master/CompleteCoreDataDemo/Screenshots/UIImageClass.png)
![image](https://github.com/Chaya123/CompleteCoreDataDemo-transformable/blob/master/CompleteCoreDataDemo/Screenshots/UIImageImplementation.png)


4.对于我们自定义的类，要完成转化，必须要实现NSCoding协议，不然会崩溃，步骤如下
![image](https://github.com/Chaya123/CompleteCoreDataDemo-transformable/blob/master/CompleteCoreDataDemo/Screenshots/ClassCoding.png)
![image](https://github.com/Chaya123/CompleteCoreDataDemo-transformable/blob/master/CompleteCoreDataDemo/Screenshots/ClassImplement.png)

如有疑问，可查看http://www.jianshu.com/p/8233a54b54fa文章详解
