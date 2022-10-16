Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ok33u-0005zn-IM
	for mharc-qemu-riscv@gnu.org; Sun, 16 Oct 2022 08:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33s-0005vi-Qg
 for qemu-riscv@nongnu.org; Sun, 16 Oct 2022 08:48:12 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33p-0003RT-Hw
 for qemu-riscv@nongnu.org; Sun, 16 Oct 2022 08:48:11 -0400
Received: by mail-pf1-x431.google.com with SMTP id y191so8888888pfb.2
 for <qemu-riscv@nongnu.org>; Sun, 16 Oct 2022 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlYT2CFS9VLgac+8urgCDXLQFwa1MdpPv8QF4J8bhXc=;
 b=KFT0+9MFIFi5x2UhixIIN01WTwwa4TW/EbcWdabkAZRmBD47lqmw2BL4nCKEcqMkpP
 k6btRZBEqqR6tyk9Ou84v6cXEOGjpJggQXz4NBlytAX+kIPFeAkNFU+df5gFAIQx8zwp
 8CMsaEJ1fh5NKMrmH0Mi/erhqhpaToLFJdo5Up/ca1dAXYtHpOA1L5fRN/JdfZTD33HS
 ayi2LJR8c1ev6QtJX9kcKXKOj1bMoYd4JHHOaeiTn0AHicf3x2GgDJqFM4dCsWqpFDXN
 qOAyyOFjl7pj0xpad2wS5FpPCk2U9ZEm9yIQX5pxCveEq7dGj3umbM/qqZSMUu9tL68/
 m8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jlYT2CFS9VLgac+8urgCDXLQFwa1MdpPv8QF4J8bhXc=;
 b=2B9Ck7kKEgb//QOBSVASGHrAyEogT4ntpMUdrxc0sCGGf725FcgTzdfvGf3Y8w1ky/
 Aaz9ovNW+mt7TA/Nqw0SE3FKJZkEV/EWvur59W5ykCVsWVD1VKqQxPMPhJGiPsXuMFgT
 SEmODPhvh8bfPMtppTidFzwl8dRyBUUF7DsEWidqDj8pxfmAH+olbABF66mDQ6BuQcUP
 NqfZNkEZlDtL402zc8neWWscgFUHixaZgfhGb7atFwat2EdiNlvujTv5eLe/ozr/e6m/
 GCENnhoflf7t9rg9QdnlA/A83OcM9LJecYkitgl0HLntv+dDPZCVrFG2LjAtvRWs4Oq8
 32YQ==
X-Gm-Message-State: ACrzQf3MN8KDAEP8Prnbb/Wre6whET3Ta2bZyexK616+nfIQjiNuyGLb
 MsST1ETM3oSYT7ejTPeLDxeSxmGahg0+jQ==
X-Google-Smtp-Source: AMsMyM5b5txCv1xe3AZ64qBBXsDdshL52CeZ9KskPd2t1m+3RE5RAN3TvryovC5LE+wuC87jM2HamA==
X-Received: by 2002:a63:8243:0:b0:463:10d9:f150 with SMTP id
 w64-20020a638243000000b0046310d9f150mr6274058pgd.242.1665924488069; 
 Sun, 16 Oct 2022 05:48:08 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:57ef:25d:3187:d4f6:127:22d3])
 by smtp.googlemail.com with ESMTPSA id
 v18-20020a634812000000b0043b565cb57csm4444894pga.73.2022.10.16.05.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:48:07 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v11 4/5] target/riscv: smstateen check for fcsr
Date: Sun, 16 Oct 2022 18:17:25 +0530
Message-Id: <20221016124726.102129-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221016124726.102129-1-mchitale@ventanamicro.com>
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 16 Oct 2022 12:48:13 -0000

If smstateen is implemented and sstateen0.fcsr is clear then the floating point
operations must return illegal instruction exception or virtual instruction
trap, if relevant.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/csr.c                        | 23 ++++++++++++
 target/riscv/insn_trans/trans_rvf.c.inc   | 43 +++++++++++++++++++++--
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
 3 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 71236f2b5d..8b25f885ec 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
         !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
+
+    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
+    }
 #endif
     return RISCV_EXCP_NONE;
 }
@@ -2023,6 +2027,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -2059,6 +2066,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2096,6 +2107,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2135,6 +2150,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2182,6 +2201,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index a1d3eb52ad..93657680c6 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,9 +24,46 @@
             return false; \
 } while (0)
 
-#define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx->cfg_ptr->ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
+#ifndef CONFIG_USER_ONLY
+static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
+{
+    CPUState *cpu = ctx->cs;
+    CPURISCVState *env = cpu->env_ptr;
+    uint64_t stateen = env->mstateen[index];
+
+    if (!ctx->cfg_ptr->ext_smstateen || env->priv == PRV_M) {
+        return true;
+    }
+
+    if (ctx->virt_enabled) {
+        stateen &= env->hstateen[index];
+    }
+
+    if (env->priv == PRV_U && has_ext(ctx, RVS)) {
+        stateen &= env->sstateen[index];
+    }
+
+    if (!(stateen & SMSTATEEN0_FCSR)) {
+        if (ctx->virt_enabled) {
+            ctx->virt_inst_excp = true;
+        }
+        return false;
+    }
+
+    return true;
+}
+#else
+#define smstateen_fcsr_check(ctx, index) (true)
+#endif
+
+#define REQUIRE_ZFINX_OR_F(ctx) do { \
+    if (!has_ext(ctx, RVF)) { \
+        if (!ctx->cfg_ptr->ext_zfinx) { \
+            return false; \
+        } \
+        if (!smstateen_fcsr_check(ctx, 0)) { \
+            return false; \
+        } \
     } \
 } while (0)
 
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5d07150cd0..6c2e338c0a 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -20,18 +20,27 @@
     if (!ctx->cfg_ptr->ext_zfh) {      \
         return false;         \
     }                         \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
     if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
         return false;                  \
     }                                  \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
     if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
         return false;                         \
     }                                         \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
@@ -39,6 +48,9 @@
           ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
         return false;                                        \
     }                                                        \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
 } while (0)
 
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
-- 
2.25.1


