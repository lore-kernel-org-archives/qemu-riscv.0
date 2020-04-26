Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jSk8P-0005cb-1o
	for mharc-qemu-riscv@gnu.org; Sun, 26 Apr 2020 12:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk8N-0005YL-7W
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 12:27:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk8M-0004s8-Rp
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 12:27:58 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:30903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk8L-0004rb-An; Sun, 26 Apr 2020 12:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1587918477; x=1619454477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eCEctXu2r/noDa+f6W0xRPXi0SV6hI35JY1T8wGTdzI=;
 b=kUYR4SLcwdNnnWlVU7tbGpOEoIOo7fmlu3jOJ40G4PBtfwkMax+OMkV+
 QSlL6hhVZ5gTgcqrj0G1c0jfcNyIQHiJw1k7JEkMpDaydarR0cYlub7GD
 3hv79wrWzQZLWxCjtwbYRLmmBA6kBQESr89+rDXiZcRgyCqs9OAcy9LlW
 s43rV4LhfxQ6VrQbIZnTwJrXPPR4R1l+1u3bjcW6aKZeFYQ/f8D9KKpAK
 +tfNu76BN3EeuStvZGPGx5ZmqV99gI6bcia6MQyQca/kpBnK16Cepl1C2
 GZRGZwAy5g8wLPXDnGE9PO6wpAW/5WSQ7+Af24cpXwbYPmXQYQbyhry7L Q==;
IronPort-SDR: 1lt3D0tphzjBs5U4aJXlqwkeTI0mEHJSjDYwniMsUcSJyT4hTHvYHc3FOTfo57o/I1446jSbCg
 TVU2M+ygd1cWnbk78U3SMwcD3MqTI7OLddjplg+B8iZsbnu4avm+Nv0yhPXxx44bBOJCO0n73y
 TDivEBo1xNMZIqdTiiv6WN6UwWt07Di0MUggH5Vk8XNgJmXISVeX/L5zD8TpaHkVJbWLWsLLYe
 MPqofyvADmMT2Qnpsv+xwMpwagmNfv9FB9qU7fP7soTNakZSQgZKmrl0glW0wo8uqIMb25MFvJ
 yl4=
X-IronPort-AV: E=Sophos;i="5.73,320,1583164800"; d="scan'208";a="136193255"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Apr 2020 00:27:55 +0800
IronPort-SDR: TEfzyvoS1pGT1Gkfd9K6JMXUKCVDdg+cWivK+ysMNYlJCUVAdwXFO8ZBpWX8jgtU2dElp61JY0
 ldD1OlGhgO18E3Vux6p01okT5de1cvTCE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 09:18:05 -0700
IronPort-SDR: vYfbP9q0nEV6GUU84tc2QuOTnvBbiUASAVZX88RmAbZk3vb3iWB5umraWjTwUQPdCsEFmrVDhg
 /lQyl9OvfeNg==
WDCIronportException: Internal
Received: from wdthnc17-0189.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.50])
 by uls-op-cesaip01.wdc.com with ESMTP; 26 Apr 2020 09:27:55 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 12/15] target/riscv: Update the CSRs to the v0.6 Hyp
 extension
Date: Sun, 26 Apr 2020 09:19:45 -0700
Message-Id: <87318882f7b08e93dae29f26d62b1eb823a136d7.1587917657.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1587917657.git.alistair.francis@wdc.com>
References: <cover.1587917657.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=378a396a1=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 12:27:21
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.42
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
X-List-Received-Date: Sun, 26 Apr 2020 16:27:59 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 6b97c27711..8a145e0a32 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -422,15 +422,17 @@
 #endif
 
 /* hstatus CSR bits */
-#define HSTATUS_SPRV         0x00000001
+#define HSTATUS_VSBE         0x00000020
+#define HSTATUS_GVA          0x00000040
 #define HSTATUS_SPV          0x00000080
-#define HSTATUS_SP2P         0x00000100
-#define HSTATUS_SP2V         0x00000200
+#define HSTATUS_SPVP         0x00000100
+#define HSTATUS_HU           0x00000200
+#define HSTATUS_VGEIN        0x0003F000
 #define HSTATUS_VTVM         0x00100000
 #define HSTATUS_VTSR         0x00400000
-#define HSTATUS_HU           0x00000200
-#define HSTATUS_GVA          0x00000040
-#define HSTATUS_SPVP         0x00000100
+#if defined(TARGET_RISCV64)
+#define HSTATUS_VSXL        0x300000000
+#endif
 
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
-- 
2.26.2


