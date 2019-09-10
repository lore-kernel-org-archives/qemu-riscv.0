Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwU-00007a-Nr
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwQ-0008Sl-1j
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwO-0006tF-R3
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:29 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45256)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwO-0006si-LE
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:28 -0400
Received: by mail-wr1-f67.google.com with SMTP id l16so23371246wrv.12
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=og+q1n3yOAmcc+5fUot4+K3025KfQ+1ohpk/ac261lM=;
 b=StK9bd0M/5wIW8rUlQRsBp70kzNKeJeRzdmETGqDywKcyp/BKrB6irHoiIYdCxq4KQ
 CXJQ8OvX6xe15a6hrDaB2eG25TRAPRgnCwqOrwjEw2jxLgjiLEUtgJhWU3JGgHdbMaCq
 A7YxEn4jOWF4KvAU3xWWzuSCsqXqb4Onm9IbU/H6cjhgLtzBkMTjdE5jmbtF2YaJviLM
 DZeEI6/NPGBEzaEH2V+1tKMMUkCL2ANQTqIC8VYNLS4bPSNWnj6n3+4XE3VbGvDeX0N5
 6pkY34SNXaaKDDbHeHtHa5ChFbKg/xCx2IktHTbx70Yn4M8ZX/ciuzLnaybzRYQu6GxY
 sWqw==
X-Gm-Message-State: APjAAAXffpWgfk1+P39+Pa+y0VnsPqsq2OyPNDcjxJKr2l6bSGl81STQ
 NNo6phd4KnoPu1nOdT9d8MYLbDyuBLzFuA==
X-Google-Smtp-Source: APXvYqzA5uuON1yW9070r+5K145tuNakY8E0qF03EU/UPbeC2fY0QQT8XRQp6u6EYfnXBJYNQXtU8A==
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr28134122wro.2.1568190327160;
 Wed, 11 Sep 2019 01:25:27 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id y186sm3504784wmd.26.2019.09.11.01.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:26 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:04 -0700
Message-Id: <20190910190513.21160-39-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: [Qemu-riscv] [PULL 38/47] riscv: sifive_u: Change UART node name in
 device tree
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:33 -0000

From: Bin Meng <bmeng.cn@gmail.com>

OpenSBI for fu540 does DT fix up (see fu540_modify_dt()) by updating
chosen "stdout-path" to point to "/soc/serial@...", and U-Boot will
use this information to locate the serial node and probe its driver.
However currently we generate the UART node name as "/soc/uart@...",
causing U-Boot fail to find the serial node in DT.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a3ee1ec0a9..5ca3793d35 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -286,7 +286,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uartclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(nodename);
 
-    nodename = g_strdup_printf("/soc/uart@%lx",
+    nodename = g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
-- 
2.21.0


