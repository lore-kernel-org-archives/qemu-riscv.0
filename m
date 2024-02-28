Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A980C5478C
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 18:53:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rfP26-0000nG-0b; Wed, 28 Feb 2024 13:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rfP22-0000li-MC
 for qemu-riscv@nongnu.org; Wed, 28 Feb 2024 13:51:54 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rfP21-0006uK-40
 for qemu-riscv@nongnu.org; Wed, 28 Feb 2024 13:51:54 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6e574a98151so507496b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Feb 2024 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709146312; x=1709751112;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CjwCWH6yJlY4ow/brTdL6993/Qnp+9jthxWLsP3wFz4=;
 b=T0D0kA62888e8Nj02Ykg5DXlXdc4lpxKgYOkypm/K5Ia+MfqTIFn/h0JYy4Cs2PeMf
 f33lVsRhDWJhlwfcv/hcLc0ims9zDgXFuGbelH6lEX/mO5z7HvRiamVkcXmP8OGI5CVB
 fMIZvJCzGACptSZY82KwZNJZYzPd4FZuXrPnivtwn8/DhaSOWmmcIkmuwdebwfkMX3yL
 3rAgxdTkRXxr/jgAVILGJp+1+xsiT9xVe7Cgvx//bD+rkLtbx+MhHuAghc3u8+cJ/f/F
 BRCb/9kCZ0lGbckRc9tTOcCJ+pzbZKmrY4dULkYWaw5/8kP/N5qJgP5W6JTzfdvbgrW2
 jl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709146312; x=1709751112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CjwCWH6yJlY4ow/brTdL6993/Qnp+9jthxWLsP3wFz4=;
 b=lHXDsf+Wf/uWtY36nZTP9xJeFMz4uti0NNLy6vk+/1+vuDH3bGII/8IKmxgrcAnS2i
 TPQJ/59qtAtU9LQ1fJYiEW57Ld7RKRTWMXgMA/Ju2bos1PgfVp7S7AdgywRRnT5amZhM
 Rh4bWmLmkKIoijiywnNwZioPmHdxEezUoZHsdzIO68ezV8H76M6mcAzA/mwJOPUW3TOb
 ffV6KtdTHPWl63AXuRRWrqkh40MOxIyg4dKL3nqHgzSd5jv4JvoWwdqbJtNvXtQCvNRO
 xzJLXtIxhh/UczXAEN4Zfzoxind9RD8t9XiTflPczC60+NZIjpy0g2N/VW8GuJ01UJbW
 rBzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHQwRTZA20ek/pFUqecvxFxpB/DAlJT6mY2N61rlsD1LTVBayew1GTl2VWeUciA8+DFdrAqwG5gXGH4WNBSw46NNpLDtg=
X-Gm-Message-State: AOJu0YxIqGFcjLtIu4HL7Y0VyyEEqsiDk7R0llUconIiL+Fegs5zqCNs
 qsec2hmE7j8qySmMkn1q3bOhW+SuyIBK99Q+oARMnz4K1NwYtY0u47SDoGuRknXasZHA3CTvxV7
 B
X-Google-Smtp-Source: AGHT+IEtq2c6/rQdDpXqK8nBQTr2A6Dv/YDqTRdYdyUcjxTe+wB4JLuT8SQfeAvvw90yr02sEYUMCg==
X-Received: by 2002:a05:6a20:6726:b0:1a0:e3c7:963d with SMTP id
 q38-20020a056a20672600b001a0e3c7963dmr115424pzh.23.1709146311764; 
 Wed, 28 Feb 2024 10:51:51 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a635d54000000b005dbed0ffb10sm49562pgm.83.2024.02.28.10.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 10:51:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: 
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 kaiwenxue1@gmail.com
Subject: [PATCH v5 3/5] target/riscv: Add cycle & instret privilege mode
 filtering definitions
Date: Wed, 28 Feb 2024 10:51:14 -0800
Message-Id: <20240228185116.1321730-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228185116.1321730-1-atishp@rivosinc.com>
References: <20240228185116.1321730-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds the definitions for ISA extension smcntrpmf.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h      |  6 ++++++
 target/riscv/cpu_bits.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f52dce78baa0..174e8ba8e847 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -338,6 +338,12 @@ struct CPUArchState {
 
     target_ulong mcountinhibit;
 
+    /* PMU cycle & instret privilege mode filtering */
+    target_ulong mcyclecfg;
+    target_ulong mcyclecfgh;
+    target_ulong minstretcfg;
+    target_ulong minstretcfgh;
+
     /* PMU counter state */
     PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fc2068ee4dcf..e866c60a400c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -394,6 +394,10 @@
 /* Machine counter-inhibit register */
 #define CSR_MCOUNTINHIBIT   0x320
 
+/* Machine counter configuration registers */
+#define CSR_MCYCLECFG       0x321
+#define CSR_MINSTRETCFG     0x322
+
 #define CSR_MHPMEVENT3      0x323
 #define CSR_MHPMEVENT4      0x324
 #define CSR_MHPMEVENT5      0x325
@@ -424,6 +428,9 @@
 #define CSR_MHPMEVENT30     0x33e
 #define CSR_MHPMEVENT31     0x33f
 
+#define CSR_MCYCLECFGH      0x721
+#define CSR_MINSTRETCFGH    0x722
+
 #define CSR_MHPMEVENT3H     0x723
 #define CSR_MHPMEVENT4H     0x724
 #define CSR_MHPMEVENT5H     0x725
@@ -878,6 +885,28 @@ typedef enum RISCVException {
 /* PMU related bits */
 #define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
 
+#define MCYCLECFG_BIT_MINH                 BIT_ULL(62)
+#define MCYCLECFGH_BIT_MINH                BIT(30)
+#define MCYCLECFG_BIT_SINH                 BIT_ULL(61)
+#define MCYCLECFGH_BIT_SINH                BIT(29)
+#define MCYCLECFG_BIT_UINH                 BIT_ULL(60)
+#define MCYCLECFGH_BIT_UINH                BIT(28)
+#define MCYCLECFG_BIT_VSINH                BIT_ULL(59)
+#define MCYCLECFGH_BIT_VSINH               BIT(27)
+#define MCYCLECFG_BIT_VUINH                BIT_ULL(58)
+#define MCYCLECFGH_BIT_VUINH               BIT(26)
+
+#define MINSTRETCFG_BIT_MINH               BIT_ULL(62)
+#define MINSTRETCFGH_BIT_MINH              BIT(30)
+#define MINSTRETCFG_BIT_SINH               BIT_ULL(61)
+#define MINSTRETCFGH_BIT_SINH              BIT(29)
+#define MINSTRETCFG_BIT_UINH               BIT_ULL(60)
+#define MINSTRETCFGH_BIT_UINH              BIT(28)
+#define MINSTRETCFG_BIT_VSINH              BIT_ULL(59)
+#define MINSTRETCFGH_BIT_VSINH             BIT(27)
+#define MINSTRETCFG_BIT_VUINH              BIT_ULL(58)
+#define MINSTRETCFGH_BIT_VUINH             BIT(26)
+
 #define MHPMEVENT_BIT_OF                   BIT_ULL(63)
 #define MHPMEVENTH_BIT_OF                  BIT(31)
 #define MHPMEVENT_BIT_MINH                 BIT_ULL(62)
-- 
2.34.1


