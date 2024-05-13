Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CFDC25B10
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 May 2024 11:47:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6U8k-00025Y-DM; Mon, 13 May 2024 07:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1s6U8T-0001z2-QC
 for qemu-riscv@nongnu.org; Mon, 13 May 2024 07:46:30 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1s6U8R-0003ss-LN
 for qemu-riscv@nongnu.org; Mon, 13 May 2024 07:46:29 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5231efd80f2so1285622e87.2
 for <qemu-riscv@nongnu.org>; Mon, 13 May 2024 04:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715600782; x=1716205582;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKPTBYnNFTJrd4sQ5qm0hPcVX84zD5v+wGyqPbfqLHI=;
 b=gIfq+xVrSaV6dLCIZYobzZf9nvcCvCbgg8Cf0o9b2j7RpjwVx4aXeV9f/f8b9rrGQe
 aJNCJMx9crcyUE2Ld7/rk05RwY1sOMha/Vhrk54Tvxd8YQyDSG3fGOccIqX0mameeHUR
 5A9dIm8tTwsd0T6Gt2DhNvaU47vnn9HSsf5v2TVAVt5DM/ax/OmCQejBI1wIs5MWyBqq
 B5j6XylvtsAeKOL0tBwh34wfW03SOinXZabyEnZ+sDyf7K3LCQXtyINWE8ZO5r3G6GD7
 e3gaHdsJRn3IzGpIs0P+ppRE+1HZWgYGbq3RNyHq5Poaf4bVU1Fep1F8nba4+e+TouPa
 Ta4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715600782; x=1716205582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKPTBYnNFTJrd4sQ5qm0hPcVX84zD5v+wGyqPbfqLHI=;
 b=jJFsBdgX1+8+bfB8Ku/rDKgFyPfAk3/2XFNZWfAnSw43tXwR/PGYFPhcWdpFIXItJS
 02Uav6Y3q126ulYZhgK+wyYq3ZbaphTqh56Dz32tPwb/or0fIY/wK2F0yZqafaizQ4tY
 YxjMRmNzKWu9hsTuoLJVcT5EWgE6ZTPoXo/lc+sDjPSCeIhY6MK67F11HaVxnWkJwjyJ
 J39+pxbl2nV7Vqwko2xbR2r4RTn1NY/NfeY3ZSGf3CMLtTlTkSvb4xTCeSDRC0SvAyvX
 T902lg+xWV9mAzSOPbBtbCajlZmqvQiIK9y+xLCttECayXoVzup/JlvPj0nksoJfn7eR
 YzWg==
X-Gm-Message-State: AOJu0YyXIAEkxJVYDJJqyjW8H6c46Boc0/wMiqekGg0Oyl+y8jxKXm+n
 EM6jhO+88hxNVhUxI0Baq3e/HP0fiF2BCT8J8QYsHPvIq4w3GL+UxSPsOGHwKmOjxAI1CPgMoCS
 zhGM=
X-Google-Smtp-Source: AGHT+IGbLMThAWzd2vKgI+dDIoqfXs+a/hbiItfJvksOUxeRQtbpGMcORL4+oTf+chL1warogPhraQ==
X-Received: by 2002:a05:6512:753:b0:51c:b73f:950 with SMTP id
 2adb3069b0e04-52210074858mr6005749e87.43.1715600782320; 
 Mon, 13 May 2024 04:46:22 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.Home
 ([2a02:c7c:7527:ee00:45f9:e636:91a8:bb8e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baacf47sm10907636f8f.78.2024.05.13.04.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 04:46:21 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, rkanwal@rivosinc.com
Subject: [PATCH 2/2] target/riscv: Move Guest irqs out of the core local irqs
 range.
Date: Mon, 13 May 2024 12:46:02 +0100
Message-Id: <20240513114602.72098-3-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513114602.72098-1-rkanwal@rivosinc.com>
References: <20240513114602.72098-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=rkanwal@rivosinc.com; helo=mail-lf1-x12a.google.com
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

Fixes: 1697837ed9 ("target/riscv: Add M-mode virtual
interrupt and IRQ filtering support.")
Fixes: 40336d5b1d ("target/riscv: Add HS-mode virtual
interrupt and IRQ filtering support.")

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 target/riscv/cpu_bits.h | 3 ++-
 target/riscv/csr.c      | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 13ce2218d1..33f28bb115 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -664,7 +664,8 @@ typedef enum RISCVException {
 #define IRQ_M_EXT                          11
 #define IRQ_S_GEXT                         12
 #define IRQ_PMU_OVF                        13
-#define IRQ_LOCAL_MAX                      16
+#define IRQ_LOCAL_MAX                      64
+/* -1 is due to bit zero of hgeip and hgeie being ROZ. */
 #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
 
 /* mip masks */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c9d685dcc5..78f42fcae5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1141,7 +1141,12 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 
 #define VSTOPI_NUM_SRCS 5
 
-#define LOCAL_INTERRUPTS (~0x1FFF)
+/* All core local interrupts except the fixed ones 0:12. This macro is for virtual
+ * interrupts logic so please don't change this to avoid messing up the whole support,
+ * For reference see AIA spec: `5.3 Interrupt filtering and virtual interrupts for
+ * supervisor level` and `6.3.2 Virtual interrupts for VS level`.
+ */
+#define LOCAL_INTERRUPTS   (~0x1FFFULL)
 
 static const uint64_t delegable_ints =
     S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS | MIP_LCOFIP;
-- 
2.34.1


