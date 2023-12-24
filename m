Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA917C46CD2
	for <qemu-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 04:49:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rHGPt-0002gj-7d; Sat, 23 Dec 2023 23:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPn-0002dO-TL; Sat, 23 Dec 2023 23:48:39 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPm-0000i4-7K; Sat, 23 Dec 2023 23:48:39 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3368fe4dcb1so1828829f8f.1; 
 Sat, 23 Dec 2023 20:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703393316; x=1703998116; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vf4COeV+6XbvhWIsNRcj4LsVU+xsP3viSVMqL17wAsQ=;
 b=HcTYjQlPu8hrKvF94frGhAi9dORO2emY/+UMZz7tUMvMlDru901oNwiWu4AKbVDCIJ
 N+A8YNKVU71P0snsWgDf4HUyC9aC4tne9l4X6OG1Sl4QsZz9Jr3PS8hn6aMFDtIYNLQi
 TbFBArt8ta4snJ4lou18J8iSc7rr4hxEMu8IugoO8CrnFOPXR0j4syifMcSN0Pueshpx
 Dj3QIZsxgTtG1gtvMwbcdB0Su7AkjSgxfQhlYkiQYA60fwvUbcIXwOg9Gr0r6UHTvdGh
 4Ld5VyxIdKa2r8TH93zg6wdAVPxJOFzebRKHnwISMFXF04wWE8rECSoh9htFAsEMHrvm
 xKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703393316; x=1703998116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vf4COeV+6XbvhWIsNRcj4LsVU+xsP3viSVMqL17wAsQ=;
 b=HueylHhD+6mGtfcAbAcEUDljqbFpbrFG5uHQ7jbSe3zIAFZi54ztO4WyH8V9ZEGxHP
 KbN5gnDnU7q54j3MOGbZXnuLrrwXNQRTlgMZz8hu3ugv1cm/sM92cXIUcpNnpSKo1U70
 U3MsPB9tCYYejfj+pxyC6tdeTH1U0jN97qk4BFG/y0qkmEwZoZVBouFFXlZqGRqBpTLf
 C0Mgzd9IX4GPZob2od59yjYeEHYZTZiSxLjeyP57eUHzB0eVG+H3KIdo6v2VWRSoK0nh
 PM8mprdEIKqyNeFuZHiMrFNnZl6megaBasRF770lfOg5nBAVlt+E3YuCooaijplZ3z5V
 Anbw==
X-Gm-Message-State: AOJu0YzG7gPXJh6RzCldV1DtAw54DHHOuxKYl4XU6C8jVeq5ZJUUyXFf
 uIxYR7t13L2+PHuipCPhvOU=
X-Google-Smtp-Source: AGHT+IG175cXk6BQXGQOYB3wLDU/OveXdnJ0uc+yzGvlXWflTYGflNeU5BRTA/tzx2TqvPn/K+QOkA==
X-Received: by 2002:a05:6000:1367:b0:333:2fd2:815b with SMTP id
 q7-20020a056000136700b003332fd2815bmr2214004wrz.120.1703393316568; 
 Sat, 23 Dec 2023 20:48:36 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d530e000000b0033668ac65ddsm7639513wrv.25.2023.12.23.20.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Dec 2023 20:48:35 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v2 4/6] target/riscv: Add pointer masking tb flags
Date: Sun, 24 Dec 2023 04:48:10 +0000
Message-Id: <20231224044812.2072140-5-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224044812.2072140-1-me@deliversmonkey.space>
References: <20231224044812.2072140-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wr1-x429.google.com
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
 target/riscv/cpu.h        | 15 +++++++++------
 target/riscv/cpu_helper.c |  3 +++
 target/riscv/translate.c  |  5 +++++
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c607a94bba..038b86db4b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -538,14 +538,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)
 FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
 FIELD(TB_FLAGS, XL, 16, 2)
-FIELD(TB_FLAGS, VTA, 18, 1)
-FIELD(TB_FLAGS, VMA, 19, 1)
+/* If pointer masking should be applied and address sign extended */
+FIELD(TB_FLAGS, PM_PMM, 18, 2)
+FIELD(TB_FLAGS, PM_SIGNEXTEND, 20, 1)
+FIELD(TB_FLAGS, VTA, 21, 1)
+FIELD(TB_FLAGS, VMA, 22, 1)
 /* Native debug itrigger */
-FIELD(TB_FLAGS, ITRIGGER, 20, 1)
+FIELD(TB_FLAGS, ITRIGGER, 23, 1)
 /* Virtual mode enabled */
-FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
-FIELD(TB_FLAGS, PRIV, 22, 2)
-FIELD(TB_FLAGS, AXL, 24, 2)
+FIELD(TB_FLAGS, VIRT_ENABLED, 24, 1)
+FIELD(TB_FLAGS, PRIV, 25, 2)
+FIELD(TB_FLAGS, AXL, 27, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 47f325294e..7c33369cf1 100644
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
index 6b4b9a671c..1eb501e0d3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -103,6 +103,9 @@ typedef struct DisasContext {
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
+    /* pointer masking extension */
+    uint8_t pm_pmm;
+    bool pm_signext;
     /* Use icount trigger for native debug */
     bool itrigger;
     /* FRM is known to contain a valid value. */
@@ -1176,6 +1179,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
+    ctx->pm_pmm = FIELD_EX32(tb_flags, TB_FLAGS, PM_PMM);
+    ctx->pm_signext = FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
-- 
2.34.1


