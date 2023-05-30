Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF198C77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:23:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q3zG6-00028E-1B; Tue, 30 May 2023 09:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFc-0001zO-AR
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:19:02 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q3zFS-0006pk-MM
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 09:18:56 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-96fab30d1e1so922868766b.0
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 06:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1685452728; x=1688044728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lN5eouJcfjPPZk9JC9Sc0CdKdmmbFl74Xe8HWwm7eI=;
 b=UbV+kmvIzmjGtJspyF0GeX75mHy8X19hO9LnBtl1RsrJubk5B6DXJSdwWeQnztIsOP
 FVjNOa+zzw8GWLQ4+m+FlVMBnCQ3D6Oh9jx6lDsv5hFYZ5p7DpkPy0b57Znn0ZA4P2cY
 hvwzuBdkQmW9Z4ioLeZssDpG7ydAZrpLzeAh8uJ0YtY0n4D106Ouv8NNBQdC3Db/x0S8
 CJkpJ9OU27ZpNFAJIav1fus0C9t5z45W83JHhhBTpDiivv87VDJuMD2KaY9PvXMVZSfR
 r+9674JvoTWZOTnD6UgEyMbJC8B0lC4biVUiV+NsR00Moz3dsPblQUEyKNzGAb0Tx6dX
 2Odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685452728; x=1688044728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6lN5eouJcfjPPZk9JC9Sc0CdKdmmbFl74Xe8HWwm7eI=;
 b=FxFkbvn6n39jBR471ff5y39NVMwm+7bVGM8EjsvzMcsLjHG98BhPmvf84N7iTlLkLW
 psLj9P/4eCjTfF5LrawaFLlEQTI+8omr/Iag3Y7WFCQtbkGVh8Q5jTDAGikQYRQKDf6Q
 nYBPVY9Jvs+GRtKQZMj2jDuPOn2jroy7UiYXREmMKInl9JaifYiovRMWeDsjHqp7DfyP
 LfbRYi84IPFuo/kfuMqscdBFxyKr/RfyYkGmBbQF0hmt30Yk3kbJrhnITCeLgKlMqbPl
 db7Yx+zqlDNdo776kLQLyRQDJArGSUb9mGWLGQs44aJy4Df+Ocg59M+w8p1iNNsGc3Nt
 yqnA==
X-Gm-Message-State: AC+VfDz73HoonHvUR1zuqH9ifdUSlaYQkr9x3WAtUVZJav73sPDXT1/y
 4uKlD6wddl0CY+AjYQD6zxsoEEkQbRCT6hW3Qcc=
X-Google-Smtp-Source: ACHHUZ7fCzVIUsAbBT518LlZVMbp7shwSapV80KMelWOKp8/6zku0vJFFHshskSI1Rvic/EZiKhvXQ==
X-Received: by 2002:a17:906:ee88:b0:96f:aed9:2520 with SMTP id
 wt8-20020a170906ee8800b0096faed92520mr1997597ejb.21.1685452728440; 
 Tue, 30 May 2023 06:18:48 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm7376156ejc.66.2023.05.30.06.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:18:47 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/9] target/riscv: Use xl instead of mxl for disassemble
Date: Tue, 30 May 2023 15:18:35 +0200
Message-Id: <20230530131843.1186637-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x631.google.com
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Disassemble function(plugin_disas, target_disas, monitor_disas) will
always call set_disas_info before disassembling instructions.

plugin_disas  and target_disas will always be called under a TB, which
has the same XLEN.

We can't ensure that monitor_disas will always be called under a TB,
but current XLEN will still be a better choice, thus we can ensure at
least the disassemble of the nearest one TB is right.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db0875fb43..5b7818dbd1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -818,8 +818,9 @@ static void riscv_cpu_reset_hold(Object *obj)
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     RISCVCPU *cpu = RISCV_CPU(s);
+    CPURISCVState *env = &cpu->env;
 
-    switch (riscv_cpu_mxl(&cpu->env)) {
+    switch (env->xl) {
     case MXL_RV32:
         info->print_insn = print_insn_riscv32;
         break;
-- 
2.40.1


