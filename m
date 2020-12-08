Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlu5-0007lG-N8
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlu3-0007fZ-Ds; Tue, 08 Dec 2020 17:56:15 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:43224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlu1-00049X-Ky; Tue, 08 Dec 2020 17:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468174; x=1639004174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nLrKjf8XZmGJ1Xd6Q2NIglSi20tiEbMDonG3iL5kf9I=;
 b=clhljAMaC995WcyTLp+WfI2XkinefzcBHq+v0LjVHcFEs5fi+qm7sh/x
 gl6I9Qt/DDt8H0GNXbTET2oInEg8nxCoDsjucltaYOWR2RktTKwqhMyU4
 g2uCYOTadUqVlqen5YHtpr1GWRv1FCExF9M2YZ3H5GaDS01dMbr9t4GtU
 Q02eEAjAf/R/9D/ZS6deCtgzIMdQ5fzluuXemeHYv7JxXHJCViTiuu7t1
 i3B4wUJt+GXP34G0yER7C84VY1ETJPyv7xZ+Yhor99Dz0zjnb/2LLY6Mq
 6dXaXCUTM4w/aAXHm/Rus7lD9WAcNAj7EVnI0MTXznp1/IRC7Po/Bb7ZC Q==;
IronPort-SDR: aE+7vLlIsrzS9lcIdeoyPmxNFhrTyDQTZtnY6eXEzV5nrLdICdWuKKozwsDtvWlRJHZYY2RDQc
 rgKnHa+OY0pzZM1gl9JahbNZ5RUq2LQb0nYEn3Dbq0PDbpnHDIXrocAlruqrwp68u1+s3hIiM7
 oPOS+L8HHiWq73FhYsfIwpyJnmTzRHDQIt2nVFY/iUsxXFL8no3NPFm9y4OFetQA+6iZHH39cy
 b2p2hUW0xzvot80GczBYcnFCo7cb8DJ9qV3r6nBsrh/2gvKU5l79jdwWA2mRTVIjyWQ7OT2p27
 d/s=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="155938390"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:12 +0800
IronPort-SDR: vZwWxNkWXbcHbOTWGfUvl8FT0tliGFqJJmGQFv1NzuI8DL7G2riKlfr74s91tvXluXUn7/AQnK
 NtsHQEhYiJPvhRefFdUmqIXWFcqNiBoeg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:41:38 -0800
IronPort-SDR: vGotmlSOmAfOjon8NJOdueTR6tv8B7nKr7+/fBdpFW733VOw2AqiIHQ9pONYo/hWTerYWumw2J
 f5ukV9fByuMA==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:11 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 01/15] hw/riscv: Expand the is 32-bit check to support more
 CPUs
Date: Tue,  8 Dec 2020 14:56:11 -0800
Message-Id: <a819cd643b60a11513dd5a75e25c8012db856828.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:16 -0000

Currently the riscv_is_32_bit() function only supports the generic rv32
CPUs. Extend the function to support the SiFive and LowRISC CPUs as
well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 9b3fe3fb1e..4165cc8d32 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -40,7 +40,19 @@
 
 bool riscv_is_32_bit(MachineState *machine)
 {
-    if (!strncmp(machine->cpu_type, "rv32", 4)) {
+    fprintf(stderr, "machine->cpu_type[8]: %c\n", machine->cpu_type[8]);
+
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


