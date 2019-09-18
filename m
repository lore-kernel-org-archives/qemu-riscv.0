Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbrx-0006Na-RI
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49011)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrt-0006He-AQ
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrs-0006QC-1e
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:45 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45667)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbrr-0006On-TG
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:43 -0400
Received: by mail-pl1-f193.google.com with SMTP id u12so95175pls.12
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=YvM1ymkGWX0+m24LnKUHducTTIF5LG0mv+vTnIqq7DA=;
 b=GH1hnPRHBlY6ENSvpsW3chef0AJjedApxd/tdcqocwC9OilpW6szWJCMi1J1D1VaUT
 nAwmamm45mP+6bhdI7gpEvNzunDyfpwEBTIdiLx3z7YzTXq6sDyXVaL70qrCnoVbgyO4
 pdXwPahzaPCM/Db6KsL2KyZCagHAGRlNX3YVJIMJLWovQheSjBTSIp74kPA3bkNg9os4
 aVFfttG3hh3Ie99+XJRgUx/wgac8fQPbZ3BblqNUBZBcn92z1dbKvAR71uZJKnOrNa6c
 MVADKGUkkUf8cAqIIwwuWzPGnKFmupqX3pxiKPWqXnYVPTR1QDF0T6G8ivhr9fhAkvLM
 jl2A==
X-Gm-Message-State: APjAAAXdX4HlrQ+SeinGeNr+0C4IMHAu1++mDqY846nr0v72SbSnCbPk
 Dgt84YGHBrG7DbQcWzUQI+W3oTDLlFY=
X-Google-Smtp-Source: APXvYqwH4WR6wPTdIqZgaF89CDq/AaxyeDTTGgjKi3UB9NuoDEhEXzb0nbJT3b2QVnvmvjFqNhrvzw==
X-Received: by 2002:a17:902:8d87:: with SMTP id
 v7mr4582244plo.229.1568820462336; 
 Wed, 18 Sep 2019 08:27:42 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f6sm5922552pga.50.2019.09.18.08.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:41 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:55:58 -0700
Message-Id: <20190918145640.17349-7-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Jonathan Behrens <fintelia@gmail.com>, 
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.193
Subject: [Qemu-riscv] [PULL 06/48] riscv: plic: Remove unused interrupt
 functions
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Sep 2019 15:27:48 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_plic.c         | 12 ------------
 include/hw/riscv/sifive_plic.h |  3 ---
 2 files changed, 15 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 64a1a10380..98e4304b66 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -162,18 +162,6 @@ static void sifive_plic_update(SiFivePLICState *plic)
     }
 }
 
-void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq)
-{
-    sifive_plic_set_pending(plic, irq, true);
-    sifive_plic_update(plic);
-}
-
-void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq)
-{
-    sifive_plic_set_pending(plic, irq, false);
-    sifive_plic_update(plic);
-}
-
 static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t addrid)
 {
     int i, j;
diff --git a/include/hw/riscv/sifive_plic.h b/include/hw/riscv/sifive_plic.h
index b0edba2884..4421e81249 100644
--- a/include/hw/riscv/sifive_plic.h
+++ b/include/hw/riscv/sifive_plic.h
@@ -69,9 +69,6 @@ typedef struct SiFivePLICState {
     uint32_t aperture_size;
 } SiFivePLICState;
 
-void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq);
-void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq);
-
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
     uint32_t num_sources, uint32_t num_priorities,
     uint32_t priority_base, uint32_t pending_base,
-- 
2.21.0


