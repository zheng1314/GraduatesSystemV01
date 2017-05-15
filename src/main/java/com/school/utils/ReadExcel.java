package com.school.utils;

import com.school.model.DegreeExam;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


/**
 * Created by zheng1718 on 17-5-4.
 */
public class ReadExcel {
    public List<DegreeExam> readXls(String path) throws InvalidFormatException, IOException {
        System.out.println("ReadExcel start work!!!!");

        InputStream is = new FileInputStream(path);
        List<DegreeExam> list = new ArrayList<DegreeExam>();
        try {
            System.out.println(111);
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
                continue;
            }
            // 循环行Row
            for (int rowNum = 1; rowNum <= mySheet.getLastRowNum(); rowNum++) {
                //mySheet.getRow(1).getCell(0)
                //Iterator<Row> rowIter = mySheet.rowIterator();
                Row hssfRow = mySheet.getRow(rowNum);
                if (hssfRow != null) {
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
