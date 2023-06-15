Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5499BEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 06:34:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9gYf-00075b-Ck; Thu, 15 Jun 2023 02:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gY0-0006Vl-7V; Thu, 15 Jun 2023 02:33:32 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gXt-0004BY-1R; Thu, 15 Jun 2023 02:33:31 -0400
Received: from localhost.localdomain (unknown [117.61.111.213])
 by APP-05 (Coremail) with SMTP id zQCowAD3_h6isIpkuxShAg--.21989S8;
 Thu, 15 Jun 2023 14:33:20 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 6/6] target/riscv: Add disas support for BF16 extensions
Date: Thu, 15 Jun 2023 14:33:02 +0800
Message-Id: <20230615063302.102409-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_h6isIpkuxShAg--.21989S8
X-Coremail-Antispam: 1UD129KBjvJXoWxuF47Kr4xJFyUAF47WrWrAFb_yoW7JFyfpr
 y5Z3y3KrZIkF1xJa1fZF4UAF95try8Jr48Za4Fv3y3WasxWFy5Cr45X343AFy8WFW0yr4x
 Wa1Sg3yYvF1xAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTY
 UUUUU
X-Originating-IP: [117.61.111.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 5005364aba..44ea69315c 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -964,6 +964,16 @@ typedef enum {
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
 
 /* structures */
@@ -2168,6 +2178,16 @@ const rv_opcode_data opcode_data[] = {
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
@@ -2643,6 +2663,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 3: op = rv_op_vloxei8_v; break;
                 }
                 break;
+            case 1: op = rv_op_flh; break;
             case 2: op = rv_op_flw; break;
             case 3: op = rv_op_fld; break;
             case 4: op = rv_op_flq; break;
@@ -2846,6 +2867,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 3: op = rv_op_vsoxei8_v; break;
                 }
                 break;
+            case 1: op = rv_op_fsh; break;
             case 2: op = rv_op_fsw; break;
             case 3: op = rv_op_fsd; break;
             case 4: op = rv_op_fsq; break;
@@ -3123,6 +3145,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 switch ((inst >> 20) & 0b11111) {
                 case 1: op = rv_op_fcvt_s_d; break;
                 case 3: op = rv_op_fcvt_s_q; break;
+                case 6: op = rv_op_fcvt_s_bf16; break;
                 }
                 break;
             case 33:
@@ -3131,6 +3154,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -3235,6 +3263,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -3254,6 +3288,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -3350,6 +3390,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     case 10: op = rv_op_vfwcvt_f_xu_v; break;
                     case 11: op = rv_op_vfwcvt_f_x_v; break;
                     case 12: op = rv_op_vfwcvt_f_f_v; break;
+                    case 13: op = rv_op_vfwcvtbf16_f_f_v; break;
                     case 14: op = rv_op_vfwcvt_rtz_xu_f_v; break;
                     case 15: op = rv_op_vfwcvt_rtz_x_f_v; break;
                     case 16: op = rv_op_vfncvt_xu_f_w; break;
@@ -3360,6 +3401,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     case 21: op = rv_op_vfncvt_rod_f_f_w; break;
                     case 22: op = rv_op_vfncvt_rtz_xu_f_w; break;
                     case 23: op = rv_op_vfncvt_rtz_x_f_w; break;
+                    case 29: op = rv_op_vfncvtbf16_f_f_w; break;
                     }
                     break;
                 case 19:
@@ -3391,6 +3433,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 52: op = rv_op_vfwadd_wv; break;
                 case 54: op = rv_op_vfwsub_wv; break;
                 case 56: op = rv_op_vfwmul_vv; break;
+                case 59: op = rv_op_vfwmaccbf16_vv; break;
                 case 60: op = rv_op_vfwmacc_vv; break;
                 case 61: op = rv_op_vfwnmacc_vv; break;
                 case 62: op = rv_op_vfwmsac_vv; break;
@@ -3629,6 +3672,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 52: op = rv_op_vfwadd_wf; break;
                 case 54: op = rv_op_vfwsub_wf; break;
                 case 56: op = rv_op_vfwmul_vf; break;
+                case 59: op = rv_op_vfwmaccbf16_vf; break;
                 case 60: op = rv_op_vfwmacc_vf; break;
                 case 61: op = rv_op_vfwnmacc_vf; break;
                 case 62: op = rv_op_vfwmsac_vf; break;
-- 
2.25.1


