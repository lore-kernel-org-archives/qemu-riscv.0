Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B732C282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 10:49:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt2ar-0002Pg-J8; Fri, 14 Mar 2025 06:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1tt2ao-0002O7-0R
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 06:48:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1tt2al-00088c-OF
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 06:48:41 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso13234415e9.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741949316; x=1742554116;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DHvaqeKOMIwi2VCRQxb1chQbCf2eCb6TpqzXigXmR7E=;
 b=k9rLzgqBR9n3pxa5vZvLLNmwCAyd/CZlcTDbgCJx7b3AdeqITfsUO6wVQwZuG9xTWt
 qS1w81Lt8MnfTJAGj2/Er9ahPNn63cEL0y3nIym49RC6mMVu8VykGhPIeWz+rY//AYfE
 b/IjN1POkbpk0fSrf7WI8MZvsv2dBFKzHpJCxgWfKfkdm0+1ZbZfObE++rmHCauqnoAA
 BSN/1Vknv0TRnZ1A+LRHQmRB3wmMB7vulb817EBY1FyYMvEyKrc0NABRFR805DgU37Y9
 H5AU/Hy9a5KMWQL7lI8dPLyOYC+mKIlujBX+K2mhHqQrOJkSAObJXvg/APvTscdxx5GH
 bIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741949316; x=1742554116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DHvaqeKOMIwi2VCRQxb1chQbCf2eCb6TpqzXigXmR7E=;
 b=SXdpYQWCjKTHZL6CXOhk3M7nzGEPzsNFhstmQeWqm/OmoHGpMrROdWMWoNt/lYOkN5
 A6tzO+1LHC7WppUgKFz6aEL9sWBrT7oO4/YgiNiLy8SexylMZbXDFvaewpUEkEnDdDzs
 w9lZqz86hwzC1y4vrEya7E2jQMXksNfxNogZ48u5ibf4XjnCqsO2D2vJnQ5viy6mDONe
 TpVvtvZ6NGokbCTiBR8AFUnxuG13muLESKTCiHV/mo7VbXt30fKWE7zdkwvYrr5VnlYt
 2wT4IqgEhdEp/yrhbHArhigRk+dpAqMtiWoUIdaXYVlQ+jFSiuDWpLfTPbmi8rqqwH3M
 0r9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXWOWbLpl+km0euKgIGyzskVelczfOHY5lZi9vmBJ3qNtWkqEUg0Huic4KCZgud93t3jCvPRDqqKlA@nongnu.org
X-Gm-Message-State: AOJu0YwQHTT5de8hCMu1PDwnJB3a3aeh/ScYrZ8QQw+w72EDIOJOMeA5
 5/pqaUAyZmGBi6Awk/m3c6bDKaS+bBAaIGGqBQ3TRZskxNmoQbaHlp7Je9tXwr0=
X-Gm-Gg: ASbGncvhhSrIxFImnGaatdfvRrev9Ntr4ezmFhcQX0W6qewSFFIkYjuyy/bbPb4fY4Y
 tV329bhCRe73akknX6csqaUbPns5ai2Yao/fhb4tVUU+0Xm7oca7T3pZkC6DGuxy79tsf+vb7zE
 hhprppEzPEqOa1bfQaVLgzPuTsZHF6Y58QnyOcpxFBi9rt0JvWGOvYRbdTgLZVFZd2enM2Cpu3M
 OhsE/f6c7RMQq8doaS52B7f876iuzN7tMWNVv/T4yzRHY6accLbME6JCgQ86TdrbQE8QqkE+EGZ
 +n2W+5sbQa/pj7KePjL09165KhPx5l7Ug3HOrF3BmPwdzmrHsp7LZdWxrKATQzUCuq9p4Y0=
X-Google-Smtp-Source: AGHT+IEa2SYIPBYIsuZ9OKAc3UqeKTelj7hbC2+XHp6uZjW2fpymM/pzkB8vzUsnOJig6uKkkVaO5A==
X-Received: by 2002:a05:600c:4245:b0:43d:2230:303b with SMTP id
 5b1f17b1804b1-43d22303221mr7322765e9.20.1741949316427; 
 Fri, 14 Mar 2025 03:48:36 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com
 ([2001:861:3382:ef90:1b9d:995f:4137:a135])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fd274c4sm8714715e9.0.2025.03.14.03.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 03:48:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC] target: riscv: Add Svrsw60b59b extension support
Date: Fri, 14 Mar 2025 11:48:33 +0100
Message-Id: <20250314104833.369365-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32b.google.com
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

The Svrsw60b59b extension allows to free the PTE reserved bits 60 and 59
for software to use.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

I tested it by always setting the bits 60 and 59 in Linux which booted
fine.

 target/riscv/cpu.c        | 2 ++
 target/riscv/cpu_bits.h   | 3 ++-
 target/riscv/cpu_cfg.h    | 1 +
 target/riscv/cpu_helper.c | 3 ++-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2..ee89cdef46 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -219,6 +219,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(svrsw60b59b, PRIV_VERSION_1_13_0, ext_svrsw60b59b),
     ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
     ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
@@ -1644,6 +1645,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
+    MULTI_EXT_CFG_BOOL("svrsw60b59b", ext_svrsw60b59b, false),
     MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, true),
 
     MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index f97c48a394..71f9e603c5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -663,7 +663,8 @@ typedef enum {
 #define PTE_SOFT            0x300 /* Reserved for Software */
 #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
 #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
-#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
+#define PTE_RESERVED(svrsw60b59b)		\
+		(svrsw60b59b ? 0x07C0000000000000ULL : 0x1FC0000000000000ULL) /* Reserved bits */
 #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
 
 /* Page table PPN shift amount */
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index b410b1e603..f6e4b0068a 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -89,6 +89,7 @@ struct RISCVCPUConfig {
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
+    bool ext_svrsw60b59b;
     bool ext_svvptc;
     bool ext_svukte;
     bool ext_zdinx;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1dfc4ecbf..6546cea403 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1156,6 +1156,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     bool svade = riscv_cpu_cfg(env)->ext_svade;
     bool svadu = riscv_cpu_cfg(env)->ext_svadu;
     bool adue = svadu ? env->menvcfg & MENVCFG_ADUE : !svade;
+    bool svrsw60b59b = riscv_cpu_cfg(env)->ext_svrsw60b59b;
 
     if (first_stage && two_stage && env->virt_enabled) {
         pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
@@ -1225,7 +1226,7 @@ restart:
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
         } else {
-            if (pte & PTE_RESERVED) {
+            if (pte & PTE_RESERVED(svrsw60b59b)) {
                 return TRANSLATE_FAIL;
             }
 
-- 
2.39.2


