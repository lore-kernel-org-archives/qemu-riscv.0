Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9118DC54E60
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 19:01:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkqJY-0000xY-SQ; Thu, 14 Mar 2024 15:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rkqJJ-0000u6-Oo
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 15:00:14 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rkqJI-0001BY-8g
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 15:00:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1dee5daedf6so916535ad.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2024 12:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710442809; x=1711047609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ooydSwvL0jjxsMrb1ZAR1B/i6i3uwUU/CB18R0piLTI=;
 b=bgPlMWxoZfj5qUCospuWFCZ62qfGRQTWimFhTNoiJLt0wM/T19JLG0vilvBXr1XCNK
 nvU8XJ3YQhcagnS+QyY2pyH3+YaSsCulwjLS0jYYNnamGwwDYTuabivspCKoKoMBLNoy
 6UymP2q+fdJFt4Tl0jHCDVTQpSTQsDJSmz6i35Ayx+JQT/wPjctMl4bgNG8sNC+G/XVh
 XCyqv826xm5jVOAXirEFcwDZOZL2+u48lJIG1z4UBSBiInBdbXLKiBHxOWxP3nI16TIj
 IoEqOxfO8TPvS4JUCxMCFpFfSAfDGE28I0EiJ0RUvNRemuPVYB/qu3eaW3Pb+QEyBeON
 rOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710442809; x=1711047609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ooydSwvL0jjxsMrb1ZAR1B/i6i3uwUU/CB18R0piLTI=;
 b=aHVO7JI0qIrjdGmIuZdBTMBqIILod1pqMfDWLHrhI4tcl9qW+4lBZljXzv9yLi5FX/
 zsbgWDn2NeWsZ4CVaHiafHRgHzlgv1kAoM4IGDHwRo2JwxiYrgtWgNWPsX1AagIBgk1t
 7RycHPNFhANDJYei8psut+77woEfUKnbW9U3mLa9aNePUZstT463Zh2PVeUB9N8ZrZMl
 MyGJdfEg8Q9j2aJcxet0+0Nmh9QhslMKw9haRdSnjKSijnVZ64jUUq71nUc/OUS94HIZ
 dV2RS3F+eeHFGT4Vvm11+b4cz+eooOH7XdTDWyy63ftjMsYFlIIamajtS7HOst92gA2B
 vazQ==
X-Gm-Message-State: AOJu0Yyzl+c6tnptn/mwnRdxXwzSZIaaDe9QCZrr+ePUg4Pyx4YZfAoN
 /crGKoObx3IXQM/ZXreyQsuPke4q9QGt48WeXPldoB0emqnEHabDb2Yv/YgbYLjiMeL2pI150Sf
 WWbk=
X-Google-Smtp-Source: AGHT+IFlpK+m6UyAOt2G9If7QcP3KIX7bmDvLom4sp0i669RnA5E5GRSnL/FVJ1IcEcCW+UEdhEx3A==
X-Received: by 2002:a17:902:e810:b0:1dd:667f:bf1b with SMTP id
 u16-20020a170902e81000b001dd667fbf1bmr2930399plg.0.1710442808425; 
 Thu, 14 Mar 2024 12:00:08 -0700 (PDT)
Received: from aryabhatta.. ([49.37.251.185]) by smtp.gmail.com with ESMTPSA id
 e8-20020a170902784800b001dd1096e365sm2105732pln.281.2024.03.14.12.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 12:00:07 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: ajones@ventanamicro.com
Subject: [PATCH v7 3/4] target/riscv: Expose sdtrig ISA extension
Date: Fri, 15 Mar 2024 00:29:56 +0530
Message-Id: <20240314185957.36940-4-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314185957.36940-1-hchauhan@ventanamicro.com>
References: <20240314185957.36940-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This patch adds "sdtrig" in the ISA string when sdtrig extension is enabled.
The sdtrig extension may or may not be implemented in a system. Therefore, the
           -cpu rv64,sdtrig=<true/false>
option can be used to dynamically turn sdtrig extension on or off.

By default, the sdtrig extension is disabled and debug property enabled as usual.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ab631500ac..4231f36c1b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -175,6 +175,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, ext_sdtrig),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
@@ -1485,6 +1486,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zvfhmin", ext_zvfhmin, false),
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
 
+    MULTI_EXT_CFG_BOOL("sdtrig", ext_sdtrig, false),
     MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
-- 
2.34.1


