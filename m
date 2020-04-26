Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jSk8S-0005m4-Fp
	for mharc-qemu-riscv@gnu.org; Sun, 26 Apr 2020 12:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk8Q-0005gC-8W
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 12:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk8P-000505-Mr
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 12:28:01 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:30903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk8O-0004rb-20; Sun, 26 Apr 2020 12:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1587918480; x=1619454480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HcVek/unt7NK3jOyUlLGKE4mVHxoXH4ienfMDbL1JK8=;
 b=HqKTLR0eCTRiIPsnD7JaWLWgNy8UjoOStuSGNJzHmvevekjF75NybaMb
 PTTla/1FFkRG4R+dH8c1OY/fyVp+9kjyI8HnMl9CECCTfGNfBWFI14+Gs
 9b5tDuhfTiqu/G06x9qvQ6qEjDeyjrGLmfyLYNhYDWprOIrPer+eW+Xok
 71XxUTjeyl4/023Xb20XluOOxt+t+F0H0zG2/jzy56usJ0t0FTCSAzj5n
 4biwCIIZDh/zfxEBdOb6He7Pgjc6+/azxskjeYpo1o+UrhPSoruu0J+tu
 qQl6P1NPHNR/8jbkYME7OOTrsvYOiRlsIMTVcf14IWCmMV296emsNFLeu Q==;
IronPort-SDR: C1IQafCCJ+OzWEVIeUNoldkIrl36xGaUCYMGswk8BzI9ThxpuW4mT9fS4CN2N/iII9cvG+MHAO
 4HNDGsRamvjz7iSSCwmDmm/op9TFQmpYi4Baul9BWBbUaawBHKGD5lm1oy6r7fG1ELucU8BNQz
 RuvKTyjMfQHb0YE9aJ7ebws6r/L1t9ntEr4Sl6t5lN5CuGrWAozKUCeGA73MsgdgcW4R5BQwUO
 jeGK/jTRtc2kjRXIKHdKSfxKoP+n5fqMzNYcrMVIz4cLkDk8E0AAnwiU8n5NVv4DlLjOqqgPnG
 wEA=
X-IronPort-AV: E=Sophos;i="5.73,320,1583164800"; d="scan'208";a="136193257"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Apr 2020 00:27:58 +0800
IronPort-SDR: d85r4kf8PeT7Idsi3TSw3B1dGd2fyirqpnMfaCl9mVcXmjWATHFDOd//hL8edyHwFdnbg6xMLK
 5mC+uptuq2znu7U7uXZbbE/mCm966l4aA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 09:18:09 -0700
IronPort-SDR: iHyN+6Yzcr4y1ZMX4U5nsGVzg24h7K4CvQxcVlnbiDABBqTmKd1yU253Z2UlaUlpgnzUzxXIQF
 qjNMwDhFN2AA==
WDCIronportException: Internal
Received: from wdthnc17-0189.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.50])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Apr 2020 09:27:59 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 13/15] target/riscv: Only support a single VSXL length
Date: Sun, 26 Apr 2020 09:19:48 -0700
Message-Id: <23c98b0c5a3394ce5a98331069383cdb0a4d095f.1587917657.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Sun, 26 Apr 2020 16:28:02 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6b6080592a..438d0a61ee 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -854,12 +854,21 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
 static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->hstatus;
+#ifdef TARGET_RISCV64
+    /* We only support 64-bit VSXL */
+    *val = set_field(*val, HSTATUS_VSXL, 2);
+#endif
     return 0;
 }
 
 static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
 {
     env->hstatus = val;
+#ifdef TARGET_RISCV64
+    if (get_field(val, HSTATUS_VSXL) != 2) {
+        qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
+    }
+#endif
     return 0;
 }
 
-- 
2.26.2


