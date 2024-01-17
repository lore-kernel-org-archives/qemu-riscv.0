Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2306CC47DA2
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 14:25:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQ6qE-0005ya-M7; Wed, 17 Jan 2024 09:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rQ6qC-0005y8-T3
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 09:24:28 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rQ6qB-0004ni-AL
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 09:24:28 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d51bf8a7dcso23842935ad.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jan 2024 06:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705501465; x=1706106265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jV+VxFjXfh07ULlO/8QJNjFaMzCVq1g+PBkWe2iNDg=;
 b=GBRNl5LtmoE1Oi/wnFfOZAoQ5ShHq5hhz1C8lzASzVcstaTkPMuWVTD7ZfRTvp6NJX
 FAJakGuXoSNBHxdcMFonPCj/EoTzuKJWmObazAcP5Kwcjvn1NB3vnW0H+AmbCajyH0k7
 vAHQ2jH3KsO1IG1PLzhmFnGAqxjRTQUCxcdvG6s6bw5yMA0rVYFfLXWhC3QCM5/T2/Lu
 Tr49BK6U/namT/tiYCEyA++7MylFvCr4JD47V8DXdB6sZzCNwJn5uJ6kH3V8pk+unIDw
 yQbrw/C0yJw8SG/nOqIGpmqtjbsERB74JnI5FmVRkx3niIccB3Q5vI7Dbke9ssBvxALT
 7Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705501465; x=1706106265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jV+VxFjXfh07ULlO/8QJNjFaMzCVq1g+PBkWe2iNDg=;
 b=w94svRkBG+WcR47YuYGYy7TNiKAjenT1rGev7aizPILjdgUP6kuFq/9GZtBZImedXf
 YdgW2L1ENXCq+rRjrbJkMYbfIk5Lo9mcZ6pd85gA50SGknsiW11xNlvHvSwEcea86rwZ
 kWa+oSNRkODNSrw9svrC3YNUyWda7sOkeDkm4llmN42R3nkaHFsAkqDPmPjBATIDCKom
 RmTzIEYdduDX2OunLf7wMvGD/GUJmeRvAUekJWgMJhQ7bdktUl0AQmhI6ju5KYvaXus5
 SkeUrX4WA2GCgUVCqKRZzaYo6+Wl4EeznvmJEyyI+hTn4GQl72sgivchX5K55lSbc/tG
 3A4Q==
X-Gm-Message-State: AOJu0Ywr5hPIUjppXfVul3iCE6tY4ik5nCjiCCOIDMa+gVRbS4FoopvL
 eBQmMqpaMwt3zv6gd5Y1Q2TNcZz86IPRNZlSb7MxRmax668=
X-Google-Smtp-Source: AGHT+IF0qcemCW2VsHwB/iVRfSmxs+JjCY0TK1gBOW8Z9DPuogetRuMQpqtTjoHGFuCIYLMk8pCUTA==
X-Received: by 2002:a17:90b:3812:b0:290:c03:363d with SMTP id
 mq18-20020a17090b381200b002900c03363dmr587844pjb.3.1705501465368; 
 Wed, 17 Jan 2024 06:24:25 -0800 (PST)
Received: from brahaspati.localdomain ([49.37.250.249])
 by smtp.gmail.com with ESMTPSA id
 mf15-20020a17090b184f00b0028cef2025ddsm14277657pjb.15.2024.01.17.06.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 06:24:25 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v2 2/2] target/riscv: Export sdtrig in ISA string
Date: Wed, 17 Jan 2024 19:54:12 +0530
Message-Id: <20240117142412.1615505-3-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117142412.1615505-1-hchauhan@ventanamicro.com>
References: <20240117142412.1615505-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x632.google.com
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

This patch adds "x-sdtrig" in the ISA string when sdtrig extension is enabled.
The sdtrig extension may or may not be implemented in a system. Therefore, the
            -cpu rv64,x-sdtrig=<true/false>
option can be used to dynamically turn sdtrig extension on or off.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c770a7e506..860e520730 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -153,6 +153,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(x-sdtrig, PRIV_VERSION_1_12_0, ext_sdtrig),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
-- 
2.34.1


