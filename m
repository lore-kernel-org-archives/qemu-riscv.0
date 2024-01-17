Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30483C47DA2
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 14:25:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQ6qB-0005xe-7t; Wed, 17 Jan 2024 09:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rQ6q9-0005xH-Rg
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 09:24:25 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rQ6q8-0004nE-Ah
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 09:24:25 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-28ffa74cb40so111554a91.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jan 2024 06:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705501462; x=1706106262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlkiDEQSbUcxiOcelE1IKzpKtiEnrHVfzqVpep2aw+s=;
 b=Atbcf8je6B2BekL9ns7f3j2QyBGK5iPxB4365az2aW0le0w+MF48vF66W0FV/s/Jqk
 3bb0qQJOKOTkgbiXugWfu5VudWTD8h6uHzJ6GlOqjiTXz/xN4N4jFll+9eQI3OCebDp8
 bqaTyl2+SBRO69Pl2x4mkmgC/8M/m859E3gjfEV7abKavq1uVhUtqGjTgN3DdUywg8iZ
 NpqBQAzf4XnwM2xPcaKU9dETGtovny45RUHkkW1LWo4P/Da6fixB75wD/kDrtXGMIl6t
 Lv+Ijd1ovW92iMJRUfDQjt51LEy1VLwP3oaaIOpaAea1TlpmDN7dR+JU0uyRAoc5J/xv
 YAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705501462; x=1706106262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlkiDEQSbUcxiOcelE1IKzpKtiEnrHVfzqVpep2aw+s=;
 b=kajEG0zmaCpJ31W49vi+FJtlivLPFfx0RUfz7JMc49ejO31ft2Tfuj6t2WqgUBPlKX
 1kznhEOKe+/u8EyooYZdmR/y3mxgnCk8nObyjrICMH0yl0AtzFq+1tYeeJgJpptC81Cq
 ImkcbjylYDQCgRvj/rkQzaoGdewWBdIL0HfZLE/rf5BuL/i7ATQ0CH4QCsESXcvSpXSC
 pGp4DbvQaYyt3kUeSa7z/t8o6IMEw7JpGP6usxVCJnTFztOtdCJAPykBZJCPytCV/uHN
 W7P8FBlR0KZEgPcTTJ4m+pVy6S3fl+7a0WamLw0Xe5ZJGLCsVP3tlYkPSzo1BBSRR1KU
 oYdg==
X-Gm-Message-State: AOJu0YzLWSOiHLdTvUe2FlSDF/apxinCkGeAPvfSk72FyIVmRd2FW9Uf
 7HX3YjGJ/P22DfB5ecJEgRg1RRamtGn+l6rgjOYRtwHG5+8=
X-Google-Smtp-Source: AGHT+IHpgPcmeGAG4mBWuJtWQJN+6P19aRCMHQI0ncWyzaKhnWn0gcvSOprfx/HZ1L63KZ80ougcaQ==
X-Received: by 2002:a17:90b:1b0b:b0:28d:2e64:88ae with SMTP id
 nu11-20020a17090b1b0b00b0028d2e6488aemr15094731pjb.2.1705501462141; 
 Wed, 17 Jan 2024 06:24:22 -0800 (PST)
Received: from brahaspati.localdomain ([49.37.250.249])
 by smtp.gmail.com with ESMTPSA id
 mf15-20020a17090b184f00b0028cef2025ddsm14277657pjb.15.2024.01.17.06.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 06:24:21 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v2 1/2] target/riscv: Convert sdtrig functionality from
 property to an extension
Date: Wed, 17 Jan 2024 19:54:11 +0530
Message-Id: <20240117142412.1615505-2-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117142412.1615505-1-hchauhan@ventanamicro.com>
References: <20240117142412.1615505-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The debug trigger (sdtrig) capability is controlled using the debug property.
The sdtrig is an ISA extension and should be treated so. The sdtrig extension
may or may not be implemented in a system. Therefore, it must raise an illegal
instruction exception when it is disabled and its CSRs are accessed.

This patch removes the "debug" property and replaces it with ext_sdtrig extension.
It also raises an illegal instruction exception when the extension is disabled and
its CSRs are accessed.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/cpu.c        | 7 +++----
 target/riscv/cpu_cfg.h    | 2 +-
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/machine.c    | 2 +-
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b07a76ef6b..c770a7e506 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -909,7 +909,7 @@ static void riscv_cpu_reset_hold(Object *obj)
     set_default_nan_mode(1, &env->fp_status);
 
 #ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.debug) {
+    if (cpu->cfg.ext_sdtrig) {
         riscv_trigger_reset_hold(env);
     }
 
@@ -1068,7 +1068,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     riscv_cpu_register_gdb_regs_for_features(cs);
 
 #ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.debug) {
+    if (cpu->cfg.ext_sdtrig) {
         riscv_trigger_realize(&cpu->env);
     }
 #endif
@@ -1393,6 +1393,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
+    MULTI_EXT_CFG_BOOL("x-sdtrig", ext_sdtrig, true),
     MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
     MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
 
@@ -1480,8 +1481,6 @@ Property riscv_cpu_options[] = {
 };
 
 static Property riscv_cpu_properties[] = {
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
-
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb190..341ebf726a 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -109,6 +109,7 @@ struct RISCVCPUConfig {
     bool ext_zvfbfwma;
     bool ext_zvfh;
     bool ext_zvfhmin;
+    bool ext_sdtrig;
     bool ext_smaia;
     bool ext_ssaia;
     bool ext_sscofpmf;
@@ -145,7 +146,6 @@ struct RISCVCPUConfig {
     uint16_t cboz_blocksize;
     bool mmu;
     bool pmp;
-    bool debug;
     bool misa_w;
 
     bool short_isa_string;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e7e23b34f4..3f7c2f1315 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -126,7 +126,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
              ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
     }
 
-    if (cpu->cfg.debug && !icount_enabled()) {
+    if (cpu->cfg.ext_sdtrig && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c50a33397c..8dbb49aa88 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -543,7 +543,7 @@ static RISCVException have_mseccfg(CPURISCVState *env, int csrno)
 
 static RISCVException debug(CPURISCVState *env, int csrno)
 {
-    if (riscv_cpu_cfg(env)->debug) {
+    if (riscv_cpu_cfg(env)->ext_sdtrig) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 72fe2374dc..8f9787a30f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -231,7 +231,7 @@ static bool debug_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
 
-    return cpu->cfg.debug;
+    return cpu->cfg.ext_sdtrig;
 }
 
 static int debug_post_load(void *opaque, int version_id)
-- 
2.34.1


