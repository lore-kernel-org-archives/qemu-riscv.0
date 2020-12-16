Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpWiu-0004xb-CQ
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 08:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzihao@ict.ac.cn>)
 id 1kpRvh-00088P-UE; Wed, 16 Dec 2020 03:13:03 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:33860 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuzihao@ict.ac.cn>)
 id 1kpRvV-0004xZ-83; Wed, 16 Dec 2020 03:12:58 -0500
Received: from localhost.localdomain (unknown [116.6.100.50])
 by APP-05 (Coremail) with SMTP id zQCowADnyClqwdlfYnGJAA--.3696S4;
 Wed, 16 Dec 2020 16:12:33 +0800 (CST)
From: Zihao Yu <yuzihao@ict.ac.cn>
To: qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] tcg,riscv: Fix illegal shift instructions
Date: Wed, 16 Dec 2020 16:12:06 +0800
Message-Id: <20201216081206.9628-1-yuzihao@ict.ac.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADnyClqwdlfYnGJAA--.3696S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4DGFyftr4xtr1kZF1DZFb_yoW5XryDpr
 4agw4aywn8t39xKFZFkF15ua4jgF4FyrWvvFsIv34fZF4Dtr1DCrsYyr4akrW5JF93Xrnx
 ZF90qF17uF1kAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0264kExVAvwVAq07x2
 0xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0n0ePUUUU
 U==
X-Originating-IP: [116.6.100.50]
X-CM-SenderInfo: p1x2xx1dr6xunwoduhdfq/
Received-SPF: none client-ip=159.226.251.25; envelope-from=yuzihao@ict.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:20:06 -0500
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
X-List-Received-Date: Wed, 16 Dec 2020 08:13:03 -0000

* This bug can be reproduced by running the following guest instructions
  on a RISC-V host.

  (1) xor %ecx,%ecx
  (2) sar %cl,%eax
  (3) cmovne %edi,%eax

  After optimization, the tcg instructions of (2) are

  movi_i32 tmp3,$0xffffffffffffffff  pref=all
  sar_i32 tmp3,eax,tmp3              dead: 2  pref=all
  mov_i32 cc_dst,eax                 sync: 0  dead: 1 pref=0xffc0300
  mov_i32 cc_src,tmp3                sync: 0  dead: 0 1  pref=all
  movi_i32 cc_op,$0x31               sync: 0  dead: 0  pref=all

  And the target assembly instructions of (2) are

  0x200808d618:  fffa5b9b          illegal
  0x200808d61c:  03442423          sw              s4,40(s0)
  0x200808d620:  03742623          sw              s7,44(s0)
  0x200808d624:  03100b93          addi            s7,zero,49
  0x200808d628:  03742a23          sw              s7,52(s0)

* Note that the `illegal` target instruction above should be
  `sraiw s7,s4,0x1f` (41fa5b9b). The bug exists because the `imm` of the
  shift instruction is too large, and therefore the `funct7` field is
  overwritten. To fix this issue, `imm` should be masked for shift
  instructions.

Signed-off-by: Zihao Yu <yuzihao@ict.ac.cn>
---
 tcg/riscv/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d536f3ccc1..4089e29cd9 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1462,14 +1462,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_shl_i32:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SLLIW, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SLLIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SLLW, a0, a1, a2);
         }
         break;
     case INDEX_op_shl_i64:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SLLI, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SLLI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SLL, a0, a1, a2);
         }
@@ -1477,14 +1477,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_shr_i32:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SRLIW, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SRLIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SRLW, a0, a1, a2);
         }
         break;
     case INDEX_op_shr_i64:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SRLI, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SRLI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SRL, a0, a1, a2);
         }
@@ -1492,14 +1492,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_sar_i32:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SRAIW, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SRAIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SRAW, a0, a1, a2);
         }
         break;
     case INDEX_op_sar_i64:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SRAI, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SRAI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SRA, a0, a1, a2);
         }
-- 
2.20.1


