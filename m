Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapb-00062a-6x
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapX-0005uB-QD
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapW-0006pY-Sf
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42250)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapW-0006mk-KQ
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id s19so428160lfb.9
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tHJ8TJeA8y3lZE06LLG15C3UoFOsuUPcKgVUlFGD2eo=;
 b=Lj4icuGzsg0U0y1hxgr7WFBWIWB8hxbPvDFafMU7En0mcoQJ7kbtO8wfXoD5wMwRQh
 jsX3p5GIr50yCEn4BlT8UYlKrN7V5H0fyvTpBCcxT97NWXk5Rw8AXCA/blVS0QQa/UZ6
 kORSCXrdjWtsnx0N6T19P8+JhbYIlvs6GMhjhGLWWLxUfd2Gfw8GFvpQxVTmusmqYapd
 UUWZYcarT97wHGqEHJzLjf/6AIDMdu+UBRh0sVlrkvWCi7n52DaeNhuiGm3sAP6gqNMT
 vR98PO5ABdPv+nFexy/cwTwa6JobXf34TcyyHhe+LIJjiezF4biBPjR2OecGBJRwxh7t
 1dsg==
X-Gm-Message-State: APjAAAWuRVLQouQl0eA7CqoFvp9t80JgB7XbBbIDN36rxI1ttL6J+ufw
 qo+NtRRw7AJqGl5RXvlI051T30sVNl84uQ==
X-Google-Smtp-Source: APXvYqyuiIk+wleDbejEspM+dfPiJcUX9JS9D5MT/5qe28JxnqZXkBHNfg6Cmo+JuCnroX9eMseljw==
X-Received: by 2002:a19:9156:: with SMTP id y22mr16788597lfj.43.1562143289182; 
 Wed, 03 Jul 2019 01:41:29 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id 2sm334879lji.94.2019.07.03.01.41.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:28 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:27 -0700
Message-Id: <20190703084048.6980-12-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.65
Subject: [Qemu-riscv] [PULL 11/32] riscv: virt: Correct pci "bus-range"
 encoding
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:34 -0000

From: Bin Meng <bmeng.cn@gmail.com>

The largest pci bus number should be calculated from ECAM size,
instead of its base address.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 84d94d0c42d8..487f61404b21 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -298,7 +298,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
     qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
     qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
-                           memmap[VIRT_PCIE_ECAM].base /
+                           memmap[VIRT_PCIE_ECAM].size /
                                PCIE_MMCFG_SIZE_MIN - 1);
     qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
     qemu_fdt_setprop_cells(fdt, nodename, "reg", 0, memmap[VIRT_PCIE_ECAM].base,
-- 
2.21.0


