Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ki2T6-0002gK-1L
	for mharc-qemu-riscv@gnu.org; Wed, 25 Nov 2020 16:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2Sw-0002Kc-2O; Wed, 25 Nov 2020 16:36:45 -0500
Received: from home.keithp.com ([63.227.221.253]:37062 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2St-0001Cz-AN; Wed, 25 Nov 2020 16:36:41 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 959963F2E291;
 Wed, 25 Nov 2020 13:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340193; bh=J0co6Q1vvgc8Jd0e8SYQj/3vWhrlTCZVfePzl9fHZPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YL6SMk4Tx+GNfe1/7NISeGih86kPAnHHKLyNGDkffUDURhh6jKVzFmTccYW8t6Xok
 tVnDcT2XwFSJ2940afIaZoZa69VPhaJoTl5coVJkoJBNSSEImP9TG7gTrxXTGUPpPr
 cTwxNLk/Ya7+KbVMIQ7SpHLqrN47GRHLiXM2BVMUt5TZTebGGqAX+6UK/0dokKpjPn
 g410F2SsGqPgQHqa6I2SpQR3KXS6FlzZAC+02OZsx1TROms3c0oCT+QO/9KVHUjqp1
 Hv4TI83IFhKnI4MIZpUSLMyOr+yo3bxN1xdjyN7kG3qsAVPMdZko1uI67OA2o22w8U
 J1GuqSOp92zGw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id vPNEEQmJ2HBk; Wed, 25 Nov 2020 13:36:33 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id BAC323F2E28B;
 Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340191; bh=J0co6Q1vvgc8Jd0e8SYQj/3vWhrlTCZVfePzl9fHZPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AybZBxEdusU8xZeG2JNQSQPKtFwQCEt12ZT8pVigybZVDBIx6AGD5wqgPO8TuASEK
 wUy/i9mXJx9UIsDt1Y3ldIvKkO+ZH2DygPHIU/z/h2XbAxD/u7SpkDcl3rb9F1n8BZ
 NiDtlKMrssVg7bgZtOF7nySvVa68eEhFoBjb0adFJkdNpayqH2bK4+wyxuPLI2GTc3
 /dXhnzI34ApKoezKVwY+d9/oU/B4fdZHt+K7I5p0fo2YVy9LnXQyVTLGlCmWN7axv2
 szYqCqqgWILwrezbJopw889KvhEqKan4BQ6YIeRy79eukofAJRD8ywmVDJLsf2fB09
 7Jsi37+B3uPoA==
Received: by keithp.com (Postfix, from userid 1000)
 id 9CC4115821C4; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 4/8] semihosting: Support SYS_HEAPINFO when env->boot_info is
 not set
Date: Wed, 25 Nov 2020 13:36:13 -0800
Message-Id: <20201125213617.2496935-5-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
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
X-List-Received-Date: Wed, 25 Nov 2020 21:36:45 -0000

env->boot_info is only set in some ARM startup paths, so we cannot
rely on it to support the SYS_HEAPINFO semihosting function. When not
available, fallback to finding a RAM memory region containing the
current stack and use the base of that.

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 42 +++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 27bdfd0e83..ddfa448cc2 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -133,6 +133,35 @@ typedef struct GuestFD {
 
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
+            if (subregion->addr <= addr && int128_lt(addr, top128)) {
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
@@ -171,7 +200,18 @@ common_semi_rambase(CPUState *cs)
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


