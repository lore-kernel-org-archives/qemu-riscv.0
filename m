Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DA8C5B572
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 17:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuD0T-0002ti-CW; Wed, 12 Aug 2026 13:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuD0M-0002rW-H2
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 13:44:43 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wuD0J-0007dC-Kw
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 13:44:42 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso2116506a91.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786556675; x=1787161475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gzDpG69c0U/dBiv0BSn17OfVNnj4yY7pxo9nq5cILcc=;
 b=IUYDfi/t/vlewy7jN+SYY2zR1+lTmpN1OHUBgHGt/xUZo+kO23w7izSC7Hr9CXZN/W
 iQD0cFIHuj+ZoIprm1XwNR1jiX3yJ33sDrD+EMxGFdHlQA1/BeDkANO8kYw1OhQe5DSi
 VU0kukBmXxc6Rz0CiSidz4v+V9MzGUBhh7/4P8+gyvVrQH+c1S+Pu7hoWYG8Kbr2k0dS
 zFPOL0EtX7QMy2ShE3UQ+CWBuEqBM3KTQY1zvC6StAD8Kb29g+76gWn9gtbB0svkgClX
 lmkO8alqt1nk6kw+bUz5z8NZ+P29KJj5+XiyG8PxBq3GxE9JYJ5TXt9S2avuGcBdFGdC
 LadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786556675; x=1787161475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gzDpG69c0U/dBiv0BSn17OfVNnj4yY7pxo9nq5cILcc=;
 b=Wr910o4apMReBpwH4+RggARoQoPfNRin7FlXcf6fyPsRgQ5C4/cx9D0+ohel7wqUOn
 ToSaIL/K03H8oJtpBwgWIH5iFfGpciTJbADIAXyM1+w5DRjlN3JBTxJJaOmpD0HG/1bk
 bJEuof4aq5OpoLbYdrE18DYGn7wc+7nuw8Wfcag6sfIMlvBmktXfX9eWobrEVK8jMrlq
 9si3/FQuC5wpx0nmezh3L3L8etOxPTSJmPVVofxEhxDuEu2ejNa0mju3+IrL/9Fz9iLb
 PKVVQ1sYvw34HT0NtOM3LemJnBuJSEXvp28rEnbsRxMIC578f+tPoWN3kTQUcPL85vkl
 AiWg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp7BVubKToLJEO4DRJYgaPesveBv4kNMfUW/Jwpyd+BIPX7FyRxVUNVwVoWr7brdWORITE4mdA1va+t@nongnu.org
X-Gm-Message-State: AOJu0YwX8obVCbw2POFP2H6SH7SFu2gPay5dCrbtTLiL51xwa6KxYUlz
 gzMIQ0PEbfxttk0M/W2f7C3eybQDiXrsYOyaJqlzOTQh56i+fMV3jEtt02Goy4+qbXU=
X-Gm-Gg: AR+sD11U6Pe0Ijv1NYJxBb2JNo5GyXDmev4yC6WK5OsqlwOM6sfnqHAh15lMUQCULYG
 iSX1RuFhlqZ3L8UfI4HqD46rRAQZXUN4/ZaD4fJ111XlGKE221U7/zokML7BeNLPuamz2ntdGjK
 t0e1E6o1JCk59Ic15JQBjP0KfQ5SrrSmHFeCbrVckb14urkXCcz8JeyiZ79irSLsMmyPHpySN/n
 rGwvnUq+jTWhW5W8zNgLgBgFEdT208itsd4F0w+T7Xr1heWqCanPAhwYRS/li3V12l5q46H8STO
 ZHoApgvvAYzUIoO454c6fcufETsZ/fXyNucfQ4l6rJTXPmyNcDDswFr6PpSjlRsYrJLRPmZ2dXg
 xyskIqgVF2SSfbXzygXuJXkyrdy4i6GP9czVPZxpr6CGwOaq6VwLLhlFT5EDwEAZuy7Tw739O/v
 P3Isf919uYbXTaAWaOiBXFnt+kLvuAYcE0gd5UifQo7ew+cx5WkInixLne9zmtc6wKDT4/YP7Hi
 0u9CuUYaoVFsi4SUIaLxCbNznOPxkoeWG7ABreHD7qF+ui+ELs+uqCx9L1UqJ81
X-Received: by 2002:a17:90b:1f90:b0:380:fead:448d with SMTP id
 98e67ed59e1d1-39301416e89mr7931944a91.13.1786556674645; 
 Wed, 12 Aug 2026 10:44:34 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931db13c3bsm13210a91.3.2026.08.12.10.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 10:44:33 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 3/6] target/riscv/cpu: Add SiFive custom int8 matmul
 extension implied rules
Date: Thu, 13 Aug 2026 01:44:13 +0800
Message-ID: <20260812174417.2468981-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812174417.2468981-1-max.chou@sifive.com>
References: <20260812174417.2468981-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Frank Chang <frank.chang@sifive.com>

Add SiFive custom int8 matmul extension implied rules to enable the
implied extensions of SiFive custom int8 matmul extension recursively.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fffb92ff110..265a92a8b7f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2811,6 +2811,24 @@ static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule XSFVQMACCDOD_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccdod),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule XSFVQMACCQOQ_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccqoq),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
     &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED,
@@ -2862,6 +2880,8 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &SMCTR_IMPLIED,
     &SSCTR_IMPLIED,
     &SSSTATEEN_IMPLIED,
+    &XSFVQMACCDOD_IMPLIED,
+    &XSFVQMACCQOQ_IMPLIED,
     NULL
 };
 
-- 
2.43.0


