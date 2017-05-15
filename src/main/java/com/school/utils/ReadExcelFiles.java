package com.school.utils;

import com.school.model.DegreeExam;
import com.school.model.*;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zheng1718 on 17-5-11.
 */
public class ReadExcelFiles {
    public List<award_info> readAIXls(String path) throws InvalidFormatException,IOException {
        System.out.println("ReadExcel start work!");
        InputStream is = new FileInputStream(path);
        List<award_info> list = new ArrayList<award_info>();
        try {
            Workbook wb = WorkbookFactory.create(is);
            award_info awardInfo;

            // 循环工作表Sheet
            for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
                Sheet mySheet = wb.getSheetAt(numSheet);
                if (mySheet == null) {
                    continue;
                }
                System.out.println(mySheet.getLastRowNum());
                // 循环行Row
                for (int rowNum = 1; rowNum < mySheet.getLastRowNum(); rowNum++) {
                    //mySheet.getRow(1).getCell(0)
                    //Iterator<Row> rowIter = mySheet.rowIterator();
                    Row hssfRow = mySheet.getRow(rowNum);
                    if (hssfRow != null) {

                        Cell sid = hssfRow.getCell(0);
                        Cell major = hssfRow.getCell(1);
                        Cell award = hssfRow.getCell(2);

                        awardInfo = new award_info();
                        awardInfo.setSid(getValue(sid));
                        awardInfo.setMajor(getValue(major));
                        awardInfo.setAward(getValue(award));

                        list.add(awardInfo);
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(is!=null){
                is.close();
            }
        }
        System.out.println("ReadExcel stop work!");
        return list;
    }
    public List<course_score> readCSXls(String path) throws InvalidFormatException, IOException {
        InputStream is = new FileInputStream(path);
        List<course_score> list = new ArrayList<course_score>();
        try {
            Workbook wb = WorkbookFactory.create(is);
            course_score courseScore;

            // 循环工作表Sheet
            for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
                Sheet mySheet = wb.getSheetAt(numSheet);
                if (mySheet == null) {
                    continue;
                }
                // 循环行Row
                System.out.println(mySheet.getLastRowNum());
                for (int rowNum = 1; rowNum <= mySheet.getLastRowNum(); rowNum++) {
                    //mySheet.getRow(1).getCell(0)
                    //Iterator<Row> rowIter = mySheet.rowIterator();
                    Row hssfRow = mySheet.getRow(rowNum);
                    if (hssfRow != null) {

                        courseScore = new course_score();
                        Cell college = hssfRow.getCell(0);
                        Cell course = hssfRow.getCell(1);
                        Cell credit = hssfRow.getCell(2);
                        Cell hours = hssfRow.getCell(3);
                        Cell classes = hssfRow.getCell(4);
                        Cell sid = hssfRow.getCell(5);
                        Cell gender = hssfRow.getCell(6);
                        Cell score = hssfRow.getCell(7);
                        Cell course_nature = hssfRow.getCell(8);
                        Cell test_nature = hssfRow.getCell(9);
                        Cell learn_term = hssfRow.getCell(10);

                        courseScore.setCollege(getValue(college));
                        courseScore.setCourse(getValue(course));
                        courseScore.setCredit(Float.parseFloat(getValue(credit)));
                        courseScore.setHours(Float.parseFloat(getValue(hours)));
                        courseScore.setClasses(getValue(classes));
                        courseScore.setSid(getValue(sid));
                        courseScore.setGender(getValue(gender));
                        courseScore.setScore(getValue(score));
                        courseScore.setCourse_nature(getValue(course_nature));
                        courseScore.setTest_nature(getValue(test_nature));
                        courseScore.setLearn_term(getValue(learn_term));

                        list.add(courseScore);
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(is!=null){
                is.close();
            }
        }
        System.out.println("ReadExcel stop work!");
        return list;
    }
    public List<degree_exam> readDEXls(String path) throws InvalidFormatException, IOException {
        InputStream is = new FileInputStream(path);
        List<degree_exam> list = new ArrayList<degree_exam>();
        try {
            Workbook wb = WorkbookFactory.create(is);
            degree_exam degreeExam;

            // 循环工作表Sheet
            for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
                Sheet mySheet = wb.getSheetAt(numSheet);
                if (mySheet == null) {
                    continue;
                }
                // 循环行Row
                for (int rowNum = 1; rowNum < mySheet.getLastRowNum(); rowNum++) {
                    //mySheet.getRow(1).getCell(0)
                    //Iterator<Row> rowIter = mySheet.rowIterator();
                    Row hssfRow = mySheet.getRow(rowNum);
                    if (hssfRow != null) {

                        Cell College = hssfRow.getCell(0);
                        Cell Grade = hssfRow.getCell(1);
                        Cell Major = hssfRow.getCell(2);
                        Cell Classes = hssfRow.getCell(3);
                        Cell ExamName = hssfRow.getCell(4);
                        Cell SId = hssfRow.getCell(5);
                        Cell Gender = hssfRow.getCell(6);
                        Cell Pass = hssfRow.getCell(7);
                        Cell Score = hssfRow.getCell(8);

                        degreeExam = new degree_exam();
                        degreeExam.setCollege(getValue(College));
                        degreeExam.setGrade(getValue(Grade));
                        degreeExam.setMajor(getValue(Major));
                        degreeExam.setClasses(getValue(Classes));
                        degreeExam.setExam_name(getValue(ExamName));
                        degreeExam.setSid(getValue(SId));
                        degreeExam.setGender(getValue(Gender));
                        degreeExam.setPass(getValue(Pass));
                        degreeExam.setScore(Float.parseFloat(getValue(Score)));

                        list.add(degreeExam);
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(is!=null){
                is.close();
            }
        }
        System.out.println("ReadExcel stop work!");
        return list;
    }
    public List<grade_point> readGPXls(String path) throws InvalidFormatException, IOException {
        InputStream is = new FileInputStream(path);
        List<grade_point> list = new ArrayList<grade_point>();
        try {
            Workbook wb = WorkbookFactory.create(is);
            grade_point gradePoint;

            // 循环工作表Sheet
            for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
                Sheet mySheet = wb.getSheetAt(numSheet);
                if (mySheet == null) {
                    continue;
                }
                // 循环行Row
                for (int rowNum = 1; rowNum <= mySheet.getLastRowNum(); rowNum++) {
                    //mySheet.getRow(1).getCell(0)
                    //Iterator<Row> rowIter = mySheet.rowIterator();
                    Row hssfRow = mySheet.getRow(rowNum);
                    if (hssfRow != null) {

                        Cell college = hssfRow.getCell(0);
                        Cell major = hssfRow.getCell(1);
                        Cell classes = hssfRow.getCell(2);
                        Cell sid = hssfRow.getCell(3);
                        Cell gender = hssfRow.getCell(4);
                        Cell total_credit = hssfRow.getCell(5);
                        Cell learned_credit = hssfRow.getCell(6);
                        Cell point = hssfRow.getCell(7);
                        Cell notlearned_credit = hssfRow.getCell(8);
                        Cell graduation_audit = hssfRow.getCell(9);
                        Cell degree_audit = hssfRow.getCell(10);

                        gradePoint = new grade_point();
                        gradePoint.setCollege(getValue(college));
                        gradePoint.setMajor(getValue(major));
                        gradePoint.setClasses(getValue(classes));
                        gradePoint.setSid(getValue(sid));
                        gradePoint.setGender(getValue(gender));
                        gradePoint.setTotal_credit(Float.parseFloat(getValue(total_credit)));
                        gradePoint.setLearned_credit(Float.parseFloat(getValue(learned_credit)));
                        gradePoint.setPoint(Float.parseFloat(getValue(point)));
                        gradePoint.setNotlearned_credit(Float.parseFloat(getValue(notlearned_credit)));
                        gradePoint.setGraduation_audit(getValue(graduation_audit));
                        gradePoint.setDegree_audit(getValue(degree_audit));

                        list.add(gradePoint);
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(is!=null){
                is.close();
            }
        }
        System.out.println("ReadExcel stop work!");
        return list;
    }
    public List<graduation_info> readGIXls(String path) throws InvalidFormatException, IOException {
        InputStream is = new FileInputStream(path);
        List<graduation_info> list = new ArrayList<graduation_info>();

        try {
            Workbook wb = WorkbookFactory.create(is);
            //Sheet mySheet = wb.getSheetAt(0);
            //Iterator<Row> rowIter = mySheet.rowIterator();
            //System.out.println(mySheet.getRow(1).getCell(0));

            //InputStream is = new FileInputStream(path);
            //HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);

            graduation_info graduationInfo;

            // 循环工作表Sheet
            for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
                Sheet mySheet = wb.getSheetAt(numSheet);
                if (mySheet == null) {
                    continue;
                }
                // 循环行Row
                for (int rowNum = 1; rowNum <= mySheet.getLastRowNum(); rowNum++) {
                    //mySheet.getRow(1).getCell(0)
                    //Iterator<Row> rowIter = mySheet.rowIterator();
                    Row hssfRow = mySheet.getRow(rowNum);
                    if (hssfRow != null) {

                        graduationInfo = new graduation_info();
                        Cell gender = hssfRow.getCell(0);
                        Cell employment = hssfRow.getCell(1);
                        Cell major = hssfRow.getCell(2);
                        Cell sid = hssfRow.getCell(3);

                        graduationInfo.setGender(getValue(gender));
                        graduationInfo.setEmployment(getValue(employment));
                        graduationInfo.setMajor(getValue(major));
                        graduationInfo.setSid(getValue(sid));

                        list.add(graduationInfo);
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(is!=null){
                is.close();
            }
        }
        System.out.println("ReadExcel stop work!");
        return list;
    }
    public List<DegreeExam> readXls(String path) throws InvalidFormatException, IOException {
        System.out.println("ReadExcelFile start work!!!!");

        InputStream is = new FileInputStream(path);
        List<DegreeExam> list = new ArrayList<DegreeExam>();
        try {
            System.out.println(is.available());
            Workbook wb = WorkbookFactory.create(is);
            System.out.println(222);
            //Sheet mySheet = wb.getSheetAt(0);
            //Iterator<Row> rowIter = mySheet.rowIterator();
            //System.out.println(mySheet.getRow(1).getCell(0));

            //InputStream is = new FileInputStream(path);
            //HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);

            DegreeExam cet4score1;

            // 循环工作表Sheet
            for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
                Sheet mySheet = wb.getSheetAt(numSheet);
                if (mySheet == null) {
                    System.out.println(222);

                    continue;
                }
                // 循环行Row
                for (int rowNum = 1; rowNum <= mySheet.getLastRowNum(); rowNum++) {
                    //mySheet.getRow(1).getCell(0)
                    //Iterator<Row> rowIter = mySheet.rowIterator();
                    Row hssfRow = mySheet.getRow(rowNum);
                    if (hssfRow != null) {
                        System.out.println(222);

                        cet4score1 = new DegreeExam();
                        Cell College = hssfRow.getCell(0);
                        Cell Grade = hssfRow.getCell(1);
                        Cell Major = hssfRow.getCell(2);
                        Cell Classes = hssfRow.getCell(3);
                        Cell ExamName = hssfRow.getCell(4);
                        Cell SId = hssfRow.getCell(5);
                        Cell Gender = hssfRow.getCell(6);
                        Cell Pass = hssfRow.getCell(7);
                        Cell Score = hssfRow.getCell(8);

                        cet4score1.setCollege(getValue(College));
                        cet4score1.setGrade(getValue(Grade));
                        cet4score1.setMajor(getValue(Major));
                        cet4score1.setClasses(getValue(Classes));
                        cet4score1.setExamName(getValue(ExamName));
                        cet4score1.setSId(getValue(SId));
                        cet4score1.setGender(getValue(Gender));
                        cet4score1.setPass(getValue(Pass));
                        cet4score1.setScore(Float.parseFloat(getValue(Score)));

                        list.add(cet4score1);
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(is!=null){
                is.close();
            }
        }
        System.out.println("ReadExcel stop work!");
        return list;
    }

    @SuppressWarnings("static-access")
    private String getValue(Cell hssfCell) {
        if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
            // 返回布尔类型的值
            System.out.println();
            return String.valueOf(hssfCell.getBooleanCellValue());
        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
            // 返回数值类型的值
            return String.valueOf(hssfCell.getNumericCellValue());
        } else {
            // 返回字符串类型的值
            return String.valueOf(hssfCell.getStringCellValue());
        }
    }
}
