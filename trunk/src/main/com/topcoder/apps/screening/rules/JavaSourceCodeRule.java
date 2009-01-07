/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;
import java.io.File;
import com.topcoder.apps.screening.ScreeningRule;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;
import com.topcoder.apps.screening.DatabaseException;

/**
 * <strong>Purpose</strong>:
 * Checks if java source code and java test source code exist.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * DatabaseException is catched and propagated to the ScreeningTool class.
 * </li>
 * </ol>
 *
 * @author WishingBone, pulky
 * @version 1.0.1
 */
public class JavaSourceCodeRule implements ScreeningRule {

    /**
     * <strong>Purpose</strong>:
     * Screen the submission. Both the file and the root directory are given. Screening responses
     * are written to the ScreeningLogger instance.
     *
     * @param file the file to screen.
     * @param root the root dir of the extracted submission.
     * @param logger the logger to write responses to.
     *
     * @return true if the rule succedeed.
     *
     * @throws DatabaseException if screening process got DatabaseException.
     */
    public boolean screen(File file, File root, ScreeningLogger logger) {
        boolean success = true;

        try {
            File source = new File(new File(new File(root, "src"), "java"), "main");
            if (!containsJavaFile(source)) {
                logger.log(new SimpleScreeningData("Does not contain Java source code.", ResponseCode.NO_SOURCE_CODE));
                success = false;
            }

            File test = new File(new File(new File(root, "src"), "java"), "tests");
            if (!containsJavaFile(test)) {
                logger.log(new SimpleScreeningData("Does not contain Java test source code.", ResponseCode.NO_TEST_CODE));
                success = false;
            }
        } catch (DatabaseException dbe) {
            // propagate database exception so submission would be rescreened.
            throw dbe;
        }
        return success;
    }

    /**
     * <strong>Purpose</strong>:
     * Recursively searches for Java source file.
     *
     * @param root the root dir to search from.
     *
     * @return whether the dir contains Java source file.
     */
    private boolean containsJavaFile(File root) {
        if (!root.exists()) {
            return false;
        }
        File[] files = root.listFiles();
        for (int i = 0; i < files.length; ++i) {
            if (files[i].isDirectory()) {
                return containsJavaFile(files[i]);
            } else if (files[i].length() > 0) {
                String name = files[i].getName().toLowerCase();
                if (name.endsWith(".java")) {
                    return true;
                }
            }
        }
        return false;
    }

}
