Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7D2C79FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4Jbl-0002iI-80; Wed, 09 Sep 2026 10:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbi-0002go-MF
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbf-000792-A5
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:02 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689BU3uK1183626
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 14:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=e3Yq/xUprvY
 vn7B1vx6090CtG1lk3xvMaGBB2wcxsBg=; b=fnDazVjPOgLVhbXMEji5PZhuDo9
 SnTYAu6i7ybGSMA+dzEGiuVDTF0dZ9v/2F4POxV7vKyK8EMtQokuKj6YJXONvHBl
 TdiaMJIim/2hkEv5J4O80zFULQeqqaQrBRsUAAdynMNvOf/jfiwnT6wCYwAngU8c
 KXeVzyLXCCaQhj6j7HUnr2s9R5Xub3wTnxIlRTZkcZMKA+MH2EKh8yK1hTNOkJdE
 bVF8m8ohgPn7js2rrWYxbBH3V8pns+Dai/bM9B3RzvFOwYHc1XVmhqgbI7xOyDBh
 kQ46l/VKs1l3dd5d+10tGROTwG3Bjt6NTGQEIwuBWBdXRldWmEIKd2p1xdg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559s734-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:48:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-9104ba8bf51so102339436d6.3
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788965337; x=1789570137; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e3Yq/xUprvYvn7B1vx6090CtG1lk3xvMaGBB2wcxsBg=;
 b=T0gVQJyAUdb73Z3QZXAgaC3b8iPefMHblvPdfDi/93ft/46lSdwn2RbhMhuEkPl8qa
 2+Tm6AXKS8ueTmu4ZRj9/Y2X/JWUuBeN723P7E4PFhKENvdcIoAeGl0QsLksiecUhbf3
 fNlPa/kCBHI+7B/I+mN9XTPHNUOxAEgxUcOtVrpaCjiRRLEdZWhLKB5BhIbk3iYlQHcY
 YFJ4ugYusXSxQThwuHwJF1qvShvqoEmD624hwM2vt++Phou6fm9+FHFkP7zl7z7K6Uyn
 jLTs0BAn61m+nApKuSopPyZIxUydVO4yfBtKqQnpcApl9rUPj7bxm8LvZOwSse5sGo2M
 DPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788965337; x=1789570137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e3Yq/xUprvYvn7B1vx6090CtG1lk3xvMaGBB2wcxsBg=;
 b=VrvhfunSw7nyYB0z6UnJa3HzyQ32YUyA4MoAa0ekVvCIT5fSu+orpZ88KodaVcFaVQ
 gaE/ljVDPvLOG3Hqp32PeLjlJFKLI9KugI4SMN7KMYJBs1p1XAbKz+qbCotq9biuGM0K
 3mqYnaUapWj4TzT4c631X1YxGjiIKy/d4J8i42OsDC/DX5V1nR4HsRwehMi0hrK2rs30
 eyKbEbbZ8VcZ/bOC0DYPkp23qZeDhL//Zz7cFWHpHzDpNQH7ydZYwCmeRyQXs/BNCfx9
 IpGV8rL29PhctzDPZMUx1g9wcyvQjL9p76cVKYrJhdA65rRsQWL4l4BnK6N1WZ5EqtTs
 dZWw==
X-Gm-Message-State: AFuF++nyjKIRWhBCJvevOq/vnVjQKrvCBhMZ2SQDNDXrCDdYxnLVxvrq
 yk+N5D8UoYWGKlZLJe8uxA0QCOtAirTV2xz96Q1yZQ2MBrGB7Y1H/AIC6F1NefYJvjoeYc5l5Hi
 427325x3Nz+3reKoxG6uvw8OrC8H1w3nosFFUJylDPv+X/G6JwXRdi47nyw==
X-Gm-Gg: AYBFou3RQGvYKn9vB62q9nPSRo9F4tGszTFfjZRJ7I6Ocpj5mFQsp3Wt3RksV8d+Csy
 sk7+4zrTjnGZTAE5tViP8te65txq8ucZ6oYN9wdCfBIzGCfcyn6yafJ5lrXQyncHH/hHAz30hgZ
 4IakKwEsO2F6NcHfiGY9WbWZ0GXDWQ76//rmVT/iDJKRLhAowRYcs0j6tmhjaNcltiJ4nNo+fIS
 3j8NvcB2t+yefxEdPC7YiQR8QbqCy4mpiuYd1Hz3SNnkrzO7RO3mt7yuT8TucPtBSRXqy80+t7j
 CE86chGx0BqZWN5TtYcNVCXItnCLOgo+2sAmFDR5RZmLfuIxrUs0cfXqAbLtcgCH6j8TEJVwD4j
 lcA4SVHRixUHt46F+c65SkNKEJR7TI5okWO6e
X-Received: by 2002:a05:622a:646:b0:530:430e:8125 with SMTP id
 d75a77b69052e-530aefba436mr27111871cf.46.1788965332470; 
 Wed, 09 Sep 2026 07:48:52 -0700 (PDT)
X-Received: by 2002:a05:622a:646:b0:530:430e:8125 with SMTP id
 d75a77b69052e-530aefba436mr27110811cf.46.1788965331850; 
 Wed, 09 Sep 2026 07:48:51 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910464bf898sm125678886d6.7.2026.09.09.07.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:48:51 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v9 2/7] target/riscv: add sdext Debug Mode helpers
Date: Wed,  9 Sep 2026 11:48:35 -0300
Message-ID: <20260909144841.1766921-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
References: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa171da cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=xvfqbYfxAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fgrLqfBXAAAA:8 a=Mp8isO8jnsZoTyD_AnUA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=_Ge82aPy-h_wFa7gWU4u:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 1Z9xAdqRO10DSjFZzepMuMgTKlx4mRGS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX/6NwWf8fE62J
 YVnwblqJm/R+F/8ehKA/8Av/29M5+cCrYPdCpAvz+WoUW1rxEMh/Kf0ySrgIT/r7p6Kxwi1/A2G
 e18CXdP0mGoX/+pXI2N36j1kTrlJr84=
X-Proofpoint-GUID: 1Z9xAdqRO10DSjFZzepMuMgTKlx4mRGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX6Jg+hwzQNxBw
 bF4xchFPCGs6VjnAxqnZw3vGt27bXqdsoKmTZbGTrrXBvRc6YBvgvZtv7zRO5L8Q/PPr2qGll7J
 oTcF7bS4mSdMM/2V42mIF7llyIDmsd/G703Rsobx+jcOUXjqD86FlfDApQIXMOxpQkZPogPV+Ud
 s09IPH+O+jTPFzgx+5KEs9Xt0vW71aG0aWP20w04QBu+PzcDN/MoMjKKx/IjNThbA9igeFkXy8R
 mzqm2KCSxJSlb6x2Y5savOE0UT9DlAU6SYYOI359W8FkPIzNxylT7QPWPOPYpoJ2j/6eTdiQ7ld
 AvA5JtE43UZs6nfzqqPQL2kai1QWCswORX5ILosJkwqtSwFCTMG6KzjTrNA+dVQuszVM15dl4xc
 R+Fv2GD6SniD2Ac5u+oVFqUTHGO5Mn4wqLGqPil2+rYcsFjZa5WR9sttjtd4k4h+Yv6yVXXDsDV
 ZEVdilD6b1rvDYWnOsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165
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

From: Chao Liu <chao.liu.zevorn@gmail.com>

RISC-V Debug Specification:
https://github.com/riscv/riscv-debug-spec/releases/tag/1.0

Add helpers to enter/leave Debug Mode and to update dpc/dcsr.
Model resume without a Debug Module by leaving Debug Mode at
cpu_exec_enter and continuing from dpc.

Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Tao Tang <tangtao1634@phytium.com.cn>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.h            |  3 ++
 target/riscv/tcg/cpu_helper.c | 85 +++++++++++++++++++++++++++++++++++
 target/riscv/tcg/debug.c      |  5 +++
 target/riscv/tcg/tcg-cpu.c    | 14 ++++++
 4 files changed, 107 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7b343d7a3e..82eb61a18c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -671,6 +671,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 char *riscv_isa_string(RISCVCPU *cpu);
 int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
 bool riscv_cpu_option_set(RISCVCPU *cpu, const char *optname);
+void riscv_cpu_enter_debug_mode(CPURISCVState *env, target_ulong pc,
+                                uint32_t cause);
+void riscv_cpu_leave_debug_mode(CPURISCVState *env);
 
 #ifndef CONFIG_USER_ONLY
 void riscv_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 07d9222652..e6d948991c 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -132,6 +132,91 @@ bool riscv_env_smode_dbltrp_enabled(CPURISCVState *env, bool virt)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool riscv_sdext_enabled(CPURISCVState *env)
+{
+    return riscv_cpu_cfg(env)->ext_sdext;
+}
+#endif
+
+void riscv_cpu_enter_debug_mode(CPURISCVState *env, target_ulong pc,
+                                uint32_t cause)
+{
+#ifndef CONFIG_USER_ONLY
+    if (!riscv_sdext_enabled(env)) {
+        return;
+    }
+
+    env->debug_mode = true;
+    env->dpc = pc & get_xepc_mask(env);
+    env->dcsr &= ~(DCSR_CAUSE_MASK | DCSR_PRV_MASK | DCSR_V);
+    env->dcsr |= ((target_ulong)(cause & 0x7)) << DCSR_CAUSE_SHIFT;
+    env->dcsr |= env->priv & DCSR_PRV_MASK;
+    if (env->virt_enabled && riscv_has_ext(env, RVH)) {
+        env->dcsr |= DCSR_V;
+    }
+
+    if (env_archcpu(env)->cfg.ext_zicfilp) {
+        if (env->elp) {
+            env->dcsr |= DCSR_PELP;
+        } else {
+            env->dcsr &= ~DCSR_PELP;
+        }
+        env->elp = false;
+    }
+#endif
+}
+
+void riscv_cpu_leave_debug_mode(CPURISCVState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    if (!riscv_sdext_enabled(env)) {
+        return;
+    }
+
+    target_ulong new_priv = env->dcsr & DCSR_PRV_MASK;
+    bool new_virt = riscv_has_ext(env, RVH) && (env->dcsr & DCSR_V);
+
+    if (new_priv > PRV_M) {
+        new_priv = PRV_M;
+    }
+    if (new_priv == PRV_M) {
+        new_virt = false;
+    }
+
+    if (new_priv == PRV_S && !riscv_has_ext(env, RVS)) {
+        new_priv = PRV_M;
+        new_virt = false;
+    } else if (new_priv == PRV_U && !riscv_has_ext(env, RVU)) {
+        new_priv = riscv_has_ext(env, RVS) ? PRV_S : PRV_M;
+        new_virt = false;
+    }
+
+    env->debug_mode = false;
+    riscv_cpu_set_mode(env, new_priv, new_virt);
+
+    if (env_archcpu(env)->cfg.ext_zicfilp) {
+        env->elp = cpu_get_fcfien(env) && (env->dcsr & DCSR_PELP);
+        env->dcsr &= ~DCSR_PELP;
+    }
+
+    if (new_priv != PRV_M) {
+        env->mstatus = set_field(env->mstatus, MSTATUS_MPRV, 0);
+    }
+
+    if (env_archcpu(env)->cfg.ext_smdbltrp && new_priv != PRV_M) {
+        env->mstatus = set_field(env->mstatus, MSTATUS_MDT, 0);
+    }
+    if (env_archcpu(env)->cfg.ext_ssdbltrp && (new_priv == PRV_U || new_virt)) {
+        env->mstatus = set_field(env->mstatus, MSTATUS_SDT, 0);
+        if (new_virt && new_priv == PRV_U) {
+            env->vsstatus = set_field(env->vsstatus, MSTATUS_SDT, 0);
+        }
+    }
+#endif
+}
+
+
 /*
  * Returns the effective PMM field.
  *
diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index e4d719a1da..2537515f54 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -973,6 +973,11 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
+    /* Triggers must not match or fire while in Debug Mode. */
+    if (env->debug_mode) {
+        return;
+    }
+
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
             do_trigger_action(env, DBG_ACTION_BP);
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b68160af83..959a1e89c8 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -269,6 +269,19 @@ static vaddr riscv_pointer_wrap(CPUState *cs, int mmu_idx,
     }
     return extract64(result, 0, 64 - pm_len);
 }
+
+static void riscv_cpu_exec_enter(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    if (!cpu->cfg.ext_sdext || !env->debug_mode) {
+        return;
+    }
+    target_ulong pc = env->dpc;
+    riscv_cpu_leave_debug_mode(env);
+    env->pc = pc;
+}
 #endif
 
 const TCGCPUOps riscv_tcg_ops = {
@@ -285,6 +298,7 @@ const TCGCPUOps riscv_tcg_ops = {
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = riscv_cpu_tlb_fill,
     .pointer_wrap = riscv_pointer_wrap,
+    .cpu_exec_enter = riscv_cpu_exec_enter,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .cpu_exec_halt = riscv_cpu_has_work,
     .cpu_exec_reset = cpu_reset,
-- 
2.43.0


