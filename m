Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0059E77166
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 23:16:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIc6W-0001Fw-2f; Tue, 03 Dec 2024 18:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6U-0001FO-Co
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:50 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6S-0001I4-IN
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:50 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7242f559a9fso6019769b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 15:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733267687; x=1733872487;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lXViAFlbF0a27TZCJ/bkE40evUkFiMFffaowOt3YXOA=;
 b=gEnHvg/0yOz90+1NOCXFDOnhHr8EiCS36/DLKNaRm5MFKUJ9OCwqkzs3xjME2vBhym
 CcCmHutSj7mD4RENPL+Jh/rWT7CAcjcXwRX5jjYQX4mvbLj28cCl7Nl6TkSLIeat1L2a
 G4PSy2Jsgk0GfvOcRhJqteJRElalN2kbe0JbLw67bngoGF2pf2TlwPgffeGLtc/nifJg
 vCIJRI793Bt4BZx67jAa6dbD/WeQmFPjb31R0mranu2cehomfof02RWMhCX+22piIzi5
 AbLqxwEp4a7YFOjg7MszltGMfuc2lEbn3bFu9WHtP1uMWs4Oi+APo9yMWp0zxY843AOI
 z/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733267687; x=1733872487;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lXViAFlbF0a27TZCJ/bkE40evUkFiMFffaowOt3YXOA=;
 b=BQrvA+JCv88SXEQLlurk4NsFEZLY7HATkBPQeVfoSjWsJbKfWEdS6UfWIULtufHVEn
 zvmTxcxg54U/KhTD2NsMCsvk2L9vzsP0yW+N2wOoNDZ5QIUh2fTJXSbRmIM96JSXNgDg
 /Efo+9eoup1KI9W9TqBmRaNGN/RjWCxU0vkQz0cgrE3N+fqX8bt+nG5SgF2LWFtekdIZ
 1Ep/kG2pGtGc08WbPQSXbGk2oIsyXjboevs7q5JG4TiK2tKCmuu1G0tagYP661gu6NG3
 2CaJ3d7SqAdlFwWbyC0SoaJOJgVBM67Ey7WlCbzz4SgzN+g4rYm3LthLJ3RbkeDVPE7D
 4Phw==
X-Gm-Message-State: AOJu0Ywr6ALt5I3bahiAm4cVgvU+GMdpcslSk0QN0y9IajzXXrgwyHKx
 Hd8p/SxxzdxAwROw3Saqb11RNKrxFd9XZKcmrkcgNsjGqALWseV4o/85TqWSS/A=
X-Gm-Gg: ASbGncslyKZGx9rIJOv8YxOrGn4Sajv768LdFB9ZwO2RO/Dj6iU5pIBqjRG5by4sqQy
 oYlEjgR1P7w7WzoL1WJy6MB8/kE+WeXHbxAyuACkSHS2htQ+Z9mfSXHwKtcxEXnPusHk0L1RTwG
 VUTbd4sj/bc4aQWLXzftNF9DR6qkqFuZSB+7PW6o9UsRSMRg5Ca+iCrlhnPlR/6aLYoZiR3qIGr
 4DKGJP1EW/WfPm1WCcJUnTyHJnHd+OU5j5oBCSL6aCwwgEHlXTN2zVrHhOECoc=
X-Google-Smtp-Source: AGHT+IHZX6xOmv6RESxSzfIKssM/VKGrdDopGu0PXBGyXwOCheTKh3QGQk4V83wimymBNC0tW+TjFw==
X-Received: by 2002:a05:6a00:92a3:b0:71e:79a9:ec47 with SMTP id
 d2e1a72fcca58-7257fa5708fmr5365792b3a.6.1733267686769; 
 Tue, 03 Dec 2024 15:14:46 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254180f78asm11032133b3a.133.2024.12.03.15.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:14:46 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 03 Dec 2024 15:14:39 -0800
Subject: [PATCH v4 01/11] target/riscv: Add properties for Indirect CSR
 Access extension
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-counter_delegation-v4-1-c12a89baed86@rivosinc.com>
References: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
In-Reply-To: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42f.google.com
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds the properties for sxcsrind. Definitions of new registers and
implementations will come with future patches.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f219f0c3b527..963f1f3af9ae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -185,12 +185,14 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
+    ISA_EXT_DATA_ENTRY(smcsrind, PRIV_VERSION_1_13_0, ext_smcsrind),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(sscsrind, PRIV_VERSION_1_12_0, ext_sscsrind),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 59d6fc445d18..8b974255f6fb 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -79,6 +79,8 @@ struct RISCVCPUConfig {
     bool ext_smstateen;
     bool ext_sstc;
     bool ext_smcntrpmf;
+    bool ext_smcsrind;
+    bool ext_sscsrind;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;

-- 
2.34.1


