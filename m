Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E269EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 07:18:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGDpQ-0002Ir-TU; Mon, 03 Jul 2023 03:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qGDpF-0002H0-3J; Mon, 03 Jul 2023 03:18:22 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qGDp9-0001ss-CN; Mon, 03 Jul 2023 03:18:20 -0400
Received: from localhost.localdomain (unknown [114.95.176.74])
 by APP-01 (Coremail) with SMTP id qwCowABnbgopdqJk8XXZBw--.46071S3;
 Mon, 03 Jul 2023 15:18:03 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 1/1] target/riscv: Add disas support for BF16 extensions
Date: Mon,  3 Jul 2023 15:17:59 +0800
Message-Id: <20230703071759.86775-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230703071759.86775-1-liweiwei@iscas.ac.cn>
References: <20230703071759.86775-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABnbgopdqJk8XXZBw--.46071S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuF47Zw1fWw4DJw4kXF48Xrb_yoW7JFW7pr
 y5Z3y3KrZIkF1xJa1fZF4UAF95try8Jr48Za4Sv3y3X3srWFy5Cr45X343AFy8WFW0yr4x
 Wa1Sg3yYqF1xAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
 kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
 CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoXUUUU
 U
X-Originating-IP: [114.95.176.74]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 disas/riscv.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/disas/riscv.c b/disas/riscv.c
index 94e568a7e9..9f0195be30 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -819,6 +819,16 @@ typedef enum {
     rv_op_cm_jalt = 788,
     rv_op_czero_eqz = 789,
     rv_op_czero_nez = 790,
+    rv_op_fcvt_bf16_s = 791,
+    rv_op_fcvt_s_bf16 = 792,
+    rv_op_vfncvtbf16_f_f_w = 793,
+    rv_op_vfwcvtbf16_f_f_v = 794,
+    rv_op_vfwmaccbf16_vv = 795,
+    rv_op_vfwmaccbf16_vf = 796,
+    rv_op_flh = 797,
+    rv_op_fsh = 798,
+    rv_op_fmv_h_x = 799,
+    rv_op_fmv_x_h = 800,
 } rv_op;
 
 /* register names */
@@ -1905,6 +1915,16 @@ const rv_opcode_data rvi_opcode_data[] = {
     { "cm.jalt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
     { "czero.eqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "czero.nez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "fcvt.bf16.s", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "fcvt.s.bf16", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
+    { "vfncvtbf16.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vfwcvtbf16.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vfwmaccbf16.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
+    { "vfwmaccbf16.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
+    { "flh", rv_codec_i, rv_fmt_frd_offset_rs1, NULL, 0, 0, 0 },
+    { "fsh", rv_codec_s, rv_fmt_frs2_offset_rs1, NULL, 0, 0, 0 },
+    { "fmv.h.x", rv_codec_r, rv_fmt_frd_rs1, NULL, 0, 0, 0 },
+    { "fmv.x.h", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -2380,6 +2400,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 3: op = rv_op_vloxei8_v; break;
                 }
                 break;
+            case 1: op = rv_op_flh; break;
             case 2: op = rv_op_flw; break;
             case 3: op = rv_op_fld; break;
             case 4: op = rv_op_flq; break;
@@ -2583,6 +2604,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 3: op = rv_op_vsoxei8_v; break;
                 }
                 break;
+            case 1: op = rv_op_fsh; break;
             case 2: op = rv_op_fsw; break;
             case 3: op = rv_op_fsd; break;
             case 4: op = rv_op_fsq; break;
@@ -2860,6 +2882,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 switch ((inst >> 20) & 0b11111) {
                 case 1: op = rv_op_fcvt_s_d; break;
                 case 3: op = rv_op_fcvt_s_q; break;
+                case 6: op = rv_op_fcvt_s_bf16; break;
                 }
                 break;
             case 33:
@@ -2868,6 +2891,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 3: op = rv_op_fcvt_d_q; break;
                 }
                 break;
+            case 34:
+                switch (((inst >> 20) & 0b11111)) {
+                case 8: op = rv_op_fcvt_bf16_s; break;
+                }
+                break;
             case 35:
                 switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_q_s; break;
@@ -2972,6 +3000,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 1: op = rv_op_fclass_d; break;
                 }
                 break;
+            case 114:
+                switch (((inst >> 17) & 0b11111000) |
+                        ((inst >> 12) & 0b00000111)) {
+                case 0: op = rv_op_fmv_x_h; break;
+                }
+                break;
             case 115:
                 switch (((inst >> 17) & 0b11111000) |
                         ((inst >> 12) & 0b00000111)) {
@@ -2991,6 +3025,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 0: op = rv_op_fmv_d_x; break;
                 }
                 break;
+            case 122:
+                switch (((inst >> 17) & 0b11111000) |
+                        ((inst >> 12) & 0b00000111)) {
+                case 0: op = rv_op_fmv_h_x; break;
+                }
+                break;
             case 123:
                 switch (((inst >> 17) & 0b11111000) |
                         ((inst >> 12) & 0b00000111)) {
@@ -3087,6 +3127,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     case 10: op = rv_op_vfwcvt_f_xu_v; break;
                     case 11: op = rv_op_vfwcvt_f_x_v; break;
                     case 12: op = rv_op_vfwcvt_f_f_v; break;
+                    case 13: op = rv_op_vfwcvtbf16_f_f_v; break;
                     case 14: op = rv_op_vfwcvt_rtz_xu_f_v; break;
                     case 15: op = rv_op_vfwcvt_rtz_x_f_v; break;
                     case 16: op = rv_op_vfncvt_xu_f_w; break;
@@ -3097,6 +3138,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     case 21: op = rv_op_vfncvt_rod_f_f_w; break;
                     case 22: op = rv_op_vfncvt_rtz_xu_f_w; break;
                     case 23: op = rv_op_vfncvt_rtz_x_f_w; break;
+                    case 29: op = rv_op_vfncvtbf16_f_f_w; break;
                     }
                     break;
                 case 19:
@@ -3128,6 +3170,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 52: op = rv_op_vfwadd_wv; break;
                 case 54: op = rv_op_vfwsub_wv; break;
                 case 56: op = rv_op_vfwmul_vv; break;
+                case 59: op = rv_op_vfwmaccbf16_vv; break;
                 case 60: op = rv_op_vfwmacc_vv; break;
                 case 61: op = rv_op_vfwnmacc_vv; break;
                 case 62: op = rv_op_vfwmsac_vv; break;
@@ -3366,6 +3409,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 52: op = rv_op_vfwadd_wf; break;
                 case 54: op = rv_op_vfwsub_wf; break;
                 case 56: op = rv_op_vfwmul_vf; break;
+                case 59: op = rv_op_vfwmaccbf16_vf; break;
                 case 60: op = rv_op_vfwmacc_vf; break;
                 case 61: op = rv_op_vfwnmacc_vf; break;
                 case 62: op = rv_op_vfwmsac_vf; break;
-- 
2.25.1


