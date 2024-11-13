Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7872D637A0
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 17:20:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBH0U-0000AV-3i; Wed, 13 Nov 2024 12:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0R-0000A0-Ug
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:15 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0Q-0003l5-JI
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:15 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-71e5130832aso5715138b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 09:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1731518293; x=1732123093; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7o8RmsaAOBH8IeqzRchnYHz4h5jWSdWaUM/ctLWYAQ=;
 b=AZaydr3vT9KSEXo4/JLLvWxk4A9sJr+TJWzUUpPTJu7/4uYPISNHMaFHXbXiemO0LI
 gDDxEufGTTpv64Qoqp5NXacZqm5JLAatjLmLkOn3dwH+n74g3+O1/wlz6S4cy5cIuxp9
 ROc7YxID9HAF/FvxJE+tXSB+C9C1psp9qVTDzwPHCnbJxVMEUDgNAXxj52JHrqi+sqQ8
 E92hLAq8Kzem2MG3tC96arC9HUALOtxExQHOftVoCNsSqBwPo26UIGG0uNykivJFBUb9
 j5KmeWzPQFa6BTLS+JlwH1MU4wvROWBBd90daY+TLlPRXCQ/BCQiVsj2xXxPPKJyDx5R
 6C2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731518293; x=1732123093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7o8RmsaAOBH8IeqzRchnYHz4h5jWSdWaUM/ctLWYAQ=;
 b=OCetaVlJV08qXB17dSM1bUEUCBCYEuDxf4qqSHFhzBuyzjaWB4ndtQG0Dj7y22Ixxs
 d29wm+oaxWJpjX0ADRzY0ICS3P54BTaWUOtrORdOR/XHd4WTc6UsYUaqrvMQzaNP2hgH
 bECN96fCwqrsrBCGcFbM5/vm9gQjqIsMxU9OLuvGH/iiINL0Ps8Gz1606n1Mvl39OPI1
 E7oFXcw+DT4abUOFjiR93tli4D2cw8aTPr+75EBg3/i5flutYpNXtmR1Z88PvCfPfx3j
 YubvjEddDN285NVIXdKB2IgduPqQ7eGHawjw1nGp4mrbcKXtwptXGMXEHcD24O/SHgUC
 mARA==
X-Gm-Message-State: AOJu0Yzqr9lIdGbZWjlud8MYgkss97GWguRH6QA9a6351PETh1unxoEl
 8OGce8oJu8Ra7mHbIGdG4LCDq49Q04YrDzLmTZvlfd/DFOyXn5N+NQfHORzntqA=
X-Google-Smtp-Source: AGHT+IGTri8kdjjFaz87jgzKJ2k8TV06p2JBlenDnRzdylUfo7+phEGyUecPlbGR+GOEsyWvdfy9zg==
X-Received: by 2002:a05:6a00:2d9c:b0:71e:4ba:f389 with SMTP id
 d2e1a72fcca58-7241329bd75mr30656823b3a.10.1731518293221; 
 Wed, 13 Nov 2024 09:18:13 -0800 (PST)
Received: from grind.. ([187.101.65.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724078a9063sm13392889b3a.75.2024.11.13.09.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 09:18:12 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 3/9] target/riscv: add shcounterenw
Date: Wed, 13 Nov 2024 14:17:49 -0300
Message-ID: <20241113171755.978109-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113171755.978109-1-dbarboza@ventanamicro.com>
References: <20241113171755.978109-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

shcounterenw is defined in RVA22 as:

"For any hpmcounter that is not read-only zero, the corresponding bit in
hcounteren must be writable."

This is always true in TCG so let's claim support for it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4ad91722a0..6bfb1b1530 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -183,6 +183,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
-- 
2.47.0


