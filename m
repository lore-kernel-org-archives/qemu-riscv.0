Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXfnr-0000UA-97
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 05:00:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXfnn-0000TT-FK; Fri, 25 Mar 2022 05:00:11 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:52434 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXfnk-0000Aj-Gq; Fri, 25 Mar 2022 05:00:11 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACHj_uLhD1ih4xtBQ--.17995S2;
 Fri, 25 Mar 2022 16:59:57 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 1/2] target/riscv: optimize condition assign for scale < 0
Date: Fri, 25 Mar 2022 16:59:01 +0800
Message-Id: <20220325085902.29500-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowACHj_uLhD1ih4xtBQ--.17995S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF4xKF1xKrWrtw4UCFg_yoW8Wry7pa
 1rKrW7CFsYyFWrCay29F4Utr1akFW0k34Ykwn0ywn5X398Gr42vF4kt39F9F1jq34kuF40
 kF1UAF13ZrWjywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 25 Mar 2022 09:00:11 -0000

for some cases, scale is always equal or less than 0, since lmul is not larger than 3

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4ea7e41e1a..2878ca3132 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1198,7 +1198,7 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
 static inline uint32_t MAXSZ(DisasContext *s)
 {
     int scale = s->lmul - 3;
-    return scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
+    return s->cfg_ptr->vlen >> -scale;
 }
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
@@ -3597,8 +3597,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
 
     if (a->vm && s->vl_eq_vlmax) {
         int scale = s->lmul - (s->sew + 3);
-        int vlmax = scale < 0 ?
-                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
+        int vlmax = s->cfg_ptr->vlen >> -scale;
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
@@ -3630,8 +3629,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
 
     if (a->vm && s->vl_eq_vlmax) {
         int scale = s->lmul - (s->sew + 3);
-        int vlmax = scale < 0 ?
-                       s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
+        int vlmax = s->cfg_ptr->vlen >> -scale;
         if (a->rs1 >= vlmax) {
             tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
-- 
2.17.1


