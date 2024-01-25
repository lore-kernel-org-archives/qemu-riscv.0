Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DB3C48260
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 19:55:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rT5nE-0004eL-3Z; Thu, 25 Jan 2024 14:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rT5nA-0004cs-Vs
 for qemu-riscv@nongnu.org; Thu, 25 Jan 2024 14:53:41 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rT5n9-0001Yh-9z
 for qemu-riscv@nongnu.org; Thu, 25 Jan 2024 14:53:40 -0500
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso5523107a12.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Jan 2024 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706212418; x=1706817218; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQBov+3obq4yDLy1SQOmpy/NkorWmiTmSoDtME+DQ+c=;
 b=fDFA51HzADNXQ9Lrp0Q7A3H9An0r8Qtl66oT54rMLeUZ6BVfXH49mvt3MbdWgOb3kV
 OQfnaXDTsVx/qzB5CaCY1mCz1LPwhLiboYbDO3+tvu/VVJj8hdXzGRifSLpg1opupW2/
 Uv7hFzCSB4MYn9v64aPVLV6bh3K99Kqm74qZKoYLo3qrQyKSWtoW/5P9jkHUZ8Xh5Akq
 R0MRFi/+N4gLzdcq1GKBS7OjBt7Sx4vgW0uZAl3sifsf20p52NwlzOrPD5HDTA5E2P95
 A9veB3AODPIbuuLBePFrHTe/kEuS6bAAbDCRQrBlAAx2UlwqO7BqYVEbKYlnNT89WiDd
 calQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706212418; x=1706817218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQBov+3obq4yDLy1SQOmpy/NkorWmiTmSoDtME+DQ+c=;
 b=PFWUXtjKVV5+3moR6wmjnx4zeketWXOAWAvQsMdGOjZ4Qa5d4CDCgu5RVnUbxOD7zT
 2KXJVfLqvBo1/uXqtfLEKmFV71sO6XmG1B5Y5tzfXSbH7pbF1oqkb4sViWyXZd/BQ6L6
 cKSKrbXuGlrb/krILa6mk+5wG4jhjbM9gvbe84JB2aVGmuLbOoHEyFpuZjnWVrz9EKD8
 XLU0gBW/rx62QFsiNuu4FSvNVz6v6SRLVTH6mORMWtooxAlbozfwFvSk76O5mF8JLoQZ
 Qv8K8MbgpQeJbIVWtTkpzfrPpU/zuFufq23Ea7DNhbWGz/XojyRtWSS/8emXOwp+JiOF
 pmsA==
X-Gm-Message-State: AOJu0YxlH3ZZupkwQ6AioV9ab01qCoNLrpJZ9BrEDKihSoavH5b3cl2a
 Z3ymDtxPofCguuBJD2/I2S0KYLdkBnMK6eXliWhbPp9Pfjf24x7FHD9bT5/oFWY=
X-Google-Smtp-Source: AGHT+IGi7LQEjLFm0wH4Z6JEEQ7kCOFsdn3zXsSyAVfed37sCRo2kviAd8WlKr2Eu212IMUi/uxjrw==
X-Received: by 2002:a17:90a:e551:b0:28c:bb6d:4d16 with SMTP id
 ei17-20020a17090ae55100b0028cbb6d4d16mr134807pjb.31.1706212417953; 
 Thu, 25 Jan 2024 11:53:37 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a17090ad40700b0028b6759d8c1sm1958613pju.29.2024.01.25.11.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 11:53:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 4/6] target/riscv: Reset henvcfg to zero
Date: Thu, 25 Jan 2024 16:53:17 -0300
Message-ID: <20240125195319.329181-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125195319.329181-1-dbarboza@ventanamicro.com>
References: <20240125195319.329181-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Andrew Jones <ajones@ventanamicro.com>

The hypervisor should decide what it wants to enable. Zero all
configuration enable bits on reset.

Also, commit ed67d63798f2 ("target/riscv: Update CSR bits name for
svadu extension") missed one reference to 'hade'. Change it now.

Fixes: 0af3f115e68e ("target/riscv: Add *envcfg.HADE related check in address translation")
Fixes: ed67d63798f2 ("target/riscv: Update CSR bits name for svadu extension")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 3 +--
 target/riscv/csr.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1ecd8a57ed..7fd433daee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -961,8 +961,7 @@ static void riscv_cpu_reset_hold(Object *obj)
 
     env->menvcfg = (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0) |
                    (cpu->cfg.ext_svadu ? MENVCFG_ADUE : 0);
-    env->henvcfg = (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0) |
-                   (cpu->cfg.ext_svadu ? HENVCFG_ADUE : 0);
+    env->henvcfg = 0;
 
     /* Initialized default priorities of local interrupts. */
     for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d9a010387f..93f7bc2cb4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2115,7 +2115,7 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
     /*
      * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
      * henvcfg.stce is read_only 0 when menvcfg.stce = 0
-     * henvcfg.hade is read_only 0 when menvcfg.hade = 0
+     * henvcfg.adue is read_only 0 when menvcfg.adue = 0
      */
     *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE) |
                            env->menvcfg);
-- 
2.43.0


