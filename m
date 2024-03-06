Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEC0C54E41
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 17:22:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhuw0-00083h-4W; Wed, 06 Mar 2024 12:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhuvx-0007yc-HW
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:20:01 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhuvu-0000no-Mg
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:20:01 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1dbd32cff0bso571085ad.0
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709745593; x=1710350393; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgYAUZpzDwP+uZDi7NubQDu0Q2WLdoEr+XBt0Nffm4I=;
 b=cUV0Ld4iw7gu2jMqxMV6GAvqa0TI46fFTnIUi+71hq90gkbYFhcun57svMEhJ3DwoV
 HqfRVcz0g8GPVfIyM3N7EHPq3VaGD0tyBoTYqG9qXwvquF8NXLmSjnnSIgQ1Aee+GVFT
 5JiiME8xb6xF48txqkcbNnGHjwXJd8/jXEuKIzquQahRSFxZiKihY7ElIoaKGT2DxmDp
 FvRqBa1qrpMIy+tS7xTPTJFcMBYY/MkPJ62hDb56Ed5iNWfDHv1D7Z8UCObVO0tA6q9E
 aZD4cd919b3AzcAb3WA8cY5CA8fGKvNMkVkr+K0OrEqmeZQ78FKNSxUCjQDI7tAU2i2U
 vD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709745593; x=1710350393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgYAUZpzDwP+uZDi7NubQDu0Q2WLdoEr+XBt0Nffm4I=;
 b=DaEa2lmwsoNY3sLEs/YJmY1HMhnK025+78zgzlbfO2rh0o37epNXEN8FHoJzIBUtfX
 Y8ZshP7PrR6qypF5hU9WxEvVZqGSObuNol0e5J9ATgOAoGTk+fQoBlBupMGRmV1c2D0/
 KPNmAPbdShvHe6QyNrTBUD8Sy+oSGIFgBFLfF5GlhmTZ/VQx8cQhyYC1OsOlMoLEhLJP
 yMj+2OWL6p9cX5H7PjQgxKPhB9hO867/AQE7s/+UL5XpLpYZlN2DpNpDiDKfPp5nUPih
 UAQ/2YK8CVmXJqc2MsoTODFW22Gk2Ck8R2hC3TZqNd/1ErxHb2TaPNZ5Bjs1Za4+mp5v
 y6NA==
X-Gm-Message-State: AOJu0YxGxu5KDEwD3Ju3LqBHB2HutvhhmvpyW90CO0y/6JVZO3XNxtOM
 4mSg6mWocr4JJ/9+JuwfXh6feD2XD0q3xVGQwYlQ8XLIhtrUhK/rID3HOl83iJY=
X-Google-Smtp-Source: AGHT+IEg4ZG8tg7xtNs+mL5Aw4qcuVwvXDk+wXXmzMXIyi1q2qwiX3H5b5A038OfEaehmz277QA69w==
X-Received: by 2002:a17:902:ecd0:b0:1dc:2d65:5fd1 with SMTP id
 a16-20020a170902ecd000b001dc2d655fd1mr6951446plh.2.1709745593484; 
 Wed, 06 Mar 2024 09:19:53 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a170902c71100b001dbb6fef41fsm12869712plp.257.2024.03.06.09.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 09:19:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 5/9] target/riscv: remove 'cpu_vl' global
Date: Wed,  6 Mar 2024 14:19:28 -0300
Message-ID: <20240306171932.549549-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306171932.549549-1-dbarboza@ventanamicro.com>
References: <20240306171932.549549-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

At this moment the global is used only in do_vsetvl(). Do a direct env
load in do_vsetvl() to read 'vl' and remove the global.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 target/riscv/translate.c                | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0114a132b3..279740f147 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -157,7 +157,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 
     if (rd == 0 && rs1 == 0) {
         s1 = tcg_temp_new();
-        tcg_gen_mov_tl(s1, cpu_vl);
+        tcg_gen_ld_tl(s1, tcg_env, offsetof(CPURISCVState, vl));
     } else if (rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_constant_tl(RV_VLEN_MAX);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3e12371887..002808895c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -38,7 +38,7 @@
 #undef  HELPER_H
 
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl;
+static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
@@ -1323,7 +1323,6 @@ void riscv_translate_init(void)
     }
 
     cpu_pc = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, pc), "pc");
-    cpu_vl = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, vl), "vl");
     load_res = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, load_res),
                              "load_res");
     load_val = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, load_val),
-- 
2.43.2


