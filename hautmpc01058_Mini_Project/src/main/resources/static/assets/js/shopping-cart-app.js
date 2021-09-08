const app = angular.module("shopping-cart-app", []);

app.controller("shopping-cart-ctrl", function($scope, $http) {
	/*
	 * QUẢN LÝ GIỎ HÀNG 
	 */
	$scope.cart = {
		items: [],
		// Thêm sản phẩm vào giỏ hàng 
		add(id) {
			var item = this.items.find(item => item.id == id);//tim mặt hàng
			if (item) {
				item.qty++;
				this.saveToLocalStorage();
			}
			else {
				$http.get(`/rest/products/${id}`).then(resp => {
					resp.data.qty = 1;//tải mặt hàng trên sv
					this.items.push(resp.data);// là 1 mảng
					this.saveToLocalStorage();
				})
			}
		},
		// Xóa sản phẩm khỏi giỏ hàng 
		remove(id) {
			var index = this.items.findIndex(item => item.id == id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		// Xóa sạch các mặt hàng trong giỏ 
		clear() {
			this.items = []
			this.saveToLocalStorage();
		},
		// Tính thành tiền của 1 sản phẩm 
		amt_of(item) { },
		// Tính tổng số lượng các mặt hàng trong giỏ 
		get count() {
			return this.items
				.map(item => item.qty)
				.reduce((total, qty) => total += qty, 0);
		},
		// Tổng thành tiền các mặt hàng trong giỏ 
		get amount() {
			return this.items
				.map(item => item.qty * item.price)
				.reduce((total, qty) => total += qty, 0);
		},
		//Lưu giỏ hàng vào local storage 
		saveToLocalStorage() {
			var json = JSON.stringify(angular.copy(this.items)); //đổi sang json
			localStorage.setItem("cart", json);//lưu vàng local
		},
		// Đọc giỏ hàng từ local storage
		loadFromLocalStorage() {
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json) : [];//nếu có chuyển sang json gán vào items
		}
	}
	$scope.cart.loadFromLocalStorage();

	$scope.order = {
		createDate: new Date(),
		address: "",
		account: {username: $("#username").text()},//lấy usname
		get orderDetails() {
			return $scope.cart.items.map(item => {
				return { //duyệt các mặt hàng
					product: { id: item.id },
					price: item.price,
					quantity: item.qty
				}
			});
		},
		purchase() {
			var order = angular.copy(this);
			//Thực hiện đặt hàng
			$http.post("/rest/orders", order).then(resp => {
				alert("Đặt hàng thành công!");
				$scope.cart.clear();
				location.href = "/order/detail/" + resp.data.id;
			}).catch(error => {
				alert("Đặt hàng lỗi!")
				console.log(error)
			})
		}
	}
})
