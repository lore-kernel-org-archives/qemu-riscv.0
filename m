Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTtO7-00072m-QH
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 16:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtNN-0006MP-Hw
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:32:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtK0-00067z-WE
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:32:13 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtK0-000664-Cm; Wed, 29 Apr 2020 16:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588192124; x=1619728124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HwZtWSsiHzCN/1ubqwhEIMjajFwjKCAraFEUeH9ODUA=;
 b=VsFa0xCmWv58o5UjlXSFL3cGcx0A5CSEhJaIftl4Rl31JhDVrNZOp6jw
 CXh0ZPrO0uymoH/HEVODaRMPo8Z9SKYaK81qFuJrB02hI0Kf84tX7y2RR
 JA+E5f/TgI1vKDh9SEOsxx/aR4O6nU2cPr/nEjeG4mCt78lxY0chO7fWB
 Aj2nnQos2J49RyXhrYGraoCjFB786MX+b4Qrzdm2MBVMW/bLxKLlmoYUk
 KTcKsppycbcnH3vAuHUMZ6TKZYAZzgXsD3sB+hlhWRrlW3EISMaHl2GaK
 Xnuo5O6qNSGYWUSLH0/U+V8zyVOrT540gfeLIfe1Qan5ZulfHecy2OLdP g==;
IronPort-SDR: 5S7kMxr8GlNJ/JwTY1MnWj4em9FbrZuhrVzKH4SZIdYV2RyfKk/Sr30oyPLLX3dzslDj6684Eg
 plHCLxjGV6rbiQl352zjEPZ5fsLr3g+OJuRrj2BaZIn6Tbj3/ysZtVuV5IarMNvZheEWp4zSF4
 tOZNexBhAFWaRA7YpE0YoDKMo3KQhkSc2GrpKG0gdi1gkyvMi7bx6wPUUgJ/eDzUFBN2ug+Xnj
 zgLWNwreWzw1mLHUjqnxGvDyCzdvDPaGLblHIXAWyrQdUFlbrYj3RLqWHtpSQtnGO7bB9+DlZX
 5g8=
X-IronPort-AV: E=Sophos;i="5.73,333,1583164800"; d="scan'208";a="136507037"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 04:28:39 +0800
IronPort-SDR: gM8GNChzYhyRtP9MioW/wC4dIuUcRCwIaw92kiFDDw2gnvLjMzMBIk6cN+UxsXkJY0rhlanmor
 pRu6yhlErltW/dGcXh7oE9WDcfrRVnLIg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 13:18:43 -0700
IronPort-SDR: ivu4pp9LberV3klvUqlgh27iE5bqSsINHNYRmPQ4OBN+JXg0hbam44v37YWOZtyxOE0CYewUYZ
 nchRn5JYBZQw==
WDCIronportException: Internal
Received: from usa004631.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.145])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 13:28:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 07/14] hw/riscv: Generate correct "mmu-type" for 32-bit
 machines
Date: Wed, 29 Apr 2020 13:19:59 -0700
Message-Id: <20200429202006.775322-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429202006.775322-1-alistair.francis@wdc.com>
References: <20200429202006.775322-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=381fbd49e=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 16:28:37
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.42
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
X-List-Received-Date: Wed, 29 Apr 2020 20:32:57 -0000

From: Bin Meng <bmeng.cn@gmail.com>

32-bit machine should have its CPU's "mmu-type" set to "riscv,sv32".

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1583585319-26603-1-git-send-email-bmeng.cn@gmail.com
Message-Id: <1583585319-26603-1-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 4 ++++
 hw/riscv/spike.c    | 4 ++++
 hw/riscv/virt.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 8d0ee8b9c4..e32355a691 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -160,7 +160,11 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_add_subnode(fdt, nodename);
         /* cpu 0 is the management hart that does not have mmu */
         if (cpu != 0) {
+#if defined(TARGET_RISCV32)
+            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
+#else
             qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+#endif
             isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
         } else {
             isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 5053fe4590..98697a244e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -102,7 +102,11 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         char *isa = riscv_isa_string(&s->soc.harts[cpu]);
         qemu_fdt_add_subnode(fdt, nodename);
+#if defined(TARGET_RISCV32)
+        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
+#else
         qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+#endif
         qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
         qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 85ec9e22aa..c621a970aa 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -229,7 +229,11 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         char *isa = riscv_isa_string(&s->soc.harts[cpu]);
         qemu_fdt_add_subnode(fdt, nodename);
+#if defined(TARGET_RISCV32)
+        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
+#else
         qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+#endif
         qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
         qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
-- 
2.26.2


