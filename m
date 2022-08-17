Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOKyx-0007Wy-8w
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 11:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyang22@iscas.ac.cn>)
 id 1oODn0-0000xo-R5; Wed, 17 Aug 2022 03:48:35 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:44434 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuyang22@iscas.ac.cn>)
 id 1oODmx-0006D4-8U; Wed, 17 Aug 2022 03:48:34 -0400
Received: from localhost.localdomain (unknown [182.37.30.21])
 by APP-01 (Coremail) with SMTP id qwCowACHaVpBnfxix+3RCQ--.34174S3;
 Wed, 17 Aug 2022 15:48:24 +0800 (CST)
From: Yang Liu <liuyang22@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, liweiwei@iscas.ac.cn,
 Yang Liu <liuyang22@iscas.ac.cn>
Subject: [PATCH 2/2] target/riscv: rvv-1.0: vf[w]redsum distinguish between
 ordered/unordered
Date: Wed, 17 Aug 2022 15:48:02 +0800
Message-Id: <20220817074802.20765-2-liuyang22@iscas.ac.cn>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
References: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHaVpBnfxix+3RCQ--.34174S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1UWFy5XF1kGF43Wr1Utrb_yoWxCr4xpF
 4Utr17Zr47CrW7Xa4rtrs8ArWUWr4vgw45CFZIqFnxWay7JFZ5CasF9r47tFWDJFZ7A34U
 W3WkAr9xA3s3Wa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWUJVWUGwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
 z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
 JwCI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbo7K3UUUUU==
X-Originating-IP: [182.37.30.21]
X-CM-SenderInfo: 5olx5tdqjsjq5lvft2wodfhubq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=liuyang22@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Aug 2022 11:29:19 -0400
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
X-List-Received-Date: Wed, 17 Aug 2022 07:48:35 -0000

Starting with RVV1.0, the original vf[w]redsum_vs instruction was renamed
to vf[w]redusum_vs. The distinction between ordered and unordered is also
more consistent with other instructions, although there is no difference
in implementation between the two for QEMU.

Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
---
 target/riscv/helper.h                   | 15 ++++++++++-----
 target/riscv/insn32.decode              |  6 ++++--
 target/riscv/insn_trans/trans_rvv.c.inc |  6 ++++--
 target/riscv/vector_helper.c            | 19 +++++++++++++------
 4 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4ef3b2251d..a03014fe67 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1009,9 +1009,12 @@ DEF_HELPER_6(vwredsum_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_6(vfredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vfredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vfredsum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredusum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfredosum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmax_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmax_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmax_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
@@ -1019,8 +1022,10 @@ DEF_HELPER_6(vfredmin_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmin_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_6(vfwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4033565393..2873a7ae04 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -659,11 +659,13 @@ vredmax_vs      000111 . ..... ..... 010 ..... 1010111 @r_vm
 vwredsumu_vs    110000 . ..... ..... 000 ..... 1010111 @r_vm
 vwredsum_vs     110001 . ..... ..... 000 ..... 1010111 @r_vm
 # Vector ordered and unordered reduction sum
-vfredsum_vs     0000-1 . ..... ..... 001 ..... 1010111 @r_vm
+vfredusum_vs    000001 . ..... ..... 001 ..... 1010111 @r_vm
+vfredosum_vs    000011 . ..... ..... 001 ..... 1010111 @r_vm
 vfredmin_vs     000101 . ..... ..... 001 ..... 1010111 @r_vm
 vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 # Vector widening ordered and unordered float reduction sum
-vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
+vfwredusum_vs   110001 . ..... ..... 001 ..... 1010111 @r_vm
+vfwredosum_vs   110011 . ..... ..... 001 ..... 1010111 @r_vm
 vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
 vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
 vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6c091824b6..9c9de17f8a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3112,7 +3112,8 @@ static bool freduction_check(DisasContext *s, arg_rmrr *a)
            require_zve64f(s);
 }
 
-GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredusum_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredosum_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
@@ -3124,7 +3125,8 @@ static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
            (s->sew != MO_8);
 }
 
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwredusum_vs, freduction_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwredosum_vs, freduction_widen_check)
 
 /*
  *** Vector Mask Operations
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fd83c0b20b..d87f79ad82 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4641,9 +4641,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
 }
 
 /* Unordered sum */
-GEN_VEXT_FRED(vfredsum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
-GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
-GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
+GEN_VEXT_FRED(vfredusum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
+GEN_VEXT_FRED(vfredusum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
+GEN_VEXT_FRED(vfredusum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
+
+/* Ordered sum */
+GEN_VEXT_FRED(vfredosum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
+GEN_VEXT_FRED(vfredosum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
+GEN_VEXT_FRED(vfredosum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
 GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum_number)
@@ -4667,9 +4672,11 @@ static uint64_t fwadd32(uint64_t a, uint32_t b, float_status *s)
 }
 
 /* Vector Widening Floating-Point Reduction Instructions */
-/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
-GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
-GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
+/* Ordered/unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
+GEN_VEXT_FRED(vfwredusum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
+GEN_VEXT_FRED(vfwredusum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
+GEN_VEXT_FRED(vfwredosum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
+GEN_VEXT_FRED(vfwredosum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
 
 /*
  *** Vector Mask Operations
-- 
2.30.1 (Apple Git-130)


