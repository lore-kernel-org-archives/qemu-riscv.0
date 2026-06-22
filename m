Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47707CDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:32:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNr-0000lM-AG; Mon, 22 Jun 2026 15:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNo-0000gZ-UY
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNl-0001qT-JF
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:35 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVitW1022811
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iz0Qs3dA7GN
 4+dUdfxOGNmKUJWefMtxQaJofGCFNLyY=; b=mLnyQdnEPInINC2uRsxx1Mp+F1w
 nIdI2b6G0XbD8WzDWi47MZATLPmLIEd02/JaRKcvKzjl58gPVwHijg9Wik+vaUEB
 MCKASK2TIh/ym9dGIjF1fg32p4tL1unryIG5ZYwEZ67aYLwLqx+cvfZyYL07Ivy/
 Fk2bPrqpxRM42GpafrQHqnkdSsAHV8AbDRMqPiS5BWoqTHGhJTzVFShNEvx9k50L
 XpJuh56DA1vnOU2MV56apjPVo3Q0CBtJ5f/iUHEhOd85n7zPMZMKodUw1g0qa1Dh
 gnXU2J1fymS71RwU42mQepSTFRdO33s3TEDidya1nL3AWS0bQ/RgQKzYSqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729s2u9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-915c364ae3bso956407485a.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156741; x=1782761541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iz0Qs3dA7GN4+dUdfxOGNmKUJWefMtxQaJofGCFNLyY=;
 b=gyPMq/2LbVCU+DrmP00ypaoMNEc5oOOW0rV5Gy5zRzQEBY5qW6i14TvtOHezd0drx9
 yCvsXQ1VS3I7jqjZ5UynCppRMHJ0ATJxRPEdi5VbA5CCYFYSLwEaGbxuepImGGWP0x75
 IdidGkoaHgr9rJWXAvhLw9cPBt7Q7SJDKThlvlJkOe+ci88DE+lwjzv5C/+quYFEcu+b
 Fq2MfCkjd/tnFjeczluve5di4EZ56v/04GcjYKlNXnatUjGXj+JHzwYCjq5FCl4/LCG0
 qqKTpLEcwP3+tB6celhOaZlQUk8eJJN0NFsCZ0Yf2QRlg1O2ByczETCdn4g2aFQVs48s
 oHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156741; x=1782761541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iz0Qs3dA7GN4+dUdfxOGNmKUJWefMtxQaJofGCFNLyY=;
 b=bYrcCvcvlcTSWzixovbJwFx4SfI0JvdTzNl/tEfH3RpbXpLrIrPXsJQuwTY88ou7zr
 OdlwICR6hcpbCQWxP3GG/JEoMUzn7E9D/53JkBcCb0BRDf1yho7IMVHLZ0K/zDgs7RT7
 uC8wqZK/ZlmeNwZ53o4CfMUIAgzG4MobLABgU3dJv5mCAgRcLLC3xbUFuSJke2I5h9r6
 dGPk064nBdEN13znogZ6iNSxXZfh/2SK7QuQd/i2VJ4TgfCDlj+IxVZy9ZG60GQLwBUI
 QL9uSvixHMl1qE8aO5yqmfy0f+qc3zTAnCe/++EjdskfxVHRePgJkxfbnQiHzBxlYvSL
 k6ag==
X-Gm-Message-State: AOJu0YxsQ+igk0Tg04GXY5HLCJNo67mnhebCEdQtvZgprSwdbF+Bwfnp
 JY3YP8dIFZJziTJJXknlqVX165EZAiy/e56AwnSolWlNzREuQAQimBl+RHABshJJjFYu0f+3c42
 I7pJk7qJe47+DlcKaSkT6kZH6gFAYWC7v+AZnEI9sViQv7Wip9MOs0wVXlA==
X-Gm-Gg: AfdE7cm7ivMGx7Qor6+Nt+5Fg5cqGPbXemhPcKVUwKcmtqgPVoSBLsHq3WoPMuIf+vv
 c0eSW6F8ZVSb+BMNgbrH4NmC+pvyikhQQ5N8bsvvthY1n11FOCZgpoBhqj+BjBAZgN+I6Jnm74d
 Kofa9v1t/P1R4sPs42xn1hGFzVvsMT6Fd85soFLjlU+lW8yy3J7IdF6dJjRGprlwI060S5IwmzN
 F+wzwUpYYLRQ2fL0BcvFyoWf7BsZCDqWtW18S1/Vxx82enlcVOtYTG4ZmqaxxaJsRUYXsu9++sA
 RU+vaMLxE49IMyfX8BOKf7LvVqTWtj7XmkHhLQaTABU4H471cJPx5irb/4IXhMFudDn/cDAPAz/
 1kV50q37mSuWv93J5vpq5/dRl8GVWslbTuwFstfkWRoPz9Q==
X-Received: by 2002:a05:620a:454a:b0:911:1a2c:f953 with SMTP id
 af79cd13be357-920d1af4854mr2232857885a.20.1782156741078; 
 Mon, 22 Jun 2026 12:32:21 -0700 (PDT)
X-Received: by 2002:a05:620a:454a:b0:911:1a2c:f953 with SMTP id
 af79cd13be357-920d1af4854mr2232850585a.20.1782156740432; 
 Mon, 22 Jun 2026 12:32:20 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:19 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 10/24] target/riscv: move custom_csrs logic to tcg-cpu.c
Date: Mon, 22 Jun 2026 16:31:26 -0300
Message-ID: <20260622193141.1449724-11-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXymhwmAtKwTBV
 /xrKLPCF+SIO33R3BjHaD42zVuYxSsMgMt9bo0HtKCRiBUPwrmvxNN5UFHRU6zqQUvZZHO8NA0O
 mqVpcWiMd+x78ABLuu9mH9P3S6BMtyM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX7ACvm3oebaTJ
 c4+L/iox6+hy2orXdnv/DRuAD1dJIzfballTqLP2eJrHg3s+j6X2EqHPr89wNRB+r2OW/CtI4GL
 7m9z1DK39Rwy7W0F3FarUlSWiB0mdRuUod5XfwkqyR6LblozEIj4NMz6wCX2+pW+5oFRkjEnZjh
 ePaznjQDFT9UQtTRQeeGEOjlEwV3y1BSETcPIl+2XCfe53SMJ8rc1S9bvX9GZ/lV62hgEtN/p4F
 lMVJi1ttDIsc8XHYF+s3zY17VuzhB71gPNMS4u1sEhW+qOH8nRwrgabYlzGLUDtQyLmLQpVm8Rt
 DGJtQdmyKedbkPK8IHESThxfZrcobaWXpX8eHapYC83a/9gBRPEc2xR8W0Az4870lPOQxUTzQsR
 mzlPy1BlC0IbuebnZUp1fPqmDfxqRnT6gHACRFT/L5JzHH71snTyduu9hEiJTINwJTaRwwibx5j
 a7yWtxVfEr1teWfOf2w==
X-Proofpoint-ORIG-GUID: iYpmTdLQ5vqxxNxIJ5cJTSXFv_oTl-94
X-Proofpoint-GUID: iYpmTdLQ5vqxxNxIJ5cJTSXFv_oTl-94
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a398dc6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UMTKudPWM8hV2BnMNbQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

We have a couple of CPUs that has a set of custom CSRs that uses TCG
specific APIs.  Move the related code to tcg-cpu.c and do not set
.custom_csrs if we're not in a TCG build.

What we'll end up doing, sooner or later, is punting all these CPUs to
tcg-cpu.c since they're all TCG specific and KVM has nothing to do with
them.  Another time.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c         | 24 +++---------------------
 target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 503b96bf2e..0c5e000f17 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -524,19 +524,6 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
 }
 #endif
 
-#ifndef CONFIG_USER_ONLY
-static void riscv_register_custom_csrs(RISCVCPU *cpu, const RISCVCSR *csr_list)
-{
-    for (size_t i = 0; csr_list[i].csr_ops.name; i++) {
-        int csrno = csr_list[i].csrno;
-        const riscv_csr_operations *csr_ops = &csr_list[i].csr_ops;
-        if (!csr_list[i].insertion_test || csr_list[i].insertion_test(cpu)) {
-            riscv_set_csr_ops(csrno, csr_ops);
-        }
-    }
-}
-#endif
-
 /* Used by csr.c and the KVM driver */
 target_ulong riscv_new_csr_seed(target_ulong new_value,
                                 target_ulong write_mask)
@@ -1244,11 +1231,6 @@ static void riscv_cpu_init(Object *obj)
     if (mcc->def->vext_spec != RISCV_PROFILE_ATTR_UNUSED) {
         cpu->env.vext_ver = mcc->def->vext_spec;
     }
-#ifndef CONFIG_USER_ONLY
-    if (mcc->def->custom_csrs) {
-        riscv_register_custom_csrs(cpu, mcc->def->custom_csrs);
-    }
-#endif
 
     accel_cpu_instance_init(CPU(obj));
 }
@@ -3178,7 +3160,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.mvendorid = THEAD_VENDOR_ID,
 
         .cfg.max_satp_mode = VM_1_10_SV39,
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
         .custom_csrs = th_csr_list,
 #endif
     ),
@@ -3224,7 +3206,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 
         .cfg.marchid = 0x8d143000,
         .cfg.mvendorid = THEAD_VENDOR_ID,
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
         .custom_csrs = th_csr_list,
 #endif
     ),
@@ -3429,7 +3411,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_xmipscmov = true,
         .cfg.marchid = 0x8000000000000201,
         .cfg.mvendorid = MIPS_VENDOR_ID,
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
         .custom_csrs = mips_csr_list,
 #endif
     ),
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index fe6350f497..fef66557c2 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -38,6 +38,7 @@
 #include "system/tcg.h"
 #include "exec/icount.h"
 #include "target/riscv/tcg/debug.h"
+#include "target/riscv/tcg/csr.h"
 #endif
 
 /* Hash that stores user set extensions */
@@ -1650,10 +1651,30 @@ static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
 }
 
+#ifndef CONFIG_USER_ONLY
+static void riscv_register_custom_csrs(RISCVCPU *cpu, const RISCVCSR *csr_list)
+{
+    for (size_t i = 0; csr_list[i].csr_ops.name; i++) {
+        int csrno = csr_list[i].csrno;
+        const riscv_csr_operations *csr_ops = &csr_list[i].csr_ops;
+        if (!csr_list[i].insertion_test || csr_list[i].insertion_test(cpu)) {
+            riscv_set_csr_ops(csrno, csr_ops);
+        }
+    }
+}
+#endif
+
 static void riscv_tcg_cpu_instance_init(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     Object *obj = OBJECT(cpu);
+#ifndef CONFIG_USER_ONLY
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(obj);
+
+    if (mcc->def->custom_csrs) {
+        riscv_register_custom_csrs(cpu, mcc->def->custom_csrs);
+    }
+#endif
 
     misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
     multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
-- 
2.43.0


