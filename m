Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxIoH-0003Y0-Bn
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 21:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxIoD-0003XK-Nu; Mon, 21 Nov 2022 21:14:49 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxIoB-0003O1-7W; Mon, 21 Nov 2022 21:14:49 -0500
Received: by mail-vk1-xa33.google.com with SMTP id g16so6552358vkl.11;
 Mon, 21 Nov 2022 18:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wgk/tkAdJCjIQl7qz0xzq/681FkJxEV02a6PvJ8B97k=;
 b=PXyQes0PuSvcVLXiabZn7MN8R+tznHIkpWE61Gqtb0YuCC+jSnCKc+SonSU2lLfrEV
 mbUUkB+LpMCOqxYEAqT3KJ5r9tPLjAJTrFMj2bLfufvvFCZQjzwyAwKw9geKe1Ce6dB2
 ewqS5NeQpWaraZQOMxczA2izvorkzzWFWrCBmsh0455YIM/CeBWiKXGVFlMj8HD/PC2s
 gMfBbftmV3xGWCWgWHYROMxjpbM4Ks1WzmH4CZPYdA2PJnii131tWOxGyAuzT4wPcrIo
 fUAzqoZlltdMs5lwpu1k3Q/mPdF+obl9pFmO55RQVKAs4YkL/S/LFBn6b792kxCtEUvT
 YsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wgk/tkAdJCjIQl7qz0xzq/681FkJxEV02a6PvJ8B97k=;
 b=YtmvlRPbXBNPwl2KaVpSYOmYxonYJJ9DjNDkonadBP7oLJwCj+KVgt1aJKgR8auWGb
 SR6GB0dIyz/1ZuXzqE9ZzKrgY2FusGqQf7+ziKgXb8dGa8wif7DiSpvT6sTzXSmwtXT/
 gsGKVcUo+SJoMTISE112NdRlMTXlc+A7bQEuH+LQWyYr5muRlXzptyY3Ne0UbOl3fHUE
 qFHH2H/xHBMTy48Rg9pkRbHHUmFweODqvM0eBoao42217dwWbaFuMM1tBN9leDba02YN
 nZ9csUip2fARg/MPR5+mN5/GwSq0uJH117zlObtIaxnJ6h9OFlc1eTLQBg0KKLm2t8NB
 OyEg==
X-Gm-Message-State: ANoB5pkxJKVPq1xjrXpXDr21kHPHuV0liXn2Inx2cEJTeVrMInQ+Hphk
 67QhKGAlfmKpO2LyVrdxmDGDGB0czYt4cK7sgLU=
X-Google-Smtp-Source: AA0mqf7eA6OREvI/K7ekObUuTg4cZbg6BfG/MQq+kpZ8LGRTBueyLM7phWudbwYOFDvF5QNP9N8t7WfBeligZA9cI9s=
X-Received: by 2002:a1f:e3c6:0:b0:3b8:ba98:bd43 with SMTP id
 a189-20020a1fe3c6000000b003b8ba98bd43mr4045669vkh.34.1669083285809; Mon, 21
 Nov 2022 18:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
 <20221118123728.49319-10-liweiwei@iscas.ac.cn>
In-Reply-To: <20221118123728.49319-10-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Nov 2022 12:14:19 +1000
Message-ID: <CAKmqyKMZyL6S1OAvvr7QtQt_gCM0w_pS3QQ-H7qWCdQEnRfDqw@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] disas/riscv.c: add disasm support for Zc*
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 22 Nov 2022 02:14:50 -0000

On Fri, Nov 18, 2022 at 10:45 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Zcmp/Zcmt instructions will override disasm for c.fld*/c.fsd*
> instructions currently
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 287 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 286 insertions(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d216b9c39b..81369063b5 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -163,6 +163,13 @@ typedef enum {
>      rv_codec_v_i,
>      rv_codec_vsetvli,
>      rv_codec_vsetivli,
> +    rv_codec_zcb_ext,
> +    rv_codec_zcb_mul,
> +    rv_codec_zcb_lb,
> +    rv_codec_zcb_lh,
> +    rv_codec_zcmp_cm_pushpop,
> +    rv_codec_zcmp_cm_mv,
> +    rv_codec_zcmt_jt,
>  } rv_codec;
>
>  typedef enum {
> @@ -935,6 +942,26 @@ typedef enum {
>      rv_op_vsetvli = 766,
>      rv_op_vsetivli = 767,
>      rv_op_vsetvl = 768,
> +    rv_op_c_zext_b = 769,
> +    rv_op_c_sext_b = 770,
> +    rv_op_c_zext_h = 771,
> +    rv_op_c_sext_h = 772,
> +    rv_op_c_zext_w = 773,
> +    rv_op_c_not = 774,
> +    rv_op_c_mul = 775,
> +    rv_op_c_lbu = 776,
> +    rv_op_c_lhu = 777,
> +    rv_op_c_lh = 778,
> +    rv_op_c_sb = 779,
> +    rv_op_c_sh = 780,
> +    rv_op_cm_push = 781,
> +    rv_op_cm_pop = 782,
> +    rv_op_cm_popret = 783,
> +    rv_op_cm_popretz = 784,
> +    rv_op_cm_mva01s = 785,
> +    rv_op_cm_mvsa01 = 786,
> +    rv_op_cm_jt = 787,
> +    rv_op_cm_jalt = 788,
>  } rv_op;
>
>  /* structures */
> @@ -958,6 +985,7 @@ typedef struct {
>      uint8_t   rnum;
>      uint8_t   vm;
>      uint32_t  vzimm;
> +    uint8_t   rlist;
>  } rv_decode;
>
>  typedef struct {
> @@ -1070,6 +1098,10 @@ static const char rv_vreg_name_sym[32][4] = {
>  #define rv_fmt_vd_vm                  "O\tDm"
>  #define rv_fmt_vsetvli                "O\t0,1,v"
>  #define rv_fmt_vsetivli               "O\t0,u,v"
> +#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
> +#define rv_fmt_push_rlist             "O\tx,-i"
> +#define rv_fmt_pop_rlist              "O\tx,i"
> +#define rv_fmt_zcmt_index             "O\ti"
>
>  /* pseudo-instruction constraints */
>
> @@ -2065,7 +2097,27 @@ const rv_opcode_data opcode_data[] = {
>      { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
>      { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
>      { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
> -    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
> +    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
> +    { "c.zext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> +    { "c.sext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> +    { "c.zext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> +    { "c.sext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> +    { "c.zext.w", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> +    { "c.not", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> +    { "c.mul", rv_codec_zcb_mul, rv_fmt_rd_rs2, NULL, 0, 0 },
> +    { "c.lbu", rv_codec_zcb_lb, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> +    { "c.lhu", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> +    { "c.lh", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> +    { "c.sb", rv_codec_zcb_lb, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> +    { "c.sh", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
> +    { "cm.push", rv_codec_zcmp_cm_pushpop, rv_fmt_push_rlist, NULL, 0, 0 },
> +    { "cm.pop", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0 },
> +    { "cm.popret", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0, 0 },
> +    { "cm.popretz", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0 },
> +    { "cm.mva01s", rv_codec_zcmp_cm_mv, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
> +    { "cm.mvsa01", rv_codec_zcmp_cm_mv, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
> +    { "cm.jt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
> +    { "cm.jalt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
>  };
>
>  /* CSR names */
> @@ -2084,6 +2136,7 @@ static const char *csr_name(int csrno)
>      case 0x000a: return "vxrm";
>      case 0x000f: return "vcsr";
>      case 0x0015: return "seed";
> +    case 0x0017: return "jvt";
>      case 0x0040: return "uscratch";
>      case 0x0041: return "uepc";
>      case 0x0042: return "ucause";
> @@ -2306,6 +2359,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                  op = rv_op_c_ld;
>              }
>              break;
> +        case 4:
> +            switch ((inst >> 10) & 0b111) {
> +            case 0: op = rv_op_c_lbu; break;
> +            case 1:
> +                if (((inst >> 6) & 1) == 0) {
> +                    op = rv_op_c_lhu;
> +                } else {
> +                    op = rv_op_c_lh;
> +                }
> +                break;
> +            case 2: op = rv_op_c_sb; break;
> +            case 3:
> +                if (((inst >> 6) & 1) == 0) {
> +                    op = rv_op_c_sh;
> +                }
> +                break;
> +            }
> +            break;
>          case 5:
>              if (isa == rv128) {
>                  op = rv_op_c_sq;
> @@ -2362,6 +2433,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                  case 3: op = rv_op_c_and; break;
>                  case 4: op = rv_op_c_subw; break;
>                  case 5: op = rv_op_c_addw; break;
> +                case 6: op = rv_op_c_mul; break;
> +                case 7:
> +                    switch ((inst >> 2) & 0b111) {
> +                    case 0: op = rv_op_c_zext_b; break;
> +                    case 1: op = rv_op_c_sext_b; break;
> +                    case 2: op = rv_op_c_zext_h; break;
> +                    case 3: op = rv_op_c_sext_h; break;
> +                    case 4: op = rv_op_c_zext_w; break;
> +                    case 5: op = rv_op_c_not; break;
> +                    }
> +                    break;
>                  }
>                  break;
>              }
> @@ -2417,6 +2499,30 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                  op = rv_op_c_sqsp;
>              } else {
>                  op = rv_op_c_fsdsp;
> +                if (((inst >> 12) & 0b01)) {
> +                    switch ((inst >> 8) & 0b01111) {
> +                    case 8: op = rv_op_cm_push; break;
> +                    case 10: op = rv_op_cm_pop; break;
> +                    case 12: op = rv_op_cm_popretz; break;
> +                    case 14: op = rv_op_cm_popret; break;
> +                    }
> +                } else {
> +                    switch ((inst >> 10) & 0b011) {
> +                    case 0:
> +                        if (((inst >> 2) & 0xFF) >= 32) {
> +                            op = rv_op_cm_jalt;
> +                        } else {
> +                            op = rv_op_cm_jt;
> +                        }
> +                        break;
> +                    case 3:
> +                        switch ((inst >> 5) & 0b011) {
> +                        case 1: op = rv_op_cm_mvsa01; break;
> +                        case 3: op = rv_op_cm_mva01s; break;
> +                        }
> +                        break;
> +                    }
> +                }
>              }
>              break;
>          case 6: op = rv_op_c_swsp; break;
> @@ -3661,6 +3767,21 @@ static uint32_t operand_crs2q(rv_inst inst)
>      return (inst << 59) >> 61;
>  }
>
> +static uint32_t calculate_xreg(uint32_t sreg)
> +{
> +    return sreg < 2 ? sreg + 8 : sreg + 16;
> +}
> +
> +static uint32_t operand_sreg1(rv_inst inst)
> +{
> +    return calculate_xreg((inst << 54) >> 61);
> +}
> +
> +static uint32_t operand_sreg2(rv_inst inst)
> +{
> +    return calculate_xreg((inst << 59) >> 61);
> +}
> +
>  static uint32_t operand_crd(rv_inst inst)
>  {
>      return (inst << 52) >> 59;
> @@ -3883,6 +4004,97 @@ static uint32_t operand_vm(rv_inst inst)
>      return (inst << 38) >> 63;
>  }
>
> +static uint32_t operand_uimm_c_lb(rv_inst inst)
> +{
> +    return (((inst << 58) >> 63) << 1) |
> +        ((inst << 57) >> 63);
> +}
> +
> +static uint32_t operand_uimm_c_lh(rv_inst inst)
> +{
> +    return (((inst << 58) >> 63) << 1);
> +}
> +
> +static uint32_t operand_zcmp_spimm(rv_inst inst)
> +{
> +    return ((inst << 60) >> 62) << 4;
> +}
> +
> +static uint32_t operand_zcmp_rlist(rv_inst inst)
> +{
> +    return ((inst << 56) >> 60);
> +}
> +
> +static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t spimm)
> +{
> +    uint32_t stack_adj_base = 0;
> +    if (isa == rv64) {
> +        switch (rlist) {
> +        case 15:
> +            stack_adj_base = 112;
> +            break;
> +        case 14:
> +            stack_adj_base = 96;
> +            break;
> +        case 13:
> +        case 12:
> +            stack_adj_base = 80;
> +            break;
> +        case 11:
> +        case 10:
> +            stack_adj_base = 64;
> +            break;
> +        case 9:
> +        case 8:
> +            stack_adj_base = 48;
> +            break;
> +        case 7:
> +        case 6:
> +            stack_adj_base = 32;
> +            break;
> +        case 5:
> +        case 4:
> +            stack_adj_base = 16;
> +            break;
> +        }
> +    } else {
> +        switch (rlist) {
> +        case 15:
> +            stack_adj_base = 64;
> +            break;
> +        case 14:
> +        case 13:
> +        case 12:
> +            stack_adj_base = 48;
> +            break;
> +        case 11:
> +        case 10:
> +        case 9:
> +        case 8:
> +            stack_adj_base = 32;
> +            break;
> +        case 7:
> +        case 6:
> +        case 5:
> +        case 4:
> +            stack_adj_base = 16;
> +            break;
> +        }
> +    }
> +    return stack_adj_base + spimm;
> +}
> +
> +static uint32_t operand_zcmp_stack_adj(rv_inst inst, rv_isa isa)
> +{
> +    return calculate_stack_adj(isa, operand_zcmp_rlist(inst),
> +                              operand_zcmp_spimm(inst));
> +}
> +
> +static uint32_t operand_tbl_index(rv_inst inst)
> +{
> +    return ((inst << 54) >> 56);
> +}
> +
>  /* decode operands */
>
>  static void decode_inst_operands(rv_decode *dec, rv_isa isa)
> @@ -4199,6 +4411,34 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
>          dec->imm = operand_vimm(inst);
>          dec->vzimm = operand_vzimm10(inst);
>          break;
> +    case rv_codec_zcb_lb:
> +        dec->rs1 = operand_crs1q(inst) + 8;
> +        dec->rs2 = operand_crs2q(inst) + 8;
> +        dec->imm = operand_uimm_c_lb(inst);
> +        break;
> +    case rv_codec_zcb_lh:
> +        dec->rs1 = operand_crs1q(inst) + 8;
> +        dec->rs2 = operand_crs2q(inst) + 8;
> +        dec->imm = operand_uimm_c_lh(inst);
> +        break;
> +    case rv_codec_zcb_ext:
> +        dec->rd = operand_crs1q(inst) + 8;
> +        break;
> +    case rv_codec_zcb_mul:
> +        dec->rd = operand_crs1rdq(inst) + 8;
> +        dec->rs2 = operand_crs2q(inst) + 8;
> +        break;
> +    case rv_codec_zcmp_cm_pushpop:
> +        dec->imm = operand_zcmp_stack_adj(inst, isa);
> +        dec->rlist = operand_zcmp_rlist(inst);
> +        break;
> +    case rv_codec_zcmp_cm_mv:
> +        dec->rd = operand_sreg1(inst);
> +        dec->rs2 = operand_sreg2(inst);
> +        break;
> +    case rv_codec_zcmt_jt:
> +        dec->imm = operand_tbl_index(inst);
> +        break;
>      };
>  }
>
> @@ -4358,6 +4598,9 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
>          case ')':
>              append(buf, ")", buflen);
>              break;
> +        case '-':
> +            append(buf, "-", buflen);
> +            break;
>          case 'b':
>              snprintf(tmp, sizeof(tmp), "%d", dec->bs);
>              append(buf, tmp, buflen);
> @@ -4541,6 +4784,48 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
>              append(buf, vma, buflen);
>              break;
>          }
> +        case 'x': {
> +            switch(dec->rlist) {
> +            case 4:
> +                snprintf(tmp, sizeof(tmp), "{ra}");
> +                break;
> +            case 5:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0}");
> +                break;
> +            case 6:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s1}");
> +                break;
> +            case 7:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s2}");
> +                break;
> +            case 8:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s3}");
> +                break;
> +            case 9:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s4}");
> +                break;
> +            case 10:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s5}");
> +                break;
> +            case 11:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s6}");
> +                break;
> +            case 12:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s7}");
> +                break;
> +            case 13:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s8}");
> +                break;
> +            case 14:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s9}");
> +                break;
> +            case 15:
> +                snprintf(tmp, sizeof(tmp), "{ra, s0-s11}");
> +                break;
> +            }
> +            append(buf, tmp, buflen);
> +            break;
> +        }
>          default:
>              break;
>          }
> --
> 2.25.1
>
>

