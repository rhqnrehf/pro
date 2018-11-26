/**
 * [placeholder.js]
 * Let working "placeholder" in Internet Explorer 9 lte
 *
 * @version 1.1.4
 * @author prevdev@gmail.com
 *
 * source code in https://github.com/Prev/placeholderjs
 * built in 2013.11.16
 *
 * MIT LICENSE
 */

(function (d) {
	var g = "#aaa";
	var h;
	function isPlaceholderSupport() {
		var a = document.createElement('input');
		return ('placeholder' in a)
	}
	function initPlaceholder() {
		var a = d.getElementsByTagName('input');
		var b = d.getElementsByTagName('textarea');
		var i;
		for (i = 0; i < a.length; i++) setPlaceHolder(a[i]);
		for (i = 0; i < b.length; i++) setPlaceHolder(b[i]);
		if (!isPlaceholderSupport()) {
			setInterval(intervalHandler, 20)
		}
	}
	function intervalHandler() {
		if (h != d.body.innerHTML) {
			initPlaceholder();
			h = d.body.innerHTML
		}
	}
	function setPlaceHolder(a) {
		var b;
		if ((a.type != "text" && a.type != "password" && a.nodeName.toLowerCase() != "textarea") || (a.placeholder && isPlaceholderSupport())) return;
		if (a.getAttribute('isPlaceHolderInited')) return;
		if (a.getAttribute('placeholder')) b = a.getAttribute('placeholder');
		else {
			var c = a.outerHTML.match(/placeholder=("([^"]*)"|[^\s>]*)/);
			if (c && c[2]) b = c[2];
			else if (c && c[1]) b = c[1];
			if (b) a.setAttribute('placeholder', b)
		}
		a.setAttribute('isPlaceHolderInited', true);
		if (!b) return;
		a.setAttribute('originalColor', a.style.color);
		if (a.type == "text" || a.nodeName.toLowerCase() == "textarea") {
			if (!a.value) {
				a.value = b;
				a.style.color = g;
				a.setAttribute('isPlaceholdered', true)
			}
			if (a.addEventListener) {
				a.addEventListener("focus", placeholderFocusHandler);
				a.addEventListener("blur", placeholderBlurHandler)
			} else if (a.attachEvent) {
				a.attachEvent("onfocus", placeholderFocusHandler);
				a.attachEvent("onblur", placeholderBlurHandler)
			} else {
				a.onfocus = placeholderFocusHandler;
				a.onblur = placeholderBlurHandler
			}
		} else if (a.type == "password") {
			var e = Math.floor(Math.random() * 100000);
			var f = d.createElement("input");
			f.className = a.className + " _fake-placeholder-" + e;
			f.type = "text";
			f.value = b;
			for (var i in a.style) {
				if (a.style[i]) f.style[i] = a.style[i]
			}
			f.style.color = g;
			a.className += " _placeholder-" + e;
			a.style.display = "none";
			a.parentElement.insertBefore(f, a);
			if (a.className.substr(0, 1) == " ") a.className = a.className.substr(1, a.className.length);
			if (f.className.substr(0, 1) == " ") f.className = f.className.substr(1, f.className.length);
			f.setAttribute("randInputId", e);
			a.setAttribute("randInputId", e);
			if (f.addEventListener) {
				f.addEventListener("focus", passwordPlaceHolderFocusHandler);
				a.addEventListener("blur", passwordPlaceHolderBlurHandler)
			} else if (f.attachEvent) {
				f.attachEvent("onfocus", passwordPlaceHolderFocusHandler);
				a.attachEvent("onblur", passwordPlaceHolderBlurHandler)
			} else {
				f.onfocus = passwordPlaceHolderFocusHandler;
				a.onblur = passwordPlaceHolderBlurHandler
			}
		}
	}
	function placeholderFocusHandler(a) {
		var b = a.srcElement || this;
		if (b.getAttribute('isPlaceholdered') && b.getAttribute('isPlaceholdered') != "false") {
			b.value = "";
			b.style.color = b.getAttribute('originalColor');
			b.setAttribute('isPlaceholdered', false)
		}
	}
	function placeholderBlurHandler(a) {
		var b = a.srcElement || this;
		if (b.value == "") {
			b.value = b.getAttribute('placeholder');
			b.style.color = g;
			b.setAttribute('isPlaceholdered', true)
		} else b.setAttribute('isPlaceholdered', false)
	}
	function passwordPlaceHolderFocusHandler(a) {
		var b = a.srcElement || this;
		var c = b.getAttribute('randInputId');
		var e = d.getElementsByClassName("_placeholder-" + c)[0];
		b.style.display = "none";
		e.style.display = "inline";
		e.focus()
	}
	function passwordPlaceHolderBlurHandler(a) {
		var b = a.srcElement || this;
		if (b.value == "") {
			var c = b.getAttribute('randInputId');
			var e = d.getElementsByClassName("_fake-placeholder-" + c)[0];
			e.style.display = "inline";
			b.style.display = "none"
		}
	}
	if (!d.getElementsByClassName) {
		if (d.querySelectorAll) {
			d.getElementsByClassName = function (a) {
				return d.querySelectorAll("." + a)
			}
		} else if (d.getElementsByTagName) {
			d.getElementsByClassName = function (a) {
				var t = d.getElementsByTagName("input");
				var b = [];
				for (var i = 0; i < t.length; i++) {
					var c = t[i].className.split(" ");
					if (c.indexOf(a) != -1) b.push(t[i])
				}
				return b
			}
		}
	}
	function NodeList(a) {
		if (a) {
			for (var i = 0; i < a; i++) this[i] = 0;
			this.length = parseInt(a)
		} else this.length = 0
	}
	NodeList.prototype = {
		item: function (a) {
			return this[a]
		},
		__push: function (a) {
			var b = this.length;
			this[b] = a;
			this.length++
		},
		toString: function () {
			return "[object NodeList]"
		}
	};
	if (!Array.prototype.indexOf) {
		Array.prototype.indexOf = function (a, b) {
			if (!b) b = 0;
			for (var i = b; i < this.length; i++) {
				if (this[i] === a) return i
			}
			return - 1
		}
	}
	if (window.addEventListener) window.addEventListener('load', initPlaceholder);
	else if (window.attachEvent) window.attachEvent('onload', initPlaceholder)
})(document);