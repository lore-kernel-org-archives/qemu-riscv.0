Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluF-0007ze-Vu
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluB-0007xF-OU; Tue, 08 Dec 2020 17:56:23 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:57377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluA-0004Cc-0z; Tue, 08 Dec 2020 17:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468181; x=1639004181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CTGEz6Ggv50vIsVjqVuctj/ddtwSeDBjNyqazv0Kae8=;
 b=GAtKn3Avst74vsYNXxZ8clHJqqMCiXKkJ6qiMKqO7w0/zLFqX39L0T0M
 f9BomCqesYglAhC6quHxSFGCPyFVKtQqVmgLrs8vwkqO7dAM+bnPHLH0e
 qrl7fgw5qFsQocSyaHnk+CqXbke1jNy3K2q0w7Ax8q+XUSQYPbj/gXiHv
 34qxD7TQjAqfaYl8ugZrin9TI4t6b1BMuCQFogaqclggosRGUQ2wn5xhn
 3sxYL1rHisiXZcPrB7cwUCoXdt2UaS+bbjJCAqrFcKuPq/v8WACr2O03c
 Bg8RpSQiVYC4BzB9+joYnp8Q6IXvjlV1Lw+uiFiNsg9Voqvm1Xlf0LGbP Q==;
IronPort-SDR: NNzBVLYB0tqs/q8yK/NVdZrJVPfYaYEqrBZIYv1KCJBaA+fTdAFtwGFnpR0zouJgM5pw8k8coj
 x1GsNX87cGtzFRiYn844PlWH9q/Lf9vD8gs+8TDqkaqUO4yd7Hk2+B8q0aFLxx8wIli8QMUkUS
 usLxvSfsazapFOG9wTDuaCo69Y/jHrVoQMy6q+VcE+SWga6K9ugmOGmd0FTcuMC50fNQClenaC
 EkWuV2W4SSa9pPNH1Cn3KJmRhTHFNiEdSCnK3Awl7pJ+TmyqJUCBxHX9boTfl3Mz2lW9CWN0nI
 qOk=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="159184101"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:20 +0800
IronPort-SDR: MJ58YaxzVVh9CmCuxcgopA0zZz2alzacjMkiAdjlRykubt283MITpyJBusqkFZybkirrR2Tc79
 by5UYWBmh4eIm/a3uohX4sdzADchdm0sk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:40:20 -0800
IronPort-SDR: TyaGz7zgoYBzgLgAfVtTpKpSdxC5Whaj6/aWX539Jw9eoeOnwW5eZWlsckCuuXjV6dlgf8hx1t
 MugyxG9VfOoA==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:20 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 04/15] riscv: virt: Remove target macro conditionals
Date: Tue,  8 Dec 2020 14:56:19 -0800
Message-Id: <fc7fb5675ba97febc39261b445d6ccacf508a785.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:24 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
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


