Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRf-0005Pf-RP
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRe-0005MS-C6; Wed, 16 Dec 2020 13:22:38 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRc-0000KE-Gl; Wed, 16 Dec 2020 13:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143424; x=1639679424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tvj0hR/ia+IZz/tDIIw5JFrhXmw6w6Q1yB09R8QDOtI=;
 b=LpNsI5Jnlup27e2MHgTkrUlqv9lpysrxQFEC/YclnyFchxjom3TE/y9c
 CHhcjL9ZLnMDo6cO4PXO3uljM96c54iTJqmIeIBKlHhEN9vY8u0+iF4eE
 M6x8nP/kxyYsRHx30Bk3Aki0/yFUFSZxjWft2ox3leYuPGXHypFTXpKc1
 5s5quho0crd+wZd+ud1/odwzsPI2hI+1zi3HBIk99FCH1sW94qFsBD9Jt
 JjGOvCFN+64fnycSkYp2hYkjiWYoyjpRjrx1YvGEPiFwvq0/YVaUkoPYV
 AYBAk51Q/ZH0mG6GLAMTmnGlY012y/AlJ02E0g0GWTRjgoSQXE5yRhDBu Q==;
IronPort-SDR: bXHzR7J2fyCFOg65Y812SbVr4MlXgEJkD+ziYcRc36yAmL1SnNTClT09UJ6Kgmplf/pFmXLPBh
 OZZKm8lnjKZYGwuO4383VvWO2nejxmdU1oOwdCmdfWUIgj/zBq8fUXzupIh28mLmYdVYZO/c7f
 eZainjkh/TVnZJ+kO8TG9oRBy8ihpFdzdKzRYxRkLep/FF6APjit5ZSCJ91CPjNy7SVtzg/syf
 5fgGE5tBXh92L5d4b1BEHzmIomQVowU1LacHGv2h70KAjH7VVVi7LzqORuAiGI6YfuE3ongJH6
 yR0=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080353"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:22 +0800
IronPort-SDR: BBaj0kRzqGKopGAN2EMvh/GWOfseAErcycnHrnjBkfOZ+6kK2bszSMdztzicqQ+R/vXlsd1dXj
 VxEhm1qfSN3mIlG7RKrreB76CsbeJBh0xsNba4WEZYVC5lDL0Vwwf7DaipXvxc+lBxrOIhXE+V
 zMSLx9kDoSLSBS6l7gDlfUFfUp76bAT+Nb/yiV4WBjwEUQUuj40d6ztwXZgf+v5uBIqtk/Zq7h
 nrM9Da37JaAG1Cfl0qsL+yi68lB2tJdpgxam3sXEMXhmBJNBvOjRpavqp1gTQbZlKqdKtOCs2q
 vyYHuteCYK0NdfuHuBkoWkkx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:10 -0800
IronPort-SDR: Ys8Y9AjQliFiaKpzA/hZuAE6f1hULwx4PG8tyiyWDYbmZKsF3ETfvfLxxaDcN0z93v4uYLPAu4
 F4q1OQYiUpOpu1uPcmK2MSL2X6E6FEFvjtn6xdgGJgN3V2PMneSp/4v1NJZCMUb0jDvaKKU07b
 K5JM41Nf9vqJs997Th/09hBi5QL/zlT08HvhhF7rwaRQqaDM00gQiXwtUfF4eDWcZy6uxagPyE
 5ZN+8Lq+ofki8m7Ty+bDzsWqDewpq9lkLuJTfIcWfvMKx1R7UF9mfYuTrunWAEQ1Oo63LsYtTl
 Yrs=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:22:36 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 04/16] riscv: virt: Remove target macro conditionals
Date: Wed, 16 Dec 2020 10:22:34 -0800
Message-Id: <aed1174c2efd2f050fa5bd8f524d68795b12c0e4.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:38 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 include/hw/riscv/virt.h | 6 ------
 hw/riscv/virt.c         | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b4ed9a32eb..84b7a3848f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -89,10 +89,4 @@ enum {
 #define FDT_INT_MAP_WIDTH     (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + 1 + \
                                FDT_PLIC_ADDR_CELLS + FDT_PLIC_INT_CELLS)
 
-#if defined(TARGET_RISCV32)
-#define VIRT_CPU TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-#define VIRT_CPU TYPE_RISCV_CPU_BASE64
-#endif
-
 #endif
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 25cea7aa67..995e1c35f1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -706,7 +706,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "RISC-V VirtIO board";
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
-    mc->default_cpu_type = VIRT_CPU;
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.29.2


