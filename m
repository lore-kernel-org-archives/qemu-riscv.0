Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA7ED69112
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 14:15:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGfHU-0006Ay-Q5; Thu, 28 Nov 2024 09:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tGfHR-00060M-O7
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:14:05 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tGfHQ-00067d-6W
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:14:05 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21200c749bfso7656615ad.1
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 06:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732803241; x=1733408041;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBLCZdqPMxSLYZ2+WYXOjsa9ukGU0ozAUlc/kIVGN5g=;
 b=3EWEO7rJIsg4e20TW6jAHMEWzanmAeMqXDW9pWE0QDuxn/6Z93sIOPdFsZlSkn2Mgz
 6kHwNg1VMEw8DfhtDxZE6yStwPBq/jNbIFCiza4xHiF8QLR7LVIaEMQrlBULgDhkXiv/
 mI0ZyKfNIkk+BPn+ujdntGqlED02G1I/446rXM7bw1ug3N2EJdicA6vK3Y4HGPpIvGHT
 FCiuT9fIlCw4smBGrPHkJabZrbPzXqbPzhPzrrLqDbhO1WqElvd7WSsaSf68GbcnNPX1
 FGSujW4hrbjAypuY+n3vTMroleF8MPIjeCGKYxZ0kQAdWKMX40N0LJxv/nIetq/JmaIc
 R2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732803241; x=1733408041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fBLCZdqPMxSLYZ2+WYXOjsa9ukGU0ozAUlc/kIVGN5g=;
 b=nDd8wpW22HoYfwEZHsWHAwzvia8mRfs3bgj7jidKF5ByuVX7vDpyCXeqSgyO0MVnZ5
 CXVzsMzvC5J6iM0+uzj5gtFVkMFhqO30U2XuQNzNt+foQiCk81kTUPLDYl0Y1K9NO02A
 vacrGAGnVt/eeP5s4Jm6p9L9Qlb3XgeT0P/d2iua+MWT9q1X9cnrRDdNkdISPvcJwoLl
 PxpK+hLwXiaWUvQivcdQ+M5yji5WlhujxaHO9vSpDfIFPVMZGVNY9CIm/GZS7A5nTR2+
 yJjVUVfqu2zsFhWRqEvO0DFo0oQwQyH9TmzP5SAbUozXEogJo8TGvtTZKk+ySdhFADDK
 caDw==
X-Gm-Message-State: AOJu0Yzo77/PbMgHXjKP8HcpbwxgImFl5CsBNDf5Fj+8KW/iBBpNhEPo
 vi9TdHa7rcrF5W/iAuFD1xeyHmnU8ysVY33hIR8zLuwYnduBcW8eGvfZtIbTdo5IcEdtqdnV7xe
 g
X-Gm-Gg: ASbGncu3O1cFexOoQZ2p6ytq4o/VHjJRByDccFWbgIFKQnU8fjlsBgqJXcK1Uio5yK7
 E13KJLwfnMKc4nCvKYwZDGq8z5yiWOlVIvVj5+JI9kxSeRsQOrqD+lW5w3Mklo1LD5ExORR+HL3
 Bdxq9UdrpOKR2dMMawPEzMq98lSWoLaNzaTt35bp+png5VZJ7YNxJWXKYbcjILlixHX1m9oRQ1g
 rcqwbFWkLvDa0WmKAnp2Hs7LJAeV7Z2hxU8HgFUJji+Ta6a3Zk=
X-Google-Smtp-Source: AGHT+IHQsMuyPDIACOoRN7p7y9HeMOR4wsSBAt8k2FqorI/oK/rRgbuoJYDnLwqrxYE437iD3e0pcw==
X-Received: by 2002:a17:903:32c2:b0:212:12a2:4011 with SMTP id
 d9443c01a7336-215018579bamr84094335ad.27.1732803241463; 
 Thu, 28 Nov 2024 06:14:01 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215218f452csm13829005ad.48.2024.11.28.06.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 06:14:00 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 9/9] target/riscv: Add Smdbltrp ISA extension enable switch
Date: Thu, 28 Nov 2024 15:12:29 +0100
Message-ID: <20241128141230.284320-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241128141230.284320-1-cleger@rivosinc.com>
References: <20241128141230.284320-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=cleger@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index be7c0475bf..9e2166a810 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -185,6 +185,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
+    ISA_EXT_DATA_ENTRY(smdbltrp, PRIV_VERSION_1_13_0, ext_smdbltrp),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
@@ -1586,6 +1587,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
 
     MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
+    MULTI_EXT_CFG_BOOL("smdbltrp", ext_smdbltrp, false),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
-- 
2.45.2


