Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6646C25B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 May 2024 16:13:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sCLsT-0000vk-MJ; Wed, 29 May 2024 12:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1sCLsR-0000td-M2
 for qemu-riscv@nongnu.org; Wed, 29 May 2024 12:10:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1sCLsE-0003MW-6T
 for qemu-riscv@nongnu.org; Wed, 29 May 2024 12:10:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4211a86f124so19098355e9.0
 for <qemu-riscv@nongnu.org>; Wed, 29 May 2024 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716998996; x=1717603796;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=StS3+7nlVIf5oE8cBUohIBpboOuZOuETS8f794xWjaU=;
 b=NBgFyaiYJ0W823dafgsxAAgnFZaXKxe7T9kp7huvafDYpiY9t9YKdOMLhv+Woo9omj
 jmYKDW7zAk4TLzT7FbBCmc9IjQNdDN2si/Kkfl56aaIF7gihMT7SgDcSbX/JhxToIIiC
 yuhggB1Cv0Va9IqqBTMZav2j7ZJQRV8h+f84WpbYvR9TNqS7eXjkIBVohgieQvC1WWIC
 n/mUjm3IsTErqNRGs53nNgJuE4STbeuhmPthcTBSlanQWkfTJKSurGWf/Gu6FJQUQOne
 EodYkTznGiMXA6Gt6XlcUkITCNdnRV2xUctVJXOhKlFQ70hGeqG+WwTa/ucdqCggznWV
 Q83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716998996; x=1717603796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=StS3+7nlVIf5oE8cBUohIBpboOuZOuETS8f794xWjaU=;
 b=giMmYjQ9UqY5dti4DlkAGaOBuvwL3XhEyuF+cQgGPV2SqhGJ5rzPtL+NF/VDpa1G+b
 x6Sm05btbrM/5WXzuLmQ+vN4gkp7dhz1A8MwqKwnjT81FXOUGs5rQGBcJraF6BDerEwa
 iO1XCih4xDkXLU8GNC71O+vtoA/4g9WGSeEHquefEPc8rCnfZnH069/k1+K9KH21lbqX
 8FzeeSB53eNcXJGSx5bmeVV6bgdng20+SQzD+b1IK5NLtIBkc5pJpD3yrXX86p8nPgUy
 FNz9b9JHBEODpF07toT4CEc4gA5Yd8fm6PqmD693kcG4guBj83pzH+B/mTG3J4hpnqjc
 7+DA==
X-Gm-Message-State: AOJu0Yyft3g9rdvw2pqVukEb1Cj/z871QSkGFgr+bKxb39M95PEJ3kGr
 Xu/dwaMTULnrZ1sg95n6xlRLgO2HNpc/oCNRFx7zIspSmJVHf6LWtfqNEk53WfSDdFbwdw/l7q5
 d
X-Google-Smtp-Source: AGHT+IGCJ/NYOxMvS1YDuREfbFCQfN3xOX+rh0kdeKF2fE/hy7YqfCJIFYcwrThYPSPNJql3gkGoRw==
X-Received: by 2002:a05:600c:364f:b0:420:1094:65d with SMTP id
 5b1f17b1804b1-421089f4dd2mr120738055e9.12.1716998996240; 
 Wed, 29 May 2024 09:09:56 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.Home
 ([2a02:c7c:7527:ee00:7446:71c1:a41a:da9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557dcf0740sm15228213f8f.107.2024.05.29.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 09:09:55 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, rkanwal@rivosinc.com,
 beeman@rivosinc.com, tech-control-transfer-records@lists.riscv.org
Subject: [PATCH 3/6] target/riscv: Add support for Control Transfer Records
 extension CSRs.
Date: Wed, 29 May 2024 17:09:47 +0100
Message-Id: <20240529160950.132754-4-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529160950.132754-1-rkanwal@rivosinc.com>
References: <20240529160950.132754-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This commit adds support for [m|s|vs]ctrcontrol, sctrstatus and
sctrdepth CSRs handling.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 target/riscv/cpu.h     |   5 ++
 target/riscv/cpu_cfg.h |   2 +
 target/riscv/csr.c     | 159 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a185e2d494..3d4d5172b8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -263,6 +263,11 @@ struct CPUArchState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    uint64_t mctrctl;
+    uint32_t sctrdepth;
+    uint32_t sctrstatus;
+    uint64_t vsctrctl;
+
     /* Machine and Supervisor interrupt priorities */
     uint8_t miprio[64];
     uint8_t siprio[64];
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index d9354dc80a..d329a65811 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -123,6 +123,8 @@ struct RISCVCPUConfig {
     bool ext_zvfhmin;
     bool ext_smaia;
     bool ext_ssaia;
+    bool ext_smctr;
+    bool ext_ssctr;
     bool ext_sscofpmf;
     bool ext_smepmp;
     bool rvv_ta_all_1s;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2f92e4b717..888084d8e5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -621,6 +621,61 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
+/*
+ * M-mode:
+ * Without ext_smctr raise illegal inst excep.
+ * Otherwise everything is accessible to m-mode.
+ *
+ * S-mode:
+ * Without ext_ssctr or mstateen.ctr raise illegal inst excep.
+ * Otherwise everything other than mctrctl is accessible.
+ *
+ * VS-mode:
+ * Without ext_ssctr or mstateen.ctr raise illegal inst excep.
+ * Without hstateen.ctr raise virtual illegal inst excep.
+ * Otherwise allow vsctrctl, sctrstatus, 0x200-0x2ff entry range.
+ * Always raise illegal instruction exception for sctrdepth.
+ */
+static RISCVException ctr_mmode(CPURISCVState *env, int csrno)
+{
+    /* Check if smctr-ext is present */
+    if (riscv_cpu_cfg(env)->ext_smctr) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
+
+static RISCVException ctr_smode(CPURISCVState *env, int csrno)
+{
+    if ((env->priv == PRV_M && riscv_cpu_cfg(env)->ext_smctr) ||
+        (env->priv == PRV_S && !env->virt_enabled &&
+         riscv_cpu_cfg(env)->ext_ssctr)) {
+        return smstateen_acc_ok(env, 0, SMSTATEEN0_CTR);
+    }
+
+    if (env->priv == PRV_S && env->virt_enabled &&
+        riscv_cpu_cfg(env)->ext_ssctr) {
+        if (csrno == CSR_SCTRSTATUS) {
+            return smstateen_acc_ok(env, 0, SMSTATEEN0_CTR);
+        }
+
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
+
+static RISCVException ctr_vsmode(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_S && env->virt_enabled &&
+        riscv_cpu_cfg(env)->ext_ssctr) {
+        return smstateen_acc_ok(env, 0, SMSTATEEN0_CTR);
+    }
+
+    return ctr_smode(env, csrno);
+}
+
 static RISCVException aia_hmode(CPURISCVState *env, int csrno)
 {
     int ret;
@@ -3835,6 +3890,100 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException rmw_sctrdepth(CPURISCVState *env, int csrno,
+                                    target_ulong *ret_val,
+                                    target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t mask = wr_mask & SCTRDEPTH_MASK;
+
+    if (ret_val) {
+        *ret_val = env->sctrdepth & SCTRDEPTH_MASK;
+    }
+
+    env->sctrdepth = (env->sctrdepth & ~mask) | (new_val & mask);
+
+    /* Correct depth. */
+    if (wr_mask & SCTRDEPTH_MASK) {
+        uint64_t depth = get_field(env->sctrdepth, SCTRDEPTH_MASK);
+
+        if (depth > SCTRDEPTH_MAX) {
+            env->sctrdepth =
+                set_field(env->sctrdepth, SCTRDEPTH_MASK, SCTRDEPTH_MAX);
+        }
+
+        /* Update sctrstatus.WRPTR with a legal value */
+        depth = 16 << depth;
+        env->sctrstatus =
+            env->sctrstatus & (~SCTRSTATUS_WRPTR_MASK | (depth - 1));
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException rmw_mctrctl(CPURISCVState *env, int csrno,
+                                    target_ulong *ret_val,
+                                    target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t mask = wr_mask & MCTRCTL_MASK;
+
+    if (ret_val) {
+        *ret_val = env->mctrctl & MCTRCTL_MASK;
+    }
+
+    env->mctrctl = (env->mctrctl & ~mask) | (new_val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException rmw_sctrctl(CPURISCVState *env, int csrno,
+                                    target_ulong *ret_val,
+                                    target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t mask = wr_mask & SCTRCTL_MASK;
+    RISCVException ret;
+
+    ret = rmw_mctrctl(env, csrno, ret_val, new_val, mask);
+    if (ret_val) {
+        *ret_val &= SCTRCTL_MASK;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sctrstatus(CPURISCVState *env, int csrno,
+                                     target_ulong *ret_val,
+                                     target_ulong new_val, target_ulong wr_mask)
+{
+    uint32_t depth = 16 << get_field(env->sctrdepth, SCTRDEPTH_MASK);
+    uint32_t mask = wr_mask & SCTRSTATUS_MASK;
+
+    if (ret_val) {
+        *ret_val = env->sctrstatus & SCTRSTATUS_MASK;
+    }
+
+    env->sctrstatus = (env->sctrstatus & ~mask) | (new_val & mask);
+
+    /* Update sctrstatus.WRPTR with a legal value */
+    env->sctrstatus = env->sctrstatus & (~SCTRSTATUS_WRPTR_MASK | (depth - 1));
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException rmw_vsctrctl(CPURISCVState *env, int csrno,
+                                    target_ulong *ret_val,
+                                    target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t mask = wr_mask & VSCTRCTL_MASK;
+
+    if (ret_val) {
+        *ret_val = env->vsctrctl & VSCTRCTL_MASK;
+    }
+
+    env->vsctrctl = (env->vsctrctl & ~mask) | (new_val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_vstopi(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
@@ -5771,6 +5920,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase,
                          write_spmbase                                      },
 
+    [CSR_MCTRCTL]       = { "mctrctl",       ctr_mmode, NULL, NULL,
+                                rmw_mctrctl },
+    [CSR_SCTRCTL]       = { "sctrctl",       ctr_smode, NULL, NULL,
+                                rmw_sctrctl },
+    [CSR_SCTRDEPTH]       = { "sctrdepth",       ctr_smode, NULL, NULL,
+                                rmw_sctrdepth },
+    [CSR_SCTRSTATUS]       = { "sctrstatus",       ctr_smode, NULL, NULL,
+                                rmw_sctrstatus },
+    [CSR_VSCTRCTL]      = { "vsctrctl",      ctr_vsmode, NULL, NULL,
+                                rmw_vsctrctl },
     /* Performance Counters */
     [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_hpmcounter },
     [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_hpmcounter },
-- 
2.34.1


