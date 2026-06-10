Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D378CD98C7
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 20:56:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXPxq-0004oz-8t; Wed, 10 Jun 2026 16:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXPxl-0004o0-P4
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 16:55:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXPxj-0005UN-AB
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 16:55:49 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65AJYXrN2600942
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 20:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=8pbLeg/5VJ7
 6MMw8N01K5CxqXwEoRhaLEcjx+9ySdas=; b=PNG5dkCqfxEUxxo8OkZa1sr61Im
 /BSjnznqCnrL1ycntCBovnU5Bh8TtnBVUpkNHfybConQMHNUxWk6/okAHuamja1+
 E2qslZuFkFoMbvqHlreSfXfjmWrT/sq48WDiwZWX5cMSYiVtHf/YIbwg+xSjsUcO
 Bf4e+OBayB/ovc3KXwX4L92p2VJa7elYD7/3/CcSZyplAeZURSh/ElivcQ9zTAdr
 eIobwp/sx0qbxlb+hcagy1yqpz/qbu/mfuweSV8qLH07NQ6OFD/RbaYOtmvePX3A
 h1zybBl4zOTcQOWWdif0CSK3wpH2pxX7uz1NNt3++XqwKUgQHWpB7LPWgpQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7009k0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 20:55:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-96395e5f46cso6771986241.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 13:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781124945; x=1781729745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pbLeg/5VJ76MMw8N01K5CxqXwEoRhaLEcjx+9ySdas=;
 b=Jv4DFF9QwpEpI0zH5X2nyY+IIHZLUfl6i1zM+uILAIkLoUxhCDNSn1Txbj8P/aexdf
 7mrM2t8Aqxmz6wiiBe+rMbZgtugngM9TcqMUbWUmqK/T7AzPaWa8VqQlOyIDbqlkQCc7
 YMjbeMSKGKsQQPk1LPKSmCfL6EUPLQMRs12qADhfbBe7BmQSaex8PjTGJsecFN35uH6n
 vLSmUn99zaYBMDEGKkUVBMaNgZZJl8lPAe+g9PQBChRiL3WsgGrhQezgrPn0q3JW1Un4
 QM5PC8Nps0GJ2TeQka/ITGRqp+DQAVsNA7OQcX7rz8+HYz12DNfIncohcyasGwN72GHw
 aIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781124945; x=1781729745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8pbLeg/5VJ76MMw8N01K5CxqXwEoRhaLEcjx+9ySdas=;
 b=j4suC1j1FWmahfybhrcHT6+h0CboNbrLck5qAPpGUcbpWciE+E2Y9w01fHPxz+o0RE
 qh0xsKGf21tEzEZZYWgk26+KEjEoODJuH6dkxs76wdVQ8a6Yxc4vrPukiz/nOnhfIJ+k
 D/v6SVUx3njl0441VVS34w1gnZbrxbWKOxdxyx6sUYFJIUpejZTySZk4dH2uhnF5vooW
 6S3s11jHeQM/ubRYEbD4CB9UawnGIdmRurz672SwO5nYIHZKp+uUcTTwWJAa+xOEzyjV
 qklpOe4mEXuNC3aLFqL5C8hhlSiMUW7IxFvrYjpjncNmFW9CSZBEYTIdITeBVczLOnvr
 32cA==
X-Gm-Message-State: AOJu0Yz86HnXE/2LzGGNPBCiLejICcSFWILaxKDodZSvFgxjggej8X4y
 sZs8M8J7J0st2zaKOa8FQFOZjloiGyRehqWH57VoDUL/NwlHLQ0MFKXx31BNOkt6WpVVbEsLNlj
 +jfsr4SN2+QJaWqhSIu7U8CQDD+W4RTmUK14ZWw2vFdYCgGPSCG9zX9lgbA==
X-Gm-Gg: Acq92OEKIgqsnQ1iW2i/qt/zEZgl3ijCQbEUCwI8QW2luvY9WstzoZYgt75KHc4kR6X
 d0HwmmaGG/5wkkkIKeo9weqnu2TKTaBbMm/vFagzJMIPwJbywpvQHFSuqm1LlwWZPVhJu4HQ7ns
 unupVQXPpruySBuPNHu1qkQJv8t8mBPIt2/DQgFxqtmoN2HM1ALRHrHe/aq2GAhvy2M+7iiPB7t
 sBF+0ERnrZ8OGYoxNIi0K0wkIRN40mduyiXSGTJUueV/kiz1H/E820Ug96ZHyGrm1h9JbcpZMDz
 OD0eq55Ol6MuYySZLGxQnAFp/xkkCqsuAQWn2UHqXCm1t42eWz4H09a6YGy9sW/43ZpGJpu/oaE
 UQ9JiVyEDrJdELXWiLPi3Cm/U/zuxvz5z/fyEN63MfBWsyVys0A0IKWQlB4YjRGeeAeaqIg==
X-Received: by 2002:a05:6122:da4:b0:59e:f988:51e with SMTP id
 71dfb90a1353d-5ac4fa4a4aamr16673381e0c.5.1781124944787; 
 Wed, 10 Jun 2026 13:55:44 -0700 (PDT)
X-Received: by 2002:a05:6122:da4:b0:59e:f988:51e with SMTP id
 71dfb90a1353d-5ac4fa4a4aamr16672714e0c.5.1781124931421; 
 Wed, 10 Jun 2026 13:55:31 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-96413f91f2esm19548084241.4.2026.06.10.13.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:55:30 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 2/2] target/riscv: add 'num-triggers' debug property
Date: Wed, 10 Jun 2026 17:54:57 -0300
Message-ID: <20260610205457.1868701-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610205457.1868701-1-daniel.barboza@oss.qualcomm.com>
References: <20260610205457.1868701-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AqTgq3AswbYG8sKadADabD14GLiyZWoS
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a29cf51 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eePdtxGNxnJlWOecZfgA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwMCBTYWx0ZWRfXw2O7fWSiVZGZ
 kxYEtE5n4mEWBsIoi6Nl8hfUkfNBPtCQEFs0SKeq5IW3ngQ97tCuAAX+LU1bgOOl0rIwYMldADM
 xGr+9JbYWnNQdJto4bbkb6scHEaLYG4idpSz5I3XqKfDlLZHX+JLaDlglO+G7AUOTzDlZISZcht
 xuR+T+txHPJAu1ePBXTFS0Ld+VQZTuMHJ3yJaFPvW6fjvrz2xbEfOSyBiOMX+allc9znVszQtr+
 Tdnsac9vBXs5Cg/GRcgXUOGXTMh/kUgyrjFPoHlV3YAj6wTd9JTn7x1pPhj+/z0OgRTTK7jJOwb
 5hEMVNj2yRGO/gfY6ecBxLz9KXGkCACJqw/m1ropUP5s14yOrT3cjV5wvhaVk8HTN7jhAYFKR0f
 +bGzCZyWL1y2oa32beOLEw4+soVp9heDePEEs2RQrDa3+eqo5HOZcOYHaaaPkUrSI91jrAdUDCV
 lQ5pX/9naQRgpB9/5uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwMCBTYWx0ZWRfX9g4uH5+zslbR
 NI6CEKXZNePLiMcIXhAGLy/NgASVWNNnuPhZdYaak75H0Kn4oKktLrH9HoUqJq3bOeZzxmZcKbT
 gCdAe2UeqAQz7LUTXWVLl8HKlNMaSnI=
X-Proofpoint-ORIG-GUID: AqTgq3AswbYG8sKadADabD14GLiyZWoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606100200
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
---
 target/riscv/cpu.c     | 11 +++++++++++
 target/riscv/cpu.h     | 19 ++++++++++++++++++-
 target/riscv/debug.c   | 16 ++++++++--------
 target/riscv/machine.c |  4 ++--
 4 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c1b10cc7ef..eed7b0b76e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1154,6 +1154,11 @@ static void riscv_cpu_init(Object *obj)
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
     qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
                             "riscv.cpu.rnmi", RNMI_MAX);
+
+    if (mcc->def->num_triggers) {
+        env->num_triggers = mcc->def->num_triggers;
+    }
+
 #endif /* CONFIG_USER_ONLY */
 
     general_user_opts = g_hash_table_new(g_str_hash, g_str_equal);
@@ -2606,6 +2611,8 @@ static const Property riscv_cpu_properties[] = {
                        DEFAULT_RNMI_IRQVEC),
     DEFINE_PROP_UINT64("rnmi-exception-vector", RISCVCPU, env.rnmi_excpvec,
                        DEFAULT_RNMI_EXCPVEC),
+    DEFINE_PROP_UINT32("num-triggers", RISCVCPU, env.num_triggers,
+                       RV_DEFAULT_NUM_TRIGGERS),
 #endif
 
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
@@ -2749,6 +2756,10 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
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
index 8345b9a207..726a79f03a 100644
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
@@ -576,6 +591,8 @@ typedef struct RISCVCPUDef {
     RISCVCPUConfig cfg;
     bool bare;
     const RISCVCSR *custom_csrs;
+    /* This is just a setter for env->num_triggers.  */
+    uint32_t num_triggers;
 } RISCVCPUDef;
 
 /**
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 8b31efdbc6..9578e3e913 100644
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
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index b6b53a4840..ba96ceceef 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -240,8 +240,8 @@ static int debug_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_debug = {
     .name = "cpu/debug",
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .needed = debug_needed,
     .post_load = debug_post_load,
     .fields = (const VMStateField[]) {
-- 
2.43.0


