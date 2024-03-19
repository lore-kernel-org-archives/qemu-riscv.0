Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17852CD11DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:47:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbeG-0000b9-8E; Tue, 19 Mar 2024 11:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdt-0007kf-9t
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:44:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdo-0005LG-Du
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:44:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ff53528ceso1966224f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863079; x=1711467879; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBdrzyRnzam5C+4e/1m5S+T9al1+qhyfeKtl+AUinsY=;
 b=MKm7VdDHdGihdu4rM1Dq0+9DySDgqkW6/LnWgzQkCC3WbyrfNrkWjIChETeZlHh3jr
 1XCtMMB44C5CxFbHY2Y84zEMSNZPe6EezH5mslkjbEZ24t8+SF8LMasMbHSvOuoB2H+b
 AfKnlo4E+zeKATL/+owc+6i/F5dcx9/ZT10wau/p7JAByohpzS/VjXBN+Vsig0ndJjzo
 ny0creta1cmRk78ZP1cpF4pxEysm7mmSwKhYBA1BCD56cXAGHSdzrtjhRx/G64Mo38cg
 x+sgFME8wsKP1Aoia2WbDO7eh/VKKr1kXb48xUu2tGL/pXmQw8/ZBX1Fvo2BobI208I0
 3p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863079; x=1711467879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBdrzyRnzam5C+4e/1m5S+T9al1+qhyfeKtl+AUinsY=;
 b=wuO0/u7KTUGz12plP76brcRHY3kI5ni9v5ZTkYzLFNS7iw+McRjoTg61QrG/92P+Ar
 m1DLteAbmVVR3OrxKLRolqFD2M0bHDmdr9btLHM/mH5Xxzi6JuMfp1X+ZEIjEszMkdz6
 Ad6KxsQrz+y5qVcemYqlmgNNJek0FNccj+n8m5kDDfqBUS4svDX6ia3SPG5qBkPSGS6C
 mC+SOPuiqPQOqiGkAakH8cex2XZwLeXOB+r0cJ1oUR1Sk2riqoBxORfB0zLgfLmKutz4
 c/wpc2ZELVj/BzrjI3Lahhhay9Ty1eYclZxSH5mPiggBOsENRL/h3Wa0CUhhe/MGgCCO
 5m/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxWdSR46j7yxkmCMXxzybR73+662L2VOzlNeg0oObFkDvMPixRMW2tHPuFjJ/9Jm3tMDHDk0tonP+oN9gTlkjJtlw1jCg=
X-Gm-Message-State: AOJu0Ywrn69llcydbDw8ObTr2CDMkrKK89eUz4SBQV/bItv1KPgMZKRH
 DmzRLGlp9pBIeC6UtwLhJ/Uih/Ictga5d3nhngxrJuTsveHJRjB+HkSzjKCF8ss=
X-Google-Smtp-Source: AGHT+IGHGqeP39Ra2YKnXUNQF8xSFS49G7XmPrSaqAxfHsk6uXyCi0s3MFUNZUcX2Sz+lVvGSvMuhw==
X-Received: by 2002:adf:f7c9:0:b0:33e:7719:325d with SMTP id
 a9-20020adff7c9000000b0033e7719325dmr13239459wrq.2.1710863079000; 
 Tue, 19 Mar 2024 08:44:39 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d4aca000000b0033e03d37685sm12668148wrs.55.2024.03.19.08.44.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH-for-9.1 17/27] target/ppc: Indent ppc_tcg_ops[] with 4 spaces
Date: Tue, 19 Mar 2024 16:42:46 +0100
Message-ID: <20240319154258.71206-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu_init.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7e65f08147..464e91faa2 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7360,22 +7360,22 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 #include "hw/core/tcg-cpu-ops.h"
 
 static const TCGCPUOps ppc_tcg_ops = {
-  .initialize = ppc_translate_init,
-  .restore_state_to_opc = ppc_restore_state_to_opc,
+    .initialize = ppc_translate_init,
+    .restore_state_to_opc = ppc_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
-  .record_sigsegv = ppc_cpu_record_sigsegv,
+    .record_sigsegv = ppc_cpu_record_sigsegv,
 #else
-  .tlb_fill = ppc_cpu_tlb_fill,
-  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
-  .do_interrupt = ppc_cpu_do_interrupt,
-  .cpu_exec_enter = ppc_cpu_exec_enter,
-  .cpu_exec_exit = ppc_cpu_exec_exit,
-  .do_unaligned_access = ppc_cpu_do_unaligned_access,
-  .do_transaction_failed = ppc_cpu_do_transaction_failed,
-  .debug_excp_handler = ppc_cpu_debug_excp_handler,
-  .debug_check_breakpoint = ppc_cpu_debug_check_breakpoint,
-  .debug_check_watchpoint = ppc_cpu_debug_check_watchpoint,
+    .tlb_fill = ppc_cpu_tlb_fill,
+    .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
+    .do_interrupt = ppc_cpu_do_interrupt,
+    .cpu_exec_enter = ppc_cpu_exec_enter,
+    .cpu_exec_exit = ppc_cpu_exec_exit,
+    .do_unaligned_access = ppc_cpu_do_unaligned_access,
+    .do_transaction_failed = ppc_cpu_do_transaction_failed,
+    .debug_excp_handler = ppc_cpu_debug_excp_handler,
+    .debug_check_breakpoint = ppc_cpu_debug_check_breakpoint,
+    .debug_check_watchpoint = ppc_cpu_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
-- 
2.41.0


