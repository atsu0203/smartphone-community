iphone_child_array = ['iPhone 11 pro max','iPhone 11 pro','iPhone 11','iPhone XR','iPhone XS Max','iPhone XS','iPhone X','iPhoe 8 plus',
'iPhone 8','iPhone 7 plus','iPhone 7' ,'iPhne SE','iPhone 6 シリーズ以前']
pixel_child_array = ['Pixel 4','Pixel 4 XL','Pixel 3a','Pixel 3a XL','Pixel 3','Pixel 3 XL','Pixel 2','Pixel 2 XL','その他'] 
galaxy_child_array = ['Galaxy Fold','Galaxy Note10+','Galaxy S10+','Galaxy S10','Galaxy Note9','Galaxy S9','Galaxy S9+','Galaxy Feel2','Galaxy Feel','Galaxy A30','Galaxy A20','Galaxy A7','その他'] 
xperia_child_array = ['Xperia 1','Xperia 5','Xperia 8','Xperia Ace','Xperia XZ3','Xperia XZ2 Premium','Xperia XZ2','Xperia XZ2 Compact','その他']
aquos_child_array = ['AQUOS zero2','AQUOS zero','AQUOS sense3 plus','AQUOS sense3','AQUOS sense3 lite','AQUOS sense2','AQUOS R2','AQUOS R2 compact','その他']
arrows_child_array = ['arrows Be3','arrows Be','arrows M05','arrows M04','arrows M03','arrows NX','arrows U','arrows J','arrows RX','その他']
huawei_child_array = ['HUAWEI Mate 20 Pro', 'HUAWEI Mate 20 lite','HUAWEI P30 Pro','HUAWEI P30','HUAWEI P30 lite','HUAWEI P20 Pro','HUAWEI P20','HUAWEI P20 lite','HUAWEI P20 pro','HUAWEI nova 5T','HUAWEI nova 3','HUAWEI nova lite 3','その他']
oppo_child_array = ['OPPO Reno A','OPPO Reno 10xZoom','OPPO A5 2020','OPPO R17 Pro','OPPO AX7','OPPO Find X','R17 Neo','その他']
zenfone_child_array = ['Zenfone 6','Zenfone 5','Zenfone 5Z','Zenfone Max','Zenfone Max Pro','Zenfone Live','その他']
lg_child_array = ['LG G8X ThinQ','LG style2','LG K50','LG style','LG Q Stylus','その他']
other_child_array =['国内メーカー','海外メーカー']



parent = Category.create(name: 'iPhone')
  iphone_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'Pixel')
pixel_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'Galaxy')
galaxy_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'Xperia')
xperia_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'AQUOS')
aquos_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'arrows')
arrows_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'HUAWEI')
huawei_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'OPPO')
oppo_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'Zenfone')
zenfone_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'LG')
lg_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end
parent = Category.create(name: 'その他')
other_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
end



