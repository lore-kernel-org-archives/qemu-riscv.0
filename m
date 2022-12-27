Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pA3lm-0006JE-AN
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 01:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pA3lg-0006IO-5G; Tue, 27 Dec 2022 01:48:59 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pA3le-0006it-Cl; Tue, 27 Dec 2022 01:48:55 -0500
X-QQ-mid: bizesmtp64t1672123718to2bf9ar
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 27 Dec 2022 14:48:37 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: BYUemv+qiN2mj/RMlPcV3As1sRb87tf9RnATet64TFWe09htJL6KC5KX3DUsV
 iAXifjhAN2u1Pr1Em/7qN8DG0plPMBtbP+/14KDslTixc0BHqqFw75ptKGyvHjPvY6FTNxm
 AV6BHXHLuNjplyRiveht+XFLIJ89ffuZOcdv2pEYQJstTH7wl+DaEpv/tAOUZGeNXi/7ulz
 io8sJift6qYtskB4qDItEFMRZx5Gr6htnFn/zPO61UiuhEgh8lxwGjF3EgEBL7Vz2tUBOwb
 tMkRvQGnlo2meXNmjitBm9ibTbG8mGc0aDuKbVTCYQxj2dzg0/I/5NFj2JJ/3SpQD9uk3rS
 P2wpX/5au0dRs5/FZekS1z4+9e3YBbkDtJ+86q5
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 08/12] hw/riscv: spike: Remove the out-of-date comments
Date: Tue, 27 Dec 2022 14:48:08 +0800
Message-Id: <20221227064812.1903326-9-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227064812.1903326-1-bmeng@tinylab.org>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
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
X-List-Received-Date: Tue, 27 Dec 2022 06:49:01 -0000

Spike machine now supports OpenSBI plain binary bios image, so the
comments are no longer valid.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/riscv/spike.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 8606331f61..ab0a945f8b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -256,11 +256,6 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
 
-    /*
-     * Not like other RISC-V machines that use plain binary bios images,
-     * keeping ELF files here was intentional because BIN files don't work
-     * for the Spike machine as HTIF emulation depends on ELF parsing.
-     */
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,
-- 
2.34.1


