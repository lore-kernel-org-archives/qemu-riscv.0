Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jh1Ax-0000xA-WD
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 21:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4185f83b6=alistair.francis@wdc.com>)
 id 1jh1Aw-0000sb-0m; Thu, 04 Jun 2020 21:29:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:56239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4185f83b6=alistair.francis@wdc.com>)
 id 1jh1Av-0008Vi-7D; Thu, 04 Jun 2020 21:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1591320578; x=1622856578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5lJn9g7UHpK0u+FPdhj/bWuKg6TrI44UV+9vDM6Jp54=;
 b=cRP/mAGvCeDGqdJRQnu/fkA2bQLBCn9ZQOMOrWOOeFmAFIwp4IhgCDOD
 ErJUD26invDJUdirE6cVow8hW1CLJaVzMbwHuWktjT5asBRra3Fdyqkj/
 2rznPYcvtbapnEbz45Y5EJkVhcTyepBXJQd+O2578tj+MZzGbywo8JN9+
 jWeb/AMG7nCWahJNUtmPp3XitYxhokuJbAYmkUoIUJd0IijW8fykuQ0cp
 XhsYrPtrXfk5PVFKXAyIsgELP6J49Lrq6zGYRmRRkbxU0/xZ2cyOMd2sz
 CaFLmufhzY7mRJBFOn90NxOQfOqA9V1dyS5ASvp+4SysGmPY6BTN/Gim3 A==;
IronPort-SDR: q/5bYReafcfJUk9T+L0wEYonklAHzIsb4T3a7Fe+Q8J/CLXsiEEHeJj6FIjEIWmz9wDyX1wQHI
 gEz/XcSBCY5aF/choIKT/aAW7EqtzB+h8ZdrKbEaWq5fIXZullYiHjllvkYj5lGizZyVkVHLpC
 wD4wg1Az2p9nKXXs44ixykNC2Lw9yC2rnls0uI0G62B572tathZ3TlvRYZ5HbkU3LyoP13fTxD
 o0u6EIEKbLVGKQyLZ1Fz6U3Fwk+zruSsrCZeKGXt4go8sV8LEFHc36F4F0lVcb6Y9zjLrVb5ec
 QDA=
X-IronPort-AV: E=Sophos;i="5.73,474,1583164800"; d="scan'208";a="139561712"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Jun 2020 09:29:36 +0800
IronPort-SDR: jHYY0yIg+IerpoTZPCyFZb3U7xuMCK7h84Wc03VVWAs/d5muvKuY7cRxEGgzfQoheGLK1j/20k
 xdeYCMJJfPajPZkmEKh7PjWZZmx+Qpe5s=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 18:19:11 -0700
IronPort-SDR: V4SIdune2AVVbfJ7jTNxjAz77QpELlLI9+wVpYXqu3sdf4K/9NB2P4HuuMEjxpQQeWsOk4J3zH
 IgU92be07YjQ==
WDCIronportException: Internal
Received: from cnf006056.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.233])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Jun 2020 18:29:36 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, alistair23@gmail.com,
 anup.pate@wdc.com
Subject: [PATCH v2 02/17] target/riscv: Report errors validating 2nd-stage PTEs
Date: Thu,  4 Jun 2020 18:20:47 -0700
Message-Id: <e8f3f03935697c721a5bb3e720d57e78e53ffe19.1591319882.git.alistair@alistair23.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591319882.git.alistair@alistair23.me>
References: <cover.1591319882.git.alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=4185f83b6=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 21:29:30
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 05 Jun 2020 01:29:38 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index eda7057663..75d2ae3434 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -435,8 +435,13 @@ restart:
             hwaddr vbase;
 
             /* Do the second stage translation on the base PTE address. */
-            get_physical_address(env, &vbase, &vbase_prot, base, MMU_DATA_LOAD,
-                                 mmu_idx, false, true);
+            int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
+                                                 base, MMU_DATA_LOAD,
+                                                 mmu_idx, false, true);
+
+            if (vbase_ret != TRANSLATE_SUCCESS) {
+                return vbase_ret;
+            }
 
             pte_addr = vbase + idx * ptesize;
         } else {
-- 
2.26.2


