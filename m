Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5wLj-0005Mz-VU
	for mharc-qemu-riscv@gnu.org; Wed, 12 Aug 2020 15:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=486123ee4=alistair.francis@wdc.com>)
 id 1k5wLh-0005Gs-SE; Wed, 12 Aug 2020 15:23:45 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:4839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=486123ee4=alistair.francis@wdc.com>)
 id 1k5wLc-0000UI-6t; Wed, 12 Aug 2020 15:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597260220; x=1628796220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNpkEhXF3G0wGMMrrCplVS4/5vssOWwwtnYQkdrsvM4=;
 b=JM0hAoO61Qp/39GJaJcAlerGc2gEUreHdL8V8EXiPdPhjjqUcYJ1o231
 V6ICGBU9wZRjoyICTJZ3N1tMfX9kiiA7qVBeELbSOufxbPuwdCNe9GlEG
 5qeHW4U5AayO18qAWbSzeIMVqN9giiL0QbE8uAE3JQD+gC0Duhy2wg7cl
 nSTCziGyTdsblJzvbDo9EvHxBTwa+heVVrd2416+f9Yag7WuF/ON0kx/O
 o3TWwaEt+0Pto4JaqBj3/5FgfDIhuLRvaBXDFJEiGJMGOtRZLojyOUFex
 xihpXqsprvLBFG5fkTBMui+F9szFYktu6Xs8LiFKLarLiKBziEcZjnzVR A==;
IronPort-SDR: HGGng6y8HBwQGg0OnTodWu3nWx7yRSyH2ZJXLqjznAgmXuEV/nAuG5QVDbn7KPf/YbVtxPXr7T
 arqwNDBam9NCVrqRDAkLU36truGkE6yhoSlPU/rCfW5Q+kuPL9objb/2n9QMhRbKFRqQvo2yYG
 9ZhXJEEL7ZMLHsF0inStwg4Lt9qfxvtmrYjKbp8vwaGq5lrOzRAN9X419MzAF6Vo2B7cxTs4aF
 JEYZjJKf5n24Yx4Cs1hH7rFk/YUcZDfwxUSCH+ZaQL9+s6dZtX61GxsU1ymCL549o2HWBV1zZ2
 G1A=
X-IronPort-AV: E=Sophos;i="5.76,305,1592841600"; d="scan'208";a="146029210"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Aug 2020 03:23:39 +0800
IronPort-SDR: mUyccbobPowvVtvfZ8ovWKLzoEOGaGMhQ10pr5TVRhWl82fLhOSRZhc3gDte3G0KaUneA3PXcz
 NrDDTpModd/g==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 12:10:47 -0700
IronPort-SDR: OAF8VfAb7uykzh3vu+tDqaZHuU3eOlT+BgKqubBtIp2YytZqqU+Tu/Lmt7SKnioLPP+iUOAYKX
 Ty4nkq3VIeZw==
WDCIronportException: Internal
Received: from jbfyk72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.59.14])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Aug 2020 12:23:40 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, anup.patel@wdc.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 09/13] target/riscv: Only support a single VSXL length
Date: Wed, 12 Aug 2020 12:13:38 -0700
Message-Id: <f3f4fd2ec22a07cc1d750e96895d6813f131de4d.1597259519.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1597259519.git.alistair.francis@wdc.com>
References: <cover.1597259519.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=486123ee4=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 15:23:20
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 12 Aug 2020 19:23:46 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f9ac21d687..390ef781e4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -836,12 +836,21 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
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
2.27.0


