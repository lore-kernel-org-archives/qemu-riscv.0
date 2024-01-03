Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3965DC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 18:58:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL6Qv-0005Ah-Mr; Wed, 03 Jan 2024 13:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qt-00059X-AK; Wed, 03 Jan 2024 13:57:39 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qr-00042T-Ct; Wed, 03 Jan 2024 13:57:38 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a2768b78a9eso139340766b.0; 
 Wed, 03 Jan 2024 10:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704308255; x=1704913055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=geTzYZ7pnQRsHsbIJKqtgIpr5fN2iDhGOj5vL6bsg7c=;
 b=jtxegwRhPgwzxPKtMN0lk+1UQ2gHxsjVHMUA//pugqxvl/+T4Gliv1WUenBXPwXb42
 5tW2CRLUvYBB3iFYcBlF0wZXgUbVAFWjt/8wDBv+wMEIzlvsnc9jbVfJvG6EumHi5FEW
 +30Cofii+q20S3+3JgYPxs5z37ZQLdY34O54UbgP5SljDIYhrNSylZSsXQPkRUU5Fh9s
 8md+SmABsMkLt3tVPjhx9qGLgA88Jfi3s6+clg5p6izhfsB+p//z/G1zNA3PHh/rbOLe
 RPhDPEpIcjT9UParOFFFZQ1Y1lzaK3h+QY26Pllt30QvRnowf9cXWr07XTixrI+g7yeg
 WyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704308255; x=1704913055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=geTzYZ7pnQRsHsbIJKqtgIpr5fN2iDhGOj5vL6bsg7c=;
 b=b2crIxGOOY6ZyJJ9CSl42OmClhnm1MEX59GWIl4wJbcwx4P0LwCCBAN8RBjXnX5ARR
 byjEkFE11Co2anSNhsIaVeI5FsaZmpYyUbb8xfLjbZGlxvr+AnTtogsRJCngjhMb1zwk
 iOQJH4ixWa6ve/7cojdqqeRIgViortgjGmxhl9wb/Oom9e3yKAzX71CXnHnm+Enz33yx
 scdno1v/sGLMt7o7J+VJP8MmmvqXZe+u6Tz5PwU04sc3QoCViSC+nzMHB4kxv6lVslPZ
 xmSsf7a6fLIPanYN+Y3gm4M1/iiHuNP892s/LpguTir/rxmec2lMqJxIDGmwXFOKp3Ff
 KNiQ==
X-Gm-Message-State: AOJu0YyuVrW6bOeF25BNXbizx0DcMatFSCGJ0M+fxsO63kYNBYcrWNM4
 26BfvkKF3u6UJavuvn7RwH0=
X-Google-Smtp-Source: AGHT+IGeoy8XhYrtjRvKtAdi4/Q8AwImFeufoVp9TqAeg2oYyX+h9rUwBKf0v0CImAP0yK7byphKew==
X-Received: by 2002:a17:906:4ad5:b0:a26:997e:fc9e with SMTP id
 u21-20020a1709064ad500b00a26997efc9emr1513758ejt.3.1704308255469; 
 Wed, 03 Jan 2024 10:57:35 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm3897915ejc.105.2024.01.03.10.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 10:57:34 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v3 4/6] target/riscv: Add pointer masking tb flags
Date: Wed,  3 Jan 2024 18:57:14 +0000
Message-Id: <20240103185716.1790546-5-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103185716.1790546-1-me@deliversmonkey.space>
References: <20240103185716.1790546-1-me@deliversmonkey.space>
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
 target/riscv/cpu.h        |  3 +++
 target/riscv/cpu_helper.c |  3 +++
 target/riscv/translate.c  | 11 +++++++++++
 3 files changed, 17 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c607a94bba..4df160494f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -546,6 +546,9 @@ FIELD(TB_FLAGS, ITRIGGER, 20, 1)
 FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
 FIELD(TB_FLAGS, PRIV, 22, 2)
 FIELD(TB_FLAGS, AXL, 24, 2)
+/* If pointer masking should be applied and address sign extended */
+FIELD(TB_FLAGS, PM_PMM, 26, 2)
+FIELD(TB_FLAGS, PM_SIGNEXTEND, 28, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4c34e12ee3..b8d8a622f3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -68,6 +68,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     RISCVCPU *cpu = env_archcpu(env);
     RISCVExtStatus fs, vs;
     uint32_t flags = 0;
+    bool pm_signext = !riscv_cpu_bare_mode(env);
 
     *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
     *cs_base = 0;
@@ -135,6 +136,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
     flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
+    flags = FIELD_DP32(flags, TB_FLAGS, PM_PMM, riscv_pm_get_pmm(env));
+    flags = FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, pm_signext);
 
     *pflags = flags;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6b4b9a671c..8ac2819fa5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -103,6 +103,9 @@ typedef struct DisasContext {
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
+    /* actual address width */
+    uint8_t addr_width;
+    bool addr_signed;
     /* Use icount trigger for native debug */
     bool itrigger;
     /* FRM is known to contain a valid value. */
@@ -1176,6 +1179,14 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
+    if (get_xl(ctx) == MXL_RV32) {
+        ctx->addr_width = 32;
+        ctx->addr_signed = false;
+    } else {
+        int pm_pmm = FIELD_EX32(tb_flags, TB_FLAGS, PM_PMM);
+        ctx->addr_width = 64 - riscv_pm_get_pmlen(pm_pmm);
+        ctx->addr_signed = FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
+    }
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
-- 
2.34.1


