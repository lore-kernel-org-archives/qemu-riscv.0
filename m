Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pko5I-0007ZA-Qw
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 11:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1pko5H-0007Yu-6o; Fri, 07 Apr 2023 11:33:03 -0400
Received: from forward101b.mail.yandex.net ([178.154.239.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1pko5F-00038w-Eu; Fri, 07 Apr 2023 11:33:02 -0400
Received: from mail-nwsmtp-smtp-production-main-10.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-10.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:2481:0:640:e0:0])
 by forward101b.mail.yandex.net (Yandex) with ESMTP id 0051A600C1;
 Fri,  7 Apr 2023 18:32:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-10.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id qWTExFWWv8c0-TQlMbU41; 
 Fri, 07 Apr 2023 18:32:54 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1680881574; bh=qHvpvSfgkj9tu+hRk0yn7GWcOobm4PCzYSJvGPlX4lw=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=vKo6e/Wu7l9M59JwYdwi7wXKSqSDOWFH+oEYVhYJCq4Q/v/L5v2c28AquvHwv34T+
 YFmBLBpPGzsxEOyZhskobUI4nxTUYvmzx7h96DCRnu8/ICirDWVerSx3lTyyF4muYs
 XOJiQbEvmPmu8c33HnSAuKmu/HiDgRiW1yFFcCTo=
Authentication-Results: mail-nwsmtp-smtp-production-main-10.sas.yp-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Irina Ryapolova <irina.ryapolova@syntacore.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org,
 Irina Ryapolova <irina.ryapolova@syntacore.com>
Subject: [PATCH v2] target/riscv: Fix Guest Physical Address Translation
Date: Fri,  7 Apr 2023 18:32:25 +0300
Message-Id: <20230407153225.156395-1-irina.ryapolova@syntacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.148;
 envelope-from=irina.ryapolova@syntacore.com; helo=forward101b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 07 Apr 2023 15:33:03 -0000

Before changing the flow check for sv39/48/57.

According to specification (for Supervisor mode):
Sv39 implementations support a 39-bit virtual address space, divided into 4 KiB pages.
Instruction fetch addresses and load and store effective addresses, which are 64 bits,
must have bits 63–39 all equal to bit 38, or else a page-fault exception will occur.
Likewise for Sv48 and Sv57.

So the high bits are equal to bit 38 for sv39.

According to specification (for Hypervisor mode):
For Sv39x4, address bits of the guest physical address 63:41 must all be zeros, or else a
guest-page-fault exception occurs.

Likewise for Sv48x4 and Sv57x4.
For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fault exception occurs.
For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fault exception occurs.

For example we are trying to access address 0xffff_ffff_ff01_0000 with only G-translation enabled.
So expected behavior is to generate exception. But qemu doesn't generate such exception.

For the old check, we get
va_bits == 41, mask == (1 << 24) - 1, masked_msbs == (0xffff_ffff_ff01_0000 >> 40) & mask == mask.
Accordingly, the condition masked_msbs != 0 && masked_msbs != mask is not fulfilled
and the check passes.

Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
---
Changes for v2:
  -Add more detailed commit message
---
 target/riscv/cpu_helper.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..27289f2305 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -863,17 +863,24 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     CPUState *cs = env_cpu(env);
     int va_bits = PGSHIFT + levels * ptidxbits + widened;
-    target_ulong mask, masked_msbs;
 
-    if (TARGET_LONG_BITS > (va_bits - 1)) {
-        mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
-    } else {
-        mask = 0;
-    }
-    masked_msbs = (addr >> (va_bits - 1)) & mask;
+    if (first_stage == true) {
+        target_ulong mask, masked_msbs;
+
+        if (TARGET_LONG_BITS > (va_bits - 1)) {
+            mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
+        } else {
+            mask = 0;
+        }
+        masked_msbs = (addr >> (va_bits - 1)) & mask;
 
-    if (masked_msbs != 0 && masked_msbs != mask) {
-        return TRANSLATE_FAIL;
+        if (masked_msbs != 0 && masked_msbs != mask) {
+            return TRANSLATE_FAIL;
+        }
+    } else {
+        if (vm != VM_1_10_SV32 && addr >> va_bits != 0) {
+            return TRANSLATE_FAIL;
+        }
     }
 
     int ptshift = (levels - 1) * ptidxbits;
-- 
2.25.1


