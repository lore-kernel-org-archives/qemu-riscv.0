Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHy-0003UP-S9
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33363)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHq-0003Nm-HH
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHk-0000Pe-Jl
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:08 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43455)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHh-0006mi-7p
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:26:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so1392641pfg.10
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tHJ8TJeA8y3lZE06LLG15C3UoFOsuUPcKgVUlFGD2eo=;
 b=heLaQbV76yIiyF6vmgwfp0xcKXAUSvs8MV+E5BKmF6YPReXtTil68gF5IFSLnQuA/x
 rriENQoB4xdD4o3HbgObcAYR2+Tcc5SprLh6HK/eDSJw2yOmUkvok/KlyRSkwhWklQcy
 hIpffBjJTwZIBiAghiCeWPGYrBqxMZb53BJ4i0YkQUAD6zfvP+PImMizBj8Ad85289Xv
 K/0i2xPIFfnzfirK/QC5x0kMhoGCt6PUlabFkKqrJSwKxK8V4ORzWcx6vJWA3LE69jXf
 lGEkOeO5YxDtNgsDYNnP5wMSZR+SnHnM1qyAMRlzSyQTH16N4BPn/FUhWJt6RiqpDEcY
 okPw==
X-Gm-Message-State: APjAAAUY/44gu9s/95hox9KOrcOTA60MQtVwe3Ljrs3CYSPaf41ZcfMe
 GWn/QlavtjG6VZGgROsffin3tBTFHDHokQ==
X-Google-Smtp-Source: APXvYqxAAiSGsJEMq09qAbmcVjS+lWBRmocPW0miY46BEjRuxT0HRsJB0zJ/PMtGlOiiuAHiSv9DZA==
X-Received: by 2002:a17:90a:7f02:: with SMTP id
 k2mr6180344pjl.78.1561649029253; 
 Thu, 27 Jun 2019 08:23:49 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id f186sm3156781pfb.5.2019.06.27.08.23.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:48 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:48 -0700
Message-Id: <20190627152011.18686-12-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: [Qemu-riscv] [PULL 11/34] riscv: virt: Correct pci "bus-range"
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
X-List-Received-Date: Thu, 27 Jun 2019 15:26:15 -0000

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


