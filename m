Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRe-0005MV-Cp
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRc-0005Fx-0V; Wed, 16 Dec 2020 13:22:36 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:41995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRU-0000K0-Jr; Wed, 16 Dec 2020 13:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143412; x=1639679412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=skbURR6ModVPJ+4rDadZSuPRHH6j2CX9z8T6S97zPzM=;
 b=Rm7sHd7UlRoCp1ndiL3oHftrTDXCJlPknLFe8hV2IkAyGhbVNC0a+n5K
 q/svhKtkuIaVyh86D83zo4u9rmcNRDb7hLeFO8o9xlg6MZDodIEBAiS7F
 YVRCsbwNY96nL43Xza8hQF8MRuaXkLOqaV5+NHqql9M6OmR/ArqsW8FLv
 jCKUn6JilV57nQsesMTteQLNKWPAF2yINg3UZd2g2ZAHGdJWaoKqrT5Cd
 CKlCaHn7h2aqXOw+KogIqk7FA39jRz4sK5N5MF6fsvkuge6FSEzc42jZg
 zPfg+mCDF+wQzaGup00rnyeBrEFUuttQPvjuwb8gZlcaO/Ji22OZo3gls g==;
IronPort-SDR: zG0RENUKyK9/+zRUYQdNvWksUZU8t/pcaEy0bFPYQFFaRcd6eZWpIoE5UeP6HxHaZDPg/Dy3go
 wj8AAhMxm5SKp6top1cJAFEAhs1eb1RvGSGBhQrwdQ/BIhsWhdtwzIUP+UMz/ihlL57AniDQEA
 R0Elba8vgBOpTZgreQ+rgumhIbGbtsNqqU3ddn0eeUkVaPzZMEBsKvO4DDepxVBYpGvSXayx+q
 d46QoRYUYy67UxNyWz+9zz786Qy0XEsLIRBVfs2bn0NwJuSTeHwgFnNqTUf7q/2Ww/1W/F9v3v
 dyk=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080334"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:09 +0800
IronPort-SDR: 3yF9k052S7eb1hqRCilO6YHwIV5bdG+oO4juPXP3uo459Tx8mItX4R6tllXyFE45ocP+/ia5hn
 55lk4PjaGxNgWg/mGjzdItckEkUdjepCb5WgqKe1PoBSmXhNq8D1wBkA0UZe12LHK+i1Rm5ATs
 XSRfUSumClMZeFWLMoPBRboJCAnPJvzrmixvlqozWeCIBTIARn9HjVZlERcRV+dg/LHrgsMA6Z
 YxsvJFFCV+J58n+dF+30oA7Pp4vNK7Pkaz0WSogB3+tXLiP5H6dy0Rz1HUtxmCSYLM8w6/6diJ
 cS9hLSpBPAKyCyDhiMgvzhU0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:02 -0800
IronPort-SDR: CPfrFAtsPnx43CVmSfvq+eMY0G5lvHUMZ0TS4tVmKJbp6a+ytGxjRWKO+rynwAyGfGk5uWYwTy
 OS/uKvfEG70Bd3fAFoA64ZSeaKQM4nAdy+XRBi6vMcRtoyyT9uHvbRM8bKc4qsgcezfOxmOSh1
 fxQqmVQScbRhCUqiMzngD//9r9CacPyv3hIzYqqX7AaPCgONid/3FqAC0UTTdqLQhoXkjs5HPp
 L5vne4tDh98tGzPyWD8FCMeMSmIKrUAh06Lo2NYPWjtbBMsD/ERHenkX1/UeXHjFRsjSXSx7tQ
 wVo=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:22:27 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 01/16] hw/riscv: Expand the is 32-bit check to support more
 CPUs
Date: Wed, 16 Dec 2020 10:22:26 -0800
Message-Id: <9a13764115ba78688ba61b56526c6de65fc3ef42.1608142916.git.alistair.francis@wdc.com>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:36 -0000

Currently the riscv_is_32_bit() function only supports the generic rv32
CPUs. Extend the function to support the SiFive and LowRISC CPUs as
well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/boot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d62f3dc758..3c70ac75d7 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -41,7 +41,17 @@
 
 bool riscv_is_32_bit(MachineState *machine)
 {
-    if (!strncmp(machine->cpu_type, "rv32", 4)) {
+    /*
+     * To determine if the CPU is 32-bit we need to check a few different CPUs.
+     *
+     * If the CPU starts with rv32
+     * If the CPU is a sifive 3 seriries CPU (E31, U34)
+     * If it's the Ibex CPU
+     */
+    if (!strncmp(machine->cpu_type, "rv32", 4) ||
+        (!strncmp(machine->cpu_type, "sifive", 6) &&
+            machine->cpu_type[8] == '3') ||
+        !strncmp(machine->cpu_type, "lowrisc-ibex", 12)) {
         return true;
     } else {
         return false;
-- 
2.29.2


