Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEEFC04FFE
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 May 2024 12:53:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s92Uz-0005k9-Ss; Mon, 20 May 2024 08:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1s92Uy-0005iY-UF
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 08:52:16 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1s92Uw-0004Qd-TN
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 08:52:16 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1eb0e08bfd2so75462255ad.1
 for <qemu-riscv@nongnu.org>; Mon, 20 May 2024 05:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716209533; x=1716814333;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiZ5stYG6iGySkoeWNLfji4K0JlTVUfLI4xMNadIqkY=;
 b=Lyzvd+hW8Qfln2fAkLbrYXZH/jM1Og+NDKpkEGBKcsc+Ld55xWzWtAVe3z0lbKUlMt
 eYqN8BS1spf+gVJgMduBxBnADAp35SoDMBB25llL5y58LwXPxUvHlRl0+qImqZKNdfmG
 SMkhX/BfUFigQ+KybcVkRo9VHcSSh4rsgyekmAYVm6dV4qFIBofPlOkBNZzoODIzlT7h
 hIF0tDI/hYLoJk4cgLw5niwNyoQVFYBWWaqvYJ7Fc/TFTnx9l546BDBzHuMSsN/vuqJF
 lSKgJedszOEMwQ3GGgKmcGtLjEp+svO5rMZzCmFzYrUK770CYjC/YZqIAzYNzb8Kgqzq
 dO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716209533; x=1716814333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FiZ5stYG6iGySkoeWNLfji4K0JlTVUfLI4xMNadIqkY=;
 b=tgYEFLeDUjjcNk0BwYa9z+ptsg5TUWL0ogR5OYjmYLvJET1EqqkIGPFfZv7Kd/1R7K
 2rFvr83ocupSVyTAWQ5qVCLwgZP24TcDfSY54mDiN5PZ84O2dfmL0vQYPYO14VGC6IY+
 FeysiNif7ffnWu2KRvJKUr3wczXW6vrQT9EXzRVDEr4UeWoKHGxGNlWDibtgzgosNnwu
 RfWZHyJGpAySz6s73uAlIytn7mZWodJENpklYrFAMX6vM6fHVFlfWy4znKh5OFmbF0Dy
 WDcS8wGv7uOr8fiiKYZiksmkV56XTGr4K4EUhbE0VFV+dgji6lQ9aKbEoBZ8hxR8REan
 3ynw==
X-Gm-Message-State: AOJu0YzHNP7XQVLkyWxlk3W6Ueyc0Q8ua65rZeCJQQaqmLvHx8v0bgGK
 yh4xsCMdz7m9J1waQgkhY9xvR7wuwY31j3e8IiMa1DsAyRfoVNV5BJmQJApUtu0gQS0TVC7IFzC
 0R/k=
X-Google-Smtp-Source: AGHT+IFREQisSBL91nPMNGPydFiB36qjyifHbBtkqg6Hfv7+stWUljN2Tn3cYpDhZLp8SPFagEk4Xg==
X-Received: by 2002:a17:902:f545:b0:1f3:453:2ca0 with SMTP id
 d9443c01a7336-1f304533970mr19272785ad.42.1716209532786; 
 Mon, 20 May 2024 05:52:12 -0700 (PDT)
Received: from localhost.localdomain ([51.52.155.79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c139465sm202905145ad.269.2024.05.20.05.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:52:12 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, rkanwal@rivosinc.com
Subject: [PATCH v2 2/2] target/riscv: Move Guest irqs out of the core local
 irqs range.
Date: Mon, 20 May 2024 13:51:57 +0100
Message-Id: <20240520125157.311503-3-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520125157.311503-1-rkanwal@rivosinc.com>
References: <20240520125157.311503-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Qemu maps IRQs 0:15 for core interrupts and 16 onward for
guest interrupts which are later translated to hgiep in
`riscv_cpu_set_irq()` function.

With virtual IRQ support added, software now can fully
use the whole local interrupt range without any actual
hardware attached.

This change moves the guest interrupt range after the
core local interrupt range to avoid clash.

Fixes: 1697837ed9 ("target/riscv: Add M-mode virtual interrupt and IRQ filtering support.")
Fixes: 40336d5b1d ("target/riscv: Add HS-mode virtual interrupt and IRQ filtering support.")

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 target/riscv/cpu_bits.h | 3 ++-
 target/riscv/csr.c      | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 74318a925c..a470fda9be 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -695,7 +695,8 @@ typedef enum RISCVException {
 #define IRQ_M_EXT                          11
 #define IRQ_S_GEXT                         12
 #define IRQ_PMU_OVF                        13
-#define IRQ_LOCAL_MAX                      16
+#define IRQ_LOCAL_MAX                      64
+/* -1 is due to bit zero of hgeip and hgeie being ROZ. */
 #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
 
 /* mip masks */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 152796ebc0..464e0e57a3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1148,7 +1148,14 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 
 #define VSTOPI_NUM_SRCS 5
 
-#define LOCAL_INTERRUPTS (~0x1FFF)
+/*
+ * All core local interrupts except the fixed ones 0:12. This macro is for
+ * virtual interrupts logic so please don't change this to avoid messing up
+ * the whole support, For reference see AIA spec: `5.3 Interrupt filtering and
+ * virtual interrupts for supervisor level` and `6.3.2 Virtual interrupts for
+ * VS level`.
+ */
+#define LOCAL_INTERRUPTS   (~0x1FFFULL)
 
 static const uint64_t delegable_ints =
     S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS | MIP_LCOFIP;
-- 
2.34.1


