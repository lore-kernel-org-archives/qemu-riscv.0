Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oUvKV-0003s5-ST
	for mharc-qemu-riscv@gnu.org; Sun, 04 Sep 2022 15:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1oUvKR-0003rn-LV
 for qemu-riscv@nongnu.org; Sun, 04 Sep 2022 15:30:49 -0400
Received: from netc0.host.rs.currently.online ([202.61.195.116]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1oUvKO-0004H6-3k
 for qemu-riscv@nongnu.org; Sun, 04 Sep 2022 15:30:46 -0400
Received: from carbon.srv.schuermann.io (unknown [IPv6:fdcb:20e8:f36d:3::1])
 by netc0.host.rs.currently.online (Postfix) with ESMTPS id 30F0DB6A9;
 Sun,  4 Sep 2022 19:30:39 +0000 (UTC)
From: leon@is.currently.online
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=is.currently.online;
 s=carbon; t=1662319838;
 bh=cxWYG2lNRRVBSXJupiaZYqHrZD7kxkoRXfwtn/adVTw=;
 h=From:To:Cc:Subject:Date;
 b=e/7Upf5zveTeXBAmGCYfd5U0HPnAgnKmkZycA3RSTDGEBuwC/LuPXnGjBJ9KtzG5c
 BYYarSjcMUiz8kgY2HDZECFuW5eVKS9jnhWpVy6FAnnZCYahUhxXKeowtprnHAsyH9
 WGKTho7Ah0qa9gye0spv227RGShrQNL7gj52MSik=
To: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: Leon Schuermann <leon@is.currently.online>
Subject: [PATCH] target/riscv/pmp: fix non-translated page size address checks
 w/ MPU
Date: Sun,  4 Sep 2022 15:29:08 -0400
Message-Id: <20220904192907.1056740-1-leon@is.currently.online>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.61.195.116;
 envelope-from=leon@is.currently.online; helo=netc0.host.rs.currently.online
X-Spam_score_int: 25
X-Spam_score: 2.5
X-Spam_bar: ++
X-Spam_report: (2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FROM_SUSPICIOUS_NTLD=0.499, FROM_SUSPICIOUS_NTLD_FP=2,
 PDS_OTHER_BAD_TLD=1.999, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 04 Sep 2022 19:30:49 -0000

From: Leon Schuermann <leon@is.currently.online>

This commit fixes PMP address access checks with non page-aligned PMP
regions on harts with MPU enabled. Without this change, the presence
of an MPU in the virtual CPU model would influence the PMP address
check behavior when an access size was unknown (`size == 0`),
regardless of whether virtual memory has actually been enabled by the
guest.

The RISC-V Privileged Spec Version 20211203[1] states in 4.3.1
Addressing and Memory Protection that "[...]  [w]hen Sv32 virtual
memory mode is selected in the MODE field of the satp register,
supervisor virtual addresses are translated into supervisor physical
addresses via a two-level page table. The 20-bit VPN is translated
into a 22-bit physical page number (PPN), while the 12-bit page offset
is untranslated. The resulting supervisor-level physical addresses are
then checked using any physical memory protection structures (Sections
3.7), before being directly converted to machine-level physical
addresses. [...]" and "[...] [w]hen the value of satp.MODE is Bare,
the 32-bit virtual address is translated (unmodified) into a 32-bit
physical address [...]". Other modes such as Sv39, Sv48 and Sv57 are
said to behave similar in this regard.

From this specification it can be inferred that any access made when
virtual memory is disabled, which is the case when satp.MODE is set to
"Bare" (0), should behave identically with respect to PMP checks as if
no MPU were present in the system at all. The current implementation,
however, degrades any PMP address checks of unknown access size (which
seems to be the case for instruction fetches at least) to be of
page-granularity, just based on the fact that the hart has MPU support
enabled. This causes systems that rely on 4-byte aligned PMP regions
to incur access faults, which are not occurring with the MPU disabled,
independent of any runtime guest configuration.

While there possibly are other unhandled edge cases in which
page-granularity access checks might not be appropriate, this commit
appears to be a strict improvement over the current implementation's
behavior. It has been tested using Tock OS, but not with other
systems (e.g., Linux) yet.

[1]: https://github.com/riscv/riscv-isa-manual/releases/download/Priv-v1.12/riscv-privileged-20211203.pdf

Signed-off-by: Leon Schuermann <leon@is.currently.online>
---
 target/riscv/pmp.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ea2b67d947..48f64a4aef 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -300,6 +300,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     int i = 0;
     int ret = -1;
     int pmp_size = 0;
+    uint64_t satp_mode;
     target_ulong s = 0;
     target_ulong e = 0;
 
@@ -310,10 +311,17 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     }
 
     if (size == 0) {
-        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
+            satp_mode = SATP32_MODE;
+        } else {
+            satp_mode = SATP64_MODE;
+        }
+
+        if (riscv_feature(env, RISCV_FEATURE_MMU)
+            && get_field(env->satp, satp_mode)) {
             /*
-             * If size is unknown (0), assume that all bytes
-             * from addr to the end of the page will be accessed.
+             * If size is unknown (0) and virtual memory is enabled, assume that
+             * all bytes from addr to the end of the page will be accessed.
              */
             pmp_size = -(addr | TARGET_PAGE_MASK);
         } else {

base-commit: 61fd710b8da8aedcea9b4f197283dc38638e4b60
-- 
2.36.0


