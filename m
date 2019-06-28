Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul4-0000CC-OK
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54625)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hguka-0008JG-T1
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukV-0000FH-JG
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44150)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgukV-00006z-8J
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id n2so2876327pgp.11
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tHJ8TJeA8y3lZE06LLG15C3UoFOsuUPcKgVUlFGD2eo=;
 b=sUkiA1u4rSAaKSgCptqK7eJ3L0blMw/CL62Loopc+CEnixarnOZyjcr/pAyaLMNZ2c
 TPkLTIzxNx5smOLseAPEnPCfbM0dHry9uDOYRrEBJF3ifKRcUzyf0Ymbg5hwy0qefhGs
 qbwM0c4+l1F1gvQ6DxS7u4mxTCi5Cn6oRYS6uIBO5vW0Qy0JuPTXV1xXQvcmfvT9VLLh
 ZCS912F9V9iIIDMlO+35LfJjCHd5XA5gnW+oidpYe3l3YKiyJF548KVnZYUcmupQWtzw
 ZxdFnknaIjR5OMcpgwW9xtx+6zcG9RUVJ3dnbivOvsyL1uIjHkgqC1f0b+KfTslNnu0H
 O9LA==
X-Gm-Message-State: APjAAAWhI6KviSd60PegdH4tcTndmY4DU95tVRCpPnJ/NmCeOYBREBPs
 ywql69pHc2UZnJyA2+aqMnJVDQ==
X-Google-Smtp-Source: APXvYqy5zlPEuhg/RGqb/0Cm3yzG+ACX/8Utlb6Qr06EZ6aGgAoW37sTb6Xnedo+Llc/6A9EYM9i9Q==
X-Received: by 2002:a65:664d:: with SMTP id z13mr9324808pgv.99.1561743191158; 
 Fri, 28 Jun 2019 10:33:11 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id m6sm2974169pgr.18.2019.06.28.10.33.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:10 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:04 -0700
Message-Id: <20190628173227.31925-12-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:32 -0000

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


