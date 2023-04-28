Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psPOb-0006AM-MF
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 10:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1psPOV-00062E-Tl; Fri, 28 Apr 2023 10:48:20 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1psPOR-0002C5-Va; Fri, 28 Apr 2023 10:48:19 -0400
Received: from [167.98.27.226] (helo=lawrence-thinkpad.guest.codethink.co.uk)
 by imap4.hz.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1psPON-005zz5-7h; Fri, 28 Apr 2023 15:48:11 +0100
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org
Subject: [PATCH v3 09/19] tcg: Add andcs and rotrs tcg gvec ops
Date: Fri, 28 Apr 2023 15:47:47 +0100
Message-Id: <20230428144757.57530-10-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 14:48:22 -0000

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

This commit adds helper functions and tcg operation definitions for the andcs and rotrs instructions

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
---
 accel/tcg/tcg-runtime-gvec.c | 11 +++++++++++
 accel/tcg/tcg-runtime.h      |  1 +
 include/tcg/tcg-op-gvec.h    |  4 ++++
 tcg/tcg-op-gvec.c            | 23 +++++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index ac7d28c251e..97399493d54 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -550,6 +550,17 @@ void HELPER(gvec_ands)(void *d, void *a, uint64_t b, uint32_t desc)
     clear_high(d, oprsz, desc);
 }
 
+void HELPER(gvec_andcs)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
+        *(uint64_t *)(d + i) = *(uint64_t *)(a + i) & ~b;
+    }
+    clear_high(d, oprsz, desc);
+}
+
 void HELPER(gvec_xors)(void *d, void *a, uint64_t b, uint32_t desc)
 {
     intptr_t oprsz = simd_oprsz(desc);
diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index e141a6ab242..b8e6421c8ac 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -217,6 +217,7 @@ DEF_HELPER_FLAGS_4(gvec_nor, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_eqv, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_ands, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_andcs, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_xors, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_ors, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 
diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 28cafbcc5ce..a8183bfeabe 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -330,6 +330,8 @@ void tcg_gen_gvec_ori(unsigned vece, uint32_t dofs, uint32_t aofs,
 
 void tcg_gen_gvec_ands(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_xors(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_ors(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -369,6 +371,8 @@ void tcg_gen_gvec_sars(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_rotls(unsigned vece, uint32_t dofs, uint32_t aofs,
                         TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
 
 /*
  * Perform vector shift by vector element, modulo the element size.
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 047a832f44a..3bbc9573e0b 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2761,6 +2761,21 @@ void tcg_gen_gvec_andi(unsigned vece, uint32_t dofs, uint32_t aofs,
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ands);
 }
 
+void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
+{
+    static GVecGen2s g = {
+        .fni8 = tcg_gen_andc_i64,
+        .fniv = tcg_gen_andc_vec,
+        .fno = gen_helper_gvec_andcs,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+        .vece = MO_64
+    };
+
+    tcg_gen_dup_i64(vece, c, c);
+    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
+}
+
 static const GVecGen2s gop_xors = {
     .fni8 = tcg_gen_xor_i64,
     .fniv = tcg_gen_xor_vec,
@@ -3336,6 +3351,14 @@ void tcg_gen_gvec_rotls(unsigned vece, uint32_t dofs, uint32_t aofs,
     do_gvec_shifts(vece, dofs, aofs, shift, oprsz, maxsz, &g);
 }
 
+void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    tcg_gen_sub_i32(tmp, tcg_constant_i32(1 << (vece + 3)), shift);
+    tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);
+}
+
 /*
  * Expand D = A << (B % element bits)
  *
-- 
2.40.1


