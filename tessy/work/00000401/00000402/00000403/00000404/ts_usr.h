/*
 * DO NOT EDIT THIS FILE!
 *
 * This file is automatically generated each time a test
 * is executed and all changes made to this file will be lost.
 */
#if !defined (__TESSY_USR_H)
   #define __TESSY_USR_H

#ifndef TESSY_USERCODE
   #define TESSY_USERCODE
#endif

/*
 * Return values
 */
#define TS_RC_USER_OK            0  /* Normal succesfull completion      */
#define TS_RC_USER_ERROR        -1  /* An error occured during execution */

#ifndef TESSY_USER_DECLARATION
#define TESSY_USER_DECLARATION
/*
 * This is a declaration.
 */
#endif


#ifdef __cplusplus
extern "C" {
#endif
/*
 * Prolog/Epilog functions
 */
void ts_tobj_prolog (void);
void ts_tobj_epilog (void);
void ts_tc_prolog (void);
void ts_tc_epilog (void);

#ifdef __cplusplus
}
#endif

#endif // !defined (__TESSY_USR_H)
