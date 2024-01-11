Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1D5C47258
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 16:17:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNxjm-00070q-Ji; Thu, 11 Jan 2024 11:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNxjh-0006rV-2M
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 11:16:53 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNxjd-0005V3-Vo
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 11:16:52 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3373a30af67so4894572f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 08:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704989808; x=1705594608;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cN/RXcq/RZ7ChyrSSuRPL4giRO8aqwkOGTqjxzEKvew=;
 b=IDmZX3lAkbELLMM2N7tjl5dspsafZEAImKkgjY5+xxYqVlCSLe1MJt7MvrBfq1lQpb
 UoUw9dLhgCFrfA0W/15gRh/SpelwZyYVeqSvz/+rid3twxb4QDHNMBCDGXBLM4xIbQHO
 RyNn+Zrj7g5Eb3Mguo3YWJhXH4SMdzX0qTWWOlw5T6nt8RLolunXwbT/9C5fNHwpRIBm
 9i8iwRUOUG1tGSP1bOXfd0R37QLXiMr+9ruyfsrINbfWeytLR4mk2c9+sc4Qd1y+R6Fn
 ljWapPFBOL+rhsvX2U7wCP1ezSnrDj3aodOugpMZVYM77VU/UsGjf5wy5IUF/TiQlNbP
 5GdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704989808; x=1705594608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cN/RXcq/RZ7ChyrSSuRPL4giRO8aqwkOGTqjxzEKvew=;
 b=NzZZtB1sDPXeiAMK1sIU879IHSIw8baucsEXb+upa8IT8XhmXH6JUeTLIj/0P0EFMn
 F7S31c3ByrgOC9QrhFD0Nd6LDaHJGe/ZkIUXM2WL9S7nLtDfJV1D+C3CW4Mt6rneCxtl
 wtR5ejpsw0RvaxUKMuBJTTDFWEyAI0jZKG/B2n3lQLr/k/DidrjEIRNqmdHbjjm5WWKB
 lN40CbICKpKhv+q1o95Q1MoC/y0xJSIhDtp9b+Z+Fy/lAVB2Cw/FBhtCStWes6Yrc04o
 TkhTvmJ6xNBlgQI4fwIwhMj0xg5oZi9yjSvm5G1XaD/VMDdm5Gr8HsXsSafKNY2Zqszi
 8bRQ==
X-Gm-Message-State: AOJu0YxY3RipVGT6rgv0xT0okbQDsPopuIjKRfV10z6E8CTfex+Wy7fF
 WMn+KUavkHcQi9Cd4djtaxLca/lhAsrglg==
X-Google-Smtp-Source: AGHT+IGiujPwnHTu5hjTey5BLHdal2IVWNkU8+LavjLatDpRddmOfAvbC0KhQKzxRTn4P0LSj8Fi3A==
X-Received: by 2002:a5d:6684:0:b0:333:2fd2:3bcf with SMTP id
 l4-20020a5d6684000000b003332fd23bcfmr452219wru.136.1704989808023; 
 Thu, 11 Jan 2024 08:16:48 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b0033642a9a1eesm1553183wrs.21.2024.01.11.08.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 08:16:47 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/2] target/riscv: Add infrastructure for 'B' MISA extension
Date: Thu, 11 Jan 2024 16:16:43 +0000
Message-ID: <20240111161644.33630-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111161644.33630-1-rbradford@rivosinc.com>
References: <20240111161644.33630-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x42b.google.com
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
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         | 5 +++--
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8cbfc7e781..fc01c10e24 100644
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
@@ -1299,6 +1299,7 @@ static const MISAExtInfo misa_ext_info_arr[] = {
     MISA_EXT_INFO(RVJ, "x-j", "Dynamic translated languages"),
     MISA_EXT_INFO(RVV, "v", "Vector operations"),
     MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
+    MISA_EXT_INFO(RVB, "x-b", "Bit manipulation (Zba_Zbb_Zbs)")
 };
 
 static int riscv_validate_misa_info_idx(uint32_t bit)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5f3955c38d..3843d44fc9 100644
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
index 14133ff665..5396c6c3eb 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1056,6 +1056,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
     MISA_CFG(RVJ, false),
     MISA_CFG(RVV, false),
     MISA_CFG(RVG, false),
+    MISA_CFG(RVB, false),
 };
 
 /*
-- 
2.43.0


