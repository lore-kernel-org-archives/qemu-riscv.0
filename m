Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXDc0-0001JQ-2U
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 22:54:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nXDby-0001JC-3Z; Wed, 23 Mar 2022 22:54:06 -0400
Received: from [2607:f8b0:4864:20::136] (port=34519
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nXDbv-0001dU-Vr; Wed, 23 Mar 2022 22:54:05 -0400
Received: by mail-il1-x136.google.com with SMTP id r11so2351727ila.1;
 Wed, 23 Mar 2022 19:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A83bOF7qPney2qSQk+FeLcmXk/8x8SHu76eM08TmKQU=;
 b=WDPrqOsGHR5UpmV1YYUri41ItUO74tG9tp09rR/8+TB/53OE5Mgyo8kDpslfpQEMEr
 xi37yQiDndmiYyeaawwBfChY+oCR19RdG8bwarFXA5cD9irx9tAefgnbTk65ri+LApMC
 ohOCgbSqP4DdV9RKUjWw046sxADtwvXS74fxry2rsfVTB7yIWmCu5tMS5TkyOLn8/NtK
 gNt5U1Jax+nU0LKQjiB9XJnK5q3eqYQhPoOn4BTpcVBqMU4B4cqNzR3ctzqt2eRNoVxl
 LKWXLZtfYdORXqk34dq9FTi6FGxViJQkKNV5Va944njRxuORmIxRj6aBrptUTk7JHDuw
 F82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A83bOF7qPney2qSQk+FeLcmXk/8x8SHu76eM08TmKQU=;
 b=DU5lwTeILhv+kTSRK9+HQ27zIAFtDjDi8WSPKaOQ6zoQK0xXtf/co2Y1CiyGxRwFfJ
 MI95L9Ya70kG1++88ggwCBavpnXlp02upMbYaT0YYsDta+wkYM0BxrbDohPXqjxweFeW
 T+1cWH4AIvKRnJvOalRrC0FL+NlrVM89bQ9qErPRD4pYrkx5dTizfdm+yA2xWfPQbb66
 lyxIAXRQyWj1E9CNv2Gd0NVI9oPaLeRmdcj3WxPlD5TbpixZ8l7SvLfih9hhGG5+Tbtl
 jcz4fTOXndmMlV/pwvzoZ6H35TJUh1zMlp/R92NTnzVVtQU9d64dgiRX4QxLATXt/55B
 4w/A==
X-Gm-Message-State: AOAM530yhH9yA2ZgsjKOBfLdU++YiB1d4EAK3Wr5vY9YwqOttos7i8Da
 9gY22XugFCMCsWZ4xtXoX9FN5TE3f1zkmviMcns=
X-Google-Smtp-Source: ABdhPJwVgZ42pcaufe0evF7s6sHz+6mDJjc8/6nXpXEddWAOyEjriqYkcXLe8PFaiyKfGE1qBhAhtG6Eoe+vlPNvEkc=
X-Received: by 2002:a05:6e02:218a:b0:2c8:1bf8:e15e with SMTP id
 j10-20020a056e02218a00b002c81bf8e15emr1617360ila.55.1648090442490; Wed, 23
 Mar 2022 19:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
 <20220318041944.19859-14-liweiwei@iscas.ac.cn>
In-Reply-To: <20220318041944.19859-14-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Mar 2022 12:53:36 +1000
Message-ID: <CAKmqyKP55v7XpnkRTM6JUC-CqmWSEK3PN2tBwpsgG1S2LxQZOQ@mail.gmail.com>
Subject: Re: [PATCH v9 13/14] disas/riscv.c: rvk: add disas support for Zbk*
 and Zk* instructions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 24 Mar 2022 02:54:06 -0000

On Fri, Mar 18, 2022 at 2:34 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 173 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 03c8dc9961..7af6afc8fa 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -156,6 +156,8 @@ typedef enum {
>      rv_codec_css_swsp,
>      rv_codec_css_sdsp,
>      rv_codec_css_sqsp,
> +    rv_codec_k_bs,
> +    rv_codec_k_rnum,
>  } rv_codec;
>
>  typedef enum {
> @@ -521,6 +523,43 @@ typedef enum {
>      rv_op_bclr = 359,
>      rv_op_binv = 360,
>      rv_op_bext = 361,
> +    rv_op_aes32esmi = 362,
> +    rv_op_aes32esi = 363,
> +    rv_op_aes32dsmi = 364,
> +    rv_op_aes32dsi = 365,
> +    rv_op_aes64ks1i = 366,
> +    rv_op_aes64ks2 = 367,
> +    rv_op_aes64im = 368,
> +    rv_op_aes64esm = 369,
> +    rv_op_aes64es = 370,
> +    rv_op_aes64dsm = 371,
> +    rv_op_aes64ds = 372,
> +    rv_op_sha256sig0 = 373,
> +    rv_op_sha256sig1 = 374,
> +    rv_op_sha256sum0 = 375,
> +    rv_op_sha256sum1 = 376,
> +    rv_op_sha512sig0 = 377,
> +    rv_op_sha512sig1 = 378,
> +    rv_op_sha512sum0 = 379,
> +    rv_op_sha512sum1 = 380,
> +    rv_op_sha512sum0r = 381,
> +    rv_op_sha512sum1r = 382,
> +    rv_op_sha512sig0l = 383,
> +    rv_op_sha512sig0h = 384,
> +    rv_op_sha512sig1l = 385,
> +    rv_op_sha512sig1h = 386,
> +    rv_op_sm3p0 = 387,
> +    rv_op_sm3p1 = 388,
> +    rv_op_sm4ed = 389,
> +    rv_op_sm4ks = 390,
> +    rv_op_brev8 = 391,
> +    rv_op_pack = 392,
> +    rv_op_packh = 393,
> +    rv_op_packw = 394,
> +    rv_op_unzip = 395,
> +    rv_op_zip = 396,
> +    rv_op_xperm4 = 397,
> +    rv_op_xperm8 = 398,
>  } rv_op;
>
>  /* structures */
> @@ -540,6 +579,8 @@ typedef struct {
>      uint8_t   succ;
>      uint8_t   aq;
>      uint8_t   rl;
> +    uint8_t   bs;
> +    uint8_t   rnum;
>  } rv_decode;
>
>  typedef struct {
> @@ -615,6 +656,8 @@ static const char rv_freg_name_sym[32][5] = {
>  #define rv_fmt_rd_rs2                 "O\t0,2"
>  #define rv_fmt_rs1_offset             "O\t1,o"
>  #define rv_fmt_rs2_offset             "O\t2,o"
> +#define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
> +#define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
>
>  /* pseudo-instruction constraints */
>
> @@ -766,6 +809,7 @@ static const rv_comp_data rvcp_csrrw[] = {
>      { rv_op_illegal, NULL }
>  };
>
> +
>  static const rv_comp_data rvcp_csrrs[] = {
>      { rv_op_rdcycle, rvcc_rdcycle },
>      { rv_op_rdtime, rvcc_rdtime },
> @@ -1203,6 +1247,43 @@ const rv_opcode_data opcode_data[] = {
>      { "bclr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "binv", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "bext", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "aes32esmi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
> +    { "aes32esi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
> +    { "aes32dsmi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
> +    { "aes32dsi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
> +    { "aes64ks1i", rv_codec_k_rnum,  rv_fmt_rd_rs1_rnum, NULL, 0, 0, 0 },
> +    { "aes64ks2", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "aes64im", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
> +    { "aes64esm", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "aes64es", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "aes64dsm", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "aes64ds", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha256sig0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
> +    { "sha256sig1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
> +    { "sha256sum0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
> +    { "sha256sum1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
> +    { "sha512sig0", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sig1", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sum0", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sum1", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sum0r", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sum1r", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sig0l", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sig0h", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sig1l", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sha512sig1h", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sm3p0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
> +    { "sm3p1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
> +    { "sm4ed", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
> +    { "sm4ks", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
> +    { "brev8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "pack", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "packh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "packw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "unzip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "zip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "xperm4", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 }
>  };
>
>  /* CSR names */
> @@ -1216,6 +1297,7 @@ static const char *csr_name(int csrno)
>      case 0x0003: return "fcsr";
>      case 0x0004: return "uie";
>      case 0x0005: return "utvec";
> +    case 0x0015: return "seed";
>      case 0x0040: return "uscratch";
>      case 0x0041: return "uepc";
>      case 0x0042: return "ucause";
> @@ -1594,7 +1676,36 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 1:
>                  switch (((inst >> 27) & 0b11111)) {
>                  case 0b00000: op = rv_op_slli; break;
> +                case 0b00001:
> +                    switch (((inst >> 20) & 0b1111111)) {
> +                    case 0b0001111: op = rv_op_zip; break;
> +                    }
> +                    break;
> +                case 0b00010:
> +                    switch (((inst >> 20) & 0b1111111)) {
> +                    case 0b0000000: op = rv_op_sha256sum0; break;
> +                    case 0b0000001: op = rv_op_sha256sum1; break;
> +                    case 0b0000010: op = rv_op_sha256sig0; break;
> +                    case 0b0000011: op = rv_op_sha256sig1; break;
> +                    case 0b0000100: op = rv_op_sha512sum0; break;
> +                    case 0b0000101: op = rv_op_sha512sum1; break;
> +                    case 0b0000110: op = rv_op_sha512sig0; break;
> +                    case 0b0000111: op = rv_op_sha512sig1; break;
> +                    case 0b0001000: op = rv_op_sm3p0; break;
> +                    case 0b0001001: op = rv_op_sm3p1; break;
> +                    }
> +                    break;
>                  case 0b00101: op = rv_op_bseti; break;
> +                case 0b00110:
> +                    switch (((inst >> 20) & 0b1111111)) {
> +                    case 0b0000000: op = rv_op_aes64im; break;
> +                    default:
> +                        if (((inst >> 24) & 0b0111) == 0b001) {
> +                            op = rv_op_aes64ks1i;
> +                        }
> +                        break;
> +                     }
> +                     break;
>                  case 0b01001: op = rv_op_bclri; break;
>                  case 0b01101: op = rv_op_binvi; break;
>                  case 0b01100:
> @@ -1615,13 +1726,20 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 5:
>                  switch (((inst >> 27) & 0b11111)) {
>                  case 0b00000: op = rv_op_srli; break;
> +                case 0b00001:
> +                    switch (((inst >> 20) & 0b1111111)) {
> +                    case 0b0001111: op = rv_op_unzip; break;
> +                    }
> +                    break;
>                  case 0b00101: op = rv_op_orc_b; break;
>                  case 0b01000: op = rv_op_srai; break;
>                  case 0b01001: op = rv_op_bexti; break;
>                  case 0b01100: op = rv_op_rori; break;
>                  case 0b01101:
>                      switch ((inst >> 20) & 0b1111111) {
> +                    case 0b0011000: op = rv_op_rev8; break;
>                      case 0b0111000: op = rv_op_rev8; break;
> +                    case 0b0000111: op = rv_op_brev8; break;
>                      }
>                      break;
>                  }
> @@ -1742,8 +1860,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 36:
>                  switch ((inst >> 20) & 0b11111) {
>                  case 0: op = rv_op_zext_h; break;
> +                default: op = rv_op_pack; break;
>                  }
>                  break;
> +            case 39: op = rv_op_packh; break;
> +
>              case 41: op = rv_op_clmul; break;
>              case 42: op = rv_op_clmulr; break;
>              case 43: op = rv_op_clmulh; break;
> @@ -1755,6 +1876,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 132: op = rv_op_sh2add; break;
>              case 134: op = rv_op_sh3add; break;
>              case 161: op = rv_op_bset; break;
> +            case 162: op = rv_op_xperm4; break;
> +            case 164: op = rv_op_xperm8; break;
> +            case 200: op = rv_op_aes64es; break;
> +            case 216: op = rv_op_aes64esm; break;
> +            case 232: op = rv_op_aes64ds; break;
> +            case 248: op = rv_op_aes64dsm; break;
>              case 256: op = rv_op_sub; break;
>              case 260: op = rv_op_xnor; break;
>              case 261: op = rv_op_sra; break;
> @@ -1762,9 +1889,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 263: op = rv_op_andn; break;
>              case 289: op = rv_op_bclr; break;
>              case 293: op = rv_op_bext; break;
> +            case 320: op = rv_op_sha512sum0r; break;
> +            case 328: op = rv_op_sha512sum1r; break;
> +            case 336: op = rv_op_sha512sig0l; break;
> +            case 344: op = rv_op_sha512sig1l; break;
> +            case 368: op = rv_op_sha512sig0h; break;
> +            case 376: op = rv_op_sha512sig1h; break;
>              case 385: op = rv_op_rol; break;
> -            case 386: op = rv_op_ror; break;
> +            case 389: op = rv_op_ror; break;
>              case 417: op = rv_op_binv; break;
> +            case 504: op = rv_op_aes64ks2; break;
> +            }
> +            switch ((inst >> 25) & 0b0011111) {
> +            case 17: op = rv_op_aes32esi; break;
> +            case 19: op = rv_op_aes32esmi; break;
> +            case 21: op = rv_op_aes32dsi; break;
> +            case 23: op = rv_op_aes32dsmi; break;
> +            case 24: op = rv_op_sm4ed; break;
> +            case 26: op = rv_op_sm4ks; break;
>              }
>              break;
>          case 13: op = rv_op_lui; break;
> @@ -1782,6 +1924,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 36:
>                  switch ((inst >> 20) & 0b11111) {
>                  case 0: op = rv_op_zext_h; break;
> +                default: op = rv_op_packw; break;
>                  }
>                  break;
>              case 130: op = rv_op_sh1add_uw; break;
> @@ -2374,6 +2517,16 @@ static uint32_t operand_cimmq(rv_inst inst)
>          ((inst << 57) >> 62) << 6;
>  }
>
> +static uint32_t operand_bs(rv_inst inst)
> +{
> +    return (inst << 32) >> 62;
> +}
> +
> +static uint32_t operand_rnum(rv_inst inst)
> +{
> +    return (inst << 40) >> 60;
> +}
> +
>  /* decode operands */
>
>  static void decode_inst_operands(rv_decode *dec)
> @@ -2653,6 +2806,16 @@ static void decode_inst_operands(rv_decode *dec)
>          dec->rs2 = operand_crs2(inst);
>          dec->imm = operand_cimmsqsp(inst);
>          break;
> +    case rv_codec_k_bs:
> +        dec->rs1 = operand_rs1(inst);
> +        dec->rs2 = operand_rs2(inst);
> +        dec->bs = operand_bs(inst);
> +        break;
> +    case rv_codec_k_rnum:
> +        dec->rd = operand_rd(inst);
> +        dec->rs1 = operand_rs1(inst);
> +        dec->rnum = operand_rnum(inst);
> +        break;
>      };
>  }
>
> @@ -2812,6 +2975,14 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
>          case ')':
>              append(buf, ")", buflen);
>              break;
> +        case 'b':
> +            snprintf(tmp, sizeof(tmp), "%d", dec->bs);
> +            append(buf, tmp, buflen);
> +            break;
> +        case 'n':
> +            snprintf(tmp, sizeof(tmp), "%d", dec->rnum);
> +            append(buf, tmp, buflen);
> +            break;
>          case '0':
>              append(buf, rv_ireg_name_sym[dec->rd], buflen);
>              break;
> --
> 2.17.1
>
>

