# 为什么要使用underscore

## 一个简单的问题，数组变量 `a` ，如何遍历?
### 常见 JavaScript 写法
```javascript
for (var i = 0; i < a.length; i++) {
	console.log(a[i]);
}
```
### 高级 ES5 写法
```javascript
a.forEach(function(i){
	console.log(i);
});
```
### TypeScript写法，以下默认使用TypeScript
```javascript
for (const i of a) {
	console.log(i);
}
```
## 进一步问题，变量 `a` 可能未定义
```javascript
if (a) {
	for (const i of a) {
		console.log(i);
	}
}
```
## 再进一步，变量 `a` 可能不是数组
```javascript
if (a && 'length' in a) {
	for (const i of a) {
		console.log(i);
	}
}
```
## 更进一步问题，变量 `a` 可能是对象，如果是对象也要进行遍历
```javascript
if (a && typeof a === 'object') {
	if ('length' in a) {
		for (const i of a) {
			console.log(i);
		}
	} else {
		for (const i in a) {
			console.log(a[i]);
		}
	}
}
```
## 大哥，我只不过要个遍历，用不用这么复杂！！！！
```javascript
_.each(a, (value, index) => console.log(value));
```
> underscore 会检查参数是否为空，是数组还是对象
> jQuery 也有each方法，但没这么智能
