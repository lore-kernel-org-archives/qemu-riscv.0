Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E29CD98E2
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 13:18:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZq96-0006Hv-6e; Wed, 17 Jun 2026 09:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZq93-0006Gt-CP
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 09:17:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZq8z-0002zp-J5
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 09:17:28 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8UYL32217728
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 13:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I1vkX42dLPWzlx1/akBQJD0lpDlJlCiCwqb90advl6Y=; b=eLNGZ++XAAwfCKZ3
 8akkI0hqFPpTDwXtnsdD8ofkXNnNtMCW7BS2orU1tRll3xqbBuJZl4S4Bnea5xy1
 DlUlH/2Ijp6sf2gNNi0qvbcwfjQiSMH/+rKUXuMY0n7+wh7FhPxVgY79dK3UsN2R
 aX5Deu7OqIdClULALfyqX81/2z/VYe9uAHLOMtZJ/Za/xB5Yl5J56d6QgoyhPwos
 1C9Ne8OMYpQ/XrDn7vFt1aGBsOX3XYBUcZS8Y0i29wF5MDu7TIfP11IS390Zl5OZ
 9aVXkdLebVBb1QuM0beFm2/tX4xPPVuStCxLk9mXWm1aTqJhXuAA+puaPP/V706f
 khwRNA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerbb5j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 13:17:24 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-7ddd34a6336so97150247b3.2
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781702244; x=1782307044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1vkX42dLPWzlx1/akBQJD0lpDlJlCiCwqb90advl6Y=;
 b=bDjUpe1048cV3lloVA2lQbnkIWLgsBH9LgT2SBwPIl3N3OnDHEEL9ZzcHN7qnT8jH1
 UKotBhIwXB3gIjWclkkSJMxB0akYamh9Pj3EWRGr34MXDpiOgVHS/eO/dmh5sCet4iOJ
 XKZPnXtC2cVTkK4bM5eJF8xzfkl+Azj3VDILgqQCbFZ2KaKyQtwu/SH/OkbFMdPiaCR+
 PAzprDZQ8smFC6Lw1HmSWg5XQDOQl4o1/GtNNFDj0p46yOv/mrg/A+1jwpJrUdnQ/jq3
 kg6hFPnYzzo1gfCpS1tIoeCiQpostqM7tBVt7u//FFJEYvxpiY4fkM7+nkcg46Q3GffY
 7phA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781702244; x=1782307044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I1vkX42dLPWzlx1/akBQJD0lpDlJlCiCwqb90advl6Y=;
 b=qpA6jckUSRnL0YQbRRoGzJxLhEVTELsQBUy95GaKjyyJrtVr49rMkyq9ffYrakoqbN
 lyEs8HKmRD+W41gsK7R7dohhFVgmgoYnl/Wp6yTlDAMDgBhSavY+Cign10Ih522pcB7G
 5yoKa5nWdFz6KJVwJzaTRd93A+2mTU6qLkDkCbHfXfo3SSdE5zw2aeruPku7hPMmTPqe
 V9ZVXXRGgDmDwLiZU63PhlQfJE7E1oxCwy9mriF+MOWQjOoholMS7plUJwuDtp6eA39L
 16XuWE3mFelE7qBVJu7OtloRIZf+i47dUCHYRmu1ZfbVZPBsqgALscJ0C/U49LtoJhDb
 0pOg==
X-Gm-Message-State: AOJu0Yy1yYZGCCQ6by8AIofv8ddN3KnpgyHYCOTQVFPtPUYw29TCQMjw
 /3tJnOzW4mbAmg7D8cjq75nz2XIMuHLYrotia8dun2ERmGv3LVcEPd3jUMSqIS6F4CCaAUAPrrM
 gEU6GbA29yW/1GweuGEiyQkRrbba+Utu9EzkfGvWnLXvb0raJyD6pM1VUVQ==
X-Gm-Gg: AfdE7ckGo5KfBFi5g+VC5VLgBtcpSIGjGXqi6rtJwO9G25o39q0+3RS0Akf/DIapg+x
 9CD1dxcUDVI8/4iZInAxbYiRq0DMTXPttLA8alBsItD4f4CQOzt0frMADLWlDUarhpWWGHQ9mOv
 xVf4bWBlZfZuqleyJjd/xYKqoF0TKPW5yGiyrnchdqaMLTIxvaGHa05oMuakFOiSZguJcj4xH8g
 YM9M0MdPabLOKXpWgJs9POdwnqjVwW5fXY0gxDyk1xvRx/6jP5kK1Ohbo2/9SA8tU6AwrLf+qjW
 eWrNNSee35oK6SHS4ZnoOp2J2voNWH4qa/53ql8O+p2pusNqVNJm4O7bnVFQsryq0QNBn+xJDvY
 tEUpwzI69WxW3eZNFBMlZKjH/uyuThcNrbQYR9Q1GnrLIVN24
X-Received: by 2002:a05:690c:4d01:b0:7d1:c256:b5a8 with SMTP id
 00721157ae682-7fe5e39c0c8mr34761067b3.40.1781702243794; 
 Wed, 17 Jun 2026 06:17:23 -0700 (PDT)
X-Received: by 2002:a05:690c:4d01:b0:7d1:c256:b5a8 with SMTP id
 00721157ae682-7fe5e39c0c8mr34760357b3.40.1781702243163; 
 Wed, 17 Jun 2026 06:17:23 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7fcd345a5fesm44861707b3.36.2026.06.17.06.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 06:17:22 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 3/3] target/riscv: add 'num-triggers' debug property
Date: Wed, 17 Jun 2026 10:17:10 -0300
Message-ID: <20260617131710.1855353-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617131710.1855353-1-daniel.barboza@oss.qualcomm.com>
References: <20260617131710.1855353-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyNiBTYWx0ZWRfXzOAPhFX/9OoG
 RlJrCsBNWwV4HiD5UihNUugpRHPgOCnZ4HQSYWAR0hHhIctp4TjDR3/6nwDmm75FEijcd1VkJZM
 d1ER9mTKyGePSCB0x8dJarAjmklPM0c=
X-Proofpoint-GUID: __UQdco9WiaZhS9RoSHJ9aw0eaT4B3jl
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a329e64 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=KJWeSTv_TiI39BqBT3cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyNiBTYWx0ZWRfX14gP4eVnSouz
 NT1oMn64v0RZcyXDECJoHeD5EYcjFfcJIQdbtQqdaCpCcDXRZQw78fZtiV/OuAMvOTzgVAGyu8x
 7wCBkExMgI5lKfNrc8qQ5+LdYJSQIz+MGWnTS9afQDjdN262I0XPKEVIU+paep4bdzd2YaQyC7S
 GTmzL2RDGfO149BKtzHXHd/IG7oMyJ2Nn6zCmP2UfRftRhaejZ7DMbVjT94Y/I5sVKdpL0U4YCw
 qTIG/RJBvDkwV6hrjOk4NAmY3iuWz6scZe3JUcga2mQTjvL55H02ksLwqKk00yc9blZfWXxWHLM
 gdio+VIyFcY/kyHaCwaqAYNZtu04H5egAzeYSfgBBONkZb2WIErKvQT9X8GxvC02gr6VyGQcZR6
 Evg5pMC6kqewTgzDLW/o6fRUol2vZR0k3sXwz0HghDlUajYK+BqcbsZMQzWZgFsfJYjLx38oC6f
 cVICCytJvt4L1o+TaGw==
X-Proofpoint-ORIG-GUID: __UQdco9WiaZhS9RoSHJ9aw0eaT4B3jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170126
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

All CPUs have the same amount of triggers: 2 triggers per hart, set via
RV_MAX_TRIGGERS.  This is not enough anymore: we'll have at least one
future CPU that will demand more triggers per hart when implementing the
RISC-V Server Ref Platform, requiring at least 11 triggers per hart.

Parametrize the trigger amount using a new 'num_triggers' property.  The
default amount is kept at 2 for backwards compatibility.  The new
maximum is bumped to a generous 1024 triggers per hart, which hopefully
will be enough for the foreseeable future.

The property can be set in two ways:

- a '.num_triggers' CPU definition flag, allowing CPUs to set a custom
  amount inside the CPU def in DEFINE_RISCV_CPU();
- a new 'num-triggers' user property.  The user property has a higher
  priority than an existing '.num_triggers' CPU def setting.

Assuming a hypothetical case where a CPU 'X' is defined with
'.num_triggers = 8':

- -cpu X,num-triggers=30 => num_triggers set to 30
- -cpu X (...)           => num_triggers set to 8

For a CPU that doesn't set '.num_triggers':

- -cpu rv64,num-triggers=30 => num_triggers set to 30
- -cpu rv64 (...)           => num_triggers set to 2

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c   | 11 +++++++++++
 target/riscv/cpu.h   | 19 ++++++++++++++++++-
 target/riscv/debug.c | 16 ++++++++--------
 3 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e7318fe9f9..e16608bbbe 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1164,6 +1164,11 @@ static void riscv_cpu_init(Object *obj)
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
     qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
                             "riscv.cpu.rnmi", RNMI_MAX);
+
+    if (mcc->def->num_triggers) {
+        env->num_triggers = mcc->def->num_triggers;
+    }
+
 #endif /* CONFIG_USER_ONLY */
 
     cpu->user_options = g_hash_table_new(g_str_hash, g_str_equal);
@@ -2616,6 +2621,8 @@ static const Property riscv_cpu_properties[] = {
                        DEFAULT_RNMI_IRQVEC),
     DEFINE_PROP_UINT64("rnmi-exception-vector", RISCVCPU, env.rnmi_excpvec,
                        DEFAULT_RNMI_EXCPVEC),
+    DEFINE_PROP_UINT32("num-triggers", RISCVCPU, env.num_triggers,
+                       RV_DEFAULT_NUM_TRIGGERS),
 #endif
 
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
@@ -2761,6 +2768,10 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
                 !valid_vm_1_10_32[mcc->def->cfg.max_satp_mode]) {
                 mcc->def->cfg.max_satp_mode = VM_1_10_SV32;
             }
+
+            if (def->num_triggers) {
+                mcc->def->num_triggers = def->num_triggers;
+            }
 #endif
         }
         if (def->priv_spec != RISCV_PROFILE_ATTR_UNUSED) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index af246a56ed..bdd28d329b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -189,7 +189,22 @@ extern RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[];
 #define RV_VLEN_MAX 1024
 #define RV_MAX_MHPMEVENTS 32
 #define RV_MAX_MHPMCOUNTERS 32
-#define RV_MAX_TRIGGERS 2
+
+/*
+ * The Debug 1.0 spec allows a humongous amount of triggers.  Section
+ * "Enumeration" says: "The above algorithm reads back tselect so that
+ * implementations which have 2^n triggers only need to implement n
+ * bits of tselect.".  tselect can have up to XLEN bits, so the max
+ * theoretical RV_MAX_TRIGGERS value is 2^XLEN.
+ *
+ * Allowing 2^XLEN triggers per hart is silly so we'll set a max to a
+ * modest 1024 triggers, which is way more than what we see current
+ * hardware use (most chips uses 2-4 triggers per hart, RISC-V Server
+ * Ref requires at least 11).  With a 1024 max per hart we'll be set
+ * for a long time ... hopefully.
+ */
+#define RV_MAX_TRIGGERS 1024
+#define RV_DEFAULT_NUM_TRIGGERS 2
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
@@ -577,6 +592,8 @@ typedef struct RISCVCPUDef {
     RISCVCPUConfig cfg;
     bool bare;
     const RISCVCSR *custom_csrs;
+    /* This is just a setter for env->num_triggers.  */
+    uint32_t num_triggers;
 } RISCVCPUDef;
 
 /**
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 9a4910c431..ba5bc6ae13 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "target/riscv/debug.h"
 #include "trace.h"
@@ -1049,14 +1050,13 @@ void riscv_trigger_realize(CPURISCVState *env)
 {
     int i;
 
-    /*
-     * Alloc env->tdata1/2/3, cpu_breakpoint, cpu_watchpoint and
-     * itrigger_timer dynamically.  This is overkill now
-     * given that they could be static arrays with RV_MAX_TRIGGERS
-     * but we'll parametrize the trigger number later, i.e. the
-     * array length won't be static.
-     */
-    env->num_triggers = RV_MAX_TRIGGERS;
+    if (env->num_triggers > RV_MAX_TRIGGERS) {
+        error_report(
+                "Invalid configuration: 'num-triggers' must be less than %u",
+                RV_MAX_TRIGGERS);
+        exit(1);
+    }
+
     env->tdata1 = g_new0(uint64_t, env->num_triggers);
     env->tdata2 = g_new0(uint64_t, env->num_triggers);
     env->tdata3 = g_new0(uint64_t, env->num_triggers);
-- 
2.43.0


