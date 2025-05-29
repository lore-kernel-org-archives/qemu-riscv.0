Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D43C5AD49
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 May 2025 20:24:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKjmq-00047o-99; Thu, 29 May 2025 16:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKjmk-00045m-V2
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 16:23:31 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKjmj-00066M-FZ
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 16:23:30 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-87de8a14cd7so408319241.1
 for <qemu-riscv@nongnu.org>; Thu, 29 May 2025 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748550207; x=1749155007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B677hJTQJzeCjexLbVxPAKLc0dEI/GRXjaegkypCrIg=;
 b=OLFvK3FXf/mIEgZ4FkR0UY6Avol9i0PVPtB7+tcgtX/4khGIBPhqBryMLE/0GWASP2
 qA4Siv8ct5xuF1bLrBae/Xw9RgacpYXWT1G+ZRJ6kJ6Xo7jIB3fYskOfYfXiu2gfPEun
 gpVXTlQReQ8hQN1r0vvZ9UvROUjgFPrfajGD1hxydL4vU+Kwv697PVWkaNUUTNtrk6zb
 Dli5sv4jK4SH2Rwt3E9rG23O8lUaWhirrny9M5klzi6JHpVPXc52nE+5gU3PQbaVD5dN
 ABfOoSTmy8aXev4j3NLyExe3xoHqWYNRh4DSgt67jXEhcn2yCO/Afiv49uv0kSDGpb9q
 s1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748550207; x=1749155007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B677hJTQJzeCjexLbVxPAKLc0dEI/GRXjaegkypCrIg=;
 b=IVP+Q4nWd2Zp4dgX6bgZ8DIWZMPyN0gyMKmgycdCZL2XEuCOT7c2Mqnzzxyrfm2lex
 T+K8o5xkxp+wP1WHpYLSmLZ/bRwvlA2f5+pp+doqk2JoFuR+DuiWXMBFKupqzTdyRL2X
 SkGFe+qbYSXW2qXJ5Y3BdT5hCnJKPV7ewUFNgXaqp/DCvPI1uNY5B32+kgASIq1RFr1E
 Z313MWM6nfRvigSH9P7z9ZIS84bzAqdTRQQpF3t0pRvTpBlwJ/LbVKVmYf8abnuo5IKa
 3a1wUD7JX5lKf5fH/jkVTtBre5mrvS/viSIWBc8Xgh17leVIVPfWhaoQIt+w7akJKTrn
 7PLA==
X-Gm-Message-State: AOJu0Yxwz8/M5Rk8kz0Jk7dECb56VEq/bpaHyJLUTouJGTDQrafA6hNj
 EbfuF+CerwuaF9N5yx4pM9GOmlcMImjpDVRtx6uidZa6gr6B4e9c6ktFMjiOlVkb7Us=
X-Gm-Gg: ASbGncvzu2ORTtB8miSTZqIxrEwDg83hVPUcrtbZ1uUqFT6MYBzF/wFhFycryUeES6c
 fkJKMGf7TmhFWMlFHQjq2/FD5GTKD99z2RnOkJMVDFQ9aJ1NWPgrQfsljk8aCi8g8akNubGEzfo
 CcKbD4CyIVlA0cc0pj5tLGOS/KWlB7WK7uTyzGrPaGkHhrxdkktA8wOutrhNmn0Y2gb3nQAXisI
 O2Pw8oWeTumffKaEUOBFfATaIkLKgBm9SWY6FxoEe7wDTp/RcXxA8IRphNeWxj3jhYo5wQol9qu
 3ZtOiI/a6myYqA5KYX+72rk7M1Rl6CuPWFDy3WO+TmrjLDkf1qa5y7+nzTIkAaIKXht3q0NkQ67
 2PTEVQMut2FwodQ==
X-Google-Smtp-Source: AGHT+IFasTjGeyBdo43PNNvGHkMS55er3yUfi9QF8k3EtNjXCgbiq1r+IKsU0nOeKB1RaEzyfwnbZg==
X-Received: by 2002:a05:6102:3e18:b0:4e5:a0a3:86da with SMTP id
 ada2fe7eead31-4e6e40fba99mr1457857137.12.1748550207464; 
 Thu, 29 May 2025 13:23:27 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.35.190])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87e2a2c774asm1647137241.20.2025.05.29.13.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 13:23:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [qemu PATCH 2/3] target/riscv/cpu.c: add 'ssstrict' to riscv,isa
Date: Thu, 29 May 2025 17:23:14 -0300
Message-ID: <20250529202315.1684198-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529202315.1684198-1-dbarboza@ventanamicro.com>
References: <20250529202315.1684198-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ua1-x92b.google.com
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

'ssstrict' is a RVA23 profile-defined extension defined as follows:

"No non-conforming extensions are present. Attempts to execute
unimplemented opcodes or access unimplemented CSRs in the standard or
reserved encoding spaces raises an illegal instruction exception that
results in a contained trap to the supervisor-mode trap handler."

In short, we need to throw an exception when accessing unimplemented
CSRs or opcodes. We do that, so let's advertise it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9d6fae72b2..cd0b159ed5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -217,6 +217,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_13_0, ext_ssnpm),
     ISA_EXT_DATA_ENTRY(sspm, PRIV_VERSION_1_13_0, ext_sspm),
     ISA_EXT_DATA_ENTRY(ssstateen, PRIV_VERSION_1_12_0, ext_ssstateen),
+    ISA_EXT_DATA_ENTRY(ssstrict, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
-- 
2.49.0


