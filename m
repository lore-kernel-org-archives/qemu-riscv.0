Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C77C54E58
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 17:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rnM2e-00074s-No; Thu, 21 Mar 2024 13:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rnM2c-00070e-A8
 for qemu-riscv@nongnu.org; Thu, 21 Mar 2024 13:17:22 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rnM2a-0007C7-Nu
 for qemu-riscv@nongnu.org; Thu, 21 Mar 2024 13:17:22 -0400
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6962e6fbf60so12278926d6.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Mar 2024 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1711041439; x=1711646239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bfRzyaQbdVM7LhhFkyg6noUZevlysrBjTZmd0VuOsCc=;
 b=S/ho9BPn354jnzhzfMILZuRsYaKoH2JD7P6OtQQ2NZ68FhcNTeH2z5srWgK7/GPlbh
 ZlgPfXyYZz8QKvR4E3PgUZeNnbQrHzB7668VlopT4gWxprkn5TP8LkSH+QGxIWmhUZVI
 3LdAxD3y4yUciXXk0v+U0gLXARGzD2DmW98QXRsQxKk83aI/Efeu/S1nMKmFoc+O9NUW
 n5Wd10HZshS2sZV6mQ69TpuU75vTE5Rvc4f54rv6u6NEQMlGXB6EVq+F8Lxd0mEXTcF8
 6sp67LCaxHCqQhr0Z1yTiOHdP/xCU/NDv6n1t3aDCANgwvIF61vJZiF+N3Ho0KKYFKto
 b6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711041439; x=1711646239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfRzyaQbdVM7LhhFkyg6noUZevlysrBjTZmd0VuOsCc=;
 b=Vq1yoRtXK1OWGgCw3mGKpfhIq0OkQx2mBUop7rqHGSGla/p2rnaJrjyeTkaY1icQOj
 4bzgte+L+S/RZ0E3OvMNIvDUtliAeO+lftKClIv4GNRq9RKVIU7+6LTjMZCRXg/mzSYs
 88E5VVKRq64s9dzvJ17Ww0P85+R8oC2XWpc4elLDOp5/hdR4CyYyvCkFy+0Y53tPgRzP
 iLF5WNFHQanC0UNAX/D0Zcpj0+DRROUJg/bHloj6SLHxyrZwcfwwts74zsQyDIhojzWD
 TTBN28Rjt6GUFP4XE8LIgyanhK7N48ZTy+R/93fwMlPWjkzT9azio5fAj6nsrxRPqozX
 eweA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLL3XG0eAIcvW36joOb6+aH956jFIaExadZcAwTLM+71z2xT0iPcI2EajywJ70Iyb4vhIRaHpzbLbhMUFlSdAYfAeB/GA=
X-Gm-Message-State: AOJu0YxrcrmgNnLG7XeCglP1RpBoJYrwt7MaIbmuFoyBGhvEDiHYkSfU
 pbRoIzLOJp7xhHWqd26wPdojWCfpCJAVD15EaF1S4/Te0BdIqaDWML/VXKOemKSHfNE3IVJCWxc
 IoBM=
X-Google-Smtp-Source: AGHT+IGxhclYz6XBiZKxlGAdH/UcoyCas7f4Uej4apIuOP+hyptjdNpNk40e4Jxg9EN3dhOfdKhoVA==
X-Received: by 2002:a05:6a20:1581:b0:1a1:510e:7673 with SMTP id
 h1-20020a056a20158100b001a1510e7673mr102552pzj.46.1711040976517; 
 Thu, 21 Mar 2024 10:09:36 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa79d1a000000b006ea790c2232sm74028pfp.79.2024.03.21.10.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 10:09:36 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH] target/riscv: rvv: Remove the dependency of Zvfbfmin to
 Zfbfmin
Date: Fri, 22 Mar 2024 01:09:27 +0800
Message-Id: <20240321170929.1162507-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=max.chou@sifive.com; helo=mail-qv1-xf33.google.com
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

According to the Zvfbfmin definition in the RISC-V BF16 extensions spec,
the Zvfbfmin extension only requires either the V extension or the
Zve32f extension.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/tcg/tcg-cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 63192ef54f3..b5b95e052d2 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -530,11 +530,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zfbfmin) {
-        error_setg(errp, "Zvfbfmin extension depends on Zfbfmin extension");
-        return;
-    }
-
     if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zve32f) {
         error_setg(errp, "Zvfbfmin extension depends on Zve32f extension");
         return;
-- 
2.34.1


