Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kou82-0001Cf-Oq
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou80-00014r-62; Mon, 14 Dec 2020 15:07:28 -0500
Received: from home.keithp.com ([63.227.221.253]:51752 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou7t-0004Fh-LG; Mon, 14 Dec 2020 15:07:26 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id A84543F2D6F1;
 Mon, 14 Dec 2020 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976438; bh=RmH2R6QxobB3gCYv+aIjULuWn7gQGSuqYqflCGwU5OI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hEXj2fRM9SbPndVcaUqg0TVhjj2/AtI69re/MzLFhtGVNt03673uynrUCYZKNdfVq
 vAKAs+3YlqVkFjarPajSMDP6FYDUz7Wmb+g8AK0asZy6B57bv9TlAKh4QD5zwKzkkG
 Dg0qfZcBtIvQYWn0fGzO5NYh4o/CjS2ewLM7Q7EjSaDCjdHDq12g+qD4VI/JH9kPNO
 joEhc+uuYcKrz2UWV2oY7wDvCwjBUJOd+S5y7xKoWq9kHSrjY3APUxzoi1RmmbUORw
 TUoSjYcmRQz5Q6EwadfU2h/wQU+FvMkKHwLRKNJRtqpxXoJdwQlNr7O+2ZyTvB5FU/
 vClSSolfFUDqQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id HpKMlp2pV3hq; Mon, 14 Dec 2020 12:07:18 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 995633F2E379;
 Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976437; bh=RmH2R6QxobB3gCYv+aIjULuWn7gQGSuqYqflCGwU5OI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VlRNnvPNCSbCiXxm1EL8YehsVCioLiaAVgn6nICuV49OCiJFTgb4G9OQ5i8wlAdwZ
 mCIYeinfVhD9vj6QvTfxmDzlrY8zCMvHMrSCnO6PsuoZ43HrUiercC8IE/T3SlpfWI
 MHPFag52RVxX9PR2+KGewfnOE/QlX2vwyzuMlTDLYY8l8iZU4BtRCTa3FL6UTn/dLD
 bvHpQmbpwsf6naSjvMlKQ1dGyOuVUQgdq4EtiwY0qwHow+MEekz/s7s5aGY2vXOMYI
 plfqHQ+4jDyjbNNmxIb9uG0RRgQynBL4KeWR24QRUJpKN/kSUPkvN3ChmatnsHxht7
 0iYX4VYZmfW1g==
Received: by keithp.com (Postfix, from userid 1000)
 id 484181582202; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 4/9] semihosting: Support SYS_HEAPINFO when env->boot_info is
 not set
Date: Mon, 14 Dec 2020 12:07:08 -0800
Message-Id: <20201214200713.3886611-5-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:07:28 -0000

env->boot_info is only set in some ARM startup paths, so we cannot
rely on it to support the SYS_HEAPINFO semihosting function. When not
available, fallback to finding a RAM memory region containing the
current stack and use the base of that.

Signed-off-by: Keith Packard <keithp@keithp.com>

---

v2
	Explicitly convert 64-bits to 128-bits in find_region_base
	for hosts that don't have native 128-bit int type.
---
 hw/semihosting/common-semi.c | 43 +++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 33c82f73b1..f09deff4d3 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -137,6 +137,36 @@ typedef struct GuestFD {
 
 static GArray *guestfd_array;
 
+#ifndef CONFIG_USER_ONLY
+#include "exec/address-spaces.h"
+/*
+ * Find the base of a RAM region containing the specified address
+ */
+static inline hwaddr
+common_semi_find_region_base(hwaddr addr)
+{
+    MemoryRegion *subregion;
+
+    /*
+     * Find the chunk of R/W memory containing the address.  This is
+     * used for the SYS_HEAPINFO semihosting call, which should
+     * probably be using information from the loaded application.
+     */
+    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
+                   subregions_link) {
+        if (subregion->ram && !subregion->readonly) {
+            Int128 top128 = int128_add(int128_make64(subregion->addr),
+                                       subregion->size);
+            Int128 addr128 = int128_make64(addr);
+            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
+                return subregion->addr;
+            }
+        }
+    }
+    return 0;
+}
+#endif
+
 #ifdef TARGET_ARM
 static inline target_ulong
 common_semi_arg(CPUState *cs, int argno)
@@ -175,7 +205,18 @@ common_semi_rambase(CPUState *cs)
 {
     CPUArchState *env = cs->env_ptr;
     const struct arm_boot_info *info = env->boot_info;
-    return info->loader_start;
+    target_ulong sp;
+
+    if (info) {
+        return info->loader_start;
+    }
+
+    if (is_a64(env)) {
+        sp = env->xregs[31];
+    } else {
+        sp = env->regs[13];
+    }
+    return common_semi_find_region_base(sp);
 }
 #endif
 
-- 
2.29.2


