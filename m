Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoT88-000861-Gm
	for mharc-qemu-riscv@gnu.org; Fri, 19 Jul 2019 09:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39475)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groeck7@gmail.com>) id 1hoT86-00085n-Md
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 09:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1hoT83-00020f-Ne
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 09:40:57 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45759)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1hoT81-0001yj-QB; Fri, 19 Jul 2019 09:40:54 -0400
Received: by mail-pf1-x442.google.com with SMTP id r1so14199071pfq.12;
 Fri, 19 Jul 2019 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Sgvj1ecqf5A8ZdfMhXMbPJTPiuDyoTaOKfMmH7WZQRc=;
 b=PxE7v0uOsPwDFHy9sZS8rkHcn4NPnhh/dP65Z1Z/b8crpQsgJdhScDetY2Saf995cY
 QJBi0J6R6oq7Ovo5umdP7RzbakK1e/54iVcBdGNrQhwqVWfULBkNSQdW0USbuCNIWQ7z
 lTZotQYSHMbXrbYGD5gOTO3CjPHYaa7iHYtqLmcGbztrY54h7QaVR/c5UGYBKbVT0r9F
 f0LZ54BomceyS8txkWm4zdRofH+30rEzce6eyNHSQVDLmvbo4AsiE0XbnIkCegJspGa1
 NslXdI+LISWOwft/nEh28t7jULbke9BB7hwQP+PQSKJ3Hq4uSY40fqlj4apwy6H9IqCx
 9ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Sgvj1ecqf5A8ZdfMhXMbPJTPiuDyoTaOKfMmH7WZQRc=;
 b=cEpbGinPJudvzgNbHt+cYmFzBLKxU9IcRaoJWUh6HY+djBL3gqFNrCF/vV6Rn6YV2F
 m+XY35wbRK1rKAEk7UahVi1Rnp0zjeVA/u3ZrAYffLGg2s+tBPxoMAsC0nrIFHldk8iR
 Oi3v5kbSa+pHj0geaPfO4xCDV/BtK3/yNDy54K6P1wVpcT8ecWI8j5DC5Srf/xWmw9oa
 OC3LgBjkDbO7raFQDwFhIyVmT2lhKmuxzejjSD8a2nsHH6MYe5OPwpmO/XXHZN5mCNEg
 tbqZub/EvdPlv+MbGxRcBhKYEoweZLpQ/1tbACNCrC5w1p0eR1hWwgpi2WejR4m+AoeS
 DuJQ==
X-Gm-Message-State: APjAAAV10r2UsZifojw72hvUSMt8PgvdlN271YekIThwZRnnuuc48yYv
 ry3zZJFeNzDq00Ocua7jVqg=
X-Google-Smtp-Source: APXvYqzKRyY/qI7NzHak+yRTpengF5lMD9ErXZcPNx086Xxht4os6TorH+irck+x32xAJAEkUoIZaA==
X-Received: by 2002:a65:5082:: with SMTP id r2mr28869355pgp.170.1563543651676; 
 Fri, 19 Jul 2019 06:40:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v8sm25953097pgs.82.2019.07.19.06.40.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 06:40:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Date: Fri, 19 Jul 2019 06:40:45 -0700
Message-Id: <1563543645-20804-3-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563543645-20804-1-git-send-email-linux@roeck-us.net>
References: <1563543645-20804-1-git-send-email-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH 3/3] riscv: sifive_u: Fix clock-names property
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
X-List-Received-Date: Fri, 19 Jul 2019 13:40:59 -0000

The correct property name is clock-names, not clocks-names.

Without this patch, the Ethernet driver fails to instantiate with
the following error.

macb 100900fc.ethernet: failed to get macb_clk (-2)
macb: probe of 100900fc.ethernet failed with error -2

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5a221c6..64e233d 100644
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
2.7.4


