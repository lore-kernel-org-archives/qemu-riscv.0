Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53ACCDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:36:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkO8-00011N-6E; Mon, 22 Jun 2026 15:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkO5-0000wv-GR
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkO2-0001sY-0y
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:52 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVvs61082392
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=G/X0cRfF4l4
 iK4D/p8Gh8GL89M7DIMuZtkGx3iFQEaQ=; b=QCNDYmewPB7aAV/wO41jAeJx+5k
 6Y0evOf1swO0ciKfWEZ/FYEOCxuhliOQilFVuhykDyBWID0lncnuXi9QH7ju8B9E
 WCcCUzvFAJCddXd726QCf79cD1TvhIyiwfrZRVnNlljDODYxMu5VFB5PYOV+ZEsb
 vmKFkre3aTYVjy6SHMcH6WZyVkN5kj2Gq6YLWlIbCv5UBWpt7EPvbYK/W0SEOOg/
 mZB/AdqN42TGPZ1PTuPQ/7XBOqTKi8l79upTYUkKxMHPTQE9Y8kXhAKE4+IjKKCh
 6nmAcFCd1UKluKDWfvpXFKbt27MVBa3Lq7DPiGyLwB62MI6M5FmZGiePzCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yja2g0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-915767b341eso440338185a.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156758; x=1782761558; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/X0cRfF4l4iK4D/p8Gh8GL89M7DIMuZtkGx3iFQEaQ=;
 b=dqPtMrKhmdJtbrlmb2PAxMKAFWkG4uh2SsMcTw88hFVbtBvCm4uxBRE8+cCU/lXpts
 Bg+q5Wh7IoZ11IYX9iM6k0MRoLZlP0HVljmfub+e+zmFYJEkq3FrqNf9VTlfDwNUYVGk
 c6eVoIcGZ1iE17E0sy9EbekFvKpyFhGD3nromRSuwPLF93Qc9lnu8pjrVuzVQC5JLmEr
 YW8kBSkuOwGpYJwfmINzcFVg8BNv5Zm8UvDA7GYsw4wnoLMVZ8uUXkgTU9Zo3PrtbaXG
 HVNdoZggU9EsT1EpUgEp+if6QXb8RbjWXJv0ZQO8W0jSWLZdw9PksIR4wHNTJeFdV8O1
 vrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156758; x=1782761558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G/X0cRfF4l4iK4D/p8Gh8GL89M7DIMuZtkGx3iFQEaQ=;
 b=koxZAJXBqk4iNXx+4wZYEBuYH7y9qvSMJS3CcUTLqJYlPxbVPlUCo6M+t7GoRbEBae
 fkwGnp3VHbESyJmCHiaLpko2nKusONUD8KjrKn8NxNPCRU32JYRz7eQxJ9ed+Dhp1HBl
 RAZa8frNWJTMFZ1q+0cRTK4dZIMbDqL74wlJqyrpJbBO0CGSKrM0fHpOeaChX7raV2ns
 CVa5Vapc2Q+Mbnohl00oMI2euNP5DrDPKy5QbPDloe/5vXcgPjoVFM+qVXxmNM3fwzKU
 FiDfbWt20xv/A6a3qTD3/wWr0nSd+1ZlX2ck68KdB++tBm17V+8O42JazOwqEzTIOXTn
 rJJg==
X-Gm-Message-State: AOJu0YznmS0cTEzUzGVysbCDYiEXfgHsHDIFAzyvQEcn/GpxLZ856pa/
 3zy9UewxpSy3nB7j0Kb5ZbBFcj+vPR3Fcco7zl3ccU+XGYy54goTIMkla93oyFZbflmbhjCJzB6
 /gnrRq09d0mtdDElTt4R/uwEu5c9WG9qVHjtp/KtYaW8Tp9Cisas5zotfaw==
X-Gm-Gg: AfdE7cl7kqARXW7uHYWcwGzPsZZ44YvyyUAQ5ga/cFDEG1yeZvr0BgE/u6FL0T9x8gD
 z544t5IldHBs0LeODgAHF/C41NdD3BJihPIguc0dMYJmKMfGrGQGhlfAC6gNsEihKrCMmTc8xqt
 cdfqrZsqaVcIyP8+dn6rMcg0D0/7eliNOkfsqNPXVLIx5e75ZAVqfuii5edjIA+USznDtKcGMz2
 bcAxDYja6PMN3UksCAQkoiFstRFBhtbNJCM5TNmvSZkrCCmnDxMVmB3/IhW83qPpRei7fshc/j8
 U0ZczX7bTOPsZ+LIkP2Zqd3qOqpiG7blLvTF5KfaKIGnBL7Q3UxTEzlGy2u13Uj4BpH54jOq+E2
 fnVtWxaGQfWgkU8VL5kEX1AgA/8NlKkxIAk+nDcXhMKF7sw==
X-Received: by 2002:a05:620a:17a3:b0:8ef:3de6:c5a6 with SMTP id
 af79cd13be357-9208d3f9286mr2528935685a.47.1782156757597; 
 Mon, 22 Jun 2026 12:32:37 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:8ef:3de6:c5a6 with SMTP id
 af79cd13be357-9208d3f9286mr2528928285a.47.1782156757049; 
 Mon, 22 Jun 2026 12:32:37 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:36 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 16/24] target/riscv: gate riscv_cpu_update_mip with
 tcg_enabled()
Date: Mon, 22 Jun 2026 16:31:32 -0300
Message-ID: <20260622193141.1449724-17-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sDOYCjPM_V8qvAXITpCn9PqxQ1n1k5jt
X-Proofpoint-GUID: sDOYCjPM_V8qvAXITpCn9PqxQ1n1k5jt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX9bftxCCFcIVp
 Cr+BMM+VwRAi6EI0RYTbYyt+vam+fzFt7vs+B4T6iqPisqQ/wsRw5B9QXH0+BSMiSLSc1Dr/uD+
 YVEitlUqiCne5VWuMbb9rynIT3QakI4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXzgdWJg+Grr5t
 /BeUgQTBM4jAbAB6c6L5MjpfVkguPvLX/q61SlZMRNKY68BNBpRk22I+vNuOfRikI/yVVZXRba0
 B6W+2UgVimm/GhZTlD/GoGCAn7D7Oqn2mRz5VaeFruoxCpgVQWTUBPTB5ktOwkIm+TxAzOrMLtF
 PQiMHC6DaE+idYga55paARI4OYD0fPbl0tr9vUFEyVWxY7hpnNlaM5VMhof7mnA0XJlGC2AFTDt
 hkEe1LOWRaHdF6ZBmWO34AcmkaiHXI9z9EIe28WP69fWI2Nwg4U0PcINNd40RXFZ2E2KgtQK/Tj
 UtP2SQ887p4VaAnXQz7Jjnh7QkT3rgv0d0tMwrF6pAvtb0v6jSm3L1665oZYipKvRMAv5wlp0df
 pdBg+C/NB48CvH9dAbsfUQlw4xnHvhlnUO8duJkrJj5+YdQN3ctCWfm4vVZGOMNYPwSXL1wfUIK
 qYtVrK60EOUR1EE5fNA==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a398dd6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=pBdMQyqLZ6fKue3OrpUA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
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

riscv_cpu_update_mip() is a TCG only call.  Its KVM equivalent is
kvm_riscv_set_irq().  cpu.c gates the KVM only function with a
kvm_enabled() check, making it unavailable for TCG only builds.  We need
to do the same for riscv_cpu_update_mip() otherwise a KVM only build
will fail because it doesn't know what this function is.

Use tcg_enabled() for the couple of riscv_cpu_update_mip() calls we have
unguarded in cpu.c.

We have way more calls to deal with in time_helper.c which isn't using
kvm_riscv_set_irq() at all. For this file create a riscv_set_irq() local
helper that will choose whether to use the KVM or TCG API.

The reason we're going through all this hassle in time_helper.c is
because hw/int/riscv_aclint.c uses it, and if we don't do something
about we won't have riscv_aclint working for KVM.  Whether this is a
real problem or not and we should remove aclint support for KVM is
question for another day.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c         | 19 ++++++++++++++-----
 target/riscv/time_helper.c | 33 +++++++++++++++++++++++++--------
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9c1b55c3c1..8aac18ea5d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1336,14 +1336,18 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
         case IRQ_M_EXT:
             if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
-            } else {
+            }
+
+            if (tcg_enabled()) {
                 riscv_cpu_update_mip(env, 1 << irq, BOOL_TO_MASK(level));
             }
              break;
         case IRQ_S_EXT:
             if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
-            } else {
+            }
+
+            if (tcg_enabled()) {
                 env->external_seip = level;
                 riscv_cpu_update_mip(env, 1 << irq,
                                      BOOL_TO_MASK(level | env->software_seip));
@@ -1370,9 +1374,14 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
             env->hgeip |= 1ULL << irq;
         }
 
-        /* Update mip.SGEIP bit */
-        riscv_cpu_update_mip(env, MIP_SGEIP,
-                             BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
+        if (kvm_enabled()) {
+            kvm_riscv_set_irq(cpu, irq, level);
+        }
+        if (tcg_enabled()) {
+            /* Update mip.SGEIP bit */
+            riscv_cpu_update_mip(env, MIP_SGEIP,
+                                 BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
+        }
     } else {
         g_assert_not_reached();
     }
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 400e917354..2679dbba6c 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -21,19 +21,34 @@
 #include "cpu_bits.h"
 #include "time_helper.h"
 #include "hw/intc/riscv_aclint.h"
+#include "kvm/kvm_riscv.h"
+#include "system/kvm.h"
+#include "system/tcg.h"
+
+static void riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    if (kvm_enabled()) {
+        kvm_riscv_set_irq(cpu, irq, level);
+    }
+
+    if (tcg_enabled()) {
+        riscv_cpu_update_mip(&cpu->env, irq, level);
+    }
+}
+
 
 static void riscv_vstimer_cb(void *opaque)
 {
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
     env->vstime_irq = 1;
-    riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
+    riscv_set_irq(cpu, 0, BOOL_TO_MASK(1));
 }
 
 static void riscv_stimer_cb(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    riscv_cpu_update_mip(&cpu->env, MIP_STIP, BOOL_TO_MASK(1));
+    riscv_set_irq(cpu, MIP_STIP, BOOL_TO_MASK(1));
 }
 
 /*
@@ -48,6 +63,7 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
     RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
     uint32_t timebase_freq;
     uint64_t rtc_r;
+    RISCVCPU *cpu;
 
     if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn ||
         !env->rdtime_fn_arg || !get_field(env->menvcfg, MENVCFG_STCE)) {
@@ -63,6 +79,7 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
 
     timebase_freq = mtimer->timebase_freq;
     rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
+    cpu = env_archcpu(env);
 
     if (timecmp <= rtc_r) {
         /*
@@ -71,9 +88,9 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
          */
         if (timer_irq == MIP_VSTIP) {
             env->vstime_irq = 1;
-            riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
+            riscv_set_irq(cpu, 0, BOOL_TO_MASK(1));
         } else {
-            riscv_cpu_update_mip(env, MIP_STIP, BOOL_TO_MASK(1));
+            riscv_set_irq(cpu, MIP_STIP, BOOL_TO_MASK(1));
         }
         return;
     }
@@ -81,9 +98,9 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
     /* Clear the [VS|S]TIP bit in mip */
     if (timer_irq == MIP_VSTIP) {
         env->vstime_irq = 0;
-        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
+        riscv_set_irq(cpu, 0, BOOL_TO_MASK(0));
     } else {
-        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
+        riscv_set_irq(cpu, timer_irq, BOOL_TO_MASK(0));
     }
 
     /*
@@ -151,7 +168,7 @@ static void riscv_timer_disable_timecmp(CPURISCVState *env, QEMUTimer *timer,
 {
     /* Disable S-mode Timer IRQ and HW-based STIP */
     if ((timer_irq == MIP_STIP) && !get_field(env->menvcfg, MENVCFG_STCE)) {
-        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
+        riscv_set_irq(env_archcpu(env), timer_irq, BOOL_TO_MASK(0));
         timer_del(timer);
         return;
     }
@@ -161,7 +178,7 @@ static void riscv_timer_disable_timecmp(CPURISCVState *env, QEMUTimer *timer,
         (!get_field(env->menvcfg, MENVCFG_STCE) ||
          !get_field(env->henvcfg, HENVCFG_STCE))) {
         env->vstime_irq = 0;
-        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
+        riscv_set_irq(env_archcpu(env), 0, BOOL_TO_MASK(0));
         timer_del(timer);
         return;
     }
-- 
2.43.0


