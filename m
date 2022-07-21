Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEY9u-0007Tb-71
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 11:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9s-0007Ql-8p
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 11:32:12 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9q-0002e2-Fc
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 11:32:11 -0400
Received: by mail-pg1-x532.google.com with SMTP id 72so2031488pge.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Jul 2022 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FEaCaWPBt3o0uBjXHJwDQO3bM7CGbAFdhMu5uAD/Qc4=;
 b=Ir9syJTXxQFbx2YPVoEBnQ2W6Pb8uabgU+zJj9J6eseCWSTS9qROKpbrsf0ONTBCxJ
 ExzeOnQd4rZmORomn7/jCGAmJiqd3GUe+IuwQAU9EqvbL0Avvd61ATb0CcLNwVgmhdNp
 oell/LZVtWZvIDX22a3Qm07dpZ/PavUsStSTYa4qEf6fShQtq42Ju+uGxotpN8C5EO8W
 kznpK5U0Et0shl6wJLArzUeJjv5dy5TKkE9tUpHQ/OKNk3xtQr2X8NLKpALBul9gFbla
 EtqtxRdEAuqJX9ll43i0TbK819ydZZHyLtzRD98X2DDqEtrhpo8UNCT8bhhOXotkThtO
 8G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEaCaWPBt3o0uBjXHJwDQO3bM7CGbAFdhMu5uAD/Qc4=;
 b=QmNZ2pRC/0k77T9QshtAYw8zQMeM4Cr2tQJoXadBCWc7h9k7AFg9b9iPasNq8Nf0Cb
 yZiOUKw4eLtOFZju10kNURks+wBK5zxbArjetJx922yTgvPxYz/DWA3+OPGqV+iaB844
 8I5b/o34pRpTjWKVtrb4WmjgfylKkM2KNfphnbFFZHUs5Q2IVxku9MuArrv6Oj6ZSzC3
 TYqBPjid8NoNcRYCnNgkyIkVkIKDLLkpYffjdHLdqc2cXRmPt6XfEEwxOJnRNviY7acx
 WCo8W24WQl3vd4ZeH4Ce5kHnv1mNMWr0VyOJNzO2G2TskOKp9h+BvMaGD2YpS4aJNDbu
 7Ggg==
X-Gm-Message-State: AJIora8pzPOroZrXq1VQelKCdp/kqMRnr/f66r2YY5Q5hNMQW7juQvvE
 NtjbYCfcQFpjdy2BnpCp9gnW2w==
X-Google-Smtp-Source: AGRyM1sMJm0FL+XaUAyO2s1y7bIT/IKQ54dTucrDBKonLRsKxEp6CqEavmeXTLFj5l335AKs1sNCrA==
X-Received: by 2002:a05:6a00:1350:b0:52b:89ce:3326 with SMTP id
 k16-20020a056a00135000b0052b89ce3326mr15382120pfu.6.1658417529040; 
 Thu, 21 Jul 2022 08:32:09 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([182.70.95.50])
 by smtp.googlemail.com with ESMTPSA id
 f4-20020a170902684400b0016bdf0032b9sm1814379pln.110.2022.07.21.08.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:32:08 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v6 3/5] target/riscv: smstateen check for fcsr
Date: Thu, 21 Jul 2022 21:01:34 +0530
Message-Id: <20220721153136.377578-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721153136.377578-1-mchitale@ventanamicro.com>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Jul 2022 15:32:12 -0000

If smstateen is implemented and sstateen0.fcsr is clear then the
floating point operations must return illegal instruction exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c                        | 23 ++++++++++++++
 target/riscv/insn_trans/trans_rvf.c.inc   | 38 +++++++++++++++++++++--
 target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
 3 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab06b117f9..a597b6cbc7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
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
@@ -1876,6 +1880,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
                                       target_ulong new_val)
 {
     uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
 
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
@@ -1924,6 +1931,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -1973,6 +1984,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2024,6 +2039,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_hstateenh(env, csrno, wr_mask, new_val);
 }
 
@@ -2083,6 +2102,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
 
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
     return write_sstateen(env, csrno, wr_mask, new_val);
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index a1d3eb52ad..c43c48336b 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,9 +24,43 @@
             return false; \
 } while (0)
 
+#ifndef CONFIG_USER_ONLY
+#define SMSTATEEN_CHECK(ctx) do {\
+    CPUState *cpu = ctx->cs; \
+    CPURISCVState *env = cpu->env_ptr; \
+    if (ctx->cfg_ptr->ext_smstateen && \
+        (env->priv < PRV_M)) { \
+        uint64_t stateen = env->mstateen[0]; \
+        uint64_t hstateen = env->hstateen[0]; \
+        uint64_t sstateen = env->sstateen[0]; \
+        if (!(stateen & SMSTATEEN_STATEN)) {\
+            hstateen = 0; \
+            sstateen = 0; \
+        } \
+        if (ctx->virt_enabled) { \
+            stateen &= hstateen; \
+            if (!(hstateen & SMSTATEEN_STATEN)) {\
+                sstateen = 0; \
+            } \
+        } \
+        if (env->priv == PRV_U && has_ext(ctx, RVS)) {\
+            stateen &= sstateen; \
+        } \
+        if (!(stateen & SMSTATEEN0_FCSR)) { \
+            return false; \
+        } \
+    } \
+} while (0)
+#else
+#define SMSTATEEN_CHECK(ctx)
+#endif
+
 #define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx->cfg_ptr->ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
+    if (!has_ext(ctx, RVF)) { \
+        SMSTATEEN_CHECK(ctx); \
+        if (!ctx->cfg_ptr->ext_zfinx) { \
+            return false; \
+        } \
     } \
 } while (0)
 
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5d07150cd0..b165ea9d58 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -17,24 +17,28 @@
  */
 
 #define REQUIRE_ZFH(ctx) do { \
+    SMSTATEEN_CHECK(ctx); \
     if (!ctx->cfg_ptr->ext_zfh) {      \
         return false;         \
     }                         \
 } while (0)
 
 #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
+    SMSTATEEN_CHECK(ctx); \
     if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
         return false;                  \
     }                                  \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
+    SMSTATEEN_CHECK(ctx); \
     if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
         return false;                         \
     }                                         \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
+    SMSTATEEN_CHECK(ctx); \
     if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin ||          \
           ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
         return false;                                        \
-- 
2.25.1


