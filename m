Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C32C44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:38:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJi-0002gy-A0; Thu, 16 Jul 2026 08:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJg-0002gC-1J
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJe-00073U-B9
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:51 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiNCF2678267
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DWG7HDrKOjT
 mw538tEqDnVNF1v1AB+BnKiUcwYxSw+o=; b=FTgAoZg5Cc57d6d6K0ch68hatXB
 /PztpQNBPy4hmNJ7CtDy/nuwVBV6uIQepdP7aTIxpHNV4WlXaHV2uIYb1FJqQ9tR
 BMNs91JaPohPM6q4naN63o1Mhp3tFWwqDmO2hcPCSmu7s6XwuqIKjHdmJmslnpMH
 QodiEI8+JKXULf81eUtKd05SkrHpChl0RoOZ6jer32l3Xwu8AgywFgljdrYOdxnP
 n1X+hZFnCZ6d5W2s4gPIHZHC3A1qZ1mErGJ9zUzMtAe32HAqMmTjm+O1Q3T1GZxX
 CYUSufMfzwryD/RZGtWKypcc46GuHQQ0kCyq7AMj84h90RUfC637KCpl7eA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1rvdu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-904ee4473a8so89569586d6.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205348; x=1784810148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DWG7HDrKOjTmw538tEqDnVNF1v1AB+BnKiUcwYxSw+o=;
 b=QmIfXQ5qJubRSlBcGsIQnZhlbDvDntUsWoDicmW78VAAE6+2T138JMO2Y8PFmp6fSk
 saY8gS94dKQd4OIZZcsmOdJ5ZVq5I5FwZglO4y2Q8BD8eWC14+NIvTcTxVaaNwoxzdkD
 C8JzE8H6Ufuds9UzOGqD7tUNFNIiIf0wUQTIgGIOszgWsV9btoefo+DHmp46Hqo1vKyC
 ddlEqdUgYC/OnJmChGAwfVR8XwmMBqM7N8ZrD/RmraEAGqMS8YCM+I6XYwvBTm/xOS45
 uWnVjzT+Py3oI8BvLmco/KIEO/xhVJvsTUpb99vLg5+BquyN1ZXTAGVclGNhTgWW9C31
 gTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205348; x=1784810148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DWG7HDrKOjTmw538tEqDnVNF1v1AB+BnKiUcwYxSw+o=;
 b=QqIe3K4dKA1THSqVuEVCbTGCIffQeeTuL3vbnIZR6r5hVPjVGP7oM4X+O6i5MT7F9z
 OReDTFmG8inmvRysuhKlQ4tbpsEaOHPQB5AcjcDIEJNkgiWIVXxcegWnrMPLtfQlQvVQ
 Fd86qD2YLyfRXYkTbi+ITM4LtyDPxGq7Xvqlpchv3KbMDgHHpLnrqeStuYICgz4qoswM
 HyoZTe+Ocv+oF7Vo6eHwOtHXnOdUw3hFLLRG7oaGjEzcx/WUMr+1L50GOILL1Co7Bhj5
 3Dh4auTiWjTG9rC1uS3yZSpg2ubVqWrN+fgu2kYXQZkrGm6fccmUOCRZHitCxnLP7K+f
 1+kQ==
X-Gm-Message-State: AOJu0YyFarHp7SRYeEmi3bRKrMZ18P5kx1xy8xX5wkJSQtP9mSv1KUZi
 H1Mn57bNLgmlaSY3TzHiWdkHZ4C7mzA5YDMNlG3se02BK2uknYaaV6aOEB6lkMX2aWIBvvufwxA
 +UFssX6TQ9+s8TuQOxTweFhmeIzdaZ11HdxQ2fRUzVv74tFjhxvrf49eUew==
X-Gm-Gg: AfdE7cl67TKmdav37G3DNKF62mEU6yB2ZQLEtCQvlYXjos/kAF9D4eIzHoYuHoFNPfr
 /iKM7mKGoyBz+BkWJiuwSASXOYK17fanu+hZtdLq/IdkXA5WxwVnivCMNE1nZQEdlY/C0H0Pmjb
 qtTxgb6RVhOk8yHYmn/7PgzvCpPE6mzfBDK7+hef7h6IK5UFB6R3kUkaEIwu6x+7n3JOAFoAhSA
 vvbWdC+L9YIXUeUStsc/mUClRP9Mdt7W/D5Xlviy57xylHjSVPHs6dks6EQUnwggqZFPWW3uXsL
 lTSkPsXmCFrIbG+S1pZhbTIOuMsIj7Hl7rMJ7RFHfzW9MCscWKO02Cyk6ilf8swkoHXLXh3QSlw
 86tkaNDkNEkLUKiwkrm35p+2YtG98FxkyC48=
X-Received: by 2002:a05:6214:4907:b0:8e9:f5de:d604 with SMTP id
 6a1803df08f44-90747cf480amr150349696d6.49.1784205348414; 
 Thu, 16 Jul 2026 05:35:48 -0700 (PDT)
X-Received: by 2002:a05:6214:4907:b0:8e9:f5de:d604 with SMTP id
 6a1803df08f44-90747cf480amr150349156d6.49.1784205347739; 
 Thu, 16 Jul 2026 05:35:47 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:35:47 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 02/17] target/riscv/debug: Handle changing trigger
 types
Date: Thu, 16 Jul 2026 09:35:19 -0300
Message-ID: <20260716123535.3709148-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXwoH1+Zkp7rge
 1VZZjB+zqgwwZdJ7ge1CMRjuqULq1bK3htjt7T0MppGJucY+nqjGor0EFRUt0SvRsmhzN4KV+Dg
 GuNJPUeMg2u2CclRnVW6oFCLW1A1JS0QlOvYzKlbMu0FU1es9rxgqPzOALDfqN3v9OqONrb4Deg
 CgLMkn+RVO4HAvh6B4deKtacwKnWVeRPeoPUBsJi9MEXXcmg1IF4+Ke07WkutVMJtjHvtohXqC8
 CaejmfsI+cb/p4J1dKwQlCZzcl6BLY9Du3MnIVzEGwkB9vQrgZQK2q/9DnzADOEeddO+MKW4y4W
 pSOhy205/iYgpKbUvu0DT5dJM+w8Mn190yagsMcqZhO4nmaT8br8VEXxJCNCaT0p0roU0kfVUbE
 OaG8KKvnkimnl2e9JpxGYTJ20WH8v0zzeq0PXGiJyghIqnNfrUYPe7Lz4Oip4OJdCLoQD9wC7oA
 gU1Pb5tr16z5M5O/6jA==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58d025 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=a3NOPWvn6jD59UKBmmgA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: FpQ9xkFEZu5od5iDLlwt3u4jJ70onmda
X-Proofpoint-ORIG-GUID: FpQ9xkFEZu5od5iDLlwt3u4jJ70onmda
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXypQkQn1V4Z8C
 Zz25S8yU3Dv8CTAl6j7GkdJuJk6Its2jf9ieah35dlfwirtzR6MVVuGr3CYE4moRSe6/8JuYZzl
 3gtvB17NKcZEdLB1BbFZWUh0a3/DShM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160129
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Nicholas Piggin <npiggin@gmail.com>

Updating debug registers will first remove the existing TCG breakpoint /
watchpoint, then adds it back with new values.

Writing TDATA1 with a value that changes the trigger type attempts to
remove the facility for the new trigger type rather than the existing
one. That is, it will not remove a breakpoint if the type is changed to
a non-breakpoint type.

Fix this by removing based on the old trigger type, then inserting based
on the new type.

Fixes: a42bd00166 ("target/riscv: debug: Determine the trigger type from tdata1.type")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 target/riscv/tcg/debug.c | 64 +++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 3ee598b86c..9e6c907742 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -530,23 +530,12 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
 static void type2_reg_write(CPURISCVState *env, target_ulong index,
                             int tdata_index, target_ulong val)
 {
-    target_ulong new_val;
-
     switch (tdata_index) {
     case TDATA1:
-        new_val = type2_mcontrol_validate(env, val);
-        if (new_val != env->tdata1[index]) {
-            env->tdata1[index] = new_val;
-            type2_breakpoint_remove(env, index);
-            type2_breakpoint_insert(env, index);
-        }
+        env->tdata1[index] = type2_mcontrol_validate(env, val);
         break;
     case TDATA2:
-        if (val != env->tdata2[index]) {
-            env->tdata2[index] = val;
-            type2_breakpoint_remove(env, index);
-            type2_breakpoint_insert(env, index);
-        }
+        env->tdata2[index] = val;
         break;
     case TDATA3:
         env->tdata3[index] = textra_validate(env, val);
@@ -554,6 +543,8 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
     default:
         g_assert_not_reached();
     }
+
+    type2_breakpoint_insert(env, index);
 }
 
 /* type 6 trigger */
@@ -644,23 +635,12 @@ static void type6_breakpoint_remove(CPURISCVState *env, target_ulong index)
 static void type6_reg_write(CPURISCVState *env, target_ulong index,
                             int tdata_index, target_ulong val)
 {
-    target_ulong new_val;
-
     switch (tdata_index) {
     case TDATA1:
-        new_val = type6_mcontrol6_validate(env, val);
-        if (new_val != env->tdata1[index]) {
-            env->tdata1[index] = new_val;
-            type6_breakpoint_remove(env, index);
-            type6_breakpoint_insert(env, index);
-        }
+        env->tdata1[index] = type6_mcontrol6_validate(env, val);
         break;
     case TDATA2:
-        if (val != env->tdata2[index]) {
-            env->tdata2[index] = val;
-            type6_breakpoint_remove(env, index);
-            type6_breakpoint_insert(env, index);
-        }
+        env->tdata2[index] = val;
         break;
     case TDATA3:
         env->tdata3[index] = textra_validate(env, val);
@@ -668,6 +648,7 @@ static void type6_reg_write(CPURISCVState *env, target_ulong index,
     default:
         g_assert_not_reached();
     }
+    type6_breakpoint_insert(env, index);
 }
 
 /* icount trigger type */
@@ -833,8 +814,6 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
                 /* set the count to timer */
                 timer_mod(env->itrigger_timer[index],
                           env->last_icount + itrigger_get_count(env, index));
-            } else {
-                env->itrigger_enabled = riscv_itrigger_enabled(env);
             }
         }
         break;
@@ -883,12 +862,30 @@ target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 {
-    int trigger_type;
+    int trigger_type = get_trigger_type(env, env->trigger_cur);
+    bool check_itrigger = false;
+
+    switch (trigger_type) {
+    case TRIGGER_TYPE_AD_MATCH:
+        type2_breakpoint_remove(env, env->trigger_cur);
+        break;
+    case TRIGGER_TYPE_AD_MATCH6:
+        type6_breakpoint_remove(env, env->trigger_cur);
+        break;
+    case TRIGGER_TYPE_INST_CNT:
+        /*
+         * itrigger_enabled is the union of all enabled icount triggers,
+         * so it's easiest to recheck all if any have changed (removed or
+         * added or modified).
+         */
+        check_itrigger = true;
+        break;
+    default:
+        break;
+    }
 
     if (tdata_index == TDATA1) {
         trigger_type = extract_trigger_type(env, val);
-    } else {
-        trigger_type = get_trigger_type(env, env->trigger_cur);
     }
 
     switch (trigger_type) {
@@ -900,6 +897,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
         break;
     case TRIGGER_TYPE_INST_CNT:
         itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
+        check_itrigger = true;
         break;
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
@@ -915,6 +913,10 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
     default:
         g_assert_not_reached();
     }
+
+    if (check_itrigger && !icount_enabled()) {
+        env->itrigger_enabled = riscv_itrigger_enabled(env);
+    }
 }
 
 target_ulong tinfo_csr_read(CPURISCVState *env)
-- 
2.43.0


