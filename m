Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbru-0006J0-Ki
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrp-0006Ca-NR
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbro-0006LG-8b
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:41 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:42938)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbro-0006KP-28
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:40 -0400
Received: by mail-pg1-f171.google.com with SMTP id z12so32628pgp.9
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=0aUWUGKUdj74mYp5bqvI3cmVOmwPFCZNAshHhaO5kdk=;
 b=nyYXQwtE6+/06PFM3yCVQsJYcdXUfusM6eNnBWdaJNWx+QyR/5P5o3qmZ6o6dV5eWl
 FRiEDb1ohVSSUMUezhjRuiHXQEhF6+ihdygBxO1FnhiYP9tI98ftnEENhxi4ltcZNi3R
 OImX3jzx+3FUeiWC/SDzYNg3j7dpXG2vIrFlhRPrrrJeQnWuY+t1TVCsTXF7SI/sYTkm
 M3LfKX8/kv0/5kUBR3mWQ9QHzV2kWcD1saK/F4PnIzIhl27hfV56EwE+PakbGg19CA5r
 ruwtQWF0jw0Jgs9YI/0o/E6UTkgNSHmXNR4H4SxEVUAHZm/wprKl3hmW3jfwp56OQjDg
 pLeQ==
X-Gm-Message-State: APjAAAX78UKRoaDkTvp84o0Vu/WahDxp1puLCrL7X+bMN4z+E1fga56+
 zPfXZTuSnnbfs41I9KCLfPAwJJPmlHs=
X-Google-Smtp-Source: APXvYqwyOf8MyieLYw+12IjC53KH8Bzot9HsRMRORbDtWn8zLGWd/6I77RkM7n3AZkbEJT33Unrkew==
X-Received: by 2002:a17:90a:3462:: with SMTP id
 o89mr4451651pjb.2.1568820458437; 
 Wed, 18 Sep 2019 08:27:38 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id cx22sm2843592pjb.19.2019.09.18.08.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:37 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:55:55 -0700
Message-Id: <20190918145640.17349-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.171
Subject: [Qemu-riscv] [PULL 03/48] riscv: sifive_u: Fix clock-names property
 for ethernet node
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
X-List-Received-Date: Wed, 18 Sep 2019 15:27:44 -0000

From: Guenter Roeck <linux@roeck-us.net>

The correct property name is clock-names, not clocks-names.

Without this patch, the Ethernet driver fails to instantiate with
the following error.

macb 100900fc.ethernet: failed to get macb_clk (-2)
macb: probe of 100900fc.ethernet failed with error -2

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 8313f2605e..ae5a16e636 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -215,7 +215,7 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         ethclk_phandle, ethclk_phandle, ethclk_phandle);
-    qemu_fdt_setprop(fdt, nodename, "clocks-names", ethclk_names,
+    qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
         sizeof(ethclk_names));
     qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 1);
     qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0);
-- 
2.21.0


