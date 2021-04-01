Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRz6u-0006qj-2I
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 11:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz6s-0006qW-L8; Thu, 01 Apr 2021 11:19:50 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:23979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz6p-0004py-P3; Thu, 01 Apr 2021 11:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617290387; x=1648826387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mMjeOjQVZu5SPDYkO3wbX1crsyX0v8qLJYG8eeT2HiQ=;
 b=FpicnZFNuthbwAul5a2X342AOmBDooAUnPc/C3vy/zdXgyUX+CYZK7p6
 EwEqGZHeRuOlHcSAil63sf5l4gp/PwPUUBrQhcJcM7/pR2h4cbzLorHJH
 15i0fWnnDCoEMQ9xRs1tx/Y9XaZdGw9bURkWU0HKeZHogs1Xygyb4FrU+
 WIzDIoFDXR1Ri4Lmxy2BqWsQVb2XrBds2Od+SP6l5CtFrnRENrMOAKOt8
 tGb7Jy8ZVxtzx8fslk3vAgLxGdI/ILtupQ3hM5iU6C0KQyh8Sb/Vu85Ih
 TCqHsnn9gRNv9AoaIZo/vRLCifLbm3WVBKYGtOuiQPcmGoC2U2vkoqqyz g==;
IronPort-SDR: n9vkduRtfVqea0yUDAK/9+Ha7QdQfm66/NDo97XPVzIkLktS9aoLtNW4VZbctsNFZXRvPzR5yQ
 ZksvVwU3+4fYIWlmFZIqi3maaB90LWyT2+jc4CqhTG7PkqwTWkPLmApD15hSpjxivGZdXITXif
 FetjqlkQwbIkV42trMibBjhiyv0OC9KlsO7kBlF5uAYDEJQGyH83xG9hHEYwS4wgNwqllrBAoy
 cxaVWy+NXdm3gcmiQrEJmfyq+YG5JQGMXmTQg4TkfB4cV4MkbpCZl8l8dOfPDeM6xCGb2povzj
 ekI=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="163455441"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 23:19:40 +0800
IronPort-SDR: uA+ss2XwOlx/I2nBkJCysrXANf/0Lq3DDO0k/AfOsrhcUkW32R80hrleTme/bzebXFOiPbQyHs
 v94AiNd6k5DntcV83gVC4T4dPoE54MEQBYuuwdxGt9FZC8nTvR0swxUYmMUq5mqjN9NhzN291C
 9Lg2dUC0qmOlQoduYh2caYb6fpPvHjFtFUyO7NWSC6+9BnJ8WF2wMhqOywmsrhaNb6ltYzLjn6
 F8Pn2PTCRyZaeTmzVKSJdjPWaaDYsqQUvJyYQ5JEEYc0GhPeDgOyUJcC5eo6RVD9dFbpnycrZT
 kvbmHQKXqwGVtfHmTzPH6crL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 08:01:20 -0700
IronPort-SDR: rwPA0q/v/prZYUk4nVdRVK71e7LcPFbyNAa10cBPcWwoero3nWa9LCa5egFK908zjq7XncfVF9
 8I3Z+KOT/T0nm8DDzct06/xLjjPHi+rtOlOARGMo7MXB5NtZsEEJRZ5ZhWpLPZY8Zt30NZd7lo
 1NSzuSQaom9LPvtxcuwnQhROWLvWdtYj8U2mE+8B2KmOwx3ElovMqSn9/sU0wfadVquYs0+69N
 zgqZ4tXCHtE5keUWf9ee/4ejOLvWpaDZSQPhb3gL/ZMZ4dMf2mlfqkcU40P2OQr7PBfZYoYc5O
 /uQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.75])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Apr 2021 08:19:37 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 3/5] target/riscv: Fix 32-bit HS mode access permissions
Date: Thu,  1 Apr 2021 11:17:48 -0400
Message-Id: <cb1ef2061547dc9028ce3cf4f6622588f9c09149.1617290165.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617290165.git.alistair.francis@wdc.com>
References: <cover.1617290165.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=718ae7c5e=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Thu, 01 Apr 2021 15:19:51 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5dc2aa9845..a82a98061b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,11 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return RISCV_EXCP_NONE;
+        if (riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        } else {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
     }
 
     return hmode(env, csrno);
-- 
2.31.0


