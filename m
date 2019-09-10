Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvm-0007V2-NJ
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvh-0007O6-T7
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvg-0006Pe-HL
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43495)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvg-0006P9-Bl
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id q17so18733807wrx.10
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=YvM1ymkGWX0+m24LnKUHducTTIF5LG0mv+vTnIqq7DA=;
 b=YhARUUvcDuFTO6nzhf6l4Z+582FSmOFLLFjaHyfI8iP8THPtBYb0usuJC0S9xzMM5D
 JSNwE7OttJs3K+jQygN65Ui0TutJOujulF/7hleNHmaTmXVxtmpKcHqncVVjLUaK6k7j
 qBAQT7pwFUy4kCcBdWS4l9wvGEogxxZ2lJcIodJve9lzzeYPN0y2WeFxfPgadE1+R5vO
 ll5m0vC2em5JXe+D21KoOSF6Pp3saHALZfXOx5YmrMuNgwf0B/1JRtnrgQz+L3leqwHQ
 mtmQ0vmKwT6tDC6DKE75Ma7iPgIZieIzVW7SaiPVFnRZlkeeCDb/kTTsZiujquTNSJD4
 hqJQ==
X-Gm-Message-State: APjAAAXq1/0zDX7sDXS/anoFZv7D+zom8las77TuukvFoAJgk5ZOMo1H
 cCHMtMTOJLIUHryWUuPoWpN6l1lingM4+Q==
X-Google-Smtp-Source: APXvYqxy5fpZopc+f1qtTSV2jQTPByTRnfx5LgPLOOLaFvcnEDddwjxJEgtY7QCtHkjl5U5/RP52yQ==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr29708111wrt.337.1568190282998; 
 Wed, 11 Sep 2019 01:24:42 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id 207sm3149520wme.17.2019.09.11.01.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:42 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:32 -0700
Message-Id: <20190910190513.21160-7-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
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
X-Received-From: 209.85.221.65
Subject: [Qemu-riscv] [PULL 06/47] riscv: plic: Remove unused interrupt
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:48 -0000

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


