Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5Zta-0002m8-6m
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:02:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtS-0002WK-Ud; Thu, 06 Jan 2022 16:01:55 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtQ-0002jw-0k; Thu, 06 Jan 2022 16:01:54 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D440140439;
 Thu,  6 Jan 2022 22:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502884;
 bh=LAfozVcya6aQJAIvYGPQ+5A8AMtRbUaBcs6EqKlZ/4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cZ6/aon31todVrgRlmVNIsZRijM/ZnXWNcIKEqwzWJdEOtt5y7ol9446PeAJEf0cu
 39TDAKCtbvPcIsfRV5ikRZXoNlQFvDzqWZ73r17Nn0vjRgGobiZ04crmjJz0njRdSp
 l1AI0oBQ9OISM1KAbdEW4e5uG5mm+8d9fZGL9F3TAppHf7WyRYGJJlhjJporp/fIo3
 ZDTRkL1/ZE/oOJI6CVayBk0LAq8PIBBullzZOTVhb7x2cQI/NCkVNChPIYc2JqHq/W
 4a7s1e9d5wfBzoIIR7pt6MF/dLRMgq0vxadMZ+OELgYCdRbuYIL26geAqowDWfZrK4
 DjwK5vtolnjoQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id B8A906005B;
 Thu,  6 Jan 2022 22:01:24 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 870CD14007F;
 Thu,  6 Jan 2022 22:01:24 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, f4bug@amsat.org, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v8 16/18] target/riscv: helper functions to wrap calls to
 128-bit csr insns
Date: Thu,  6 Jan 2022 22:01:06 +0100
Message-Id: <20220106210108.138226-17-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 06 Jan 2022 21:01:57 -0000

Given the side effects they have, the csr instructions are realized as
helpers. We extend this existing infrastructure for 128-bit sized csr.
We return 128-bit values using the same approach as for div/rem.
Theses helpers all call a unique function that is currently a fallback
on the 64-bit version.
The trans_csrxx functions supporting 128-bit are yet to be implemented.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |  5 +++++
 target/riscv/helper.h    |  3 +++
 target/riscv/csr.c       | 17 ++++++++++++++++
 target/riscv/op_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f3a52fef32..edc7de7b17 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -25,6 +25,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "qom/object.h"
+#include "qemu/int128.h"
 #include "cpu_bits.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
@@ -500,6 +501,10 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
                                           target_ulong new_value,
                                           target_ulong write_mask);
 
+RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
+                                Int128 *ret_value,
+                                Int128 new_value, Int128 write_mask);
+
 typedef struct {
     const char *name;
     riscv_csr_predicate_fn predicate;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a8ee8a362a..6cf6d6ce98 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -96,6 +96,9 @@ DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
 DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
+DEF_HELPER_2(csrr_i128, tl, env, int)
+DEF_HELPER_4(csrw_i128, void, env, int, tl, tl)
+DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5..4c6a44c0b8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1817,6 +1817,23 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
+                               Int128 *ret_value,
+                               Int128 new_value, Int128 write_mask)
+{
+    /* fall back to 64-bit version for now */
+    target_ulong ret_64;
+    RISCVException ret = riscv_csrrw(env, csrno, &ret_64,
+                                     int128_getlo(new_value),
+                                     int128_getlo(write_mask));
+
+    if (ret_value) {
+        *ret_value = int128_make64(ret_64);
+    }
+
+    return ret;
+}
+
 /*
  * Debugger support.  If not in user mode, set env->debugger before the
  * riscv_csrrw call and clear it after the call.
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 58d992e98a..6f040f2fb9 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -69,6 +69,50 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
     return val;
 }
 
+target_ulong helper_csrr_i128(CPURISCVState *env, int csr)
+{
+    Int128 rv = int128_zero();
+    RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
+                                          int128_zero(),
+                                          int128_zero());
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    env->retxh = int128_gethi(rv);
+    return int128_getlo(rv);
+}
+
+void helper_csrw_i128(CPURISCVState *env, int csr,
+                      target_ulong srcl, target_ulong srch)
+{
+    RISCVException ret = riscv_csrrw_i128(env, csr, NULL,
+                                          int128_make128(srcl, srch),
+                                          UINT128_MAX);
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+}
+
+target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
+                       target_ulong srcl, target_ulong srch,
+                       target_ulong maskl, target_ulong maskh)
+{
+    Int128 rv = int128_zero();
+    RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
+                                          int128_make128(srcl, srch),
+                                          int128_make128(maskl, maskh));
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    env->retxh = int128_gethi(rv);
+    return int128_getlo(rv);
+}
+
 #ifndef CONFIG_USER_ONLY
 
 target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
-- 
2.34.1


