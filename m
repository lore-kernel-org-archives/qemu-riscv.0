Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nf33L-0007u9-42
	for mharc-qemu-riscv@gnu.org; Thu, 14 Apr 2022 13:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=09613d920=niklas.cassel@wdc.com>)
 id 1nf1ox-0004lT-Eg; Thu, 14 Apr 2022 11:55:47 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:21674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=09613d920=niklas.cassel@wdc.com>)
 id 1nf1ot-0000wq-Ch; Thu, 14 Apr 2022 11:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649951743; x=1681487743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZSUa15JuP2rebAbx5D3GQJOhU3wIEw022dQbQBD30fI=;
 b=Fw0G3qSec5CI8y3yUQSsOnTqjLXjUPWdfKPHbnhU3Wv8SiKxbmcLfKzu
 o4k3SCmttpNkaFfNPC9w0XnkmciPzkyMbNhUmsyX15/dtaB7w+6jy8JrD
 FT6rSK3BLn5fzkph39cukLGXnOmIgjRQ4i/cqLar/fcdXC7j34V6ftfC5
 6fHyHdET3CeEiGuicTbCEyxQ2WXkENxGYL6+G7yf4QHDcsb3l6DZAhXOz
 maQOpK0V9CL7HNr6jBGR0Ue7ycyB/4EX1cQ+PawhkKSAKwe3Vl7y+BC72
 dAaIoI1BpLyAG1wcglJ+dBoSSB4519yU8/h8phE+tnL4qj2XRURXjuQTz w==;
X-IronPort-AV: E=Sophos;i="5.90,260,1643644800"; d="scan'208";a="196789230"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2022 23:55:38 +0800
IronPort-SDR: LQDAf1eAZ2kGQugSWwWVKy+xosKRF178xY5QjPcWcLWySvL8HBZsh9L6Mxt/VCfoVghvkl8R2u
 mCHopHk6XkShTJznUwFFMIXaTZD3mfgtEsdmWz8/hMltW29GH4yOqVWhAGYiQ00H21tFwgkCjv
 U3Y/zqHSsgH4XHLlcfI+f6kp3lRBY2hd29u8aniO9nEz3rvhjXK4tqycGqInZqao75pf2r7B0F
 H5nEkD2T/kWJcU1/hxiIfG406uYKUm8/sIfNkGS9VtgwcNJknRWipiddjMgdEMoxNMPZIbhycC
 okRdC0/4soit4D4z8g++yzHW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 08:26:51 -0700
IronPort-SDR: T1Kqewkpfh4/m90/nN1rftG97IMsupQc47Sk1tBYy9B9Bx1IZ0O0CHF7VnCNE9mrHP1ugorCpw
 eG6AB464jsc8L38AEFQyzwrLiLlo1GMySxMWTZLIQwbwWT+YQEYnzMFXzVa7qyT6/fZeFAJP2m
 dqyrmVaf64Pi1mz2afzg9OF+1Du9DdLqNKn7YRdAmfxxp+KB/eEXUhF5cXG1dw92/Ct5J9G+w1
 FQy+usADlnLD7YlCDXOINkwTEHsYzx/ntTnv4rreZf+It7Qw4esx0sjh34AH2L6LWY1arJruJn
 hEw=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.21])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Apr 2022 08:55:38 -0700
From: Niklas Cassel <niklas.cassel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH] hw/riscv: virt: fix DT property mmu-type when CPU mmu option
 is disabled
Date: Thu, 14 Apr 2022 17:55:10 +0200
Message-Id: <20220414155510.1364147-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=09613d920=niklas.cassel@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Apr 2022 13:14:41 -0400
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
X-List-Received-Date: Thu, 14 Apr 2022 15:55:47 -0000

The device tree property "mmu-type" is currently exported as either
"riscv,sv32" or "riscv,sv48".

However, the riscv cpu device tree binding [1] has a specific value
"riscv,none" for a HART without a MMU.

Set the device tree property "mmu-type" to "riscv,none" when the CPU mmu
option is disabled using rv32,mmu=off or rv64,mmu=off.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v5.17

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/riscv/virt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..3be6be9ad3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -230,8 +230,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
+        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                          RISCV_FEATURE_MMU)) {
+            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+                                    "riscv,none");
+        }
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
-- 
2.35.1


