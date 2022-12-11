Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4Cpd-0003eF-Tl
	for mharc-qemu-riscv@gnu.org; Sat, 10 Dec 2022 22:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpX-0003Zt-Qk; Sat, 10 Dec 2022 22:16:44 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpV-0000B0-Th; Sat, 10 Dec 2022 22:16:43 -0500
X-QQ-mid: bizesmtp68t1670728142ti9f4g4u
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:09:01 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: Xz3VOcA7Mr1CNgl934T2T0ZMcHTEOn7Ggyl57is+ZeNvYWUnB/hfDyPMgqDJe
 mB4/tMJ1fmV+iSIC3YiZT0NoRoWVQ08FVDV+B4W5Plj94Kkbaamo05XddJOIdFp6om+YOkN
 A1f2sBcX/1oFCZNkpuaUyO4OGvjulNfNMSTfXR/qpHnBAPFFHsQgpKWVMndDBpcF0NUAFgX
 czPyKzB2FN/UCqF3DgISs/7cNig8tHYCmuWLoZiUDN4tM0Th15xBTVV06QPZjXRlCQBOFLW
 jt4L7hMSNthP8YUBP1gTw4jR6EqutwtdOuRgiAitGB7g0Y1jeWwMxM7ZJKkNGRIvkCjgcp/
 7kmhTw2ooQCOjBwi/SQrDL9k+ooH/MuFqHTWul1c9IR25egGnM=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 12/16] hw/riscv: sifive_u: Avoid using magic number for
 "riscv, ndev"
Date: Sun, 11 Dec 2022 11:08:25 +0800
Message-Id: <20221211030829.802437-12-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211030829.802437-1-bmeng@tinylab.org>
References: <20221211030829.802437-1-bmeng@tinylab.org>
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
X-List-Received-Date: Sun, 11 Dec 2022 03:16:45 -0000

At present magic number is used to create "riscv,ndev" property
in the dtb. Let's use the macro SIFIVE_U_PLIC_NUM_SOURCES that
is used to instantiate the PLIC model instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

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


