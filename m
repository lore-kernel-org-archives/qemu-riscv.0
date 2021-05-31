Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnZWT-0001ZJ-8E
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 00:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=778d471cf=alistair.francis@wdc.com>)
 id 1lnZWQ-0001YM-VR; Mon, 31 May 2021 00:27:27 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=778d471cf=alistair.francis@wdc.com>)
 id 1lnZWO-0005yM-4a; Mon, 31 May 2021 00:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622435243; x=1653971243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BzKfrt+sRZcXXQXOyTdrvAiIEWuVSuqdUMqIEvEL5lM=;
 b=GyEeW/i6LFpsr+OXnvpAq65NKqBYWx8ETFKs3bEQ36eFO0rh1I/Pa5SQ
 wIeVOhMLKmqDmn+1z4BxE6NIKexSqNnaYDAB2831gIe2maNEKd7x9KXhb
 FIhjD9I2nzTN4S6DQN8M2WqgTc+ZsTuQBV4Kk9uYq/vcXTSMRWJoJC32E
 sEB3S9lzVBmZuXBPiwGSMXjzY1R4YPruq3iKAg0SfnujVwiXN46tbqTfB
 35YnfH73ETmNnaioikGtRskuvPv1yBnroWDnCfv+qRZTziCuyVDtRwqgr
 BzMXHjL7WslzlfieoFwpI7mh1kMH9krLTChsjyYsILUmwVF77qN/cdSl/ w==;
IronPort-SDR: yW6LZhydsl4zfxYP7KTUDnDvSekz1lJ7Qr1eGnTso8ADee27PaT90mqrlbx4Jr10EJSL1fZ3Yd
 xVLNspPl0Tps1R4rJTi5ONMrP58lF5hLEpURu8N79bVlniVJFIOTLdo4P+G4fbfbAohnayKp9o
 0SG9QWwLuUkyJ69dn0HHfoEfQywy9ArXsF9QUvU6GBVy6CJDRRkHpfukyYIJJJhcE/nTZMFHC7
 cRRkrQylSI+NyLWKESgSHapwlYpl4sKoM1EZCtm5lPecKSFfWVH7nKv6Seq0WnPx39B3CEL891
 J8M=
X-IronPort-AV: E=Sophos;i="5.83,236,1616428800"; d="scan'208";a="174840325"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2021 12:27:18 +0800
IronPort-SDR: 04O6fprmM80NIaOzzx3gVftxvNYkTe06aD/1I1zyUg+BZrfxdy8lo2ZqsiZFBWd6lFftlV1NLH
 OnmCGenH+8w/Nnw6K4IhAHM85AMH6iYtl3e6uGXAciuyo3x43K+UdislmpZfmTjNTmhjuT1InD
 AS2EWGU0ryK3ABk/cr2RjGX8h+yXzFsuSmbB69LNpWfJy+YytAQE88/NcIqlr4ewMdPIdrBERe
 ERhx5zdp8aJvBr6ZNe60iaO+zK1RYXUVNb6vuf8VrcPfaNOKi2vig1rnzHrI9usvBc8HU9c8HL
 g/hNi+O3is1QgigJE7a60+vc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2021 21:05:16 -0700
IronPort-SDR: ISuy9t/KVq6rglpF/C6pfQ+34ugppAywISQ7zb7cmXheQ4O80+7KQGGmrUlcdc6dzg5BweTxdU
 TH+VxNMOvvAxZN4PZAdDBYK4F0JWCSIij3NqKw0dboHbqHdfEJQD4u/m+dmxbID8byFrK20Efd
 5CjlVNxDGx0vHeyjj0TyEgNtHRmrY9Cev0psMzzrBDkS9V+GFYZtLjPWZWPvXxbsEns0ZhfYXe
 snyGvrTfCxv/h6+gm/PklJ3biYmMDX802ezMdc4VXif9UB2qwOZhzI+v/tq5F00dOMBvj/VwZB
 NVc=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.65])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 May 2021 21:27:15 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] target/riscv: Use target_ulong for the DisasContext
 misa
Date: Mon, 31 May 2021 14:27:14 +1000
Message-Id: <c00176c7518c2a7b4de3eec320b6a683ab56f705.1622435221.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=778d471cf=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 31 May 2021 04:27:27 -0000

The is_32bit() check in translate.c expects a 64-bit guest to have a
64-bit misa value otherwise the macro check won't work. This patches
fixes that and fixes a Coverity issue at the same time.

Fixes: CID 1453107
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e945352bca..a35a58df92 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -47,7 +47,7 @@ typedef struct DisasContext {
     bool virt_enabled;
     uint32_t opcode;
     uint32_t mstatus_fs;
-    uint32_t misa;
+    target_ulong misa;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
-- 
2.31.1


