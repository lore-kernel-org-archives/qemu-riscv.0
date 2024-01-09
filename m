Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93838C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 17:20:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNFkv-0001us-Ka; Tue, 09 Jan 2024 12:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNFks-0001sG-UJ
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 12:19:10 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNFkq-0004xi-Ro
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 12:19:10 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e5280a381so6228695e9.2
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704820747; x=1705425547;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7JJwmgisw0X/jOef1avVYzZWfop3gRIE8N7iHYhYws=;
 b=2OEtFo4vZbXIy0GAJP7HungL5ZtGoGhwy8D8Bn4gpdufrMVqRBJu/AqWoMF27QPo37
 UynH6HqO5XDMDp/W5iJ9SWFkai3ltnZd7flCgeQpIfkW1rcNss244YCSE+ynCgkCYD2c
 TXVwBNvevCJpud/7rluXlaZNraYFADzbOtXCuzU3JHXCfskLAMGXQfil7bkKylov30l5
 ecFhAJumcCLlXIFSer7YgTf2maSKdjDn9R6DlatB3IvIhRz5HG7iRdzruVMbGHXIbq/F
 jPjfNcmUKxJ8PrX0nV8FTH7JD15km5Wpxe71pln/6EbKuBirEcY924OaCguFz5+1nVSU
 ZU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704820747; x=1705425547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7JJwmgisw0X/jOef1avVYzZWfop3gRIE8N7iHYhYws=;
 b=CNG7Ya84iHMgnihDCnslOpMx+hhbk7e1S//A4EA5g3YEu2p0XdOhO//YnssDKV44yi
 E4iTu3hErTlcKugAURYgTTmkGpBBpl8gx+T0aX7HbOvLZyOTA5QyfwygiEE7kzk1B8uY
 8eXrErBqNT7qHQK5jLib9Lepps5OW2c/kZwfYWmnJFVFZxqXiyfN/3eeKCQv3zvzN7Mu
 7LnGtganGH9LyW9vGTFdo2xHXMoe8h5IUpa+a4M8+nsnDZgN7IqMXgpcRyreckybsPQf
 5TNY/cn63vD1B7JrPtYbdcuHuPgCdyiwQDU8pk7L82Dba2schES8apupv0VibzYgqUkv
 0Snw==
X-Gm-Message-State: AOJu0YzhA8i823iUM4UQZjJcKoBmuR/gRP5bD/dF4lxXRq1clu62NUFP
 PA05RwzHmaPMWJ3WS32VblVfDrF6eJCC5g==
X-Google-Smtp-Source: AGHT+IH6ElUD9A+v0Z2Aabue/BSHRZEGuPPS7osKdfoRg7/tEFEGJ7HHpvmZ4AL5vb4VT4Jt0V0wew==
X-Received: by 2002:a05:600c:4747:b0:40d:87e9:6efe with SMTP id
 w7-20020a05600c474700b0040d87e96efemr2973786wmo.1.1704820747331; 
 Tue, 09 Jan 2024 09:19:07 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 bg30-20020a05600c3c9e00b0040d62f89381sm4350308wmb.35.2024.01.09.09.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:19:06 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 1/3] target/riscv: Add infrastructure for 'B' MISA extension
Date: Tue,  9 Jan 2024 17:07:35 +0000
Message-ID: <20240109171848.32237-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109171848.32237-1-rbradford@rivosinc.com>
References: <20240109171848.32237-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32b.google.com
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

Add the infrastructure for the 'B' extension which is the union of the
Zba, Zbb and Zbs instructions.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c         | 5 +++--
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b07a76ef6b..22f8e527ff 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -38,9 +38,9 @@
 #include "tcg/tcg.h"
 
 /* RISC-V CPU definitions */
-static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
+static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
 const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
-                              RVC, RVS, RVU, RVH, RVJ, RVG, 0};
+                              RVC, RVS, RVU, RVH, RVJ, RVG, RVB, 0};
 
 /*
  * From vector_helper.c
@@ -1251,6 +1251,7 @@ static const MISAExtInfo misa_ext_info_arr[] = {
     MISA_EXT_INFO(RVJ, "x-j", "Dynamic translated languages"),
     MISA_EXT_INFO(RVV, "v", "Vector operations"),
     MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
+    MISA_EXT_INFO(RVB, "x-b", "Bit manipulation (Zba_Zbb_Zbs)")
 };
 
 static int riscv_validate_misa_info_idx(uint32_t bit)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2725528bb5..756a345513 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -69,6 +69,7 @@ typedef struct CPUArchState CPURISCVState;
 #define RVH RV('H')
 #define RVJ RV('J')
 #define RVG RV('G')
+#define RVB RV('B')
 
 extern const uint32_t misa_bits[];
 const char *riscv_get_misa_ext_name(uint32_t bit);
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8a35683a34..fda54671d5 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -791,6 +791,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
     MISA_CFG(RVJ, false),
     MISA_CFG(RVV, false),
     MISA_CFG(RVG, false),
+    MISA_CFG(RVB, false)
 };
 
 /*
-- 
2.43.0


