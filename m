Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouXl-0000fL-Az
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXj-0000bc-8b; Mon, 14 Dec 2020 15:34:03 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXh-0007rn-1e; Mon, 14 Dec 2020 15:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978041; x=1639514041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r0ZfNgOdaidiF4AhAMQ3WmwibBw8fNT/SmUP4a+2+iw=;
 b=CfCrbyB1/2fBDLosa+YTVne14TT7e+/Y0x5PbItpdto45TrhhZXSu6BB
 PCbaBe9LhkrcFdhA9Xzkpu2PnrYI9hXy/uCR4PNKPBn/1mjfhJz5Cnqbv
 qAPilE/8DscQYDxp6ZrxDMKcJmBTjSnJEELdobOVrhRVhT1EULtKcBxMy
 3yIAXOWj34Obq8nBYQ1y/lerVENFyjmH1LNK3du3YIIySQmXlI+pveL2E
 sVM2ddWYZuBlmRJUDVo+AHOHUVpH7nnU7oFm92BgM89uGuVHq/OTHOsvP
 1UkWHqSD5avL0McPIpczimPZ3ntbw3/bEzjcIkSFZHJPJSKcvYhLN+Rdb Q==;
IronPort-SDR: pMAISxWeUcGsge/Frpkq7yWwPV3MN1eCqGamG9aSwcMDzBZQKEihVw7TWwYlLU8Tt+bU5kx7ln
 FV+H/toJDGRgyhzNmiji0VpZ7EnMHXg6Zkp6Oza679Amen5CZedErEN7g12qaDpC51NprkJb3z
 fKk7gnvGbifJOXg8LSrciI3IQADucaDasyWIXpfPw8WJox/1mp1x4G92dDXKmXjf4BIVHQ5Yhy
 FNznkdguNiktU9gT4SUNQFROU3PsqfbrE2t0/uH3RJAJx5P/YaRhGWytjGDkJ7J9Q0Y+CNH0yv
 /tw=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156338101"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:00 +0800
IronPort-SDR: 6n3QpVmU1JNb6e0f/kQyNo2EE6sMv7vKqAsZVr7YL02gDY7EZBt64bC+avxJBZw3HEz/mffUxS
 iJhzkAlx94MPBIBn/vhgi5R5wobStBm2/2t9fQqrX/jLJA9JFaAJHxAAHOMD4v8++vsQfJyxOZ
 ydHWCTuSN22oxhYf3CpmQmyOqg/zjA+yo5o/cmj8W2GHmmBaZeyYG24MP4jGjjA6j5efQaEes2
 9c/OG9EQrBHOXjz4pqda5MrRGgm2N7W53nNnor27+2wlyllPvG6uS/OI4NOUsMdT0ea4rN00UP
 suY6M81Jen6h19kiLTlWZtb9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:17:43 -0800
IronPort-SDR: JsXFMv4M+7Es7jWNDt6Ne2GiJ9XR8yT05itif7CojIPQER9XGijzyKU+23d7/hCVrvWXpYgNgh
 amBCAUCYaKoXi4/55ryArE2CRzrgCzBpgYQFCe5q0gw0SNEIgqIfXu7gVJCqbRrEKSWWHEZu97
 zygbE4F8WyR504wdCP7Npz6jPhVs72uUkJ0CJKPLpZI5bnCrgsUlJfuPUrfOJraRnQlRBrZPME
 WPnhUMdBrppWP+8aUnZJqRJYaGm/ut5EtxVHxO+Q3wJYmBQ/rKQuM4IqozCHOcdivJlbe08NTF
 +UA=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:33:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 01/15] hw/riscv: Expand the is 32-bit check to support more
 CPUs
Date: Mon, 14 Dec 2020 12:33:58 -0800
Message-Id: <3b6338af937d0d3aa0858ba1a4ad0fd9e759be66.1607967113.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:03 -0000

Currently the riscv_is_32_bit() function only supports the generic rv32
CPUs. Extend the function to support the SiFive and LowRISC CPUs as
well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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


