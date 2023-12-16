Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC429C46CCD
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 13:53:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rEV5I-0001C8-Gy; Sat, 16 Dec 2023 08:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5G-0001AH-MJ; Sat, 16 Dec 2023 08:52:02 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5E-0001Eh-Fc; Sat, 16 Dec 2023 08:52:02 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a2331caab22so17525966b.3; 
 Sat, 16 Dec 2023 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702734719; x=1703339519; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rye7SEwEpHGno4AHmNtYhB26rqF5AqoDV8mljGrNQW0=;
 b=KZLRur/XntCpJzAMJtdjmSb6H5hEvZHXxTODxQHQUsPSLdr9cFAslpCHdILJauAQOB
 SWWV3SH8lJ4iakVlVvokMXBPpJIR1H/uCxeh1gdt6GX0xUbI0q5Cu5sHPkJ9t5DOnI+E
 Mv+8z8+pH9LghyvhrQvbCntP8k5a7qVbn/7Jr565FkK2BYQ0gzUB3HH3TPqJx1xCAI8r
 iCMqLBRgbC7Ge/W8n9O5hiQOZ4K3oWaz0oJfNEQ+s6Cw6qAVCprdNl+4Dpy+nkBbdifc
 FLKEjr2KaFcbJDP9GvSBqL/8hVXSMjXyNBM90bANe8s0ya6PhUYsnsv5t+J21T/Elrc/
 kaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702734719; x=1703339519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rye7SEwEpHGno4AHmNtYhB26rqF5AqoDV8mljGrNQW0=;
 b=E5j7SOUOAZ/gX8sw/25iJmM7mToNki8sZuEjCL2H3yY6mrbf0T4b8/e5rqva8dGcNJ
 HY68zaAurYyeok734gGHPg3jBe1+6UgeicNXQB6bVuICjT5QZOMzczbhoJVvIkEafniu
 vtutaVU+NEmx+knuidZs7TTn1qqB4pfXCIqDb74s+gAslebuZSSQVbe1rDf3LkYLOOzI
 OhZcSsTK5Xvb3WFPEffeJDlpz771+8DA2lBqghGPwSU3chlrG3ScwebFiLNuvxpFYje7
 D3zBIcpz+cWIi/8ElHv7JFs7pTbFouL4IwJK9jQxZAlBOI4Yq+jzZM2hQODc/zN3i1Vz
 mI1w==
X-Gm-Message-State: AOJu0YyzqoaXhWsN3aycIKxYY4ifn+q8Aknrp6os7tXqVCO1Mun8Z3b0
 tzXjiCaKISQC14rMRQOaW9pCSBqbE6f6zA==
X-Google-Smtp-Source: AGHT+IHiGTCJNPe6i8tlJh/ZD1mac23zQ3jjidLcsPBKQfSG5S3c6FiPelEiM+hfstYTh2MY6T9QIQ==
X-Received: by 2002:a17:906:2984:b0:a17:d7ea:f59e with SMTP id
 x4-20020a170906298400b00a17d7eaf59emr6064454eje.48.1702734718811; 
 Sat, 16 Dec 2023 05:51:58 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 vw12-20020a170907a70c00b00a1c904675cfsm11819595ejc.29.2023.12.16.05.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 05:51:58 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: zhiwei_liu@linux.alibaba.com, baturo.alexey@gmail.com,
 richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
Date: Sat, 16 Dec 2023 13:51:36 +0000
Message-Id: <20231216135136.1597456-7-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231216135136.1597456-1-me@deliversmonkey.space>
References: <20231216135136.1597456-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.c        | 9 +++++++++
 target/riscv/cpu_helper.c | 1 +
 target/riscv/csr.c        | 4 ++++
 target/riscv/machine.c    | 1 +
 target/riscv/pmp.c        | 1 +
 5 files changed, 16 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e6571ce99..1d20e6a978 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -153,6 +153,9 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_12_0, ext_ssnpm),
+    ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_12_0, ext_smnpm),
+    ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_12_0, ext_smmpm),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
@@ -897,6 +900,7 @@ static void riscv_cpu_reset_hold(Object *obj)
     pmp_unlock_entries(env);
 #endif
     env->xl = riscv_cpu_mxl(env);
+    riscv_cpu_update_mask(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
@@ -1337,6 +1341,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
 
     MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
 
+    /* Zjpm v0.8 extensions */
+    MULTI_EXT_CFG_BOOL("ssnpm", ext_ssnpm, false),
+    MULTI_EXT_CFG_BOOL("smnpm", ext_smnpm, false),
+    MULTI_EXT_CFG_BOOL("smmpm", ext_smmpm, false),
+
     MULTI_EXT_CFG_BOOL("zca", ext_zca, false),
     MULTI_EXT_CFG_BOOL("zcb", ext_zcb, false),
     MULTI_EXT_CFG_BOOL("zcd", ext_zcd, false),
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8e2751fef4..c2bc737dd7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -723,6 +723,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
     env->xl = cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a67ba30494..5336d91dd8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1348,6 +1348,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         env->xl = cpu_recompute_xl(env);
     }
 
+    riscv_cpu_update_mask(env);
     return RISCV_EXCP_NONE;
 }
 
@@ -2039,6 +2040,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
     }
     env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
 
+    riscv_cpu_update_mask(env);
     return RISCV_EXCP_NONE;
 }
 
@@ -2093,6 +2095,8 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
     }
 
     env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+
+    riscv_cpu_update_mask(env);
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 5e9c5b43ab..41ad30c8e1 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -261,6 +261,7 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     CPURISCVState *env = &cpu->env;
 
     env->xl = cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
     return 0;
 }
 
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 893ccd58d8..2cc08e58c5 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -607,6 +607,7 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
     }
 
     env->mseccfg = val;
+    riscv_cpu_update_mask(env);
 }
 
 /*
-- 
2.34.1


