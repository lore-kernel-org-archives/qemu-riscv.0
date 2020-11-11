Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kczUF-0002bO-VU
	for mharc-qemu-riscv@gnu.org; Wed, 11 Nov 2020 18:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5772e8c53=alistair.francis@wdc.com>)
 id 1kczUC-0002aq-BH; Wed, 11 Nov 2020 18:25:08 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:11721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5772e8c53=alistair.francis@wdc.com>)
 id 1kczU8-0001oG-NE; Wed, 11 Nov 2020 18:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605137824; x=1636673824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=trAVkYOnM+YjhGGzk6wPLZOERcyY5b8v/ZohS1pIFMg=;
 b=mc65a3Ns8zJF6zWHuDbpQdU9/7GmhcdKGIGQ1JUxXOWn4vAd9HX7NvQr
 rW3U1W9zLV3zixmOblXQzRs9Rt80DcjQ+tXnRUCzCupmQ5gOCdqkzzZld
 TYHY1Y0n+qVHjS6RbqwRzR0rD39HU/YeXxs3mgKuixskwvHS+L+BVUTZN
 0GLe7VxukL37g7gs+KGjCB1cI8eMBoGmzeox1PYnPVVjojVDR0fqqkwpq
 KHoDAw4a8eLqpFQyqGYmdpT/2HxqAkNo+yRW3GC08Vg+dO4xIYUhIz/2g
 iFKo0pse7ujzN7uCU6SSh34djxxszXTjEcwHyr5wlIJ1Rck44FCh0ZQ0E g==;
IronPort-SDR: 8n0Zphv69FBHocSjwUFaWwXOv/wUCwd6DQuiTV49+0N1V53N/E1tPYS9/Ei8HrE9+j0WXpaI7u
 a+Rbt42aW4KJ5atbakI+9R4wktrgDxPc/bk2VRRotjITGXP2T/GAjPMLtIJ3Uv+OAhzIyAaKGc
 KYgcafFQerggiiwOm1Pm7UG5ma9wvY+0yLeYnYFSQ0aLT42UzKHOTZD0zhU1yRDDP/oiRce2tX
 SgPe5Uo/iXyb32rsqz+OABtFow46Ke4I1QRQ20vLoNjQbvJlUExRJGItskdxEYAw0fjCf20iKI
 Kns=
X-IronPort-AV: E=Sophos;i="5.77,471,1596470400"; d="scan'208";a="255996587"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Nov 2020 07:36:56 +0800
IronPort-SDR: A2wfQj+XD7Nqnt7PsBmLjXVXSH5nkvHWQ9VkgGlayksKtQd5sq1lzfU8hMLbf3/EwIgwwqn0vx
 vSpZhKY5PhVatmwXaOgRg7X/mqJXix9tsCzN+Sc+t5KgA3+EYaOit2j7N5S6IHtsQdBfFjaZm1
 +laQyCgRgvo/RpTFiP15r/siiGElT7xAGrmPBXk6Ke5acIKO+/UQIWFQJFV9l/dLf5Rngv5/ig
 FD5RqZWb1ZcihwA3JQ8WjYyiS161DD3cgkiaAsAZfEf04PpdDJWvM0TnTOmODD3dunaAU/1/Q6
 buirRQ8Vbfm4bxe0Dq/LNWzE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 15:10:58 -0800
IronPort-SDR: Y1Ku/CyZd41uY6COZyDnsyYRgQ4kO/qkk0K+h8xeoiUk+7DUZY6CgyU7UVZ4UOIbLNRO+ezN7U
 c2KYe9B6/FzTVybcCUJ6mR66lV7gv9U7cArHHNW7i5m9YIojgT8dQtMPXclsxCCIa9ui+ewGZ7
 tq9N+fQS+7bU+M+l1OtDp87fTe8w0RxCdxERMa7QYARJMuxWsMX1hRvDpS01lsQQj37tp+4NwX
 FY8XpU5cA+lDEuSViWqAO7aLLMMS0KY4pPi1CvQ5ZeJMsjsAs0srAj2qp0hpzTrwLQsfFHkEBe
 Aq8=
WDCIronportException: Internal
Received: from usa002979.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.31])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Nov 2020 15:24:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/2] intc/ibex_plic: Fix some typos in the comments
Date: Wed, 11 Nov 2020 15:13:21 -0800
Message-Id: <22d2fb0d7af5ca316c67ac909926368d1bcb7cf5.1605136387.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=5772e8c53=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 18:25:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
X-List-Received-Date: Wed, 11 Nov 2020 23:25:09 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/ibex_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index 235e6b88ff..db9e0aa25f 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -45,7 +45,7 @@ static void ibex_plic_irqs_set_pending(IbexPlicState *s, int irq, bool level)
 
     if (s->claimed[pending_num] & 1 << (irq % 32)) {
         /*
-         * The interrupt has been claimed, but not compelted.
+         * The interrupt has been claimed, but not completed.
          * The pending bit can't be set.
          */
         return;
@@ -133,7 +133,7 @@ static uint64_t ibex_plic_read(void *opaque, hwaddr addr,
         int pending_num = s->claim / 32;
         s->pending[pending_num] &= ~(1 << (s->claim % 32));
 
-        /* Set the interrupt as claimed, but not compelted */
+        /* Set the interrupt as claimed, but not completed */
         s->claimed[pending_num] |= 1 << (s->claim % 32);
 
         /* Return the current claimed interrupt */
-- 
2.29.2


