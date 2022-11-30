Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0HCs-0000Jm-3D
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 02:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1p0HCn-0000Hu-26; Wed, 30 Nov 2022 02:08:30 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1p0HCi-0003Jf-EF; Wed, 30 Nov 2022 02:08:28 -0500
Received: from [192.168.3.6] (unknown [180.175.30.174])
 by APP-05 (Coremail) with SMTP id zQCowACXuM1XAYdj2SeeAw--.33437S2;
 Wed, 30 Nov 2022 15:08:09 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------Nr4R0RCNVp3XzovLNFVMSK2s"
Message-ID: <654523f6-f051-a558-e7b2-b8aa26141035@iscas.ac.cn>
Date: Wed, 30 Nov 2022 15:08:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 9/9] disas/riscv.c: add disasm support for Zc*
To: Shaobo Song <shzclx123456@163.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221129024343.20384-1-liweiwei@iscas.ac.cn>
 <20221129024343.20384-10-liweiwei@iscas.ac.cn>
 <6fc30870.1d7b.184c67dc958.Coremail.shzclx123456@163.com>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <6fc30870.1d7b.184c67dc958.Coremail.shzclx123456@163.com>
X-CM-TRANSID: zQCowACXuM1XAYdj2SeeAw--.33437S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Cr48tFW3JF1Dtr4DCw4Uurg_yoWkGF4fpF
 y5WwnxJrWUKa4Iqa4fJFWUAasxtrWDXF47WFySqas8Ca9rZ3ZFkF1jvw4avF95C34UKr4x
 ZFsI9r1jq3Z7ArUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
 x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5V
 A0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l7480Y4vEI4kI2Ix0rVAq
 x4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUtkuxUUUUU=
X-Originating-IP: [180.175.30.174]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.258, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 30 Nov 2022 07:08:30 -0000

This is a multi-part message in MIME format.
--------------Nr4R0RCNVp3XzovLNFVMSK2s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/11/30 11:04, Shaobo Song wrote:
>
> At 2022-11-29 10:43:43, "Weiwei Li" <liweiwei@iscas.ac.cn> wrote:
>
> >Zcmp/Zcmt instructions will override disasm for c.fld*/c.fsd*
> >instructions currently
> >
> >Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >---
> > disas/riscv.c | 287 +++++++++++++++++++++++++++++++++++++++++++++++++-
> > 1 file changed, 286 insertions(+), 1 deletion(-)
> >
> >diff --git a/disas/riscv.c b/disas/riscv.c
> >index d216b9c39b..81369063b5 100644
> >--- a/disas/riscv.c
> >+++ b/disas/riscv.c
> >@@ -163,6 +163,13 @@ typedef enum {
> >     rv_codec_v_i,
> >     rv_codec_vsetvli,
> >     rv_codec_vsetivli,
> >+    rv_codec_zcb_ext,
> >+    rv_codec_zcb_mul,
> >+    rv_codec_zcb_lb,
> >+    rv_codec_zcb_lh,
> >+    rv_codec_zcmp_cm_pushpop,
> >+    rv_codec_zcmp_cm_mv,
> >+    rv_codec_zcmt_jt,
> > } rv_codec;
> > 
> > typedef enum {
> >@@ -935,6 +942,26 @@ typedef enum {
> >     rv_op_vsetvli = 766,
> >     rv_op_vsetivli = 767,
> >     rv_op_vsetvl = 768,
> >+    rv_op_c_zext_b = 769,
> >+    rv_op_c_sext_b = 770,
> >+    rv_op_c_zext_h = 771,
> >+    rv_op_c_sext_h = 772,
> >+    rv_op_c_zext_w = 773,
> >+    rv_op_c_not = 774,
> >+    rv_op_c_mul = 775,
> >+    rv_op_c_lbu = 776,
> >+    rv_op_c_lhu = 777,
> >+    rv_op_c_lh = 778,
> >+    rv_op_c_sb = 779,
> >+    rv_op_c_sh = 780,
> >+    rv_op_cm_push = 781,
> >+    rv_op_cm_pop = 782,
> >+    rv_op_cm_popret = 783,
> >+    rv_op_cm_popretz = 784,
> >+    rv_op_cm_mva01s = 785,
> >+    rv_op_cm_mvsa01 = 786,
> >+    rv_op_cm_jt = 787,
> >+    rv_op_cm_jalt = 788,
> > } rv_op;
> > 
> > /* structures */
> >@@ -958,6 +985,7 @@ typedef struct {
> >     uint8_t   rnum;
> >     uint8_t   vm;
> >     uint32_t  vzimm;
> >+    uint8_t   rlist;
> > } rv_decode;
> > 
> > typedef struct {
> >@@ -1070,6 +1098,10 @@ static const char rv_vreg_name_sym[32][4] = {
> > #define rv_fmt_vd_vm                  "O\tDm"
> > #define rv_fmt_vsetvli                "O\t0,1,v"
> > #define rv_fmt_vsetivli               "O\t0,u,v"
> >+#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
> >+#define rv_fmt_push_rlist             "O\tx,-i"
> >+#define rv_fmt_pop_rlist              "O\tx,i"
> >+#define rv_fmt_zcmt_index             "O\ti"
> > 
> > /* pseudo-instruction constraints */
> > 
> >@@ -2065,7 +2097,27 @@ const rv_opcode_data opcode_data[] = {
> >     { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
> >     { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
> >     { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
> >-    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
> >+    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
> >+    { "c.zext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> >+    { "c.sext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> >+    { "c.zext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> >+    { "c.sext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> >+    { "c.zext.w", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> >+    { "c.not", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> >+    { "c.mul", rv_codec_zcb_mul, rv_fmt_rd_rs2, NULL, 0, 0 },
> >+    { "c.lbu", rv_codec_zcb_lb, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> >+    { "c.lhu", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> >+    { "c.lh", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> >+    { "c.sb", rv_codec_zcb_lb, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> >+    { "c.sh", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> >+    { "cm.push", rv_codec_zcmp_cm_pushpop, rv_fmt_push_rlist, NULL, 0, 0 },
> >+    { "cm.pop", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0 },
> >+    { "cm.popret", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0, 0 },
> >+    { "cm.popretz", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0 },
> >+    { "cm.mva01s", rv_codec_zcmp_cm_mv, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
> >+    { "cm.mvsa01", rv_codec_zcmp_cm_mv, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
> >+    { "cm.jt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
> >+    { "cm.jalt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
> > };
> > 
> > /* CSR names */
> >@@ -2084,6 +2136,7 @@ static const char *csr_name(int csrno)
> >     case 0x000a: return "vxrm";
> >     case 0x000f: return "vcsr";
> >     case 0x0015: return "seed";
> >+    case 0x0017: return "jvt";
> >     case 0x0040: return "uscratch";
> >     case 0x0041: return "uepc";
> >     case 0x0042: return "ucause";
> >@@ -2306,6 +2359,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
> >                 op = rv_op_c_ld;
> >             }
> >             break;
> >+        case 4:
> >+            switch ((inst >> 10) & 0b111) {
> >+            case 0: op = rv_op_c_lbu; break;
> >+            case 1:
> >+                if (((inst >> 6) & 1) == 0) {
> >+                    op = rv_op_c_lhu;
> >+                } else {
> >+                    op = rv_op_c_lh;
> >+                }
> >+                break;
> >+            case 2: op = rv_op_c_sb; break;
> >+            case 3:
> >+                if (((inst >> 6) & 1) == 0) {
> >+                    op = rv_op_c_sh;
> >+                }
> >+                break;
> >+            }
> >+            break;
> >         case 5:
> >             if (isa == rv128) {
> >                 op = rv_op_c_sq;
> >@@ -2362,6 +2433,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
> >                 case 3: op = rv_op_c_and; break;
> >                 case 4: op = rv_op_c_subw; break;
> >                 case 5: op = rv_op_c_addw; break;
> >+                case 6: op = rv_op_c_mul; break;
> >+                case 7:
> >+                    switch ((inst >> 2) & 0b111) {
> >+                    case 0: op = rv_op_c_zext_b; break;
> >+                    case 1: op = rv_op_c_sext_b; break;
> >+                    case 2: op = rv_op_c_zext_h; break;
> >+                    case 3: op = rv_op_c_sext_h; break;
> >+                    case 4: op = rv_op_c_zext_w; break;
> >+                    case 5: op = rv_op_c_not; break;
> >+                    }
> >+                    break;
> >                 }
> >                 break;
> >             }
> >@@ -2417,6 +2499,30 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
> >                 op = rv_op_c_sqsp;
> >             } else {
> >                 op = rv_op_c_fsdsp;
> >+                if (((inst >> 12) & 0b01)) {
> >+                    switch ((inst >> 8) & 0b01111) {
> >+                    case 8: op = rv_op_cm_push; break;
> >+                    case 10: op = rv_op_cm_pop; break;
> >+                    case 12: op = rv_op_cm_popretz; break;
> >+                    case 14: op = rv_op_cm_popret; break;
> >+                    }
> >+                } else {
> >+                    switch ((inst >> 10) & 0b011) {
> >+                    case 0:
> >+                        if (((inst >> 2) & 0xFF) >= 32) {
> >+                            op = rv_op_cm_jalt;
> >+                        } else {
> >+                            op = rv_op_cm_jt;
> >+                        }
> >+                        break;
> >+                    case 3:
> >+                        switch ((inst >> 5) & 0b011) {
> >+                        case 1: op = rv_op_cm_mvsa01; break;
> >+                        case 3: op = rv_op_cm_mva01s; break;
> >+                        }
> >+                        break;
> >+                    }
> >+                }
> >             }
> >             break;
> >         case 6: op = rv_op_c_swsp; break;
> >@@ -3661,6 +3767,21 @@ static uint32_t operand_crs2q(rv_inst inst)
> >     return (inst << 59) >> 61;
> > }
> > 
> >+static uint32_t calculate_xreg(uint32_t sreg)
> >+{
> >+    return sreg < 2 ? sreg + 8 : sreg + 16;
> >+}
> >+
> >+static uint32_t operand_sreg1(rv_inst inst)
> >+{
> >+    return calculate_xreg((inst << 54) >> 61);
> >+}
> >+
> >+static uint32_t operand_sreg2(rv_inst inst)
> >+{
> >+    return calculate_xreg((inst << 59) >> 61);
> >+}
> >+
> > static uint32_t operand_crd(rv_inst inst)
> > {
> >     return (inst << 52) >> 59;
> >@@ -3883,6 +4004,97 @@ static uint32_t operand_vm(rv_inst inst)
> >     return (inst << 38) >> 63;
> > }
> > 
> >+static uint32_t operand_uimm_c_lb(rv_inst inst)
> >+{
> >+    return (((inst << 58) >> 63) << 1) |
> >+        ((inst << 57) >> 63);
> >+}
> >+
> >+static uint32_t operand_uimm_c_lh(rv_inst inst)
> >+{
> >+    return (((inst << 58) >> 63) << 1);
> >+}
> >+
> >+static uint32_t operand_zcmp_spimm(rv_inst inst)
> >+{
> >+    return ((inst << 60) >> 62) << 4;
> >+}
> >+
> >+static uint32_t operand_zcmp_rlist(rv_inst inst)
> >+{
> >+    return ((inst << 56) >> 60);
> >+}
> >+
> >+static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t spimm)
> >+{
> >+    uint32_t stack_adj_base = 0;
> >+    if (isa == rv64) {
> >+        switch (rlist) {
> >+        case 15:
> >+            stack_adj_base = 112;
> >+            break;
> >+        case 14:
> >+            stack_adj_base = 96;
> >+            break;
> >+        case 13:
> >+        case 12:
> >+            stack_adj_base = 80;
> >+            break;
> >+        case 11:
> >+        case 10:
> >+            stack_adj_base = 64;
> >+            break;
> >+        case 9:
> >+        case 8:
> >+            stack_adj_base = 48;
> >+            break;
> >+        case 7:
> >+        case 6:
> >+            stack_adj_base = 32;
> >+            break;
> >+        case 5:
> >+        case 4:
> >+            stack_adj_base = 16;
> >+            break;
> >+        }
> >+    } else {
> >+        switch (rlist) {
> >+        case 15:
> >+            stack_adj_base = 64;
> >+            break;
> >+        case 14:
> >+        case 13:
> >+        case 12:
> >+            stack_adj_base = 48;
> >+            break;
> >+        case 11:
> >+        case 10:
> >+        case 9:
> >+        case 8:
> >+            stack_adj_base = 32;
> >+            break;
> >+        case 7:
> >+        case 6:
> >+        case 5:
> >+        case 4:
> >+            stack_adj_base = 16;
> >+            break;
> >+        }
> >+ }
> I think you can be simply:
> int target_long_bytes_log2 = isa == rv64 ? 3 : 2;
> int regs = rlist == 15 ? 13 : rlist - 3;
> stack_adj_base = ROUND_UP(regs << target_long_bytes_log2, 16);
> may get closer to the description of spec.
> Shabo Song

Yeah,  this is similar to the calculation in trans function for Zcmp.

I'll update this in next version.

Regards,

Weiwei Li

> >+    return stack_adj_base + spimm;
> >+}
> >+
> >+static uint32_t operand_zcmp_stack_adj(rv_inst inst, rv_isa isa)
> >+{
> >+    return calculate_stack_adj(isa, operand_zcmp_rlist(inst),
> >+                              operand_zcmp_spimm(inst));
> >+}
> >+
> >+static uint32_t operand_tbl_index(rv_inst inst)
> >+{
> >+    return ((inst << 54) >> 56);
> >+}
> >+
> > /* decode operands */
> > 
> > static void decode_inst_operands(rv_decode *dec, rv_isa isa)
> >@@ -4199,6 +4411,34 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
> >         dec->imm = operand_vimm(inst);
> >         dec->vzimm = operand_vzimm10(inst);
> >         break;
> >+    case rv_codec_zcb_lb:
> >+        dec->rs1 = operand_crs1q(inst) + 8;
> >+        dec->rs2 = operand_crs2q(inst) + 8;
> >+        dec->imm = operand_uimm_c_lb(inst);
> >+        break;
> >+    case rv_codec_zcb_lh:
> >+        dec->rs1 = operand_crs1q(inst) + 8;
> >+        dec->rs2 = operand_crs2q(inst) + 8;
> >+        dec->imm = operand_uimm_c_lh(inst);
> >+        break;
> >+    case rv_codec_zcb_ext:
> >+        dec->rd = operand_crs1q(inst) + 8;
> >+        break;
> >+    case rv_codec_zcb_mul:
> >+        dec->rd = operand_crs1rdq(inst) + 8;
> >+        dec->rs2 = operand_crs2q(inst) + 8;
> >+        break;
> >+    case rv_codec_zcmp_cm_pushpop:
> >+        dec->imm = operand_zcmp_stack_adj(inst, isa);
> >+        dec->rlist = operand_zcmp_rlist(inst);
> >+        break;
> >+    case rv_codec_zcmp_cm_mv:
> >+        dec->rd = operand_sreg1(inst);
> >+        dec->rs2 = operand_sreg2(inst);
> >+        break;
> >+    case rv_codec_zcmt_jt:
> >+        dec->imm = operand_tbl_index(inst);
> >+        break;
> >     };
> > }
> > 
> >@@ -4358,6 +4598,9 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
> >         case ')':
> >             append(buf, ")", buflen);
> >             break;
> >+        case '-':
> >+            append(buf, "-", buflen);
> >+            break;
> >         case 'b':
> >             snprintf(tmp, sizeof(tmp), "%d", dec->bs);
> >             append(buf, tmp, buflen);
> >@@ -4541,6 +4784,48 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
> >             append(buf, vma, buflen);
> >             break;
> >         }
> >+        case 'x': {
> >+            switch (dec->rlist) {
> >+            case 4:
> >+                snprintf(tmp, sizeof(tmp), "{ra}");
> >+                break;
> >+            case 5:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0}");
> >+                break;
> >+            case 6:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s1}");
> >+                break;
> >+            case 7:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s2}");
> >+                break;
> >+            case 8:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s3}");
> >+                break;
> >+            case 9:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s4}");
> >+                break;
> >+            case 10:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s5}");
> >+                break;
> >+            case 11:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s6}");
> >+                break;
> >+            case 12:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s7}");
> >+                break;
> >+            case 13:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s8}");
> >+                break;
> >+            case 14:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s9}");
> >+                break;
> >+            case 15:
> >+                snprintf(tmp, sizeof(tmp), "{ra, s0-s11}");
> >+                break;
> >+            }
> >+            append(buf, tmp, buflen);
> >+            break;
> >+        }
> >         default:
> >             break;
> >         }
> >-- 
> >2.25.1
> >
--------------Nr4R0RCNVp3XzovLNFVMSK2s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/11/30 11:04, Shaobo Song wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6fc30870.1d7b.184c67dc958.Coremail.shzclx123456@163.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div
        style="line-height:1.7;color:#000000;font-size:14px;font-family:Arial">
        <p style="margin: 0;"><span style="font-family: arial; white-space: pre-wrap;">At 2022-11-29 10:43:43, "Weiwei Li" <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a> wrote:</span></p>
        <pre>&gt;Zcmp/Zcmt instructions will override disasm for c.fld*/c.fsd*
&gt;instructions currently
&gt;
&gt;Signed-off-by: Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a>
&gt;Signed-off-by: Junqiang Wang <a class="moz-txt-link-rfc2396E" href="mailto:wangjunqiang@iscas.ac.cn">&lt;wangjunqiang@iscas.ac.cn&gt;</a>
&gt;Acked-by: Alistair Francis <a class="moz-txt-link-rfc2396E" href="mailto:alistair.francis@wdc.com">&lt;alistair.francis@wdc.com&gt;</a>
&gt;---
&gt; disas/riscv.c | 287 +++++++++++++++++++++++++++++++++++++++++++++++++-
&gt; 1 file changed, 286 insertions(+), 1 deletion(-)
&gt;
&gt;diff --git a/disas/riscv.c b/disas/riscv.c
&gt;index d216b9c39b..81369063b5 100644
&gt;--- a/disas/riscv.c
&gt;+++ b/disas/riscv.c
&gt;@@ -163,6 +163,13 @@ typedef enum {
&gt;     rv_codec_v_i,
&gt;     rv_codec_vsetvli,
&gt;     rv_codec_vsetivli,
&gt;+    rv_codec_zcb_ext,
&gt;+    rv_codec_zcb_mul,
&gt;+    rv_codec_zcb_lb,
&gt;+    rv_codec_zcb_lh,
&gt;+    rv_codec_zcmp_cm_pushpop,
&gt;+    rv_codec_zcmp_cm_mv,
&gt;+    rv_codec_zcmt_jt,
&gt; } rv_codec;
&gt; 
&gt; typedef enum {
&gt;@@ -935,6 +942,26 @@ typedef enum {
&gt;     rv_op_vsetvli = 766,
&gt;     rv_op_vsetivli = 767,
&gt;     rv_op_vsetvl = 768,
&gt;+    rv_op_c_zext_b = 769,
&gt;+    rv_op_c_sext_b = 770,
&gt;+    rv_op_c_zext_h = 771,
&gt;+    rv_op_c_sext_h = 772,
&gt;+    rv_op_c_zext_w = 773,
&gt;+    rv_op_c_not = 774,
&gt;+    rv_op_c_mul = 775,
&gt;+    rv_op_c_lbu = 776,
&gt;+    rv_op_c_lhu = 777,
&gt;+    rv_op_c_lh = 778,
&gt;+    rv_op_c_sb = 779,
&gt;+    rv_op_c_sh = 780,
&gt;+    rv_op_cm_push = 781,
&gt;+    rv_op_cm_pop = 782,
&gt;+    rv_op_cm_popret = 783,
&gt;+    rv_op_cm_popretz = 784,
&gt;+    rv_op_cm_mva01s = 785,
&gt;+    rv_op_cm_mvsa01 = 786,
&gt;+    rv_op_cm_jt = 787,
&gt;+    rv_op_cm_jalt = 788,
&gt; } rv_op;
&gt; 
&gt; /* structures */
&gt;@@ -958,6 +985,7 @@ typedef struct {
&gt;     uint8_t   rnum;
&gt;     uint8_t   vm;
&gt;     uint32_t  vzimm;
&gt;+    uint8_t   rlist;
&gt; } rv_decode;
&gt; 
&gt; typedef struct {
&gt;@@ -1070,6 +1098,10 @@ static const char rv_vreg_name_sym[32][4] = {
&gt; #define rv_fmt_vd_vm                  "O\tDm"
&gt; #define rv_fmt_vsetvli                "O\t0,1,v"
&gt; #define rv_fmt_vsetivli               "O\t0,u,v"
&gt;+#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
&gt;+#define rv_fmt_push_rlist             "O\tx,-i"
&gt;+#define rv_fmt_pop_rlist              "O\tx,i"
&gt;+#define rv_fmt_zcmt_index             "O\ti"
&gt; 
&gt; /* pseudo-instruction constraints */
&gt; 
&gt;@@ -2065,7 +2097,27 @@ const rv_opcode_data opcode_data[] = {
&gt;     { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
&gt;     { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
&gt;     { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
&gt;-    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
&gt;+    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
&gt;+    { "c.zext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
&gt;+    { "c.sext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
&gt;+    { "c.zext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
&gt;+    { "c.sext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
&gt;+    { "c.zext.w", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
&gt;+    { "c.not", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
&gt;+    { "c.mul", rv_codec_zcb_mul, rv_fmt_rd_rs2, NULL, 0, 0 },
&gt;+    { "c.lbu", rv_codec_zcb_lb, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
&gt;+    { "c.lhu", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
&gt;+    { "c.lh", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
&gt;+    { "c.sb", rv_codec_zcb_lb, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
&gt;+    { "c.sh", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
&gt;+    { "cm.push", rv_codec_zcmp_cm_pushpop, rv_fmt_push_rlist, NULL, 0, 0 },
&gt;+    { "cm.pop", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0 },
&gt;+    { "cm.popret", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0, 0 },
&gt;+    { "cm.popretz", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0 },
&gt;+    { "cm.mva01s", rv_codec_zcmp_cm_mv, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
&gt;+    { "cm.mvsa01", rv_codec_zcmp_cm_mv, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
&gt;+    { "cm.jt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
&gt;+    { "cm.jalt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
&gt; };
&gt; 
&gt; /* CSR names */
&gt;@@ -2084,6 +2136,7 @@ static const char *csr_name(int csrno)
&gt;     case 0x000a: return "vxrm";
&gt;     case 0x000f: return "vcsr";
&gt;     case 0x0015: return "seed";
&gt;+    case 0x0017: return "jvt";
&gt;     case 0x0040: return "uscratch";
&gt;     case 0x0041: return "uepc";
&gt;     case 0x0042: return "ucause";
&gt;@@ -2306,6 +2359,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
&gt;                 op = rv_op_c_ld;
&gt;             }
&gt;             break;
&gt;+        case 4:
&gt;+            switch ((inst &gt;&gt; 10) &amp; 0b111) {
&gt;+            case 0: op = rv_op_c_lbu; break;
&gt;+            case 1:
&gt;+                if (((inst &gt;&gt; 6) &amp; 1) == 0) {
&gt;+                    op = rv_op_c_lhu;
&gt;+                } else {
&gt;+                    op = rv_op_c_lh;
&gt;+                }
&gt;+                break;
&gt;+            case 2: op = rv_op_c_sb; break;
&gt;+            case 3:
&gt;+                if (((inst &gt;&gt; 6) &amp; 1) == 0) {
&gt;+                    op = rv_op_c_sh;
&gt;+                }
&gt;+                break;
&gt;+            }
&gt;+            break;
&gt;         case 5:
&gt;             if (isa == rv128) {
&gt;                 op = rv_op_c_sq;
&gt;@@ -2362,6 +2433,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
&gt;                 case 3: op = rv_op_c_and; break;
&gt;                 case 4: op = rv_op_c_subw; break;
&gt;                 case 5: op = rv_op_c_addw; break;
&gt;+                case 6: op = rv_op_c_mul; break;
&gt;+                case 7:
&gt;+                    switch ((inst &gt;&gt; 2) &amp; 0b111) {
&gt;+                    case 0: op = rv_op_c_zext_b; break;
&gt;+                    case 1: op = rv_op_c_sext_b; break;
&gt;+                    case 2: op = rv_op_c_zext_h; break;
&gt;+                    case 3: op = rv_op_c_sext_h; break;
&gt;+                    case 4: op = rv_op_c_zext_w; break;
&gt;+                    case 5: op = rv_op_c_not; break;
&gt;+                    }
&gt;+                    break;
&gt;                 }
&gt;                 break;
&gt;             }
&gt;@@ -2417,6 +2499,30 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
&gt;                 op = rv_op_c_sqsp;
&gt;             } else {
&gt;                 op = rv_op_c_fsdsp;
&gt;+                if (((inst &gt;&gt; 12) &amp; 0b01)) {
&gt;+                    switch ((inst &gt;&gt; 8) &amp; 0b01111) {
&gt;+                    case 8: op = rv_op_cm_push; break;
&gt;+                    case 10: op = rv_op_cm_pop; break;
&gt;+                    case 12: op = rv_op_cm_popretz; break;
&gt;+                    case 14: op = rv_op_cm_popret; break;
&gt;+                    }
&gt;+                } else {
&gt;+                    switch ((inst &gt;&gt; 10) &amp; 0b011) {
&gt;+                    case 0:
&gt;+                        if (((inst &gt;&gt; 2) &amp; 0xFF) &gt;= 32) {
&gt;+                            op = rv_op_cm_jalt;
&gt;+                        } else {
&gt;+                            op = rv_op_cm_jt;
&gt;+                        }
&gt;+                        break;
&gt;+                    case 3:
&gt;+                        switch ((inst &gt;&gt; 5) &amp; 0b011) {
&gt;+                        case 1: op = rv_op_cm_mvsa01; break;
&gt;+                        case 3: op = rv_op_cm_mva01s; break;
&gt;+                        }
&gt;+                        break;
&gt;+                    }
&gt;+                }
&gt;             }
&gt;             break;
&gt;         case 6: op = rv_op_c_swsp; break;
&gt;@@ -3661,6 +3767,21 @@ static uint32_t operand_crs2q(rv_inst inst)
&gt;     return (inst &lt;&lt; 59) &gt;&gt; 61;
&gt; }
&gt; 
&gt;+static uint32_t calculate_xreg(uint32_t sreg)
&gt;+{
&gt;+    return sreg &lt; 2 ? sreg + 8 : sreg + 16;
&gt;+}
&gt;+
&gt;+static uint32_t operand_sreg1(rv_inst inst)
&gt;+{
&gt;+    return calculate_xreg((inst &lt;&lt; 54) &gt;&gt; 61);
&gt;+}
&gt;+
&gt;+static uint32_t operand_sreg2(rv_inst inst)
&gt;+{
&gt;+    return calculate_xreg((inst &lt;&lt; 59) &gt;&gt; 61);
&gt;+}
&gt;+
&gt; static uint32_t operand_crd(rv_inst inst)
&gt; {
&gt;     return (inst &lt;&lt; 52) &gt;&gt; 59;
&gt;@@ -3883,6 +4004,97 @@ static uint32_t operand_vm(rv_inst inst)
&gt;     return (inst &lt;&lt; 38) &gt;&gt; 63;
&gt; }
&gt; 
&gt;+static uint32_t operand_uimm_c_lb(rv_inst inst)
&gt;+{
&gt;+    return (((inst &lt;&lt; 58) &gt;&gt; 63) &lt;&lt; 1) |
&gt;+        ((inst &lt;&lt; 57) &gt;&gt; 63);
&gt;+}
&gt;+
&gt;+static uint32_t operand_uimm_c_lh(rv_inst inst)
&gt;+{
&gt;+    return (((inst &lt;&lt; 58) &gt;&gt; 63) &lt;&lt; 1);
&gt;+}
&gt;+
&gt;+static uint32_t operand_zcmp_spimm(rv_inst inst)
&gt;+{
&gt;+    return ((inst &lt;&lt; 60) &gt;&gt; 62) &lt;&lt; 4;
&gt;+}
&gt;+
&gt;+static uint32_t operand_zcmp_rlist(rv_inst inst)
&gt;+{
&gt;+    return ((inst &lt;&lt; 56) &gt;&gt; 60);
&gt;+}
&gt;+
&gt;+static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t spimm)
&gt;+{
&gt;+    uint32_t stack_adj_base = 0;
&gt;+    if (isa == rv64) {
&gt;+        switch (rlist) {
&gt;+        case 15:
&gt;+            stack_adj_base = 112;
&gt;+            break;
&gt;+        case 14:
&gt;+            stack_adj_base = 96;
&gt;+            break;
&gt;+        case 13:
&gt;+        case 12:
&gt;+            stack_adj_base = 80;
&gt;+            break;
&gt;+        case 11:
&gt;+        case 10:
&gt;+            stack_adj_base = 64;
&gt;+            break;
&gt;+        case 9:
&gt;+        case 8:
&gt;+            stack_adj_base = 48;
&gt;+            break;
&gt;+        case 7:
&gt;+        case 6:
&gt;+            stack_adj_base = 32;
&gt;+            break;
&gt;+        case 5:
&gt;+        case 4:
&gt;+            stack_adj_base = 16;
&gt;+            break;
&gt;+        }
&gt;+    } else {
&gt;+        switch (rlist) {
&gt;+        case 15:
&gt;+            stack_adj_base = 64;
&gt;+            break;
&gt;+        case 14:
&gt;+        case 13:
&gt;+        case 12:
&gt;+            stack_adj_base = 48;
&gt;+            break;
&gt;+        case 11:
&gt;+        case 10:
&gt;+        case 9:
&gt;+        case 8:
&gt;+            stack_adj_base = 32;
&gt;+            break;
&gt;+        case 7:
&gt;+        case 6:
&gt;+        case 5:
&gt;+        case 4:
&gt;+            stack_adj_base = 16;
&gt;+            break;
&gt;+        }
<div>&gt;+    }</div><div>I think you can be simply:</div><div>    int target_long_bytes_log2 = isa == rv64 ? 3 : 2;</div><div>    int regs = rlist == 15 ? 13 : rlist - 3;</div><div>    stack_adj_base = ROUND_UP(regs &lt;&lt; target_long_bytes_log2, 16); </div><div>may get closer to the description of spec.</div><div>
</div><div>Shabo Song</div></pre>
      </div>
    </blockquote>
    <p>Yeah,  this is similar to the calculation in trans function for
      Zcmp.</p>
    <p>I'll update this in next version.</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:6fc30870.1d7b.184c67dc958.Coremail.shzclx123456@163.com">
      <div
        style="line-height:1.7;color:#000000;font-size:14px;font-family:Arial">
        <pre>&gt;+    return stack_adj_base + spimm;
&gt;+}
&gt;+
&gt;+static uint32_t operand_zcmp_stack_adj(rv_inst inst, rv_isa isa)
&gt;+{
&gt;+    return calculate_stack_adj(isa, operand_zcmp_rlist(inst),
&gt;+                              operand_zcmp_spimm(inst));
&gt;+}
&gt;+
&gt;+static uint32_t operand_tbl_index(rv_inst inst)
&gt;+{
&gt;+    return ((inst &lt;&lt; 54) &gt;&gt; 56);
&gt;+}
&gt;+
&gt; /* decode operands */
&gt; 
&gt; static void decode_inst_operands(rv_decode *dec, rv_isa isa)
&gt;@@ -4199,6 +4411,34 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
&gt;         dec-&gt;imm = operand_vimm(inst);
&gt;         dec-&gt;vzimm = operand_vzimm10(inst);
&gt;         break;
&gt;+    case rv_codec_zcb_lb:
&gt;+        dec-&gt;rs1 = operand_crs1q(inst) + 8;
&gt;+        dec-&gt;rs2 = operand_crs2q(inst) + 8;
&gt;+        dec-&gt;imm = operand_uimm_c_lb(inst);
&gt;+        break;
&gt;+    case rv_codec_zcb_lh:
&gt;+        dec-&gt;rs1 = operand_crs1q(inst) + 8;
&gt;+        dec-&gt;rs2 = operand_crs2q(inst) + 8;
&gt;+        dec-&gt;imm = operand_uimm_c_lh(inst);
&gt;+        break;
&gt;+    case rv_codec_zcb_ext:
&gt;+        dec-&gt;rd = operand_crs1q(inst) + 8;
&gt;+        break;
&gt;+    case rv_codec_zcb_mul:
&gt;+        dec-&gt;rd = operand_crs1rdq(inst) + 8;
&gt;+        dec-&gt;rs2 = operand_crs2q(inst) + 8;
&gt;+        break;
&gt;+    case rv_codec_zcmp_cm_pushpop:
&gt;+        dec-&gt;imm = operand_zcmp_stack_adj(inst, isa);
&gt;+        dec-&gt;rlist = operand_zcmp_rlist(inst);
&gt;+        break;
&gt;+    case rv_codec_zcmp_cm_mv:
&gt;+        dec-&gt;rd = operand_sreg1(inst);
&gt;+        dec-&gt;rs2 = operand_sreg2(inst);
&gt;+        break;
&gt;+    case rv_codec_zcmt_jt:
&gt;+        dec-&gt;imm = operand_tbl_index(inst);
&gt;+        break;
&gt;     };
&gt; }
&gt; 
&gt;@@ -4358,6 +4598,9 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
&gt;         case ')':
&gt;             append(buf, ")", buflen);
&gt;             break;
&gt;+        case '-':
&gt;+            append(buf, "-", buflen);
&gt;+            break;
&gt;         case 'b':
&gt;             snprintf(tmp, sizeof(tmp), "%d", dec-&gt;bs);
&gt;             append(buf, tmp, buflen);
&gt;@@ -4541,6 +4784,48 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
&gt;             append(buf, vma, buflen);
&gt;             break;
&gt;         }
&gt;+        case 'x': {
&gt;+            switch (dec-&gt;rlist) {
&gt;+            case 4:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra}");
&gt;+                break;
&gt;+            case 5:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0}");
&gt;+                break;
&gt;+            case 6:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s1}");
&gt;+                break;
&gt;+            case 7:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s2}");
&gt;+                break;
&gt;+            case 8:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s3}");
&gt;+                break;
&gt;+            case 9:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s4}");
&gt;+                break;
&gt;+            case 10:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s5}");
&gt;+                break;
&gt;+            case 11:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s6}");
&gt;+                break;
&gt;+            case 12:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s7}");
&gt;+                break;
&gt;+            case 13:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s8}");
&gt;+                break;
&gt;+            case 14:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s9}");
&gt;+                break;
&gt;+            case 15:
&gt;+                snprintf(tmp, sizeof(tmp), "{ra, s0-s11}");
&gt;+                break;
&gt;+            }
&gt;+            append(buf, tmp, buflen);
&gt;+            break;
&gt;+        }
&gt;         default:
&gt;             break;
&gt;         }
&gt;-- 
&gt;2.25.1
<div>&gt;</div></pre>
      </div>
    </blockquote>
  </body>
</html>

--------------Nr4R0RCNVp3XzovLNFVMSK2s--


