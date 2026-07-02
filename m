Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB802C44500
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHqM-00031G-Je; Thu, 02 Jul 2026 09:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq8-0002r7-Ri
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq7-0008Du-2l
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:28 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0bb7522235
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nx/6w7J4y521AmPNG5qOYu0dUyp/4YSmzZyGwwbYfoo=; b=PV6qxEy4/iv9sIZS
 wgMdkficI/R5l4lPtf4kIksGha6mgs9LN8lIsay2/1NqJsz/VdHwyiQlHo2kDd97
 gAE8gp36wggSn1U8cOQ1NMxRfIFZBjn0vYHhJVFnMYxWguJIqBtZfRwQayu509Dk
 WlZOPvfGGo+ElzlfuueVvOd15WvYVZKA2ucU3+rpUCYm/E6Wratb6UHpcYgmRVOB
 up+aO7t+vrmPognbDWpM6SR7p0h8rNQdQTOhQRb6GbuSgzv3L+Ic6EKy//k4UTEX
 JSNo3lAidLo7BOLYMsuQp5DUZFXWZPNPSQpIgUgLZVwZi45yoZMHw0T5cGhv1N6T
 hBAykQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc1gj4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7389d239cccso638704137.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000335; x=1783605135; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nx/6w7J4y521AmPNG5qOYu0dUyp/4YSmzZyGwwbYfoo=;
 b=XXltyIha/R1uTHD6Y0qhi0zdZ3Gj+HF34zNFbUNhO8aqjlym2LGkwoKy730pqd+kSs
 7uganJW+GEbtaCcPNfvUG4NDaZLwuusfSGDE3IFOw9sNDiDvUp4XqSc5NApkI5I3hLeh
 f0ZMnnaF2XFHgnXJzPB/aKe2drr2/kZfkEhAMwq7/Arz7HPKEQx1vgdk5cOpxKmY3Bp2
 SAQWY+TyWKg3Kj3G53WeqWUwW6IGcNZGf0Lh1yyBsf+bccD9QnBwEjNySODtkgMqe5+Z
 /IDorEszc1rFpG8uSXpqp7mHHp2nu2Ow5oOSHbcAOOwIVhYxb3lnIFMKUtM/zHRJv2BB
 NdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000335; x=1783605135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nx/6w7J4y521AmPNG5qOYu0dUyp/4YSmzZyGwwbYfoo=;
 b=hmBwb5p0lzId1O30zFFh/4vbVfOI8ZIoWAIFuER6gsiW7HrqP0rrDsAj66OS41A5pJ
 utxJ6u1YDo3ixwR89ERYbYFL6yJYm6yGV6886o5NMiISuab+Ex2HCN7ohtkeATOpzm/Z
 uxPmPEeL+cpAete8pLJl54QfjmFg6iWQAMuOLY84iRRvdUnBy+OlL1kGVVVs5w0eYcGt
 9TPz2uVz//djrlyxLXKu76IqqA8SpPjcLoNP0aRamJnqhXPtshh2FeeM67Ys0Uvx7WHs
 GgMQw+4pH18yRGEKS1n8lQ672J945N64Bigy0xkcNiv2We/xDzU8+b9sbKXTbPMrn2kl
 xnzg==
X-Gm-Message-State: AOJu0YwgZxu6hCGeH8oqxf62tMQjFKDL7NpRAaUcJYyFSyGWutQyAwgY
 lU6EaBoix2ABP3tIPcrWgB01w0cb3Q/LX8UovNUlwlbm4S00rg3GctDb7U/GkzypFBWwKkxcO2E
 +JiE6LYRxXbIfEudn1jFdnFgiwPWpwYEJpGoI5LeerrPbue1EMPyZ/ryaow==
X-Gm-Gg: AfdE7clTTrQCae9KrFj0Oen6oq98luhfnA1mFlk1rC08vL3ek5VKs0H5p8rkvmOjchY
 gwORc3vp0wsq8oCIqCY8xYoW+U+h5eXSf8GnaYMAnfLhPIbcslRVQocy7ULolsPce4mJ1ArfFYJ
 tDOw/uN6YZ9rF3MQUN/W85GekDawKMj8XGlhFALS1zMly5ulfdVZUnYlqXywHBRX2yBy850nqLB
 YK/drNkMoHdzwyHC4Fb1Mmmt1OxQTm6ODJl+c5KS91JR0XXFs6Zai+LUmj1aQKcizzeqmh5+wJw
 QUbDuybU+tshIDhijvzOW7jyhpcoyEvqVakrJJU+wGNEksqK1vpGeQ0UmDy3wB1qX5TpqSLKrpn
 FtCJtLLjIKnWtzpceqeV9q56CoAQAE9ukPXmswzXKOLdrxg==
X-Received: by 2002:a05:6102:30c7:20b0:73e:c6a0:328 with SMTP id
 ada2fe7eead31-73ec6a01642mr416146137.19.1783000335278; 
 Thu, 02 Jul 2026 06:52:15 -0700 (PDT)
X-Received: by 2002:a05:6102:30c7:20b0:73e:c6a0:328 with SMTP id
 ada2fe7eead31-73ec6a01642mr416138137.19.1783000334712; 
 Thu, 02 Jul 2026 06:52:14 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:14 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 16/24] target/riscv: gate riscv_cpu_update_mip with
 tcg_enabled()
Date: Thu,  2 Jul 2026 10:51:18 -0300
Message-ID: <20260702135128.1188021-17-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1BgSYOEj7jVMGLvvWPfTHB43Ie4HIs14
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a466d0f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pBdMQyqLZ6fKue3OrpUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXxV28jN40Uhqf
 l9y180/a1AX0LVlHDtJntMBrHnzyNKSUrpyVrux4J1diQIj5Sh4y2Nd7YoJ0WW/y4UfmAVgjMSr
 V8VGZrxVP5Fh6Lzt/otdAOr99njgV9ZLLNAcKuwmnt3o93EEiQbHDu+EtqmMQGXV6gV5UFU8unE
 Dc4zm9VPbeo/LvbYHfisBbR3I8c54HBYT78JvTRIgLj8o5uuSr5P/7Kd0Ime9B17Y7l7M+G9K5d
 ZcMQ/mia2D/l3Soy6IgMQncAQV3P9Qx+5GrWgzeeY7JyWAUFN3n2hCYqjqH0ZauukcgH/3fzI7M
 jQymlVGO0FAUkKw8NTX7Bcz+Gw91NuvZmMwHkdieow41zMplIhUQ2q/CG3544gSxQV35PvUjoP5
 2lDEBCLVujlNjR3eDIsgq9d2dC1e8vU8JkDdR8LLKv7jk0aFe57clLlD4gEeKMQVzGbZjP/Ctq+
 e+hESHHjlYKKFCEq0xQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX8L7OWV9Q3uc+
 TE2p1fYIkkqDThhiTxQImVhpHt/o0HkTxdBY+CZmco1cWU0g29uCkvC/wXkzxPcmnITgUuLPXcP
 moXE6BwXzulgsrKGSe+7EXDoLg3o4ds=
X-Proofpoint-GUID: 1BgSYOEj7jVMGLvvWPfTHB43Ie4HIs14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
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

riscv_cpu_update_mip() is a TCG only call.  Its KVM equivalent is
kvm_riscv_set_irq().  cpu.c gates the KVM only function with a
kvm_enabled() check, making it unavailable for TCG only builds.  We need
to do the same for riscv_cpu_update_mip() otherwise a KVM only build
will fail because it doesn't know what this function is.

Use tcg_enabled() for the couple of riscv_cpu_update_mip() calls we have
unguarded in cpu.c.

We have way more calls to deal with in time_helper.c which isn't using
kvm_riscv_set_irq() at all, so create a riscv_accel_set_irq() local
helper that will choose whether to use the KVM or TCG API.

The reason we're going through all this hassle in time_helper.c is
because hw/int/riscv_aclint.c uses it, and if we don't do something
about we won't have riscv_aclint working for KVM.  Whether this is a
real problem or not and we should remove aclint support for KVM is
question for another day.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 19 ++++++++++++++-----
 target/riscv/time_helper.c | 33 +++++++++++++++++++++++++--------
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db18c52656..6b79dcc5ee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1343,14 +1343,18 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
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
@@ -1377,9 +1381,14 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
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
index 400e917354..ede1a4c2a3 100644
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
+static void riscv_accel_set_irq(RISCVCPU *cpu, int irq, int level)
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
+    riscv_accel_set_irq(cpu, 0, BOOL_TO_MASK(1));
 }
 
 static void riscv_stimer_cb(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    riscv_cpu_update_mip(&cpu->env, MIP_STIP, BOOL_TO_MASK(1));
+    riscv_accel_set_irq(cpu, MIP_STIP, BOOL_TO_MASK(1));
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
+            riscv_accel_set_irq(cpu, 0, BOOL_TO_MASK(1));
         } else {
-            riscv_cpu_update_mip(env, MIP_STIP, BOOL_TO_MASK(1));
+            riscv_accel_set_irq(cpu, MIP_STIP, BOOL_TO_MASK(1));
         }
         return;
     }
@@ -81,9 +98,9 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
     /* Clear the [VS|S]TIP bit in mip */
     if (timer_irq == MIP_VSTIP) {
         env->vstime_irq = 0;
-        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
+        riscv_accel_set_irq(cpu, 0, BOOL_TO_MASK(0));
     } else {
-        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
+        riscv_accel_set_irq(cpu, timer_irq, BOOL_TO_MASK(0));
     }
 
     /*
@@ -151,7 +168,7 @@ static void riscv_timer_disable_timecmp(CPURISCVState *env, QEMUTimer *timer,
 {
     /* Disable S-mode Timer IRQ and HW-based STIP */
     if ((timer_irq == MIP_STIP) && !get_field(env->menvcfg, MENVCFG_STCE)) {
-        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
+        riscv_accel_set_irq(env_archcpu(env), timer_irq, BOOL_TO_MASK(0));
         timer_del(timer);
         return;
     }
@@ -161,7 +178,7 @@ static void riscv_timer_disable_timecmp(CPURISCVState *env, QEMUTimer *timer,
         (!get_field(env->menvcfg, MENVCFG_STCE) ||
          !get_field(env->henvcfg, HENVCFG_STCE))) {
         env->vstime_irq = 0;
-        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
+        riscv_accel_set_irq(env_archcpu(env), 0, BOOL_TO_MASK(0));
         timer_del(timer);
         return;
     }
-- 
2.43.0


