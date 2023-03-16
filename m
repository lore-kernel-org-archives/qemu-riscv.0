Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pccRy-0003De-Nb
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 21:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pccRx-0003DJ-Ne; Wed, 15 Mar 2023 21:30:37 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pccRt-0007EK-KE; Wed, 15 Mar 2023 21:30:37 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VdxpRtY_1678930220; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdxpRtY_1678930220) by smtp.aliyun-inc.com;
 Thu, 16 Mar 2023 09:30:21 +0800
Message-ID: <405a9900-9138-920c-7adb-78797d190f85@linux.alibaba.com>
Date: Thu, 16 Mar 2023 09:30:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] disas/riscv: Add support for XThead* instructions
To: Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230315133510.3511784-1-christoph.muellner@vrull.eu>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
In-Reply-To: <20230315133510.3511784-1-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 16 Mar 2023 01:30:38 -0000


On 2023/3/15 21:35, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> Support for emulating XThead* instruction has been added recently.
> This patch adds support for these instructions to the RISC-V disassembler.

This patch doesn't scale well. It will make the custom encoding only 
work for XTHEAD*. I once sent a multiple disassemble path patch set  for 
custom extensions.
https://www.mail-archive.com/qemu-devel@nongnu.org/msg906222.html

We may continue this work based on that patch set.

Zhiwei

>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   disas/riscv.c | 366 +++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 365 insertions(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d6b0fbe5e8..14f3faaef4 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -19,6 +19,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "disas/dis-asm.h"
> +#include "qemu/bitops.h"
>   
>   
>   /* types */
> @@ -163,6 +164,12 @@ typedef enum {
>       rv_codec_v_i,
>       rv_codec_vsetvli,
>       rv_codec_vsetivli,
> +    rv_codec_r2_imm5,
> +    rv_codec_r2,
> +    rv_codec_r2_imm6,
> +    rv_codec_r_imm2,
> +    rv_codec_r2_immhl,
> +    rv_codec_r2_imm2_imm5,
>   } rv_codec;
>   
>   typedef enum {
> @@ -935,6 +942,90 @@ typedef enum {
>       rv_op_vsetvli = 766,
>       rv_op_vsetivli = 767,
>       rv_op_vsetvl = 768,
> +    /* XTheadBa */
> +    rv_op_th_addsl = 769,
> +    /* XTheadBb */
> +    rv_op_th_srri = 770,
> +    rv_op_th_srriw = 771,
> +    rv_op_th_ext = 772,
> +    rv_op_th_extu = 773,
> +    rv_op_th_ff0 = 774,
> +    rv_op_th_ff1 = 775,
> +    rv_op_th_rev = 776,
> +    rv_op_th_revw = 777,
> +    rv_op_th_tstnbz = 778,
> +    /* XTheadBs */
> +    rv_op_th_tst = 779,
> +    /* XTheadCondMov */
> +    rv_op_th_mveqz = 780,
> +    rv_op_th_mvnez = 781,
> +    /* XTheadFMemIdx */
> +    rv_op_th_flrd = 782,
> +    rv_op_th_flrw = 783,
> +    rv_op_th_flurd = 784,
> +    rv_op_th_flurw = 785,
> +    rv_op_th_fsrd = 786,
> +    rv_op_th_fsrw = 787,
> +    rv_op_th_fsurd = 788,
> +    rv_op_th_fsurw = 789,
> +    /* XTheadMac */
> +    rv_op_th_mula = 790,
> +    rv_op_th_mulah = 791,
> +    rv_op_th_mulaw = 792,
> +    rv_op_th_muls = 793,
> +    rv_op_th_mulsw = 794,
> +    rv_op_th_mulsh = 795,
> +    /* XTheadMemIdx */
> +    rv_op_th_lbia = 796,
> +    rv_op_th_lbib = 797,
> +    rv_op_th_lbuia = 798,
> +    rv_op_th_lbuib = 799,
> +    rv_op_th_lhia = 800,
> +    rv_op_th_lhib = 801,
> +    rv_op_th_lhuia = 802,
> +    rv_op_th_lhuib = 803,
> +    rv_op_th_lwia = 804,
> +    rv_op_th_lwib = 805,
> +    rv_op_th_lwuia = 806,
> +    rv_op_th_lwuib = 807,
> +    rv_op_th_ldia = 808,
> +    rv_op_th_ldib = 809,
> +    rv_op_th_sbia = 810,
> +    rv_op_th_sbib = 811,
> +    rv_op_th_shia = 812,
> +    rv_op_th_shib = 813,
> +    rv_op_th_swia = 814,
> +    rv_op_th_swib = 815,
> +    rv_op_th_sdia = 816,
> +    rv_op_th_sdib = 817,
> +    rv_op_th_lrb = 818,
> +    rv_op_th_lrbu = 819,
> +    rv_op_th_lrh = 820,
> +    rv_op_th_lrhu = 821,
> +    rv_op_th_lrw = 822,
> +    rv_op_th_lrwu = 823,
> +    rv_op_th_lrd = 824,
> +    rv_op_th_srb = 825,
> +    rv_op_th_srh = 826,
> +    rv_op_th_srw = 827,
> +    rv_op_th_srd = 828,
> +    rv_op_th_lurb = 829,
> +    rv_op_th_lurbu = 830,
> +    rv_op_th_lurh = 831,
> +    rv_op_th_lurhu = 832,
> +    rv_op_th_lurw = 833,
> +    rv_op_th_lurwu = 834,
> +    rv_op_th_lurd = 835,
> +    rv_op_th_surb = 836,
> +    rv_op_th_surh = 837,
> +    rv_op_th_surw = 838,
> +    rv_op_th_surd = 839,
> +    /* XTheadMemPair */
> +    rv_op_th_ldd = 840,
> +    rv_op_th_lwd = 841,
> +    rv_op_th_lwud = 842,
> +    rv_op_th_sdd = 843,
> +    rv_op_th_swd = 844,
>   } rv_op;
>   
>   /* structures */
> @@ -943,6 +1034,7 @@ typedef struct {
>       uint64_t  pc;
>       uint64_t  inst;
>       int32_t   imm;
> +    int32_t   imm1;
>       uint16_t  op;
>       uint8_t   codec;
>       uint8_t   rd;
> @@ -1071,6 +1163,11 @@ static const char rv_vreg_name_sym[32][4] = {
>   #define rv_fmt_vd_vm                  "O\tDm"
>   #define rv_fmt_vsetvli                "O\t0,1,v"
>   #define rv_fmt_vsetivli               "O\t0,u,v"
> +#define rv_fmt_rd_rs1_rs2_imm         "O\t0,1,2,i"
> +#define rv_fmt_frd_rs1_rs2_imm        "O\t3,1,2,i"
> +#define rv_fmt_rd_rs1_immh_imml       "O\t0,1,i,j"
> +#define rv_fmt_rd_rs1_immh_imml_addr  "O\t0,(1),i,j"
> +#define rv_fmt_rd2_imm                "O\t0,2,(1),i"
>   
>   /* pseudo-instruction constraints */
>   
> @@ -2066,7 +2163,91 @@ const rv_opcode_data opcode_data[] = {
>       { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
>       { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
>       { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
> -    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
> +    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
> +    /* XTheadBa */
> +    { "th.addsl", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    /* XTheadBb */
> +    { "th.srri", rv_codec_r2_imm6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0},
> +    { "th.srriw", rv_codec_r2_imm5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0},
> +    { "th.ext", rv_codec_r2_immhl, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0, 0},
> +    { "th.extu", rv_codec_r2_immhl, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0, 0},
> +    { "th.ff0", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "th.ff1", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "th.rev", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "th.revw", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "th.tstnbz", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    /* XTheadBs */
> +    { "th.tst", rv_codec_r2_imm6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0},
> +    /* XTheadCondMov */
> +    { "th.mveqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mvnez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    /* XTheadFMemIdx */
> +    { "th.flrd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.flrw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.flurd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.flurw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.fsrd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.fsrw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.fsurd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.fsurw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    /* XTheadMac */
> +    { "th.mula", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mulaw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mulah", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.muls", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mulsw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mulsh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    /* XTheadMemIdx */
> +    { "th.lbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0, 0 },
> +    { "th.lbuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lbuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lhia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lhib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lhuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lhuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lwia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lwib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lwuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lwuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.ldia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.ldib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.sbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.sbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.shia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.shib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.swia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.swib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.sdia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.sdib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NULL, 0, 0, 0 },
> +    { "th.lrb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrbu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrhu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrwu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.srb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.srh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.srw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.srd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lurb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lurbu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lurh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lurhu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lurw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lurwu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lurd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.surb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.surh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.surw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.surd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    /* XTheadMemPair */
> +    { "th.ldd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    { "th.lwd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    { "th.lwud", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    { "th.sdd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    { "th.swd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
>   };
>   
>   /* CSR names */
> @@ -2528,6 +2709,133 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   break;
>               }
>               break;
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 0: /* ingore priviledged inst */ break;
> +            case 1:
> +                switch ((inst >> 25) & 0b1111111) {
> +                case 0b0001010: op = rv_op_th_srriw; break;
> +                case 0b0010000: op = rv_op_th_mula; break;
> +                case 0b0010001: op = rv_op_th_muls; break;
> +                case 0b0010010: op = rv_op_th_mulaw; break;
> +                case 0b0010011: op = rv_op_th_mulsw; break;
> +                case 0b0010100: op = rv_op_th_mulah; break;
> +                case 0b0010101: op = rv_op_th_mulsh; break;
> +                case 0b0100000: op = rv_op_th_mveqz; break;
> +                case 0b0100001: op = rv_op_th_mvnez; break;
> +                case 0b1000000:
> +                    if (((inst >> 20) & 0b11111) == 0) {
> +                        op = rv_op_th_tstnbz;
> +                    }
> +                    break;
> +                case 0b1000001:
> +                    if (((inst >> 20) & 0b11111) == 0) {
> +                        op = rv_op_th_rev;
> +                    }
> +                    break;
> +                case 0b1000010:
> +                    if (((inst >> 20) & 0b11111) == 0) {
> +                        op = rv_op_th_ff0;
> +                    }
> +                    break;
> +                case 0b1000011:
> +                    if (((inst >> 20) & 0b11111) == 0) {
> +                        op = rv_op_th_ff1;
> +                    }
> +                    break;
> +                case 0b1000100:
> +                case 0b1000101: op = rv_op_th_tst; break;
> +                case 0b1001000:
> +                    if (((inst >> 20) & 0b11111) == 0) {
> +                        op = rv_op_th_revw;
> +                    }
> +                    break;
> +                case 0b0000000:
> +                case 0b0000001:
> +                case 0b0000010:
> +                case 0b0000011: op = rv_op_th_addsl; break;
> +                case 0b0000100:
> +                case 0b0000101: op = rv_op_th_srri; break;
> +                }
> +                break;
> +            case 2: op = rv_op_th_ext; break;
> +            case 3: op = rv_op_th_extu; break;
> +            case 4:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 0: op = rv_op_th_lrb; break;
> +                case 1: op = rv_op_th_lbib; break;
> +                case 2: op = rv_op_th_lurb; break;
> +                case 3: op = rv_op_th_lbia; break;
> +                case 4: op = rv_op_th_lrh; break;
> +                case 5: op = rv_op_th_lhib; break;
> +                case 6: op = rv_op_th_lurh; break;
> +                case 7: op = rv_op_th_lhia; break;
> +                case 8: op = rv_op_th_lrw; break;
> +                case 9: op = rv_op_th_lwib; break;
> +                case 10: op = rv_op_th_lurw; break;
> +                case 11: op = rv_op_th_lwia; break;
> +                case 12: op = rv_op_th_lrd; break;
> +                case 13: op = rv_op_th_ldib; break;
> +                case 14: op = rv_op_th_lurd; break;
> +                case 15: op = rv_op_th_ldia; break;
> +                case 16: op = rv_op_th_lrbu; break;
> +                case 17: op = rv_op_th_lbuib; break;
> +                case 18: op = rv_op_th_lurbu; break;
> +                case 19: op = rv_op_th_lbuia; break;
> +                case 20: op = rv_op_th_lrhu; break;
> +                case 21: op = rv_op_th_lhuib; break;
> +                case 22: op = rv_op_th_lurhu; break;
> +                case 23: op = rv_op_th_lhuia; break;
> +                case 24: op = rv_op_th_lrwu; break;
> +                case 25: op = rv_op_th_lwuib; break;
> +                case 26: op = rv_op_th_lurwu; break;
> +                case 27: op = rv_op_th_lwuia; break;
> +                case 28: op = rv_op_th_lwd; break;
> +                case 30: op = rv_op_th_lwud; break;
> +                case 31: op = rv_op_th_ldd; break;
> +                }
> +                break;
> +            case 5:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 0: op = rv_op_th_srb; break;
> +                case 1: op = rv_op_th_sbib; break;
> +                case 2: op = rv_op_th_surb; break;
> +                case 3: op = rv_op_th_sbia; break;
> +                case 4: op = rv_op_th_srh; break;
> +                case 5: op = rv_op_th_shib; break;
> +                case 6: op = rv_op_th_surh; break;
> +                case 7: op = rv_op_th_shia; break;
> +                case 8: op = rv_op_th_srw; break;
> +                case 9: op = rv_op_th_swib; break;
> +                case 10: op = rv_op_th_surw; break;
> +                case 11: op = rv_op_th_swia; break;
> +                case 12: op = rv_op_th_srd; break;
> +                case 13: op = rv_op_th_sdib; break;
> +                case 14: op = rv_op_th_surd; break;
> +                case 15: op = rv_op_th_sdia; break;
> +                case 28: op = rv_op_th_swd; break;
> +                case 31: op = rv_op_th_sdd; break;
> +                }
> +                break;
> +            case 6:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 8: op = rv_op_th_flrw; break;
> +                case 10: op = rv_op_th_flurw; break;
> +                case 12: op = rv_op_th_flrd; break;
> +                case 14: op = rv_op_th_flurd; break;
> +                }
> +                break;
> +            case 7:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 8: op = rv_op_th_fsrw; break;
> +                case 10: op = rv_op_th_fsurw; break;
> +                case 12: op = rv_op_th_fsrd; break;
> +                case 14: op = rv_op_th_fsurd; break;
> +                }
> +                break;
> +            }
> +            break;
>           case 3:
>               switch (((inst >> 12) & 0b111)) {
>               case 0: op = rv_op_fence; break;
> @@ -3884,6 +4192,26 @@ static uint32_t operand_vm(rv_inst inst)
>       return (inst << 38) >> 63;
>   }
>   
> +static uint32_t operand_imm6(rv_inst inst)
> +{
> +    return (inst << 38) >> 60;
> +}
> +
> +static uint32_t operand_imm2(rv_inst inst)
> +{
> +    return (inst << 37) >> 62;
> +}
> +
> +static uint32_t operand_immh(rv_inst inst)
> +{
> +    return (inst << 32) >> 58;
> +}
> +
> +static uint32_t operand_imml(rv_inst inst)
> +{
> +    return (inst << 38) >> 58;
> +}
> +
>   /* decode operands */
>   
>   static void decode_inst_operands(rv_decode *dec, rv_isa isa)
> @@ -4200,6 +4528,38 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
>           dec->imm = operand_vimm(inst);
>           dec->vzimm = operand_vzimm10(inst);
>           break;
> +    case rv_codec_r2_imm5:
> +        dec->rd = operand_rd(inst);
> +        dec->rs1 = operand_rs1(inst);
> +        dec->imm = operand_rs2(inst);
> +        break;
> +    case rv_codec_r2:
> +        dec->rd = operand_rd(inst);
> +        dec->rs1 = operand_rs1(inst);
> +        break;
> +    case rv_codec_r2_imm6:
> +        dec->rd = operand_rd(inst);
> +        dec->rs1 = operand_rs1(inst);
> +        dec->imm = operand_imm6(inst);
> +        break;
> +    case rv_codec_r_imm2:
> +        dec->rd = operand_rd(inst);
> +        dec->rs1 = operand_rs1(inst);
> +        dec->rs2 = operand_rs2(inst);
> +        dec->imm = operand_imm2(inst);
> +        break;
> +    case rv_codec_r2_immhl:
> +        dec->rd = operand_rd(inst);
> +        dec->rs1 = operand_rs1(inst);
> +        dec->imm = operand_immh(inst);
> +        dec->imm1 = operand_imml(inst);
> +        break;
> +    case rv_codec_r2_imm2_imm5:
> +        dec->rd = operand_rd(inst);
> +        dec->rs1 = operand_rs1(inst);
> +        dec->imm = sextract32(operand_rs2(inst), 0, 5);
> +        dec->imm1 = operand_imm2(inst);
> +        break;
>       };
>   }
>   
> @@ -4396,6 +4756,10 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
>               snprintf(tmp, sizeof(tmp), "%d", dec->imm);
>               append(buf, tmp, buflen);
>               break;
> +        case 'j':
> +            snprintf(tmp, sizeof(tmp), "%d", dec->imm1);
> +            append(buf, tmp, buflen);
> +            break;
>           case 'u':
>               snprintf(tmp, sizeof(tmp), "%u", ((uint32_t)dec->imm & 0b11111));
>               append(buf, tmp, buflen);

