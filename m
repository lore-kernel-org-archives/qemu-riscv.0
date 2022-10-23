Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omaIn-0001Sd-Nq
	for mharc-qemu-riscv@gnu.org; Sun, 23 Oct 2022 08:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1omaIm-0001SL-0G; Sun, 23 Oct 2022 08:42:04 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1omaIj-00006g-5Z; Sun, 23 Oct 2022 08:42:03 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R991e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VSpdU1e_1666528911; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSpdU1e_1666528911) by smtp.aliyun-inc.com;
 Sun, 23 Oct 2022 20:41:52 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, lzw194868@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 1/1] tcg/riscv: Fix base regsiter for qemu_ld/st
Date: Sun, 23 Oct 2022 20:41:48 +0800
Message-Id: <20221023124148.6283-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 23 Oct 2022 12:42:04 -0000

When guest base is zero, we should use addr_regl as base regiser instead of
the initial register TCG_REG_TMP0. Besides, we can remove the
unnecessary use of base register.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 tcg/riscv/tcg-target.c.inc | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..946da1bb72 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1158,7 +1158,6 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #else
     unsigned a_bits;
 #endif
-    TCGReg base = TCG_REG_TMP0;
 
     data_regl = *args++;
     data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
@@ -1169,24 +1168,23 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+    tcg_out_qemu_ld_direct(s, data_regl, data_regh, TCG_REG_TMP0, opc, is_64);
     add_qemu_ldst_label(s, 1, oi,
                         (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, addr_regl, addr_regl);
     }
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_regl, a_bits);
     }
     if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
+        tcg_out_opc_reg(s, OPC_ADD, addr_regl, TCG_GUEST_BASE_REG, addr_regl);
     }
-    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+    tcg_out_qemu_ld_direct(s, data_regl, data_regh, addr_regl, opc, is_64);
 #endif
 }
 
@@ -1230,7 +1228,6 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #else
     unsigned a_bits;
 #endif
-    TCGReg base = TCG_REG_TMP0;
 
     data_regl = *args++;
     data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
@@ -1241,24 +1238,23 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
-    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+    tcg_out_qemu_st_direct(s, data_regl, data_regh, TCG_REG_TMP0, opc);
     add_qemu_ldst_label(s, 0, oi,
                         (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, addr_regl, addr_regl);
     }
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_regl, a_bits);
     }
     if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
+        tcg_out_opc_reg(s, OPC_ADD, addr_regl, TCG_GUEST_BASE_REG, addr_regl);
     }
-    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+    tcg_out_qemu_st_direct(s, data_regl, data_regh, addr_regl, opc);
 #endif
 }
 
-- 
2.25.1


