<?php
class BrandModel extends BaseModel
{

    use SweetAlert;
    public function tableName()
    {
        return 'brand';
    }
    public function tableField()
    {
        return '*';
    }
    public function primaryKey()
    {
        return 'id';
    }
    function getAllBrand()
    {
        if (isset(ViewShare::$dataShare['userData']) && ViewShare::$dataShare['userData']['role_id'] == 2) {
            return $this->db->table($this->tableName())->where('user_id', '=', ViewShare::$dataShare['userData']['user_id'])->orderBy('id', 'ASC')->get();
        }
        return $this->db->table($this->tableName())->orderBy('id', 'ASC')->get();
    }

    function checkBrandExisted($name)
    {
        return $this->db->table($this->tableName())->where('name', '=', $name)->getOne();
    }

    function getOneBrand($id)
    {
        return $this->db->table($this->tableName())->where('id', '=', $id)->getOne();
    }

    function addNewBrand($data)
    {
        return $this->db->create($this->tableName(), $data);
    }

    function updateBrand($id, $data)
    {
        return $this->db->findByIdAndUpdate($this->tableName(), $id, $data);
    }

    function deleteBrand($id)
    {
        // deleteBrand 
        $delBrand = $this->db->findIdAndDelete('brand', $id);

        //Get id product
        $dataProd = $this->db->table('product')->select('id')->where('brand_id', '=', $id)->getOne();

        if (empty($dataProd)) {
            return true;
        }
        // Delete product 
        $delProd = $this->db->findIdAndDelete('product', $dataProd['id']);

        // Delete product Image
        $delImageProd = $this->db->findAndDelete('images_product', ['prod_id' => $dataProd['id']]);

        if ($delBrand && $delProd && $delImageProd) {
            return true;
        }
        return false;
    }
}
