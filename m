Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8E0C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:41:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGUR-0002D1-NT; Thu, 21 Dec 2023 05:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUM-0001VA-Sm; Thu, 21 Dec 2023 05:41:14 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUF-00055K-G8; Thu, 21 Dec 2023 05:41:13 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d22d3e751so10253485e9.1; 
 Thu, 21 Dec 2023 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703155264; x=1703760064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rye7SEwEpHGno4AHmNtYhB26rqF5AqoDV8mljGrNQW0=;
 b=Ct56OjSI5CAJI772Fnos3badUHM0/QTm2DxjyciUhIf2fug6rNv8+CLbU+MCPfoVRI
 jBbBl3+OAJaxqvXAQp77sEw1A0s/cF/IHJtUuCU/jhX5JUivHlr7b4mRqT6t272K/RVe
 gGscgK3PGdTzsscqRSZ/g+fjOq0uVIRKgp5ijQiiOGMpThGn38SbvjzvwOTkqXD+LLQv
 e/Siv4hYV5b/4SNo1Vti791KT/+zOMP0iL00hQ7cAnvREMHB8DYSebIkBUkBZMQtMDF3
 iSdFyf6EeFLUJwdQ54QghWWXIs7yqTOtxp7sNHJWY54h0gkvTf0gJc/B+CbX8/nzG3Gu
 5o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155264; x=1703760064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rye7SEwEpHGno4AHmNtYhB26rqF5AqoDV8mljGrNQW0=;
 b=kjs9DApjgFUN0FvUgJTpcNW7Uu1mVe0NOXIXHACEKnJUboWGdmVt4EsPTMo1whNyOW
 eUaYOjE+DDylkfKXS0iU3khkFWZ6tRxBOig98zWbXh9llgxXkXhIuKv0fPEgZ4pL+AF2
 TYVrydYY7PDZ1M985+75flJ8a44R5mDUmrCm3RPsE/uSGgwnRZ86PwsPWFP8HblbbB8a
 H0jtZDbcJZR1gckcWFNzD8QvEc8/P0+7OYIY+g4S+odk7J6mcRVsdXcS8IoUOlECZaTf
 DGzSLJsQ087p4Yt7CJay6PP/qPGdrK7NwlgO4VvR53rZDBz9XFvyFmk2D3US6BQbmN2s
 Qkwg==
X-Gm-Message-State: AOJu0Yzjkqv9eGlrVeluamr0a1tYVR9PdXIFH//dXxk/QHrNmhHqh6PU
 Nbf4Ob4LB64FPtKjYkbp6dw=
X-Google-Smtp-Source: AGHT+IHCYpMLR4kTnXjmv1/IJMHedM1hfae13cgStTMXjZNM9TdBPTBLQbT3JrlgK6JKERobCG6WrA==
X-Received: by 2002:a7b:ca5a:0:b0:40b:5e4a:234c with SMTP id
 m26-20020a7bca5a000000b0040b5e4a234cmr345177wml.78.1703155263878; 
 Thu, 21 Dec 2023 02:41:03 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 bh20-20020a05600c3d1400b0040d15dcb77asm10633674wmb.23.2023.12.21.02.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:41:03 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
Date: Thu, 21 Dec 2023 10:40:35 +0000
Message-Id: <20231221104035.1287244-7-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221104035.1287244-1-me@deliversmonkey.space>
References: <20231221104035.1287244-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wm1-x332.google.com
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


