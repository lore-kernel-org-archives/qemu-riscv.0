Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZg-0005Jh-UB
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZV-00053F-2D
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:41 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZI-0001ni-4g
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q19so16060337pfl.4
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RT2VpKAEfApm7ELgrgjYw2HluCj4mChRvtgjB+9QAL8=;
 b=mOa5XS+CnoMwE7kXn80tS1WwIXH2ThuYKDDNaWe/fjMKBUJ1MeeURqmvqUNSCrAVEB
 xSkp9wf6mXBJNhuaa4TOPC1H6MmMKJbBNSkWd7mnIL3Irx8PmaBjjaigvHE9BRTTH2z+
 ajajCCOJq8EM53r6SnSGiQz2AauSZWeNTqZVmLen4CYMdk+X//UrPR5f1ddSdqLAbcbd
 M7SMcC0+IQ5Wqg/a6IudtHov/WhL9IrBcQ02Y1PHWZe/BAdTlJ66rlw0MFUHvjaOu3lK
 2lLMJnRTJCYmmkBsa/nDDdm8rGOEC5R2MNLs314NJc5uLmmqqcK3vW6QHWMf6Xuec95u
 nFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RT2VpKAEfApm7ELgrgjYw2HluCj4mChRvtgjB+9QAL8=;
 b=Ydf9B5O7t1xf13m/+YZ5MklDb+66s5bfyb/39TSCOtCpKFrSyqsEc0txOmCRX0C/4y
 SftnBaY/0B66e3ASLcrOUxQ6zoyEQiTNSnaQwWBPX+BwuxdN17ZB8b8UhSJeCDKyuVWZ
 Z6qBaRBQIFb8bTkaHSdjSE17RAgluLbRspBy4qBiaFQN0fCCIBQf5cspkz+grUGjifK7
 MWAGuLFY9ha9p/FWVqKyN+AB1elelB9ybfw6WC+Nh4NNcD2ljrr9KoJWW2vVCB47qPeA
 w0tOEs4p90VIoaz+DbVGGbv1zybCqTPR4Rcgvxo87IlldZFE+RGKASdTfj7QyRMre94P
 S6lQ==
X-Gm-Message-State: AOAM531ddHFYiSY0utQM53cCAH0kavw6QYTa8uTXzDthigkMhkYyGnB9
 AwoOH5SFOF/lVRaPA78fVmkLO68K+SHBYw==
X-Google-Smtp-Source: ABdhPJxkK6LqrPJ4F2Ki4aiYyeiqUsQhwpmh0qvF9TzjunE0t4FgnSBmq72jNQ67yZ2XkXBOMvs4iQ==
X-Received: by 2002:a63:f62:: with SMTP id 34mr25909411pgp.159.1634601681515; 
 Mon, 18 Oct 2021 17:01:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 16/16] target/riscv: Compute mstatus.sd on demand
Date: Mon, 18 Oct 2021 17:01:08 -0700
Message-Id: <20211019000108.3678724-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 00:01:41 -0000

The position of this read-only field is dependent on the
current cpu width.  Rather than having to compute that
difference in many places, compute it only on read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c |  3 +--
 target/riscv/csr.c        | 37 ++++++++++++++++++++++---------------
 target/riscv/translate.c  |  5 ++---
 3 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 429afd1f48..0d1132f39d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -185,10 +185,9 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
 
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
-    uint64_t sd = riscv_cpu_mxl(env) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
     uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL | sd;
+                            MSTATUS64_UXL;
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c4a479ddd2..69e4d65fcd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -477,10 +477,28 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
 }
 
 /* Machine Trap Setup */
+
+/* We do not store SD explicitly, only compute it on demand. */
+static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
+{
+    if ((status & MSTATUS_FS) == MSTATUS_FS ||
+        (status & MSTATUS_XS) == MSTATUS_XS) {
+        switch (xl) {
+        case MXL_RV32:
+            return status | MSTATUS32_SD;
+        case MXL_RV64:
+            return status | MSTATUS64_SD;
+        default:
+            g_assert_not_reached();
+        }
+    }
+    return status;
+}
+
 static RISCVException read_mstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    *val = env->mstatus;
+    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus);
     return RISCV_EXCP_NONE;
 }
 
@@ -498,7 +516,6 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 {
     uint64_t mstatus = env->mstatus;
     uint64_t mask = 0;
-    int dirty;
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
@@ -520,12 +537,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
-            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
-    } else {
-        mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+    if (riscv_cpu_mxl(env) == MXL_RV64) {
         /* SXL and UXL fields are for now read only */
         mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
         mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
@@ -798,13 +810,8 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
 {
     target_ulong mask = (sstatus_v1_10_mask);
 
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        mask |= SSTATUS32_SD;
-    } else {
-        mask |= SSTATUS64_SD;
-    }
-
-    *val = env->mstatus & mask;
+    /* TODO: Use SXL not MXL. */
+    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index de013fbf9b..35245aafa7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -280,7 +280,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
 
     if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
@@ -288,7 +287,7 @@ static void mark_fs_dirty(DisasContext *ctx)
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_temp_free(tmp);
     }
@@ -299,7 +298,7 @@ static void mark_fs_dirty(DisasContext *ctx)
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
         tcg_temp_free(tmp);
     }
-- 
2.25.1


