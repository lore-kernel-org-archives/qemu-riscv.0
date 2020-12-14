Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouXt-0000xe-T3
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXr-0000qS-7M; Mon, 14 Dec 2020 15:34:11 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXp-0007tb-CD; Mon, 14 Dec 2020 15:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978049; x=1639514049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CTGEz6Ggv50vIsVjqVuctj/ddtwSeDBjNyqazv0Kae8=;
 b=T34nF4OeEiP7THbRLwFpEAkheqKR7WitQkIfpx0SYLiQ7UQH5EzZkwxm
 FiQfrRXnPfB5PBJdxKX339YnUPRxcBEIorEzM/iYlB5fKlmWIAh5j4/qd
 zMTQNIkq6hxMtcj91RlzbK5rh4Lj0s1qJz0nzqoqJNxcFZ2ZgD8iVlpT1
 lo6xP+29MMg83l7/PvvrpXX5lpO1pzGUPfUsLmUF5Blv3VNkWrMdxdsyM
 QZPFFuH2DyAyHRh9tZ0dTWExkjdZgMOpcez0Gqir2V8z8CuusWL23ykll
 OA88iyoA26rjDs/41y8NpvdHnaujl1fOnQkdyLmgDqM1fmEYBlPesDkOW Q==;
IronPort-SDR: T23XvT1F6henFwrQxD0aTDxSbfj9/1bxjDngnVGtc5mm9SVMeiE6aGJQ2IjyN+/fBBUTlosFQp
 +aWUSbGtKlNbZNYps2YGy9tQZzhXmQUqaUcnjzHqR+k4TBPVKB1o1xkYhp3J0Rnakj0anrhJnW
 lT9/0b7fqCOpWBAFwccwozZyPKIQrpLuo9lCe4870gwg2r8QDWQIEL2DUzUMZLKJikVX+aG0bv
 qaWLWpDD8i9UkgdUUWKsn1FPRfxhoYqdd4cS+7C1CS8dEnhcya8SQIEfJhO4gyEfzs+K/hU4Y6
 g7U=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156338119"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:08 +0800
IronPort-SDR: deyaYdHMeHeHoY9Y5YNost2NVb8Rz4+/bHQq7ZphpLqiM7/4MqeEpsTdEoV8OwhxQa2GpDBlMo
 dYYfsEThZi2J6eb/KPtDUyh5h5kIiPUPF1as/bAhSXqxxq/0tLpClfTAjYEtZeZdU+oDWeM7hS
 qVQaEbgI0ZXXbgVCpkWLXAV5rmxYcNoc9Nu4I634DNL9/7H2lN71qNmzDNPPfvKA9PdcWqqCcK
 2lBd4Y9BObU/4SIThCuc2JdiIHdM1TCGe2OlnEur9wwtSEWpIWmTBc2xYscC32eI2kOJpSau8c
 hESQkh5Nwj4qgSgerwPAhGAt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:17:51 -0800
IronPort-SDR: 5VNRjjsCFGULiAhh66H855ZHzf3aU1/SbyuJTa1QMBDkWZnH7n9RzbftazsT3niovKj/5I6rli
 IP5HHR4BpQ7F9Q9aOFJ7+XJuCj+jIaWI+1n+b1efcSHvHKN58O9apGT54PXdEKXlkt4DU/DJJV
 P9w9xVy4TeZHpZdtXMXaY+qXpevxKlHgTaIMzGUNJH+7BfVo+6bL1xqEFxpUHdSu0NeOpHkSni
 0aPUt0P070jd7Nm0zSrEurrjr36AYTfvFhwOzDcKpW0BOHS/nu9+62g4ENdZSDjO0MDMv0YSVa
 u3Y=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:07 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 04/15] riscv: virt: Remove target macro conditionals
Date: Mon, 14 Dec 2020 12:34:07 -0800
Message-Id: <3b7f53e0eef69904ec20a6fdcb30ab61672e5322.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:11 -0000

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


