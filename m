Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B6E77184
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 09:09:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNTYM-0008VP-2Z; Tue, 17 Dec 2024 04:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTY6-0008Pb-Ql
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:27 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTY5-0001a0-8p
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38637614567so2258492f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Dec 2024 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734426441; x=1735031241;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgjSgjJZNQH0MIc70/i9yglpUly96nDthfPOg+sK/Yk=;
 b=Rgnr6kAhzXTcl54UA4CyyWWTxpTH/nenIXvrOiV5XZ6WiFWU3fMAkZXwAZKLRmnKnG
 c7Vj49AN4pvvV5AXFPjjV0fdVsyWhhRfg4wMKUa9i/m54nRKo+g4vBc02CtGRy7XwzsL
 FjWlTdIV7jo0XmcSJ/oWO4S4f9Rtqa4IpxvJz70tyja7PV2RDKX/1t3y2WJ+QoiGn8B5
 YYk2dexHXdDE1Dnrm2f/gGlyb5MECbhVp/df7SWpifoy32SuaB0rSc3CK78DQZN1Jodo
 wwOm6RR9r52j6Ow75pmIQM1Ec0hWDuJlyM9fad4l28hGQWN1zmYVtjzs+3190Wx5ECPN
 TITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734426441; x=1735031241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgjSgjJZNQH0MIc70/i9yglpUly96nDthfPOg+sK/Yk=;
 b=UXaQGDh94sVrWDe2B8CHtgyrcXt++1KbxyA7noa3QRsPeX2sKlO0MNcjQX3LGB5KWw
 u2yo9PQV5+vUcSvrYzH0y9rjeii4OXrwSt8MK85iwqT7U5ZiGn/4pHSoqdd7F/+rlQuY
 DO7h1FfiQbuhGpy6CrLsqnu7wi+K5H6U2zV8LsErZXF9elJJaa5McHodRDUnx37MbT1o
 h90809T1impQFssOQu04sV12A6QBLtkSvcEy4EhFLeWBTcABtYj0iMlnN+gnnWPnikbG
 RoDEM4hK65NhEmD0hoITk9dQXxsmShjFRU2XgZkVoFDg1evd4vFtjEYbYLtQqow9/+KM
 qDdg==
X-Gm-Message-State: AOJu0YwvIrSmRIzXuBENAiMv1BVekGIlKVtTh27OX7f31gZL/IPQG24e
 DjOf6bjzAiqix9YSI+tUkazDxfMDb923noSi+W39hUhURiLkgvvIihDbG8GUgykaFT4rBbOx9z/
 /7M4=
X-Gm-Gg: ASbGncu8HZeHFIzaxcmC5kOOHt9t1bdoB/EqVe403fdZa/LU/uOGB2IETRlu03y3lD+
 VChtCfL5GEvq5S79dlfxpHnFiaVUyvhHsn8oIOuZCYyRBFw+gm6bkrEic2zDfEqcmIFCMjwQJbN
 UsMKq9mf1scKyaq24mcKemjVKNq+/muZ4QGjctBc1V1HLVimQcgL8VF847LpyTjJ4obEq1MKoGD
 IcBpWwRL2baJpV+PIOmiCFcMZf/lqBIlx6Xt8+6rW8MzIzb8w/1UXkxOw==
X-Google-Smtp-Source: AGHT+IGCU33sDnKzwaIvtxyhKjbuRRCYWEkZplRFSNzQdrDpmTVxicKEKeLUVqC9hhc0JwwUlNtJ8w==
X-Received: by 2002:a05:6000:184e:b0:385:e013:39ec with SMTP id
 ffacd0b85a97d-388da380c3amr1972966f8f.8.1734426441457; 
 Tue, 17 Dec 2024 01:07:21 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c46sm10704122f8f.71.2024.12.17.01.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 01:07:20 -0800 (PST)
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
Subject: [PATCH v7 9/9] target/riscv: Add Smdbltrp ISA extension enable switch
Date: Tue, 17 Dec 2024 10:07:05 +0100
Message-ID: <20241217090707.3511160-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217090707.3511160-1-cleger@rivosinc.com>
References: <20241217090707.3511160-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x435.google.com
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
index 1b883db0cc..c4330ded69 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -192,6 +192,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(shvstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
+    ISA_EXT_DATA_ENTRY(smdbltrp, PRIV_VERSION_1_13_0, ext_smdbltrp),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
@@ -1625,6 +1626,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
 
     MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
+    MULTI_EXT_CFG_BOOL("smdbltrp", ext_smdbltrp, false),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
-- 
2.45.2


