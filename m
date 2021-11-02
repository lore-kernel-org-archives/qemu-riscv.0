Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhu0t-0000i4-NH
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 09:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhkES-00032o-51; Mon, 01 Nov 2021 23:13:04 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:34890 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhkEL-0004nr-Hf; Mon, 01 Nov 2021 23:13:02 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mO2qrIBh7YkSBg--.46962S8;
 Tue, 02 Nov 2021 11:12:49 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: luruibo2000@163.com, lustrew@foxmail.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, liweiwei@iscas.ac.cn
Subject: [RFC 6/6] disas/riscv.c: rvk: add disas support for Zbk* and Zk*
 instructions
Date: Tue,  2 Nov 2021 11:11:28 +0800
Message-Id: <20211102031128.17296-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowAC3mO2qrIBh7YkSBg--.46962S8
X-Coremail-Antispam: 1UD129KBjvJXoW3KFW7XFy7Kry3JrWfGFW3Wrg_yoWDWw15pr
 15XayYkFWFkrW8X3WfZFWUZF95JFWUXF42qFWft3Z3G3y7Xw1rCry5Z3sIyFyvgrWYkr4x
 uF43WF1FqF1xA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
 JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
 0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
 JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
 A2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
 43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7V
 UbmZX7UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Nov 2021 09:39:20 -0400
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
X-List-Received-Date: Tue, 02 Nov 2021 03:13:04 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 disas/riscv.c | 171 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 170 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 793ad14c27..eb1d36d1e5 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -156,6 +156,8 @@ typedef enum {
     rv_codec_css_swsp,
     rv_codec_css_sdsp,
     rv_codec_css_sqsp,
+    rv_codec_k_bs,
+    rv_codec_k_rnum,
 } rv_codec;
 
 typedef enum {
@@ -521,6 +523,43 @@ typedef enum {
     rv_op_bclr = 359,
     rv_op_binv = 360,
     rv_op_bext = 361,
+    rv_op_aes32esmi = 362,
+    rv_op_aes32esi = 363,
+    rv_op_aes32dsmi = 364,
+    rv_op_aes32dsi = 365,
+    rv_op_aes64ks1i = 366,
+    rv_op_aes64ks2 = 367,
+    rv_op_aes64im = 368,
+    rv_op_aes64esm = 369,
+    rv_op_aes64es = 370,
+    rv_op_aes64dsm = 371,
+    rv_op_aes64ds = 372,
+    rv_op_sha256sig0 = 373,
+    rv_op_sha256sig1 = 374,
+    rv_op_sha256sum0 = 375,
+    rv_op_sha256sum1 = 376,
+    rv_op_sha512sig0 = 377,
+    rv_op_sha512sig1 = 378,
+    rv_op_sha512sum0 = 379,
+    rv_op_sha512sum1 = 380,
+    rv_op_sha512sum0r = 381,
+    rv_op_sha512sum1r = 382,
+    rv_op_sha512sig0l = 383,
+    rv_op_sha512sig0h = 384,
+    rv_op_sha512sig1l = 385,
+    rv_op_sha512sig1h = 386,
+    rv_op_sm3p0 = 387,
+    rv_op_sm3p1 = 388,
+    rv_op_sm4ed = 389,
+    rv_op_sm4ks = 390,
+    rv_op_brev8 = 391,
+    rv_op_pack = 392,
+    rv_op_packh = 393,
+    rv_op_packw = 394,
+    rv_op_unzip = 395,
+    rv_op_zip = 396,
+    rv_op_xperm4 = 397,
+    rv_op_xperm8 = 398,
 } rv_op;
 
 /* structures */
@@ -540,6 +579,8 @@ typedef struct {
     uint8_t   succ;
     uint8_t   aq;
     uint8_t   rl;
+    uint8_t   bs;
+    uint8_t   rnum;
 } rv_decode;
 
 typedef struct {
@@ -615,6 +656,8 @@ static const char rv_freg_name_sym[32][5] = {
 #define rv_fmt_rd_rs2                 "O\t0,2"
 #define rv_fmt_rs1_offset             "O\t1,o"
 #define rv_fmt_rs2_offset             "O\t2,o"
+#define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
+#define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
 
 /* pseudo-instruction constraints */
 
@@ -766,6 +809,7 @@ static const rv_comp_data rvcp_csrrw[] = {
     { rv_op_illegal, NULL }
 };
 
+
 static const rv_comp_data rvcp_csrrs[] = {
     { rv_op_rdcycle, rvcc_rdcycle },
     { rv_op_rdtime, rvcc_rdtime },
@@ -1203,10 +1247,46 @@ const rv_opcode_data opcode_data[] = {
     { "bclr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "binv", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "bext", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes32esmi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "aes32esi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "aes32dsmi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "aes32dsi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "aes64ks1i", rv_codec_k_rnum,  rv_fmt_rd_rs1_rnum, NULL, 0, 0, 0 },
+    { "aes64ks2", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes64im", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "aes64esm", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes64es", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes64dsm", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes64ds", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha256sig0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sha256sig1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sha256sum0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sha256sum1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sha512sig0", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig1", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sum0", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sum1", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sum0r", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sum1r", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig0l", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig0h", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig1l", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig1h", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sm3p0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sm3p1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sm4ed", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "sm4ks", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "brev8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "pack", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "packh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "packw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "unzip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "zip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "xperm4", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 }
 };
 
 /* CSR names */
-
 static const char *csr_name(int csrno)
 {
     switch (csrno) {
@@ -1216,6 +1296,7 @@ static const char *csr_name(int csrno)
     case 0x0003: return "fcsr";
     case 0x0004: return "uie";
     case 0x0005: return "utvec";
+    case 0x0015: return "seed";
     case 0x0040: return "uscratch";
     case 0x0041: return "uepc";
     case 0x0042: return "ucause";
@@ -1594,7 +1675,36 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 1:
                 switch (((inst >> 27) & 0b11111)) {
                 case 0b00000: op = rv_op_slli; break;
+                case 0b00001:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0001111: op = rv_op_zip; break;
+                    }
+                    break;
+                case 0b00010:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0000000: op = rv_op_sha256sum0; break;
+                    case 0b0000001: op = rv_op_sha256sum1; break;
+                    case 0b0000010: op = rv_op_sha256sig0; break;
+                    case 0b0000011: op = rv_op_sha256sig1; break;
+                    case 0b0000100: op = rv_op_sha512sum0; break;
+                    case 0b0000101: op = rv_op_sha512sum1; break;
+                    case 0b0000110: op = rv_op_sha512sig0; break;
+                    case 0b0000111: op = rv_op_sha512sig1; break;
+                    case 0b0001000: op = rv_op_sm3p0; break;
+                    case 0b0001001: op = rv_op_sm3p1; break;
+                    }
+                    break;
                 case 0b00101: op = rv_op_bseti; break;
+                case 0b00110:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0000000: op = rv_op_aes64im; break;
+                    default:
+                        if (((inst >> 24) & 0x111) == 0b001) {
+                            op = rv_op_aes64ks1i;
+                        }
+                        break;
+                     }
+                     break;
                 case 0b01001: op = rv_op_bclri; break;
                 case 0b01101: op = rv_op_binvi; break;
                 case 0b01100:
@@ -1615,6 +1725,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 5:
                 switch (((inst >> 27) & 0b11111)) {
                 case 0b00000: op = rv_op_srli; break;
+                case 0b00001:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0001111: op = rv_op_unzip; break;
+                    }
+                    break;
                 case 0b00101: op = rv_op_orc_b; break;
                 case 0b01000: op = rv_op_srai; break;
                 case 0b01001: op = rv_op_bexti; break;
@@ -1622,6 +1737,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 0b01101:
                     switch ((inst >> 20) & 0b1111111) {
                     case 0b0111000: op = rv_op_rev8; break;
+                    case 0b0000111: op = rv_op_brev8; break;
                     }
                     break;
                 }
@@ -1742,8 +1858,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 36:
                 switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_zext_h; break;
+                default: op = rv_op_pack; break;
                 }
                 break;
+            case 39: op = rv_op_packh; break;
+
             case 41: op = rv_op_clmul; break;
             case 42: op = rv_op_clmulr; break;
             case 43: op = rv_op_clmulh; break;
@@ -1755,6 +1874,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 132: op = rv_op_sh2add; break;
             case 134: op = rv_op_sh3add; break;
             case 161: op = rv_op_bset; break;
+            case 162: op = rv_op_xperm4; break;
+            case 164: op = rv_op_xperm8; break;
+            case 200: op = rv_op_aes64es; break;
+            case 216: op = rv_op_aes64esm; break;
+            case 232: op = rv_op_aes64ds; break;
+            case 248: op = rv_op_aes64dsm; break;
             case 256: op = rv_op_sub; break;
             case 260: op = rv_op_xnor; break;
             case 261: op = rv_op_sra; break;
@@ -1762,9 +1887,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 263: op = rv_op_andn; break;
             case 289: op = rv_op_bclr; break;
             case 293: op = rv_op_bext; break;
+            case 320: op = rv_op_sha512sum0r; break;
+            case 328: op = rv_op_sha512sum1r; break;
+            case 336: op = rv_op_sha512sig0l; break;
+            case 344: op = rv_op_sha512sig1l; break;
+            case 368: op = rv_op_sha512sig0h; break;
+            case 376: op = rv_op_sha512sig1h; break;
             case 385: op = rv_op_rol; break;
             case 386: op = rv_op_ror; break;
             case 417: op = rv_op_binv; break;
+            case 504: op = rv_op_aes64ks2; break;
+            }
+            switch ((inst >> 25) & 0b0011111) {
+            case 17: op = rv_op_aes32esi; break;
+            case 19: op = rv_op_aes32esmi; break;
+            case 21: op = rv_op_aes32dsi; break;
+            case 23: op = rv_op_aes32esmi; break;
+            case 24: op = rv_op_sm4ed; break;
+            case 26: op = rv_op_sm4ks; break;
             }
             break;
         case 13: op = rv_op_lui; break;
@@ -1782,6 +1922,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 36:
                 switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_zext_h; break;
+                default: op = rv_op_packw; break;
                 }
                 break;
             case 130: op = rv_op_sh1add_uw; break;
@@ -2374,6 +2515,16 @@ static uint32_t operand_cimmq(rv_inst inst)
         ((inst << 57) >> 62) << 6;
 }
 
+static uint32_t operand_bs(rv_inst inst)
+{
+    return (inst << 32) >> 62;
+}
+
+static uint32_t operand_rnum(rv_inst inst)
+{
+    return (inst << 40) >> 60;
+}
+
 /* decode operands */
 
 static void decode_inst_operands(rv_decode *dec)
@@ -2653,6 +2804,16 @@ static void decode_inst_operands(rv_decode *dec)
         dec->rs2 = operand_crs2(inst);
         dec->imm = operand_cimmsqsp(inst);
         break;
+    case rv_codec_k_bs:
+        dec->rs1 = operand_rs1(inst);
+        dec->rs2 = operand_rs2(inst);
+        dec->bs = operand_bs(inst);
+        break;
+    case rv_codec_k_rnum:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->rnum = operand_rnum(inst);
+        break;
     };
 }
 
@@ -2812,6 +2973,14 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
         case ')':
             append(buf, ")", buflen);
             break;
+        case 'b':
+            snprintf(tmp, sizeof(tmp), "%d", dec->bs);
+            append(buf, tmp, buflen);
+            break;
+        case 'n':
+            snprintf(tmp, sizeof(tmp), "%d", dec->rnum);
+            append(buf, tmp, buflen);
+            break;
         case '0':
             append(buf, rv_ireg_name_sym[dec->rd], buflen);
             break;
-- 
2.17.1


