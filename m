Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C58CDB479
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:08:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9q-0007wz-3g; Tue, 23 Jun 2026 20:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9c-0007dh-2A
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9Y-0003JK-IY
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:42 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0KVf973583
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TCwdhiMRj9ZQNqm4F7nb8HIrgeLaw/oBfD3H8vDFPjs=; b=cSZDs6u0FEWIDfJj
 oPPY8ON8O+wpfeNzMkL9JiP7Ya5mX+LozOJJTJ2hK2FTUV7FPz4o87rrzQRBv2ZU
 TI2jaehElzD6bLZQ1zx/4GYRmVUt+sRJ93wTiarGc5yX6Jqbqs7WQT1V+Vjw5/9/
 LUomJzfEjxEUgTQqee9vxRt9D3ZDypXnBkzBGOLSMu7XGP6/yDEjvjkBykymPDb1
 IaxhLEHCDJWEYphQ+DpdodQ16dvYOuutWpSXe1eJcJw9CZubvGRrA7tcfXGKc+Gc
 rWAfsIkaCSaYk3mmwamHmCZhlKK3d8uukjJpOwSP4hhiGDtFoa3cfAyb8TJhXhbg
 WUf1AA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p0sku-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8e05aa49693so14263166d6.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259649; x=1782864449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCwdhiMRj9ZQNqm4F7nb8HIrgeLaw/oBfD3H8vDFPjs=;
 b=hScTkjTYbahNPrVJmD+slQ33ddcbZGRZmQ8MOS4bErnvy8jLjfrRGyFNBQLAIIuXQO
 s01JMIvBzCGWuDJnNJWDEKfTlJN9+HXLjJbLviX4BManm8c/qJTkbf8zs/hkaXP4MDSm
 mR891QKNJKQ6U0mPrPnafF65NBuEgIWFwu/wqniorPjGySmGVM+fbGnoSus2bdCS4+m4
 ZnnsfuSk+FqJfayIRy4PBNlXFK/RntB9OEX/MkN99PDejkhYCe3AVPK+rh3knm+CPtd4
 lzJQcFw6nmVPpah5vntsBnYU6zMH1M/yJQpx0u+Ix7cIfDjsDCENY9KTtj5tBFFJx2lU
 v8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259649; x=1782864449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TCwdhiMRj9ZQNqm4F7nb8HIrgeLaw/oBfD3H8vDFPjs=;
 b=UdW9MLNygAXCOx6s5xWdvZKTSvUMhGHslvWgP4tumM9q+XetsB3rekH6dgFbhhlsLv
 bLq1q27Motf/pj14EHQvYk0TNMUg2Ofepu6fStBaHP3S1eUIwtw13Xd0Y5GN1Dtd4yay
 HPSX20ppwgCuVqjn6X/l6uQFk4hTDSWAhTeDtQTsSfKx7bVkXfexUktpNUUYbYKVQ84l
 uvaoR8s2r9f7FBI0Yo2z7Qk5BFrUJO2edNXPFiJQPN2hmlZ6Kr9i0mdpQHkFhs24uro8
 ifRUaHhz5PB2aqYpcFZJZAOs3dS4JPWGNMDQXlrkH/45aHrRQ2FzipDAEJ+8XEyZw/FX
 SmeQ==
X-Gm-Message-State: AOJu0YwnmcsPTZZseUvlDmSLI2BPzoqUOOmQfHsKF3s1R0iTUpuMe0IT
 dRuBQyCgnItZoyxzxn9flutccdR/3CB0ceaAVCsc/KkhObyayZJd2ryFQGLGalsOG7krGWkut62
 Sg0Rw6rs2m7MkPWL2PnDdh7at+aWRc0Dj3bb7JXU1xo+RZAc/nY2daphCOw==
X-Gm-Gg: AfdE7clG5Cbq4m34Q1nZ33qBhzDUlGuw52PB3GJYLpJtnyFTmOvlznZuFiZkRVLrzB+
 /WDCnIbAErHb+TUBErbBmBfuNr4onfrElyufbwXID4KVptRbbDiCwXCKS/34JjUxrlEun94hYGx
 qTmLaXOIwmOYhHd8SAvyC5mgimol5Pxmc0QGx4wZUzm+Z8OGMTD3ha9bYZcpi6ZzBa7GBde9jTU
 kmHHOEbkgpo7aQLp3ZrYtn0Rm79LU1UCmku/H2JtI3Hla77QLMmekoWz0O5fdWzt58Vw7fm9ZfR
 d4+0u5nZkBEkzEehw24vNR4PfvajBqeXr1zf92VAeVWQirQ2qnWOTIg1N8ZB5AnqscmZgSj4Ffm
 CIypMSS4KhT+2+bqBz4xE6OoiBn/GWFDjFmnpKHV9po7Vnw==
X-Received: by 2002:a05:6214:3286:b0:8df:9ea9:72e6 with SMTP id
 6a1803df08f44-8e52d7d6229mr25857646d6.5.1782259648990; 
 Tue, 23 Jun 2026 17:07:28 -0700 (PDT)
X-Received: by 2002:a05:6214:3286:b0:8df:9ea9:72e6 with SMTP id
 6a1803df08f44-8e52d7d6229mr25856966d6.5.1782259648384; 
 Tue, 23 Jun 2026 17:07:28 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:27 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 16/24] target/riscv: gate riscv_cpu_update_mip with
 tcg_enabled()
Date: Tue, 23 Jun 2026 21:06:23 -0300
Message-ID: <20260624000632.2149359-17-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfXw2ipEqbhZMOI
 UP65mQIEvttlEIwZ9Qhq4j2Dbz4ElqFUC8zDSP1NzvQQ0L00a9AssBCQH1CxN6uQ+jJ3MJJCzIy
 7dRqNrcjGrjmNRI0lu5PSmltwX+46ZM=
X-Proofpoint-ORIG-GUID: N7cStGqTX39OoQDh20FElOKMJmSF5qfW
X-Proofpoint-GUID: N7cStGqTX39OoQDh20FElOKMJmSF5qfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX2VINq1d2BX5B
 FNI78ygxuxc4XUzOYX1nv2/KSmoImsja8yTQwj+8qtK9bXEszqIjBvqAv6BioE3qGs3RyHIO99O
 vucKMEajUkkKWby/FYjNI+6EwOyzQekp3GFFFNxhiJD6MvuuVaRpMajqPdEZz7GEE4f+DxF5uea
 qhvowlsNkfw/5oqeDOY4P6ZxhfALkis/lma24QbsueVu2rZUjMt49jmZTBzosKamnuel6/U/ppv
 nt4IQGtQi/r+parZaOSgSa0kURtUBKVxQM0xL7ahZNybA7Ss6jD9qmajjIzrufasZThDN6zIOdl
 bl1wDUTaHHbxkgI5McDTPXvn4lVYeZQ9tK5x2BukfAICzHPyBHQkJM4cgx7EyBjLPu1WxjGjzzs
 GCGIdQZvUlPTrgo1Fs5XvUJlrjiOXLCEKzwW3RxQkTWkEE3iYYojmWjqyOlj2QbFg0QFSnG2ZLw
 PvEnStq0LK48TjmfWkA==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3b1fc1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pBdMQyqLZ6fKue3OrpUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 target/riscv/cpu.c         | 19 ++++++++++++++-----
 target/riscv/time_helper.c | 33 +++++++++++++++++++++++++--------
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7bd5bc0fc1..8f9d2967ef 100644
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


