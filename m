Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5BDC47DAF
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 14:25:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQ6q7-0005wZ-BJ; Wed, 17 Jan 2024 09:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rQ6q6-0005w3-CM
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 09:24:22 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rQ6q4-0004mU-Sg
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 09:24:22 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d5595997ffso19203255ad.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jan 2024 06:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705501459; x=1706106259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qTZUuaX1W6st72AeIA8AhRC3XRQhFWCuRiAHHvQLoWg=;
 b=M6M9dfFWWRK/rTY5uj0kGKu269YppR0SqZW6D0myzVo1RUi4z6Rzh6BHdbskVQ2osq
 5Eys5cJ8EPxeK2IzxUnVnyEBERAM0j69yDvK4WkV0PySYM88u1iMJKVjKUjmMRoSP8bG
 CXaQqAVx8pQw0rPc6RSnN4ZmqbtmaI1FJy5wiqKUyiGmcFraSTvCCNHb7UY+HSfvqjSw
 31/b8TMsYHDPr1WORF7V3kjsiBGxI/i8coI1df0gRZ1yVhQklnvKCAUmdNhCyOd/VT+k
 Fx06vTeltboZ7JIsaoJ+f7erbx7BB6GN57fm5DrZQo47BZg0ufUIe9bAkw20m2RfF08c
 F/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705501459; x=1706106259;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qTZUuaX1W6st72AeIA8AhRC3XRQhFWCuRiAHHvQLoWg=;
 b=cOTkxG3nJadhci60A8tiDe8RDNOtESA5BtJ0KQsywt5iR3B0+dACBdIX4lw05m0LRV
 E5puDBsRKtqTR4NazYH26k2qPj1/3OkiZ3yLsYA6/Oxr7vHK5noMzVJVJC6QVVFAv/43
 FDRqABOiPxkdlzQfclWeV4YHYh76Js7PNwnmd6YtPp1kxYteWJJMWQYAnJYKrSLkS0g+
 BYlMVfsT/Aupu9roXbATv2w5CEFhzYTheBSWNj3HIQdkWQiGTZNzxaeKEs2Ts+EJ6f2Z
 5O0EYHg3gFx3mTxC1qrMzkcwoIr8wrAUvoZncwyiXprX3BSUiGFdviH6lH/i29W4+9DN
 uKSA==
X-Gm-Message-State: AOJu0YxGk7XTMqozOJrskXxfKN4LSg+hAT4shDaTFjhZzwnIYL0X6szL
 168MrDsxaVyFiGPYwU2XsSIUy0jJ3WO3nxlSZqljMoSAQUY=
X-Google-Smtp-Source: AGHT+IG5h5F8jVSJoE8RG0hyEtLiJPfVjbKeO66WcUA0HL/muoF7kMXyZISKjWFXMoQL4pFzbDa8Ng==
X-Received: by 2002:a17:90b:1e0a:b0:28e:3dcc:7381 with SMTP id
 pg10-20020a17090b1e0a00b0028e3dcc7381mr10381711pjb.0.1705501458649; 
 Wed, 17 Jan 2024 06:24:18 -0800 (PST)
Received: from brahaspati.localdomain ([49.37.250.249])
 by smtp.gmail.com with ESMTPSA id
 mf15-20020a17090b184f00b0028cef2025ddsm14277657pjb.15.2024.01.17.06.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 06:24:18 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v2 0/2] Export debug triggers as an extension
Date: Wed, 17 Jan 2024 19:54:10 +0530
Message-Id: <20240117142412.1615505-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x62a.google.com
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

All the CPUs may or may not implement the debug trigger (sdtrig)
extension. The presence of it should be dynamically detectable.
This patch exports the debug triggers as an extension which
can be turned on or off by x-sdtrig=<true/false> option. It is
turned on by default.

"x-sdtrig" is concatenated to ISA string when it is enabled.
Like so:
rv64imafdch_zicbom_*_x-sdtrig_*_sstc_svadu

Changes from v1:
   - Replaced the debug property with ext_sdtrig
   - Marked it experimenatal by naming it x-sdtrig
   - x-sdtrig is added to ISA string
   - Reversed the patch order

Himanshu Chauhan (2):
  target/riscv: Convert sdtrig functionality from property to an
    extension
  target/riscv: Export sdtrig in ISA string

 target/riscv/cpu.c        | 8 ++++----
 target/riscv/cpu_cfg.h    | 2 +-
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/machine.c    | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1


