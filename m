Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8452AC4828D
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 13:19:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rXLMQ-0003gB-G7; Tue, 06 Feb 2024 08:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rXLMO-0003fX-18
 for qemu-riscv@nongnu.org; Tue, 06 Feb 2024 08:19:36 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rXLMH-0005y5-Lu
 for qemu-riscv@nongnu.org; Tue, 06 Feb 2024 08:19:35 -0500
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5d3912c9a83so4259176a12.3
 for <qemu-riscv@nongnu.org>; Tue, 06 Feb 2024 05:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1707225567; x=1707830367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMvi22rkrBmsZVwZknytn23922K4Y1Z689E1EhIiGOc=;
 b=Hcqr4uCGAGuDP70DhZPuPQaTfMGcqFW90vsvqtVLOKqsatxnEtgxZIUxKK0VvLzabL
 5fYypeN2fPq2SOx4PIjdQ8gXfKkpn5Doo9UDR/Ft9pIeQz2/VCDluhZ7v7JUmbhoOJPX
 1CFf2GyfaCXeQKmKxcrmJ7K6FuL+hFXxwIKeD7WbraYOLFBusE+LZM/XjmB/2/Y0MbEh
 2RVhmbQtTvkLoCeTxuMPmSzq2OM54h0LvtTNlcA0/4Rx1CPVPfyvUKQm4D7lmqfy6sjH
 lq7juArQT2wJ2ZmfMMhTkDBotj3P9VkULOFOjHD9B/VU6O3uqu7MXfrEsGfmw/BTcVob
 lwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707225567; x=1707830367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMvi22rkrBmsZVwZknytn23922K4Y1Z689E1EhIiGOc=;
 b=Plutj5+L/VhmYTRQcN6Z5JjCbD6RmDM9F22H+J4YeiU7JlnuTNp9ynbV2b4sSqUUsz
 3xQrtzgQk6jpq7M6PLJT+VEgF1mafC5tZdJUK4lIPx4OHql2kJdZE10hSe5N79Fox74i
 xT7vS6tRWzr8jpQrdsakysc+7lUEHnRBve4hNn16HaQ6ONvH10tNNInpdPXlp8VeU9TU
 hOfLYA65wOJ0y67XLe3oOp+dpqYPlaOb5WIqCL/zmG9WMukWsKwDZCp58k078eK+Qvhx
 fOrEbLpLrbN2RADJxd/61YkcFvolgp9ykplb5oXBMfkSNYGWfg2gLcSmIt6w+pnVfSXa
 a0lw==
X-Gm-Message-State: AOJu0YwPv3w+tgvl5WrpeZaupI58r3wJxat0ma4sbXYciyiUEyNyXog5
 QbumAXXLXLAKJGsbNeyPnATAO55t1SjeL2LgS1qkAEwwJY2ogOopiEFMN3cHIeY=
X-Google-Smtp-Source: AGHT+IGK05hxnLosC4RZVktCIsUlf65XRFm/EGNDcVQpcrKir8UrYZ5T/PAeDySXuKiGn46NSVD+mg==
X-Received: by 2002:a05:6a00:9a0:b0:6db:d59c:a5b7 with SMTP id
 u32-20020a056a0009a000b006dbd59ca5b7mr3317383pfg.20.1707225567203; 
 Tue, 06 Feb 2024 05:19:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUjUImBatw7bAKJ5cUfYtKwc2S7NnfFZOd0Pl5sDSdoys1vyScsAAHFP0A5s6j1zuwi2yuetV9kv2mU3ujsrptfE2UwCeF/DgTMdMLk05GQhM078Be248qo/y+U2FXvE02ufdi+WO9BKzq54ZPiTQ88q1u4KHW/PhqeY45ehLHTOTdklpD2Fz7IC0imdQ+b3zxmASjgmzbg2jmHeHt6CUAEptRkpQz1ply0YFg+FHxyZ6zMYITHrHEcnYSwoqeLQE6nYDLbWWVhDzB6HWWK9qnxYsRG+ZN2Q1nIPt7Qxw6z4s4lkmHgAxleFuOzaL/awwfDz0wscDDLKGnzTkxljkA2KD5XQThDZ2VjBqTJrvEaRyNT
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 e11-20020aa798cb000000b006e04ddf97f7sm1837105pfm.107.2024.02.06.05.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:19:26 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/riscv: Update $pc after linking to $ra in
 trans_cm_jalt()
Date: Tue,  6 Feb 2024 21:18:42 +0800
Message-ID: <20240206131911.10998-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=jason.chien@sifive.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The original implementation sets $pc to the address read from the jump
vector table first and links $ra with the address of the next instruction
after the updated $pc. After jumping to the updated $pc and executing the
next ret instruction, the program jumps to $ra, which is in the same
function currently executing, which results in an infinite loop.
This commit reverses the two action. Firstly, $ra is updated with the
address of the next instruction after $pc, and sets $pc to the address
read from the jump vector table.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 target/riscv/insn_trans/trans_rvzce.c.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index 8d8a64f493..a185e2315f 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -293,13 +293,6 @@ static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
 {
     REQUIRE_ZCMT(ctx);
 
-    /*
-     * Update pc to current for the non-unwinding exception
-     * that might come from cpu_ld*_code() in the helper.
-     */
-    gen_update_pc(ctx, 0);
-    gen_helper_cm_jalt(cpu_pc, cpu_env, tcg_constant_i32(a->index));
-
     /* c.jt vs c.jalt depends on the index. */
     if (a->index >= 32) {
         TCGv succ_pc = dest_gpr(ctx, xRA);
@@ -307,6 +300,13 @@ static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
         gen_set_gpr(ctx, xRA, succ_pc);
     }
 
+    /*
+     * Update pc to current for the non-unwinding exception
+     * that might come from cpu_ld*_code() in the helper.
+     */
+    gen_update_pc(ctx, 0);
+    gen_helper_cm_jalt(cpu_pc, cpu_env, tcg_constant_i32(a->index));
+
     tcg_gen_lookup_and_goto_ptr();
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
-- 
2.43.0


