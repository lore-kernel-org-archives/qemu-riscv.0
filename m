Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217D4C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 00:27:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMzxN-0001XA-2i; Mon, 08 Jan 2024 19:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rMzxI-0001Ti-TQ
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:26:56 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rMzxE-0001bM-FZ
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:26:55 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-204df0830ccso2281933fac.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 16:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704760010; x=1705364810;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBFb3wD9JrSYCXaN0lwhbhsoKTi8i5JV1Iqt3vza59s=;
 b=I/bRge2T9GmW9Xrt32ZD3g5PkMMkWgEdxyJFJh/VFy/QizpPYtzOa/w0ZWZ5SjM7l/
 2i0gYXkC3bqigyK4Uyp5MrH4/tgfO7sLXd4o635dZLF/8okBFLJCrGg80bYXt/G2LN/k
 B5wCB8ysIevdMFe3l6gyitXsKrlf+fjA0pDScH4vTsGByt4tmp6sfm2WxDcv13V4zI3D
 7mBI2xA+WHs59vYja6QBAJiIz9HoIGYc90Mga/gfLu/iw+mJR/x2o/LdHaDPZZkov1Nm
 Fy56yFU+msk4/uTeARTY2FmaHDwxOc67Mu/KKGSwkSu0IxbfGMOYZva4yTsS2wdeYwhe
 KaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704760010; x=1705364810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBFb3wD9JrSYCXaN0lwhbhsoKTi8i5JV1Iqt3vza59s=;
 b=tihDwk9XtJvKWOnSgRrpg7GKcSsQXNGgaGOBDzlNrce6hlsrX3NJfj3bUz9Vd2iGeN
 gyXeermtFeN1JFcyv40AUZ4aex5NrmdeWLbsq9VH+6ncxYWYgWKbv2qDkQoG1qxqGh/Z
 IAIEzpootgOmkoa6dkZp9t9WGMSKzErPamU4m5rcx/Af74GSa5/xXvFwumv8y2txQ2Jh
 JiFYtQO2Kxcc7TkkiNYjAIXP7MBfdhMQfUxumEB3qXVa8/AZutEyRf1cRHduBIb6hZCo
 pet26q8/kQalZbBiRlvXxHzgdxKe5z6pZxuRDU/VAY2AiXubG/65SENfIYVekG7MemIR
 qhXQ==
X-Gm-Message-State: AOJu0YzWPyRwidcAMEvwGA6vg1jawSwxTfOcFGGDeoYhINPKHpElwMwJ
 pdwgOuady422KQ2wUfiBunpH8haecqMxlA==
X-Google-Smtp-Source: AGHT+IEpDUvEad/BmYXqSLpVWfxXwSszCAP1wofyOfkB3aIV2PrZ0V/dnhz9QT0g+1zE09IooTLJWw==
X-Received: by 2002:a05:6871:2b01:b0:203:ec89:de1e with SMTP id
 dr1-20020a0568712b0100b00203ec89de1emr6835850oac.58.1704760010602; 
 Mon, 08 Jan 2024 16:26:50 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 wp12-20020a056871a9cc00b002042cafdc52sm219917oab.2.2024.01.08.16.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 16:26:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: 
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 kaiwenxue1@gmail.com
Subject: [PATCH v4 3/5] target/riscv: Add cycle & instret privilege mode
 filtering definitions
Date: Mon,  8 Jan 2024 16:25:52 -0800
Message-Id: <20240109002554.646572-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109002554.646572-1-atishp@rivosinc.com>
References: <20240109002554.646572-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=atishp@rivosinc.com; helo=mail-oa1-x33.google.com
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
index d74b361be641..34617c4c4bab 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -319,6 +319,12 @@ struct CPUArchState {
 
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
index ebd7917d490a..0ee91e502e8f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -401,6 +401,10 @@
 /* Machine counter-inhibit register */
 #define CSR_MCOUNTINHIBIT   0x320
 
+/* Machine counter configuration registers */
+#define CSR_MCYCLECFG       0x321
+#define CSR_MINSTRETCFG     0x322
+
 #define CSR_MHPMEVENT3      0x323
 #define CSR_MHPMEVENT4      0x324
 #define CSR_MHPMEVENT5      0x325
@@ -431,6 +435,9 @@
 #define CSR_MHPMEVENT30     0x33e
 #define CSR_MHPMEVENT31     0x33f
 
+#define CSR_MCYCLECFGH      0x721
+#define CSR_MINSTRETCFGH    0x722
+
 #define CSR_MHPMEVENT3H     0x723
 #define CSR_MHPMEVENT4H     0x724
 #define CSR_MHPMEVENT5H     0x725
@@ -885,6 +892,28 @@ typedef enum RISCVException {
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


