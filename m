Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7980CD8CA8
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 21:40:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wX4AL-0003Bi-KH; Tue, 09 Jun 2026 17:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wX4AJ-0003B8-Vc
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2026 17:39:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wX4AH-00041Z-E8
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2026 17:39:19 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4gVB3229298
 for <qemu-riscv@nongnu.org>; Tue, 9 Jun 2026 21:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=cSpQ0J1y875fSpB49vEgLqLaggo7Wr2Vp4l
 umBVORXQ=; b=UsmvtjGMeWjoYRJD7zGKMXeb1pV0X6hfEv4I9f2Sg/5OfkkSyWi
 icPOq+WxySsyqWFMuXH22oWd8fRTLS9gJH4eT+1XQAS9QAlihzHWdkaCKhWf6t5i
 RuDBYjAvc7fVuznEnLAirJsdeSRe3YMyYOtmFIqw43ycY7++HFv1Twy/IzimZRF1
 8N1mqVrsNSIRPnqPnHfPBWKfuDEgJm39G0yuL/ZcYv1mkiZMsPwZduWWiiOOEPbE
 j4dpXA8ORphYo1kbCgBDLuisJM3ojGKg50K3E2lIEyNVdlZDTSFSItfsd8aRiyUj
 eo1AaDgpEErWjWYk5mlGXDg6BRtgbXLk6kw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkeyn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2026 21:39:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304ed777a96so4185905eec.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2026 14:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041153; x=1781645953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cSpQ0J1y875fSpB49vEgLqLaggo7Wr2Vp4lumBVORXQ=;
 b=W8aQaTvbiQIJmu8Nv/pTGH0r72YN4k7eypoXP65ae0KTIWPkAwLWqgvqg9VtMBIZ/f
 bTYLivjmDY1OawNEzjzzpzjUshtmBrdkvSo391h9rXK/4/bbjQHnGIePIZhiOJbzzaiz
 j1tKRb3Wsnaum/ceLiQG68wDwNy51q8UsBSOakJEeHUenalgEaauCZlms9mFmHvIGdfO
 uYgF3Y7ev2ErJft8HzhlalGbX2wErjjZRT3luxiKfyRe1BtB91on31m4RWcOf4pwtiG9
 kDnEOS1zP8xlV7K9OFvzGbgLeeLGQMFg2aRD1uwgdbiv4zYe6byAsnDE2U9FLOJywp8p
 /mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041153; x=1781645953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSpQ0J1y875fSpB49vEgLqLaggo7Wr2Vp4lumBVORXQ=;
 b=f/M/H/6QdATKys7x0iLhjSZfHAuL2D3xCDgiXpKjPfiaucUN8NXA13Tn1tuOJ0H8sD
 ojfkrjpJVNJfQvlD00nhge83Trsi62EGaQmcxhv7yozTAg6NbZp5LIpSS/pwSGvkyFeL
 D4PSPw57vQSEK4SKRKTuKVVaLArUIpED6x8OA2AK0p0h/dco6GqjkCjo5N31EdaaAzIl
 F4nm9HnhPeBuRq+gvwKH71w07yUSlz1Z8PaNO3EycwNGYoi4u+zLxPamKAu55+O+MhI7
 l21gAxl0GNSJ13/GKLGeuYwPLRIBOGmQKj3tMNZAMJaUTAyoVBc1rpxgA7IWl+uOq9ne
 XZog==
X-Gm-Message-State: AOJu0YyXJfDf/ARYcDJUgwEfgZ+/BLmDcPCwxsDCfleWVPerYm+dkEtT
 eNQwzTL3RckX3p7kTbtSo9vaOJWwMErsu3NWWgI4W5/h5eRzkHexCMIqcX8tNNVH773oVT8frNQ
 9PsqoN3nun8H7ky84D2Vw5qJ7ShDNBlmPTovNkVkffP+z5YMfk26XMiPJzg==
X-Gm-Gg: Acq92OF0SVQqQ+JW6r0c9lU9p3Qp78FIJgyPO6tykBgw1VNia+kUHpM6AWPA4fopbm6
 TnKnfLv7jOJFDRT/HKo3loXoD1GeKY6EVqqtzNsQv1QlG0QflByg05vGNPSUCIFgoSy3saq0wLA
 TJpeExh90X0uQcvxhetLmjCq9Ko0z/pObZ8t6uUTYP/X2iqvocFkWMxtgxlok6D2OySDD3NKAib
 23+JSnOQwJrPCZTIGYlJwMngAzLep7F1AyCb1ibnsF+Z0xSqr/Wbr1Jgo9EdRzJB7ZxKqaXHfxE
 MAXzW5vBI9VcDAAT63ymZ61lNpW59SH55Tco8zLuw4N9vNJ3zqPf6cvGaIfA/5bE96ckCroyoYd
 d4qwWptfQ2TABx/RjojNUUCuwhJtzJJ7VMRQ+SL6+f0HaxgUp1YUHmr8UOdPrnQFVksQBfg==
X-Received: by 2002:a05:7301:db08:b0:2d2:d5a3:e97c with SMTP id
 5a478bee46e88-3077ffb5107mr7173643eec.12.1781041152361; 
 Tue, 09 Jun 2026 14:39:12 -0700 (PDT)
X-Received: by 2002:a05:7301:db08:b0:2d2:d5a3:e97c with SMTP id
 5a478bee46e88-3077ffb5107mr7173635eec.12.1781041151842; 
 Tue, 09 Jun 2026 14:39:11 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074df77a0asm24401504eec.27.2026.06.09.14.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:39:11 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv: add 'trigger-count' debug property
Date: Tue,  9 Jun 2026 18:39:05 -0300
Message-ID: <20260609213905.1126795-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwMyBTYWx0ZWRfXwythYajV62IW
 acXHnYe54hBGqnIYtNtJwQzskdBdxpwlGISzKOOI0r9JUws/tXzBXJhbGWLlKKf7ilHqvSzsDYe
 48OmOgLt9M7uIrclpDuIMvq4Wg9NlTCFv7EsHe4FQImxnuwU8ONf7djxqecevqWY0bQl70koEQ9
 BFYvQo58Rxyd2DaZ2zJtAb21j63+uVChjvVmwzG7V+Oq6s/zWA8W7nfPrSpfAIlKdnqaR8U6jC7
 bAdKfw0q4InPGC1aSduZNLhLKpJJjKsrFdpaHTIdgmYFDymAq3TD8xJ61nEhpaFKO1jDRRURwxo
 5hfGb2By9MMD2a+XntZbS2QfFzWNPd3YUfbWt2Ox3eusC+Wb6K0lZLKW/FlHhMdY0lpUJKWFzPL
 G9E7qTqDnqADtxOw9L2iAXNB0c4tI6Zr72PTLzey4scMOF9WWQlW5nKkNeAJ2NcpVs39eQ6ECDh
 86L9eHC3kBzguaCAS1Q==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288801 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ZX_15Imc85JVUawRZg0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 9XXfGTbA0gwDvWSwb6feD3puLMx1SW_H
X-Proofpoint-ORIG-GUID: 9XXfGTbA0gwDvWSwb6feD3puLMx1SW_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090203
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

All CPUs have the same amount of triggers: 2 triggers per hart, set via
RV_MAX_TRIGGERS.  This is not enough anymore: we'll have at least one
future CPU that will demand more triggers per hart when implementing the
RISC-V Server Ref Platform, requiring at least 11 triggers per hart.

Parametrize the trigger amount using a new 'trigger_count' env property.
The default amount is kept at 2.  Set the new maximum to an educated
guess of 128 triggers per hart (which is less than 2^XLEN theoretical
maximum by the spec).  All relevant callers (csr.c and debug.c) will now
use env->trigger_count instead of RV_MAX_TRIGGERS.

We're also adding two ways of setting the property:

- a '.trigger_count' CPU definition flag, allowing CPUs to set a custom
  amount inside the CPU def in DEFINE_RISCV_CPU();
- a new 'trigger-count' user property.  The user property has a higher
  priority than an existing '.trigger_count' CPU def setting.

Assuming a hypotetical case where a CPU 'X' is defined with
'.trigger_count = 8':

- -cpu X,trigger-count=30 => trigger_count set to 30
- -cpu X (...)            => trigger_count set to 8

For a CPU that doesn't set '.trigger_count':

- -cpu rv64,trigger-count=30 => trigger_count set to 30
- -cpu rv64 (...)            => trigger_count set to 2

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c         | 11 +++++++++++
 target/riscv/cpu.h         | 23 ++++++++++++++++++++++-
 target/riscv/csr.c         |  2 +-
 target/riscv/debug.c       | 16 ++++++++--------
 target/riscv/machine.c     |  4 ++--
 target/riscv/tcg/tcg-cpu.c |  7 +++++++
 6 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c1b10cc7ef..56dc9ad644 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1154,6 +1154,11 @@ static void riscv_cpu_init(Object *obj)
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
     qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
                             "riscv.cpu.rnmi", RNMI_MAX);
+
+    if (mcc->def->trigger_count) {
+        env->trigger_count = mcc->def->trigger_count;
+    }
+
 #endif /* CONFIG_USER_ONLY */
 
     general_user_opts = g_hash_table_new(g_str_hash, g_str_equal);
@@ -2606,6 +2611,8 @@ static const Property riscv_cpu_properties[] = {
                        DEFAULT_RNMI_IRQVEC),
     DEFINE_PROP_UINT64("rnmi-exception-vector", RISCVCPU, env.rnmi_excpvec,
                        DEFAULT_RNMI_EXCPVEC),
+    DEFINE_PROP_UINT16("trigger-count", RISCVCPU, env.trigger_count,
+                       RV_DEFAULT_TRIGGER_COUNT),
 #endif
 
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
@@ -2749,6 +2756,10 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
                 !valid_vm_1_10_32[mcc->def->cfg.max_satp_mode]) {
                 mcc->def->cfg.max_satp_mode = VM_1_10_SV32;
             }
+
+            if (def->trigger_count) {
+                mcc->def->trigger_count = def->trigger_count;
+            }
 #endif
         }
         if (def->priv_spec != RISCV_PROFILE_ATTR_UNUSED) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c98652cd62..361f3cecf3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -189,7 +189,26 @@ extern RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[];
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
+ * Alas, we need to carry over migration state for all these folks,
+ * even if not utilized, so setting 2^XLEN isn't an option.
+ *
+ * We're setting a smaller default based on what we see current
+ * hardware use (most chips uses 2-4 triggers per hart, RISC-V
+ * Server Ref requires at least 11).
+ *
+ * 128 seems like a good amount for current and future usage without
+ * a lot of footprint on our side.
+ */
+#define RV_MAX_TRIGGERS 128
+#define RV_DEFAULT_TRIGGER_COUNT 2
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
@@ -475,6 +494,7 @@ struct CPUArchState {
     QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
     int64_t last_icount;
     bool itrigger_enabled;
+    uint16_t trigger_count;
 
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
@@ -570,6 +590,7 @@ typedef struct RISCVCPUDef {
     RISCVCPUConfig cfg;
     bool bare;
     const RISCVCSR *custom_csrs;
+    uint16_t trigger_count;
 } RISCVCPUDef;
 
 /**
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ec931a8c3d..6aa4a321c7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -5436,7 +5436,7 @@ static RISCVException read_tdata(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
     /* return 0 in tdata1 to end the trigger enumeration */
-    if (env->trigger_cur >= RV_MAX_TRIGGERS && csrno == CSR_TDATA1) {
+    if (env->trigger_cur >= env->trigger_count && csrno == CSR_TDATA1) {
         *val = 0;
         return RISCV_EXCP_NONE;
     }
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 30d39ee5cd..78b84591b4 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -172,7 +172,7 @@ target_ulong tselect_csr_read(CPURISCVState *env)
 
 void tselect_csr_write(CPURISCVState *env, target_ulong val)
 {
-    if (val < RV_MAX_TRIGGERS) {
+    if (val < env->trigger_count) {
         env->trigger_cur = val;
     }
 }
@@ -701,7 +701,7 @@ static bool check_itrigger_priv(CPURISCVState *env, int index)
 bool riscv_itrigger_enabled(CPURISCVState *env)
 {
     int count;
-    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
+    for (int i = 0; i < env->trigger_count; i++) {
         if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
             continue;
         }
@@ -721,7 +721,7 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
 void helper_itrigger_match(CPURISCVState *env)
 {
     int count;
-    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
+    for (int i = 0; i < env->trigger_count; i++) {
         if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
             continue;
         }
@@ -750,7 +750,7 @@ static void riscv_itrigger_update_count(CPURISCVState *env)
     int64_t last_icount = env->last_icount, current_icount;
     current_icount = env->last_icount = icount_get_raw();
 
-    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
+    for (int i = 0; i < env->trigger_count; i++) {
         if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
             continue;
         }
@@ -950,7 +950,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
     int i;
 
     QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-        for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+        for (i = 0; i < env->trigger_count; i++) {
             trigger_type = get_trigger_type(env, i);
 
             if (!trigger_common_match(env, trigger_type, i)) {
@@ -996,7 +996,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     int flags;
     int i;
 
-    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+    for (i = 0; i < env->trigger_count; i++) {
         trigger_type = get_trigger_type(env, i);
 
         if (!trigger_common_match(env, trigger_type, i)) {
@@ -1049,7 +1049,7 @@ void riscv_trigger_realize(CPURISCVState *env)
 {
     int i;
 
-    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+    for (i = 0; i < env->trigger_count; i++) {
         env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                               riscv_itrigger_timer_cb, env);
     }
@@ -1061,7 +1061,7 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
     int i;
 
     /* init to type 2 triggers */
-    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+    for (i = 0; i < env->trigger_count; i++) {
         /*
          * type = TRIGGER_TYPE_AD_MATCH
          * dmode = 0 (both debug and M-mode can write tdata)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 6e70b145a5..a667c06b17 100644
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
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b73e3e9dd4..9b657a7544 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1211,6 +1211,13 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
                                           riscv_pmu_timer_cb, cpu);
         }
     }
+
+    if (env->trigger_count > RV_MAX_TRIGGERS) {
+        error_setg(errp,
+                "Invalid configuration: 'trigger-count' must be less than %u",
+                RV_MAX_TRIGGERS);
+        return;
+    }
 #endif
 }
 
-- 
2.43.0


