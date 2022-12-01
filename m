Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kFE-0008G3-A0
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF9-0008Cf-Mr; Thu, 01 Dec 2022 09:08:52 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF7-0008E6-UY; Thu, 01 Dec 2022 09:08:51 -0500
X-QQ-mid: bizesmtp72t1669903717tgqkwcma
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:36 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: vqhsT3OOnzSM4KPg4bTdLmC3sUf5zh5gYgjq1mgIN9dM5/VrvSAgN6BhW0aGz
 90AwsqWZXn4EHJ2IWCKWHOP4dtqgJWdD/QC1WDLDhhSzhUnvtFz7ZKk+w+bZiDlrBXIaFtK
 S1X2R1fFd7DY4nMjYq2V3UrsY5WT4KrouI/F0kuJwTzbtcPYXKJf9b3DpWrdDRcrPH7BByS
 GDqFmchwqnl0r6ACJdCTD6gtT4GcDhD2HZWmCQhtKtaLyruNnJo0EoC+Hk5Mmi9BtGwpnK+
 1dVxmsCpJ1xsue4UEx2qW0KCx2AOyNMqYQwGHw5YHDTIMUeYOKOtg8BQx0+WFKpqy3uqmQk
 dbYNf9CxVCO/7/SwjUrnHZTpJnYmv5dfzYLJ5A5q0ImiGhrKQY=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 11/15] hw/riscv: sifive_u: Avoid using magic number for "riscv, ndev"
Date: Thu,  1 Dec 2022 22:08:07 +0800
Message-Id: <20221201140811.142123-11-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Dec 2022 14:08:52 -0000

At present magic number is used to create "riscv,ndev" property
in the dtb. Let's use the macro SIFIVE_U_PLIC_NUM_SOURCES that
is used to instantiate the PLIC model instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/riscv/sifive_u.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b139824aab..b40a4767e2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -287,7 +287,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_DEV_PLIC].base,
         0x0, memmap[SIFIVE_U_DEV_PLIC].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
+    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
+                          SIFIVE_U_PLIC_NUM_SOURCES - 1);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
-- 
2.34.1


