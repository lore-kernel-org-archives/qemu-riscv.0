Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA32CA5FA3
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:01:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHVy-0004QS-FC; Mon, 28 Sep 2026 15:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVS-0004Kh-62
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVO-0006iQ-Bq
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:21 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SHvOY63195914
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4KF98JgD6wC
 QXrzFOc3wXtJLpEVde3YSi9A/1OXCss0=; b=h0/g/yuxDaTk43CMOuwEmEFEXO0
 riqxvc5NMDo2BiyFjadgZ5wVIPDJlSRx2GyPEH49GIMWrEjVooRjkf9b9iXfjkO7
 H3AdyQQ3Caz++6IKKP84aFhQ4GA6U3JkoXJ25d25+IK8ALzIHiwijjy1nT2v3VDN
 nDsN4tgMgaQIa7ISkLgMeGFYr3RBSyJZBU6jodWd82JPhLj3+M6BHaJTyEIDV5Zb
 fgSl+iHSFCulghHjX/1j+pKKqhdkLxLEuJrAZ9aILzqSR0Gd2cggI6nHdF9kSQvN
 U057M84FGX9+zBo3O3nKKCKhIjqLvPAOvCTY4kxD/FCVqxPxwDsmdsx62Lw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03gja3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-532c6028621so41444511cf.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 12:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790625554; x=1791230354; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4KF98JgD6wCQXrzFOc3wXtJLpEVde3YSi9A/1OXCss0=;
 b=fPwi/FEbOfeS+6JFdWWo6rDlOnTX5cxr1knJgkrIALayVz1QhR65MBP1kuZi0ofSct
 zhdCLhOu1ylrYdUv+6Ht/rTQ4qB3Ya8mcSNWqMSu6gFP7eayNzgIpH+kpy99uDA51jUj
 jn0ZVHenysdTR/XeUzVLFaEdC9/XDfwVVmj6ADqBxi5aaVBDiUw8rHDeTIEWlMTqP9tk
 xOu37L2w/JnLbbRomZoBWYdO2aSB0ByqSHpFaOSrKEX2l1+zqjTqPvwumpM0atB+G9eK
 BimgneQGNseeZsycnSrGKE7mPZhfxI+x/bJvu6utS1jxkySf28pUpr5q9kqB75zLpM5q
 vq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790625554; x=1791230354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4KF98JgD6wCQXrzFOc3wXtJLpEVde3YSi9A/1OXCss0=;
 b=ONGKrRSjtjmlrVtDKEhsAQixdJS1ed13+3ayjdltmCSuts4QTLYZPcpF9j19kfCK8c
 kc4zeu7SmNWs398LlDPQ1u1Q750xIEI8cmXcsZWBuerIuJcyB5AVJwKWnTHJzVmB3TBc
 UaSg7K51Tmaziaoulrymi6OTeFGPX1ZQdI6oHieXfLYqx2XbjrZt5D7VzqFBHoD0Y5hu
 CLy9zjS5nba1ZdTGc/AClxtiQQmhrIh73dc4jwLfe8LjEwrbjsPoPiZK1pJc7mDHExLy
 0fNzkTh0f8Ngvfnb2vGaE0ERYzWJFwVJu9qkcLkFqzJ74mO4dlwXPzwaybLUvLufXmDD
 nVyA==
X-Gm-Message-State: AFuF++kKyeu7ycRxU4wEcSHa+jEY+RIX6O6N2WlYXXKWnKuW7Gu3P5VJ
 +NGwdaoKTkb5AZKXkMhGmFiDN+Pq8p5noX3FAGIxVyxA1a54n6NqdIwkdi5NltmiZiNYhu7plyJ
 x9+0XR6QRxp4HcsA+LUVL1UTB20ZYhyfc0AC2gESzoIE8vl13D3K5AX7/eQ==
X-Gm-Gg: AYBFou12+JgBs9Tuxwzh5A6gO3XiHO9MzFtoriiF27Y3DTdMn62o7XyaMZ4lg8eyrLX
 wsqQwEZiVmZfNnlcHAsExmpj5jZd+wPPCvwBcd16dFDNGmPu2Rs+ebZPnAlFLhIX3e1V4Wrd4ss
 ycMJG0JsOpGPjJ21sGAyjHkGxUGgsXQcb96cxXR7MH1bAprUJ8mJ4QNdTsmES4pLf9GsXfWjhHR
 NrUhJ/SF4fMfE2+KmAfcPHMGeEhGdPwha5kKB/jdMuVUk/oKwqavb/Y0isaQhGhC9LsRdUGnQIA
 WnJJcnh75AT1jTpM3zilSZ6YQI5sD6b/f6VKjLTVewBOTFdl+Yje23TzR63D6yBJO+bnWOdl6jN
 5yzz1lHhZstK4ixN0hkVvB5ktqJiOdD3l2PA=
X-Received: by 2002:a05:622a:107:b0:531:175b:97e6 with SMTP id
 d75a77b69052e-5330b6d438amr240864341cf.54.1790625554394; 
 Mon, 28 Sep 2026 12:59:14 -0700 (PDT)
X-Received: by 2002:a05:622a:107:b0:531:175b:97e6 with SMTP id
 d75a77b69052e-5330b6d438amr240863681cf.54.1790625553341; 
 Mon, 28 Sep 2026 12:59:13 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9143d0a64b9sm75905556d6.35.2026.09.28.12.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 12:59:12 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 2/7] target/riscv: add sdext Debug Mode helpers
Date: Mon, 28 Sep 2026 16:58:56 -0300
Message-ID: <20260928195902.2045235-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
References: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX/NIZhMKdbQJ5
 ugf+rvuFiN6rMkXG6gysBkw76z2KDAHrPMsvggSW2V5kHp1MNT8UTGEFd48YyZ6Bspl78MtvVvo
 j4BoPi27uvXy/U4yaKa+p5yqQ2H/0H4=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abac713 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=xvfqbYfxAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fgrLqfBXAAAA:8 a=Mp8isO8jnsZoTyD_AnUA:9
 a=dawVfQjAaf238kedN5IG:22 a=_Ge82aPy-h_wFa7gWU4u:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX7oqtol8IBN2+
 hUXNrfNOB74fMo9yn5VbU0IwljozfktGm7fsJZwBwQG11FrxXdOwMKScwr4LHqKdDGIfVGBvQEU
 6Fgz6L1MFPeLlqJV0ASNKa6UEQx067YjpSOVpSaaRtf8GKtFTdx/CxUEjD7aifFfRlifnECNivy
 dzELiAMkQS3qoXgn810RkySUR3zRF0kqWsbw/a3TBAAGkQaHnkR8pLvVO8GSpNdVl5lKK8c5UMN
 urLzARaRyQO+49xtTsnQ/1KliA7WSBgEfz/YiEcs2tu0ylr/V3IJ8iH/mTegC88HN4cBi/lCwg+
 Bsufm/ozFxvqSYBF+2fFXmMF0iWNpP/f2HfFOAuGjzLdgeKZaydvaDWVtJH1XjFWlGP/y6IN5Cx
 axSVVphqt7LDvxIfXbmseoNShRXuVnq9N4WEyrfXfceNgWwopDxQMgopVf5cjv4rsr3E1PF97CD
 1Z4wmy+yv1DocPdSaNA==
X-Proofpoint-GUID: 2g0h7Jg-VyccLXupIZL4i9Q7wyeC_9R3
X-Proofpoint-ORIG-GUID: 2g0h7Jg-VyccLXupIZL4i9Q7wyeC_9R3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280079
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
 target/riscv/tcg/cpu_helper.c | 88 +++++++++++++++++++++++++++++++++++
 target/riscv/tcg/debug.c      |  5 ++
 target/riscv/tcg/tcg-cpu.c    | 14 ++++++
 4 files changed, 110 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5de8b2ceb4..fa253b32d0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -678,6 +678,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 char *riscv_isa_string(RISCVCPU *cpu);
 int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
 bool riscv_cpu_option_set(RISCVCPU *cpu, const char *optname);
+void riscv_cpu_enter_debug_mode(CPURISCVState *env, target_ulong pc,
+                                uint32_t cause);
+void riscv_cpu_leave_debug_mode(CPURISCVState *env);
 
 #ifndef CONFIG_USER_ONLY
 void riscv_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index e78acf37dc..b6b8c2518b 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -132,6 +132,94 @@ bool riscv_env_smode_dbltrp_enabled(CPURISCVState *env, bool virt)
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
+    env->dcsr |= (cause & 0x7) << DCSR_CAUSE_SHIFT;
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
+    uint32_t new_priv;
+    bool new_virt;
+
+    if (!riscv_sdext_enabled(env)) {
+        return;
+    }
+
+    new_priv = env->dcsr & DCSR_PRV_MASK;
+    new_virt = riscv_has_ext(env, RVH) && (env->dcsr & DCSR_V);
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


