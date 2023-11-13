Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8ABC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 09:57:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2Tg3-0004zJ-EX; Mon, 13 Nov 2023 04:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r2Tg1-0004y3-55
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 04:56:17 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r2Tfy-0005Vy-2g
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 04:56:16 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53dd3f169d8so6262096a12.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 01:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1699869372; x=1700474172; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THyee81tu3w+McyXHKmAkftYlF7KiJwneRd5OF9ZWP8=;
 b=QJVzT0uUBYLyU7/xNSW+aUY9b67WICFk4Z338Z+cbFooh+D3BvV52rNpPyyS9UTqq0
 LbNcTpl6nO1I0tLfKRrAfqEuaxGWsEehzCdl08pUDpfON6IUJn0gFUBV0sB4uirKsB/L
 GU6bqcVd6/L1bKGUL8axvB5W5tYcRopem4KEN8YJGjrog3skL7FmYxwqVrx29Df4+vkn
 KVOG31KMveS9Rx7f9Cv4MbFow3j8EOw0NJHQChL67ndXgg5NHND31yvZnBdxR1RqtESj
 d6VjsbTYd9B0vWb5LusXa7JPIXrr17qGhCX+z2SLG87KXpiIkooH5zIHHLN70qcyz4+V
 VFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699869372; x=1700474172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THyee81tu3w+McyXHKmAkftYlF7KiJwneRd5OF9ZWP8=;
 b=DKXXh9FBgYyW9t1Zd6BHf+nnucFE6m3JcaHabME9DM0TothvgxWqerKFqK/gwwZfrM
 EllltftL3rtKDOm6LbNxcmvYAdkdDNAyu0d0Yj5p0U0D9QT10R3DUAJfMF/iFHsRquGu
 UnIKc7mABAj8AtSkkbl4FNWZqeilSfHubtfP89jAM/H0i8Kw2NyGYLJpaWqZXhNaA34C
 ghqyKtq0gqkNMxcMCgC3Uj7Y2v6WrtoYClgkIUSeDO2Fx5QBnBCVbK0CadafQEFdVJI9
 EBSXNKKjpAE6lSaKno6kaeFWd1YEnbmmg4afl4gQaNQkvOUquqhxYIfE56wMxvsXD/bC
 RU1w==
X-Gm-Message-State: AOJu0YxnyScREx5NSDkTOS5cL2Q/I5fWzpw1Dh/jI5Futmpy0Iut+6ob
 /y1R/KuLyRnBz5zumXYUhQfyV1wncFuS8woyfDY=
X-Google-Smtp-Source: AGHT+IHCodu2FVEwELcN4EZgABqxQTTHF6DoBJdVzQHKDjNBTjDR80JGmp9tLZsFc1JZ6kpyZ1BEoA==
X-Received: by 2002:a17:906:d8dc:b0:9c5:7f8b:bafc with SMTP id
 re28-20020a170906d8dc00b009c57f8bbafcmr4393451ejb.22.1699869372179; 
 Mon, 13 Nov 2023 01:56:12 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170906190b00b0098d2d219649sm3807321eje.174.2023.11.13.01.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 01:56:11 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 2/2] RISC-V: Add support for Ssdtso
Date: Mon, 13 Nov 2023 10:56:03 +0100
Message-ID: <20231113095605.1131443-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
References: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Christoph Müllner <christoph.muellner@vrull.eu>

The Ssdtso extension introduces a DTSO field to the {m,s,h}envcfg
register to enable TSO at run-time.  Building on top of Ztso support,
this patch treates Ssdtso just like Ztso (always execute in TSO mode),
which should be fine from a correctness perspective.

Similar like Ztso, this is expected to have little overhead on
host machines that operate in TSO mode (e.g. x86).
However, executing the TSO fences on guests without TSO, will
have a negative performance impact, regardless if TSO is enabled
in the guest or not (e.g. running a RV guest with Ssdtso and disabled
DTSO bit on an aarch64 host).

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c       | 2 ++
 target/riscv/cpu_bits.h  | 3 +++
 target/riscv/cpu_cfg.h   | 1 +
 target/riscv/csr.c       | 9 ++++++---
 target/riscv/translate.c | 2 +-
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b446e553b1..e01bc56471 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -149,6 +149,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
+    ISA_EXT_DATA_ENTRY(ssdtso, PRIV_VERSION_1_12_0, ext_ssdtso),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
@@ -1308,6 +1309,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),
     MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
     MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
+    MULTI_EXT_CFG_BOOL("ssdtso", ext_ssdtso, false),
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
 
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ebd7917d49..166f1a879d 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -751,6 +751,7 @@ typedef enum RISCVException {
 #define MENVCFG_CBIE                       (3UL << 4)
 #define MENVCFG_CBCFE                      BIT(6)
 #define MENVCFG_CBZE                       BIT(7)
+#define MENVCFG_DTSO                       BIT(8)
 #define MENVCFG_ADUE                       (1ULL << 61)
 #define MENVCFG_PBMTE                      (1ULL << 62)
 #define MENVCFG_STCE                       (1ULL << 63)
@@ -764,11 +765,13 @@ typedef enum RISCVException {
 #define SENVCFG_CBIE                       MENVCFG_CBIE
 #define SENVCFG_CBCFE                      MENVCFG_CBCFE
 #define SENVCFG_CBZE                       MENVCFG_CBZE
+#define SENVCFG_DTSO                       MENVCFG_DTSO
 
 #define HENVCFG_FIOM                       MENVCFG_FIOM
 #define HENVCFG_CBIE                       MENVCFG_CBIE
 #define HENVCFG_CBCFE                      MENVCFG_CBCFE
 #define HENVCFG_CBZE                       MENVCFG_CBZE
+#define HENVCFG_DTSO                       MENVCFG_DTSO
 #define HENVCFG_ADUE                       MENVCFG_ADUE
 #define HENVCFG_PBMTE                      MENVCFG_PBMTE
 #define HENVCFG_STCE                       MENVCFG_STCE
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index a0f951d9c1..bdf0d2bbc4 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -72,6 +72,7 @@ struct RISCVCPUConfig {
     bool ext_zihpm;
     bool ext_ztso;
     bool ext_smstateen;
+    bool ext_ssdtso;
     bool ext_sstc;
     bool ext_svadu;
     bool ext_svinval;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fde7ce1a53..ee40f01185 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2034,7 +2034,8 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
     const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
-    uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
+    uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE |
+                    MENVCFG_CBZE | MENVCFG_DTSO;
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
@@ -2084,7 +2085,8 @@ static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
 static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+    uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE |
+                    SENVCFG_CBZE | SENVCFG_DTSO;
     RISCVException ret;
 
     ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
@@ -2119,7 +2121,8 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
-    uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE |
+                    HENVCFG_CBZE | HENVCFG_DTSO;
     RISCVException ret;
 
     ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ab56051d6d..a9c2061099 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1196,7 +1196,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
-    ctx->ztso = cpu->cfg.ext_ztso;
+    ctx->ztso = cpu->cfg.ext_ztso || cpu->cfg.ext_ssdtso;
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
-- 
2.41.0


