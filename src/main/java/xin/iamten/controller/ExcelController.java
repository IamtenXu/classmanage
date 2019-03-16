package xin.iamten.controller;

import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import xin.iamten.entity.Classinfo;
import xin.iamten.entity.Stuinfo;
import xin.iamten.entity.Teainfo;
import xin.iamten.service.ClassService;
import xin.iamten.service.StuService;
import xin.iamten.service.TeaService;
import xin.iamten.utils.ExcelUtil;
import xin.iamten.utils.R;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/excel")
public class ExcelController {

    @Autowired
    private StuService stuService;

    @Autowired
    private TeaService teaService;

    @Autowired
    private ClassService classService;

    //教务处导入学生信息
    @RequestMapping(value = "/uploadStu", method = RequestMethod.POST)
    @ResponseBody
    public R uploadStu(@RequestParam MultipartFile file)throws Exception{
        if(!file.getOriginalFilename().equals("学生信息上传模板.xls")){
            return R.ok("请使用模板上传，注意不能改名！");
        }
        if(file.isEmpty()){
            try {
                throw new Exception("文件不存在！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        InputStream in =null;
        try {
            in = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        List<List<Object>> listob = null;
        try {
            System.out.println(file.getOriginalFilename());
            listob = new ExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
            System.out.println(listob.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Stuinfo> stuinfoList = new ArrayList<Stuinfo>();
        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            Stuinfo stuinfo = new Stuinfo();
            /*这里是主键验证，根据实际需要添加，可要可不要，加上之后，可以对现有数据进行批量修改和导入
            User j = null;
			try {
				j = userMapper.selectByPrimaryKey(Integer.valueOf(String.valueOf(lo.get(0))));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				System.out.println("没有新增");
			}*/
            //vo.setUserId(Integer.valueOf(String.valueOf(lo.get(0))));  // 刚开始写了主键，由于主键是自增的，又去掉了，现在只有批量插入的功能，不能对现有数据进行修改了
            stuinfo.setStuid(String.valueOf(lo.get(0)));    // 表格的第一列   注意数据格式需要对应实体类属性
            stuinfo.setSname(String.valueOf(lo.get(1)));
            stuinfo.setSsex(String.valueOf(lo.get(2)));
            stuinfo.setSbirthday(String.valueOf(lo.get(3)));
            stuinfo.setStudents(String.valueOf(lo.get(4)));
            stuinfo.setSpolitical(String.valueOf(lo.get(5)));
            stuinfo.setSphone(String.valueOf(lo.get(6)));
            stuinfo.setSemail(String.valueOf(lo.get(7)));
            stuinfo.setSphoto(String.valueOf(lo.get(8)));
            stuinfo.setSadress(String.valueOf(lo.get(9)));
            stuinfo.setSclass(String.valueOf(lo.get(10)));
            stuinfo.setSrole(13);
//            vo.setUserTel(String.valueOf(lo.get(0)));     // 表格的第一列   注意数据格式需要对应实体类属性
//            vo.setIntegral(Integer.valueOf(String.valueOf(lo.get(1))));   // 表格的第二列
            //vo.setRegTime(Date.valueOf(String.valueOf(lo.get(2))));
            //由于数据库中此字段是datetime，所以要将字符串时间格式：yyyy-MM-dd HH:mm:ss，转为Date类型
            stuinfoList.add(stuinfo);
            System.out.println(stuinfo.getStuid());
			/*if(j == null)
			{
		            userMapper.insert(vo);
			}
			else
			{
		            userMapper.updateByPrimaryKey(vo);
			}*/
        }
        int num = stuService.insertforeach(stuinfoList);
        return R.ok("成功导入"+listob.size()+"条数据！其中有"+(num-listob.size())+"条数据已存在且进行了更新！");
    }
    //教务处导入教师信息
    @RequestMapping(value = "/uploadTea", method = RequestMethod.POST)
    @ResponseBody
    public R uploadTea(@RequestParam MultipartFile file)throws Exception{
        if(!file.getOriginalFilename().equals("教师信息上传模板.xls")){
            return R.ok("请使用模板上传，注意不能改名！");
        }
        if(file.isEmpty()){
            try {
                throw new Exception("文件不存在！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        InputStream in =null;
        try {
            in = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        List<List<Object>> listob = null;
        try {
            System.out.println(file.getOriginalFilename());
            listob = new ExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
            System.out.println(listob.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Teainfo> teainfoList = new ArrayList<Teainfo>();
        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            Teainfo teainfo = new Teainfo();
            /*这里是主键验证，根据实际需要添加，可要可不要，加上之后，可以对现有数据进行批量修改和导入
            User j = null;
			try {
				j = userMapper.selectByPrimaryKey(Integer.valueOf(String.valueOf(lo.get(0))));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				System.out.println("没有新增");
			}*/
            //vo.setUserId(Integer.valueOf(String.valueOf(lo.get(0))));  // 刚开始写了主键，由于主键是自增的，又去掉了，现在只有批量插入的功能，不能对现有数据进行修改了
            teainfo.setTeaid(String.valueOf(lo.get(0)));    // 表格的第一列   注意数据格式需要对应实体类属性
            teainfo.setTname(String.valueOf(lo.get(1)));
            teainfo.setTsex(String.valueOf(lo.get(2)));
            teainfo.setTbirthday(String.valueOf(lo.get(3)));
            teainfo.setTpolitical(String.valueOf(lo.get(4)));
            teainfo.setTitle(String.valueOf(lo.get(5)));
            teainfo.setTphone(String.valueOf(lo.get(6)));
            teainfo.setTemail(String.valueOf(lo.get(7)));
            if(String.valueOf(lo.get(8)).equals("教务处")){
                teainfo.setTrole(1);
            }else if(String.valueOf(lo.get(8)).equals("辅导员")){
                teainfo.setTrole(2);
            }else if(String.valueOf(lo.get(8)).equals("班主任")){
                teainfo.setTrole(3);
            }
            teainfo.setTphoto(String.valueOf(lo.get(9)));
            teainfo.setTaddress(String.valueOf(lo.get(10)));
            teainfo.setTcollege(String.valueOf(lo.get(11)));
//            vo.setUserTel(String.valueOf(lo.get(0)));     // 表格的第一列   注意数据格式需要对应实体类属性
//            vo.setIntegral(Integer.valueOf(String.valueOf(lo.get(1))));   // 表格的第二列
            //vo.setRegTime(Date.valueOf(String.valueOf(lo.get(2))));
            //由于数据库中此字段是datetime，所以要将字符串时间格式：yyyy-MM-dd HH:mm:ss，转为Date类型
            teainfoList.add(teainfo);
			/*if(j == null)
			{
		            userMapper.insert(vo);
			}
			else
			{
		            userMapper.updateByPrimaryKey(vo);
			}*/
        }
        int num = teaService.insertforeach(teainfoList);
        return R.ok("成功导入"+listob.size()+"条数据！其中有"+(num-listob.size())+"条数据已存在且进行了更新！");
    }
    //教务处导入班级信息
    @RequestMapping(value = "/uploadClass", method = RequestMethod.POST)
    @ResponseBody
    public R uploadClass(@RequestParam MultipartFile file)throws Exception{
        if(!file.getOriginalFilename().equals("班级信息上传模板.xls")){
            return R.ok("请使用模板上传，注意不能改名！");
        }
        if(file.isEmpty()){
            try {
                throw new Exception("文件不存在！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        InputStream in =null;
        try {
            in = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        List<List<Object>> listob = null;
        try {
            System.out.println(file.getOriginalFilename());
            listob = new ExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
            System.out.println(listob.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Classinfo> classinfoList = new ArrayList<Classinfo>();
        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            Classinfo classinfo = new Classinfo();
            /*这里是主键验证，根据实际需要添加，可要可不要，加上之后，可以对现有数据进行批量修改和导入
            User j = null;
			try {
				j = userMapper.selectByPrimaryKey(Integer.valueOf(String.valueOf(lo.get(0))));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				System.out.println("没有新增");
			}*/
            //vo.setUserId(Integer.valueOf(String.valueOf(lo.get(0))));  // 刚开始写了主键，由于主键是自增的，又去掉了，现在只有批量插入的功能，不能对现有数据进行修改了
            classinfo.setClassid(String.valueOf(lo.get(0)));    // 表格的第一列   注意数据格式需要对应实体类属性
            System.out.println(classinfo.getClassid());
            classinfo.setCcollege(String.valueOf(lo.get(1)));
            classinfo.setMajor(String.valueOf(lo.get(2)));
            classinfo.setCgrade(String.valueOf(lo.get(3)));
            classinfo.setInstructor(String.valueOf(lo.get(4)));
            classinfo.setHeadmaster(String.valueOf(lo.get(5)));
//            vo.setUserTel(String.valueOf(lo.get(0)));     // 表格的第一列   注意数据格式需要对应实体类属性
//            vo.setIntegral(Integer.valueOf(String.valueOf(lo.get(1))));   // 表格的第二列
            //vo.setRegTime(Date.valueOf(String.valueOf(lo.get(2))));
            //由于数据库中此字段是datetime，所以要将字符串时间格式：yyyy-MM-dd HH:mm:ss，转为Date类型
            classinfoList.add(classinfo);
			/*if(j == null)
			{
		            userMapper.insert(vo);
			}
			else
			{
		            userMapper.updateByPrimaryKey(vo);
			}*/
        }
        int num = classService.insertforeach(classinfoList);
        System.out.println(num);
        return R.ok("成功导入"+listob.size()+"条数据！其中有"+(num-listob.size())+"条数据已存在且进行了更新！");
    }
    //从数据库导出所有学生信息
    @RequestMapping(value = "/exportStu",method = RequestMethod.GET)
    @ResponseBody
    public void exportStu(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        //一、从后台拿数据
        Stuinfo stuinfo = new Stuinfo();
        Classinfo classinfo = new Classinfo();
        stuinfo.setClassinfo(classinfo);
        List<Stuinfo> list=stuService.queryStuListByOthers(stuinfo);
        //二、 数据转成excel
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/x-download");
        String fileName = "学生信息.xlsx";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        // 第一步：定义一个新的工作簿
        XSSFWorkbook wb = new XSSFWorkbook();
        // 第二步：创建一个Sheet页
        XSSFSheet sheet = wb.createSheet("startTimeendTime");
        sheet.setDefaultRowHeight((short) (2 * 256));//设置行高
        sheet.setColumnWidth(0, 3000);//设置列宽
        sheet.setColumnWidth(1,3000);
        sheet.setColumnWidth(2,3000);
        sheet.setColumnWidth(3,3000);
        sheet.setColumnWidth(4,2500);
        sheet.setColumnWidth(5,5000);
        sheet.setColumnWidth(6,3000);
        sheet.setColumnWidth(7,3000);
        sheet.setColumnWidth(8,3000);
        sheet.setColumnWidth(9,3000);
        sheet.setColumnWidth(10,5000);
        sheet.setColumnWidth(11,3000);
        sheet.setColumnWidth(12,5000);
        sheet.setColumnWidth(13,3000);
        sheet.setColumnWidth(14,5000);
        XSSFFont font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 16);
        XSSFRow row = sheet.createRow(0);
        XSSFCell cell = row.createCell(0);
        cell.setCellValue("学号");
        cell = row.createCell(1);
        cell.setCellValue("姓名");
        cell = row.createCell(2);
        cell.setCellValue("性别");
        cell = row.createCell(3);
        cell.setCellValue("出生年月日");
        cell = row.createCell(4);
        cell.setCellValue("生源地");
        cell = row.createCell(5);
        cell.setCellValue("政治面貌");
        cell = row.createCell(6);
        cell.setCellValue("联系方式");
        cell = row.createCell(7);
        cell.setCellValue("邮箱");
        cell = row.createCell(8);
        cell.setCellValue("照片");
        cell = row.createCell(9);
        cell.setCellValue("寝室");
        cell = row.createCell(10);
        cell.setCellValue("学院");
        cell = row.createCell(11);
        cell.setCellValue("专业");
        cell = row.createCell(12);
        cell.setCellValue("年级");
        cell = row.createCell(13);
        cell.setCellValue("班级号");
        cell = row.createCell(14);
        cell.setCellValue("职务");
        XSSFRow rows;
        XSSFCell cells;
        for (int i = 0; i < list.size(); i++) {
            // 第三步：在这个sheet页里创建一行
            rows = sheet.createRow(i+1);
            // 第四步：在该行创建一个单元格
            cells = rows.createCell(0);
            // 第五步：在该单元格里设置值
            cells.setCellValue(list.get(i).getStuid());
            cells = rows.createCell(1);
            cells.setCellValue(list.get(i).getSname());
            cells = rows.createCell(2);
            cells.setCellValue(list.get(i).getSsex());
            cells = rows.createCell(3);
            cells.setCellValue(list.get(i).getSbirthday());
            cells = rows.createCell(4);
            cells.setCellValue(list.get(i).getStudents());
            cells = rows.createCell(5);
            cells.setCellValue(list.get(i).getSpolitical());
            cells = rows.createCell(6);
            cells.setCellValue(list.get(i).getSphone());
            cells = rows.createCell(7);
            cells.setCellValue(list.get(i).getSemail());
            cells = rows.createCell(8);
            cells.setCellValue(list.get(i).getSphoto());
            cells = rows.createCell(9);
            cells.setCellValue(list.get(i).getSadress());
            cells = rows.createCell(10);
            cells.setCellValue(list.get(i).getClassinfo().getCcollege());
            cells = rows.createCell(11);
            cells.setCellValue(list.get(i).getClassinfo().getMajor());
            cells = rows.createCell(12);
            cells.setCellValue(list.get(i).getClassinfo().getCgrade());
            cells = rows.createCell(13);
            cells.setCellValue(list.get(i).getSclass());
            cells = rows.createCell(14);
            cells.setCellValue(list.get(i).getRoleinfo().getRname());
        }
        try {
            OutputStream out = response.getOutputStream();
            wb.write(out);
            out.close();
            wb.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //从数据库导出所有教师信息
    @RequestMapping(value = "/exportTea",method = RequestMethod.GET)
    @ResponseBody
    public void exportTea(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        //一、从后台拿数据
        List<Teainfo> list=teaService.queryTeaList();
        //二、 数据转成excel
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/x-download");
        String fileName = "教师信息.xlsx";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        // 第一步：定义一个新的工作簿
        XSSFWorkbook wb = new XSSFWorkbook();
        // 第二步：创建一个Sheet页
        XSSFSheet sheet = wb.createSheet("startTimeendTime");
        sheet.setDefaultRowHeight((short) (2 * 256));//设置行高
        sheet.setColumnWidth(0, 3000);//设置列宽
        sheet.setColumnWidth(1,3000);
        sheet.setColumnWidth(2,3000);
        sheet.setColumnWidth(3,3000);
        sheet.setColumnWidth(4,2500);
        sheet.setColumnWidth(5,5000);
        sheet.setColumnWidth(6,3000);
        sheet.setColumnWidth(7,3000);
        sheet.setColumnWidth(8,3000);
        sheet.setColumnWidth(9,3000);
        sheet.setColumnWidth(10,5000);
        sheet.setColumnWidth(11,3000);
        XSSFFont font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 16);
        XSSFRow row = sheet.createRow(0);
        XSSFCell cell = row.createCell(0);
        cell.setCellValue("工号");
        cell = row.createCell(1);
        cell.setCellValue("姓名");
        cell = row.createCell(2);
        cell.setCellValue("性别");
        cell = row.createCell(3);
        cell.setCellValue("出生年月日");
        cell = row.createCell(4);
        cell.setCellValue("政治面貌");
        cell = row.createCell(5);
        cell.setCellValue("职称");
        cell = row.createCell(6);
        cell.setCellValue("联系方式");
        cell = row.createCell(7);
        cell.setCellValue("邮箱");
        cell = row.createCell(8);
        cell.setCellValue("照片");
        cell = row.createCell(9);
        cell.setCellValue("办公地点");
        cell = row.createCell(10);
        cell.setCellValue("学院");
        cell = row.createCell(11);
        cell.setCellValue("职务");
        XSSFRow rows;
        XSSFCell cells;
        for (int i = 0; i < list.size(); i++) {
            // 第三步：在这个sheet页里创建一行
            rows = sheet.createRow(i+1);
            // 第四步：在该行创建一个单元格
            cells = rows.createCell(0);
            // 第五步：在该单元格里设置值
            cells.setCellValue(list.get(i).getTeaid());
            cells = rows.createCell(1);
            cells.setCellValue(list.get(i).getTname());
            cells = rows.createCell(2);
            cells.setCellValue(list.get(i).getTsex());
            cells = rows.createCell(3);
            cells.setCellValue(list.get(i).getTbirthday());
            cells = rows.createCell(4);
            cells.setCellValue(list.get(i).getTpolitical());
            cells = rows.createCell(5);
            cells.setCellValue(list.get(i).getTitle());
            cells = rows.createCell(6);
            cells.setCellValue(list.get(i).getTphone());
            cells = rows.createCell(7);
            cells.setCellValue(list.get(i).getTemail());
            cells = rows.createCell(8);
            cells.setCellValue(list.get(i).getTphoto());
            cells = rows.createCell(9);
            cells.setCellValue(list.get(i).getTaddress());
            cells = rows.createCell(10);
            cells.setCellValue(list.get(i).getTcollege());
            cells = rows.createCell(11);
            cells.setCellValue(list.get(i).getRoleinfo().getRname());
        }
        try {
            OutputStream out = response.getOutputStream();
            wb.write(out);
            out.close();
            wb.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //从数据库导出所有教师信息
    @RequestMapping(value = "/exportClass",method = RequestMethod.GET)
    @ResponseBody
    public void exportClass(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        //一、从后台拿数据
        List<Classinfo> list=classService.queryAll();
        //二、 数据转成excel
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/x-download");
        String fileName = "班级信息.xlsx";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        // 第一步：定义一个新的工作簿
        XSSFWorkbook wb = new XSSFWorkbook();
        // 第二步：创建一个Sheet页
        XSSFSheet sheet = wb.createSheet("startTimeendTime");
        sheet.setDefaultRowHeight((short) (2 * 256));//设置行高
        sheet.setColumnWidth(0, 3000);//设置列宽
        sheet.setColumnWidth(1,3000);
        sheet.setColumnWidth(2,3000);
        sheet.setColumnWidth(3,3000);
        sheet.setColumnWidth(4,2500);
        sheet.setColumnWidth(5,5000);
        XSSFFont font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 16);
        XSSFRow row = sheet.createRow(0);
        XSSFCell cell = row.createCell(0);
        cell.setCellValue("学院");
        cell = row.createCell(1);
        cell.setCellValue("专业");
        cell = row.createCell(2);
        cell.setCellValue("年级");
        cell = row.createCell(3);
        cell.setCellValue("班级号");
        cell = row.createCell(4);
        cell.setCellValue("辅导员");
        cell = row.createCell(5);
        cell.setCellValue("班主任");
        XSSFRow rows;
        XSSFCell cells;
        for (int i = 0; i < list.size(); i++) {
            // 第三步：在这个sheet页里创建一行
            rows = sheet.createRow(i+1);
            // 第四步：在该行创建一个单元格
            cells = rows.createCell(0);
            // 第五步：在该单元格里设置值
            cells.setCellValue(list.get(i).getCcollege());
            cells = rows.createCell(1);
            cells.setCellValue(list.get(i).getMajor());
            cells = rows.createCell(2);
            cells.setCellValue(list.get(i).getCgrade());
            cells = rows.createCell(3);
            cells.setCellValue(list.get(i).getClassid());
            cells = rows.createCell(4);
            cells.setCellValue(list.get(i).getInstructor());
            cells = rows.createCell(5);
            cells.setCellValue(list.get(i).getHeadmaster());
        }
        try {
            OutputStream out = response.getOutputStream();
            wb.write(out);
            out.close();
            wb.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
