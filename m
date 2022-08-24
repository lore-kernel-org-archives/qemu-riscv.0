Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQsKF-0000Im-Tl
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 11:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oQq8A-0008LZ-Hp; Wed, 24 Aug 2022 09:09:14 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:34512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oQq84-0006gJ-LD; Wed, 24 Aug 2022 09:09:11 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VN7XDfZ_1661346228; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VN7XDfZ_1661346228) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 21:03:49 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 3/4] disas/riscv: Add used_opcode_data field
Date: Wed, 24 Aug 2022 21:03:30 +0800
Message-Id: <20220824130331.21315-4-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
References: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Aug 2022 11:29:42 -0400
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
X-List-Received-Date: Wed, 24 Aug 2022 13:09:15 -0000

Add used_opcode_data field in rv_decode. After this patch, we will
not use opcode_data directly.

This will give the custom opcode data a choice to be selected in
the future.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 disas/riscv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 5c36ae08dc..aaf85b2aba 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -601,6 +601,7 @@ typedef struct {
     uint8_t   rl;
     uint8_t   bs;
     uint8_t   rnum;
+    const rv_opcode_data *used_opcode_data;
 } rv_decode;
 
 /* register names */
@@ -2532,7 +2533,7 @@ static uint32_t operand_rnum(rv_inst inst)
 static void decode_inst_operands(rv_decode *dec)
 {
     rv_inst inst = dec->inst;
-    dec->codec = opcode_data[dec->op].codec;
+    dec->codec = dec->used_opcode_data[dec->op].codec;
     switch (dec->codec) {
     case rv_codec_none:
         dec->rd = dec->rs1 = dec->rs2 = rv_ireg_zero;
@@ -2959,6 +2960,7 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
 {
     char tmp[64];
     const char *fmt;
+    const rv_opcode_data *opcode_data = dec->used_opcode_data;
 
     fmt = opcode_data[dec->op].format;
     while (*fmt) {
@@ -3111,6 +3113,7 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
 
 static void decode_inst_lift_pseudo(rv_decode *dec)
 {
+    const rv_opcode_data *opcode_data = dec->used_opcode_data;
     const rv_comp_data *comp_data = opcode_data[dec->op].pseudo;
     if (!comp_data) {
         return;
@@ -3129,6 +3132,7 @@ static void decode_inst_lift_pseudo(rv_decode *dec)
 
 static void decode_inst_decompress_rv32(rv_decode *dec)
 {
+    const rv_opcode_data *opcode_data = dec->used_opcode_data;
     int decomp_op = opcode_data[dec->op].decomp_rv32;
     if (decomp_op != rv_op_illegal) {
         if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
@@ -3143,6 +3147,7 @@ static void decode_inst_decompress_rv32(rv_decode *dec)
 
 static void decode_inst_decompress_rv64(rv_decode *dec)
 {
+    const rv_opcode_data *opcode_data = dec->used_opcode_data;
     int decomp_op = opcode_data[dec->op].decomp_rv64;
     if (decomp_op != rv_op_illegal) {
         if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
@@ -3157,6 +3162,7 @@ static void decode_inst_decompress_rv64(rv_decode *dec)
 
 static void decode_inst_decompress_rv128(rv_decode *dec)
 {
+    const rv_opcode_data *opcode_data = dec->used_opcode_data;
     int decomp_op = opcode_data[dec->op].decomp_rv128;
     if (decomp_op != rv_op_illegal) {
         if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
@@ -3192,6 +3198,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
     rv_decode dec = { 0 };
     dec.pc = pc;
     dec.inst = inst;
+    dec.used_opcode_data = opcode_data;
     decode_inst_opcode(&dec, isa);
     decode_inst_operands(&dec);
     decode_inst_decompress(&dec, isa);
-- 
2.25.1


