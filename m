Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8730C369D5
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 12:00:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1stQfM-0006Z9-8z; Wed, 25 Sep 2024 07:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1stQf3-0005Ax-3R
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2024 07:58:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1stQf1-0000i6-5J
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2024 07:58:24 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-375e5c12042so3496613f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Sep 2024 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727265501; x=1727870301;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVwwvNZTDkJx0gmpOxGh5ddASHBGIzNT4u9n31ZE25I=;
 b=J0wQGPyARllY5uRLfP/BDQAgrxsfUDtGEDG2YS5lBv0/IeyKyceQbBpJw1nLCEWSl7
 1DIXOLlfvwS8LaoKYRoC7gnABaVlCUZfCwQqwYkydjwM08chlyXsZk97TP8q77PCVmGu
 2Hg7kst8IN0EyC0VBaQltaCUi08+QfD0vOHZVgdHQ+j7uH7QmSKKeMC9tEKspdORmMbJ
 YrrSA3jPhqmai+tpe/JYLyt5N4SBXUMe2ZLqFzt3sA7hOZGryFKBg4JheA8tvrEX/vNQ
 aKEh9whaLhHszlZposP8xF66pxaaHNuh4YRrzy9ozyJ3se9xTpNjFOwErR6o/DabK9Zw
 0poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727265501; x=1727870301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AVwwvNZTDkJx0gmpOxGh5ddASHBGIzNT4u9n31ZE25I=;
 b=AfNDqXoOveEOrU91ck0p9Ir4jqPhaI5sBLYbQHx7eI1KeioUXeRIpkrQs67Au7moZX
 ukAMMrV9UzjTcT389uE4hZwAUW2Fh3Qiwb/guhlWXxBUTjpE314b4GicZ4ruXxOFA6hP
 q36+zUQ8DxypGjLfkI+vuhw1bLJQ/1rgPeFAZ1qW5mK2w4ipCikUAJksLbNDi9Rc4WkC
 w9diQZW9A5W+SEAPoXwrtwT4HHxmX/0VD71OPhpAS8vY89vgkpq4+UWa38dZs/iKim3n
 2jiWbg3Volq7uaImlOvlA2DytFhQjy79OS+nfBVqLipI9imRddKKEFb7uTewQzUK1iWq
 NQlQ==
X-Gm-Message-State: AOJu0YwGMas/9by/AZqwnyDOQSfodiii8myjrVRh2UG9BzgpkWiDuqiR
 z2F7cLzHPyMuvY+MaI4qrPDL2OOUfOM72guOvqeS2nWwX3BDc+rOH9BSYMcUHwTZTe3EvvCA9og
 r
X-Google-Smtp-Source: AGHT+IEGywPzFSyZ3yorDA+A9/p0BCPmvUoHf0kXD9riXsT2wN3IoeCqNFrt6v8omhahaW+o8X0k3A==
X-Received: by 2002:a5d:4946:0:b0:374:c1a9:b989 with SMTP id
 ffacd0b85a97d-37cc2464e4fmr1804630f8f.1.1727265500746; 
 Wed, 25 Sep 2024 04:58:20 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2ab52fsm3770612f8f.13.2024.09.25.04.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:58:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] target/riscv: Add Smdbltrp ISA extension enable switch
Date: Wed, 25 Sep 2024 13:58:06 +0200
Message-ID: <20240925115808.77874-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925115808.77874-1-cleger@rivosinc.com>
References: <20240925115808.77874-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add the switch to enable the Smdbltrp ISA extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd3351832a..44da17bc9a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -183,6 +183,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
+    ISA_EXT_DATA_ENTRY(smdbltrp, PRIV_VERSION_1_12_0, ext_smdbltrp),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
@@ -1492,6 +1493,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
 
     MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
+    MULTI_EXT_CFG_BOOL("smdbltrp", ext_smdbltrp, false),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
-- 
2.45.2


