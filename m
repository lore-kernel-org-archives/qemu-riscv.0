Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVuJf-0002t9-Ex
	for mharc-qemu-riscv@gnu.org; Wed, 29 May 2019 04:52:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1hVuJd-0002rh-15
	for qemu-riscv@nongnu.org; Wed, 29 May 2019 04:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1hVuJc-0002G5-5t
	for qemu-riscv@nongnu.org; Wed, 29 May 2019 04:52:08 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:32768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1hVuJc-0002Fp-0x; Wed, 29 May 2019 04:52:08 -0400
Received: by mail-pg1-x543.google.com with SMTP id h17so982916pgv.0;
	Wed, 29 May 2019 01:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=kS9RwfTWm7yJJiKansvU2AvQ0hnlJBsSRKgE5jXjYTI=;
	b=LEhTsuy7OuQN3yJeX8u96tFxbMduV5X4UGXTxM6OGEcfjS9OJK24Ec+0FORgchb8wu
	rSIj/WjoCCE1V2BfM/uwpKpr+i+3z5uhRhvEG2+ko1y7gHWSyoEOpsAYxI3e7KOTkUnY
	5W6Bm1iTVanPQ9hiUV4F+JQ0TIDMI3vt0q7p98S1iAgA+lpwDMsqJG5uap8jEviokCQ2
	D3b+3EVXMS/jmbBJb6ka9Q9+mBvbmrUvJVeiHDdWhn5fZYZs2b7PF2DCbzQv2jfFetEQ
	KhBPE8H7/yreuEk59HqKR0nJv9jokOp8W/Wg3DfXzMy911rj4A+x8pC6P9Wya95BMlZy
	nJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kS9RwfTWm7yJJiKansvU2AvQ0hnlJBsSRKgE5jXjYTI=;
	b=nQfqDu5e1Hk/Mlm4z2XOOrgynLpGtUDDqi3oQXe+KjeucGYQXbJYNoT0En0gtjbler
	Ww3jo5peLvMqxb+6eHM08ckax0emMSHCZttKl789PFynsnvrK3jHNg1cQfkR8d07zJ3k
	lGArq0d5kmpB5hNKQVerLqldIrSvaUR4cpxKaMKge2fZXy+g2nMoIus6kRuji1v1zo5C
	xrmoctIwoHlK66KuA+Qk/DNfLvjiEVFko9MWixUPJ6zCVIXyp8Eh7Bd3nwcNPq/DcvL6
	HOw3OnkiOX3xy6RSZDtdd8oNzd9zQMzkP8NMnvJEbXqKFYHnfI4DJgO+NQ3eNPrnXRQv
	6pgQ==
X-Gm-Message-State: APjAAAWdrqcKKhAWqzloTEvpuHV2+fMKODwZxT5Fe1JYvPMhEGx8uCz0
	GieSqtuyJdtGiVwcjVr1CyIZe3mJ
X-Google-Smtp-Source: APXvYqz8bmnpoQpg410Xq1RIALZdOTrKcVxM63F9hjaug5EBQk5GGssoXPEldQZ7A5WSDPRctlbjpw==
X-Received: by 2002:a17:90a:240c:: with SMTP id
	h12mr10916017pje.12.1559119926436; 
	Wed, 29 May 2019 01:52:06 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
	[147.11.224.80]) by smtp.gmail.com with ESMTPSA id
	k3sm16310838pgo.81.2019.05.29.01.52.05
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Wed, 29 May 2019 01:52:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
Date: Wed, 29 May 2019 01:52:01 -0700
Message-Id: <1559119921-6098-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH] riscv: virt: Correct pci "bus-range" encoding
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 29 May 2019 08:52:10 -0000

The largest pci bus number should be calculated from ECAM size,
instead of its base address.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fc4c6b3..d6132d9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -299,7 +299,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
     qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
     qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
-                           memmap[VIRT_PCIE_ECAM].base /
+                           memmap[VIRT_PCIE_ECAM].size /
                                PCIE_MMCFG_SIZE_MIN - 1);
     qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
     qemu_fdt_setprop_cells(fdt, nodename, "reg", 0, memmap[VIRT_PCIE_ECAM].base,
-- 
2.7.4


