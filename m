Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phDVN-0001Mt-LC
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 13:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1phCgN-0008I0-U1; Tue, 28 Mar 2023 13:00:38 -0400
Received: from forward101a.mail.yandex.net ([178.154.239.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irina.ryapolova@syntacore.com>)
 id 1phCgL-0005ai-Be; Tue, 28 Mar 2023 13:00:27 -0400
Received: from mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c1d:63cd:0:640:4ab5:0])
 by forward101a.mail.yandex.net (Yandex) with ESMTP id 50FA346CF5;
 Tue, 28 Mar 2023 20:00:18 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id E0LU4L3PduQ0-8v8Zid0l; 
 Tue, 28 Mar 2023 20:00:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1680022817; bh=B5mh8eRonp6eLYRY8fNk1uwsaaBLHXRgLnj7sCGlLAY=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=n/V6VS/xBzE2ALwGzWVNVGX5uIVrziOctLSwfqv0QejEBKoa6Ndx9W2jiX48NJ/nh
 RHE5zcYOhM+21/XC6ehS5bFPLVMudApbE9l5hEeCkGpZqAii03YfiT11QhVMBjNWnE
 7/7TRBRsJulP0qXsdBss8MAjTWagUEc9H8RZFFpc=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Irina Ryapolova <irina.ryapolova@syntacore.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org,
 Irina Ryapolova <irina.ryapolova@syntacore.com>
Subject: [PATCH] target/riscv: Fix Guest Physical Address Translation
Date: Tue, 28 Mar 2023 19:54:06 +0300
Message-Id: <20230328165406.271528-1-irina.ryapolova@syntacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0>
References: <0>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.84;
 envelope-from=irina.ryapolova@syntacore.com; helo=forward101a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Mar 2023 13:53:07 -0400
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
X-List-Received-Date: Tue, 28 Mar 2023 17:00:39 -0000

According to specification:
For Sv39x4, address bits of the guest physical address 63:41 must all be zeros, or else a
guest-page-fault exception occurs.

Likewise for Sv48x4 and Sv57x4.
For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fault exception occurs.
For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fault exception occurs.

Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
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


