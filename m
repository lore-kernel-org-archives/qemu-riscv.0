Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvVGt-0001qK-Co
	for mharc-qemu-riscv@gnu.org; Thu, 09 Dec 2021 21:04:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mvVGr-0001pH-Mk; Thu, 09 Dec 2021 21:04:25 -0500
Received: from [2607:f8b0:4864:20::136] (port=45777
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mvVGo-0004aa-89; Thu, 09 Dec 2021 21:04:24 -0500
Received: by mail-il1-x136.google.com with SMTP id w4so7152539ilv.12;
 Thu, 09 Dec 2021 18:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V+9BeIMVdJ7d92n0CCRU4L7izKUKvDbt/1H8o7cRqgQ=;
 b=ioiqHnwnU6dP5ZgNrF0D3u/FtKfwjcrja4PW1s+e55835rwyvRM1QpMbz20cLBYs9r
 C7tw8vSszdRyofTuuEhu4uxbp/khmbQDHj1NpFFMCqbHGPrD+QkOOiABnskBhr6tZ+wD
 apUBoFcW5cFgiV5SMJ1an3BTdOijyEYPhbRGpitPdf/fERZVAF9StNMesfjsoX3op5r8
 EfpDK9SVN7ewepQW3F5mRZVcc0fIf5WmMvymj4ciFTtIKiXm0HUy5NdM43B9EONFMDu2
 sWHs3zlHCC/KAAytW22ky1ARgN4XW+1PAC2daUbmQI59GCS0mJM3PtfRMACqwmpen6I5
 PNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V+9BeIMVdJ7d92n0CCRU4L7izKUKvDbt/1H8o7cRqgQ=;
 b=uLiD8WdFgtXmZw86QVy3X2d1X4tNUhgKxLhKDS5UtBMqMGjnfaViOEeLebLqQDl4kN
 qYcIV/YaHohpAfRS3hu+ITwNu355NiLOiH5tBvQ2KOwthVx+9jYwijb4XYcTEd9fk6cc
 J+SrB+zvi2NKQZMeIVn/gkld0QLAkBfxaGFhsSFza7jOEgR5Kw/ZvRtjcFIYGlHVRxYI
 K9Kl1TeNo+v4o66HINxCYxNsfSjNGso5kLkkRFCqMpDFC8QE2Ls4cow8dv7nCXkBAcic
 VSvKLtg1DplJlBxZoeDCXGKYyLvFsK3FXz3bONhLYR7M06S8tmEhvWKMjCdpIZ7VsCc5
 4u7Q==
X-Gm-Message-State: AOAM531IgL/R3Rqsz73dxs30Vrb6vieeFlvkaZsXb4wTM7RGI1O1QJ1l
 5jzOeuhy5lM+Htyle/nyP1J4dR++rJrBs4oh0MY=
X-Google-Smtp-Source: ABdhPJzD2CrP8obgmF6bsQQoy/YyV5iS+lFhlla5m/Zr1GSJf7AvD2j1urWznDI0cXSfEwPG8ZgUp1wHPEa/I2WukXc=
X-Received: by 2002:a05:6e02:1b08:: with SMTP id
 i8mr15211824ilv.74.1639101859859; 
 Thu, 09 Dec 2021 18:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211128135719.50444-10-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211128135719.50444-10-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Dec 2021 12:03:54 +1000
Message-ID: <CAKmqyKPVcED8rdPecGkUngEQchQ3i+Z43v0wMqSmDa2bGan=BA@mail.gmail.com>
Subject: Re: [PATCH v6 09/18] target/riscv: accessors to registers upper part
 and 128-bit load/store
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 02:04:26 -0000

On Mon, Nov 29, 2021 at 12:03 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Get function to retrieve the 64 top bits of a register, stored in the gpr=
h
> field of the cpu state. Set function that writes the 128-bit value at onc=
e.
> The access to the gprh field can not be protected at compile time to make
> sure it is accessed only in the 128-bit version of the processor because =
we
> have no way to indicate that the misa_mxl_max field is const.
>
> The 128-bit ISA adds ldu, lq and sq. We provide support for these
> instructions. Note that (a) we compute only 64-bit addresses to actually
> access memory, cowardly utilizing the existing address translation mechan=
ism
> of QEMU, and (b) we assume for now little-endian memory accesses.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn16.decode              |  27 ++++++-
>  target/riscv/insn32.decode              |   5 ++
>  target/riscv/translate.c                |  41 ++++++++++
>  target/riscv/insn_trans/trans_rvi.c.inc | 100 ++++++++++++++++++++++--
>  4 files changed, 163 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
> index 2e9212663c..02c8f61b48 100644
> --- a/target/riscv/insn16.decode
> +++ b/target/riscv/insn16.decode
> @@ -25,14 +25,17 @@
>  # Immediates:
>  %imm_ci        12:s1 2:5
>  %nzuimm_ciw    7:4 11:2 5:1 6:1   !function=3Dex_shift_2
> +%uimm_cl_q     10:1 5:2 11:2      !function=3Dex_shift_4
>  %uimm_cl_d     5:2 10:3           !function=3Dex_shift_3
>  %uimm_cl_w     5:1 10:3 6:1       !function=3Dex_shift_2
>  %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=3Dex_shift_1
>  %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=3Dex_shift_1
>
>  %shimm_6bit   12:1 2:5               !function=3Dex_rvc_shifti
> +%uimm_6bit_lq 2:4 12:1 6:1           !function=3Dex_shift_4
>  %uimm_6bit_ld 2:3 12:1 5:2           !function=3Dex_shift_3
>  %uimm_6bit_lw 2:2 12:1 4:3           !function=3Dex_shift_2
> +%uimm_6bit_sq 7:4 11:2               !function=3Dex_shift_4
>  %uimm_6bit_sd 7:3 10:3               !function=3Dex_shift_3
>  %uimm_6bit_sw 7:2 9:4                !function=3Dex_shift_2
>
> @@ -54,16 +57,20 @@
>  # Formats 16:
>  @cr        ....  ..... .....  .. &r      rs2=3D%rs2_5       rs1=3D%rd   =
  %rd
>  @ci        ... . ..... .....  .. &i      imm=3D%imm_ci      rs1=3D%rd   =
  %rd
> +@cl_q      ... . .....  ..... .. &i      imm=3D%uimm_cl_q   rs1=3D%rs1_3=
  rd=3D%rs2_3
>  @cl_d      ... ... ... .. ... .. &i      imm=3D%uimm_cl_d   rs1=3D%rs1_3=
  rd=3D%rs2_3
>  @cl_w      ... ... ... .. ... .. &i      imm=3D%uimm_cl_w   rs1=3D%rs1_3=
  rd=3D%rs2_3
>  @cs_2      ... ... ... .. ... .. &r      rs2=3D%rs2_3       rs1=3D%rs1_3=
  rd=3D%rs1_3
> +@cs_q      ... ... ... .. ... .. &s      imm=3D%uimm_cl_q   rs1=3D%rs1_3=
  rs2=3D%rs2_3
>  @cs_d      ... ... ... .. ... .. &s      imm=3D%uimm_cl_d   rs1=3D%rs1_3=
  rs2=3D%rs2_3
>  @cs_w      ... ... ... .. ... .. &s      imm=3D%uimm_cl_w   rs1=3D%rs1_3=
  rs2=3D%rs2_3
>  @cj        ...    ........... .. &j      imm=3D%imm_cj
>  @cb_z      ... ... ... .. ... .. &b      imm=3D%imm_cb      rs1=3D%rs1_3=
  rs2=3D0
>
> +@c_lqsp    ... . .....  ..... .. &i      imm=3D%uimm_6bit_lq rs1=3D2 %rd
>  @c_ldsp    ... . .....  ..... .. &i      imm=3D%uimm_6bit_ld rs1=3D2 %rd
>  @c_lwsp    ... . .....  ..... .. &i      imm=3D%uimm_6bit_lw rs1=3D2 %rd
> +@c_sqsp    ... . .....  ..... .. &s      imm=3D%uimm_6bit_sq rs1=3D2 rs2=
=3D%rs2_5
>  @c_sdsp    ... . .....  ..... .. &s      imm=3D%uimm_6bit_sd rs1=3D2 rs2=
=3D%rs2_5
>  @c_swsp    ... . .....  ..... .. &s      imm=3D%uimm_6bit_sw rs1=3D2 rs2=
=3D%rs2_5
>  @c_li      ... . .....  ..... .. &i      imm=3D%imm_ci rs1=3D0 %rd
> @@ -87,9 +94,15 @@
>    illegal         000  000 000 00 --- 00
>    addi            000  ... ... .. ... 00 @c_addi4spn
>  }
> -fld               001  ... ... .. ... 00 @cl_d
> +{
> +  lq              001  ... ... .. ... 00 @cl_q
> +  fld             001  ... ... .. ... 00 @cl_d
> +}
>  lw                010  ... ... .. ... 00 @cl_w
> -fsd               101  ... ... .. ... 00 @cs_d
> +{
> +  sq              101  ... ... .. ... 00 @cs_q
> +  fsd             101  ... ... .. ... 00 @cs_d
> +}
>  sw                110  ... ... .. ... 00 @cs_w
>
>  # *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
> @@ -132,7 +145,10 @@ addw              100 1 11 ... 01 ... 01 @cs_2
>
>  # *** RV32/64C Standard Extension (Quadrant 2) ***
>  slli              000 .  .....  ..... 10 @c_shift2
> -fld               001 .  .....  ..... 10 @c_ldsp
> +{
> +  lq              001  ... ... .. ... 10 @c_lqsp
> +  fld             001 .  .....  ..... 10 @c_ldsp
> +}
>  {
>    illegal         010 -  00000  ----- 10 # c.lwsp, RES rd=3D0
>    lw              010 .  .....  ..... 10 @c_lwsp
> @@ -147,7 +163,10 @@ fld               001 .  .....  ..... 10 @c_ldsp
>    jalr            100 1  .....  00000 10 @c_jalr rd=3D1  # C.JALR
>    add             100 1  .....  ..... 10 @cr
>  }
> -fsd               101   ......  ..... 10 @c_sdsp
> +{
> +  sq              101  ... ... .. ... 10 @c_sqsp
> +  fsd             101   ......  ..... 10 @c_sdsp
> +}
>  sw                110 .  .....  ..... 10 @c_swsp
>
>  # *** RV32C and RV64C specific Standard Extension (Quadrant 2) ***
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 2f251dac1b..02889c6082 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -163,6 +163,11 @@ sllw     0000000 .....  ..... 001 ..... 0111011 @r
>  srlw     0000000 .....  ..... 101 ..... 0111011 @r
>  sraw     0100000 .....  ..... 101 ..... 0111011 @r
>
> +# *** RV128I Base Instruction Set (in addition to RV64I) ***
> +ldu      ............   ..... 111 ..... 0000011 @i
> +lq       ............   ..... 010 ..... 0001111 @i
> +sq       ............   ..... 100 ..... 0100011 @s
> +
>  # *** RV32M Standard Extension ***
>  mul      0000001 .....  ..... 000 ..... 0110011 @r
>  mulh     0000001 .....  ..... 001 ..... 0110011 @r
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f969885eed..b6127783b3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -58,6 +58,7 @@ typedef struct DisasContext {
>      /* pc_succ_insn points to the instruction following base.pc_next */
>      target_ulong pc_succ_insn;
>      target_ulong priv_ver;
> +    RISCVMXL misa_mxl_max;
>      RISCVMXL xl;
>      uint32_t misa_ext;
>      uint32_t opcode;
> @@ -123,6 +124,13 @@ static inline int get_olen(DisasContext *ctx)
>      return 16 << get_ol(ctx);
>  }
>
> +/* The maximum register length */
> +#ifdef TARGET_RISCV32
> +#define get_xl_max(ctx)    MXL_RV32
> +#else
> +#define get_xl_max(ctx)    ((ctx)->misa_mxl_max)
> +#endif
> +
>  /*
>   * RISC-V requires NaN-boxing of narrower width floating point values.
>   * This applies when a 32-bit value is assigned to a 64-bit FP register.
> @@ -227,6 +235,7 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, D=
isasExtend ext)
>          }
>          break;
>      case MXL_RV64:
> +    case MXL_RV128:
>          break;
>      default:
>          g_assert_not_reached();
> @@ -234,6 +243,15 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, =
DisasExtend ext)
>      return cpu_gpr[reg_num];
>  }
>
> +static TCGv get_gprh(DisasContext *ctx, int reg_num)
> +{
> +    assert(get_xl(ctx) =3D=3D MXL_RV128);
> +    if (reg_num =3D=3D 0) {
> +        return ctx->zero;
> +    }
> +    return cpu_gprh[reg_num];
> +}
> +
>  static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>  {
>      if (reg_num =3D=3D 0 || get_olen(ctx) < TARGET_LONG_BITS) {
> @@ -242,6 +260,14 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
>      return cpu_gpr[reg_num];
>  }
>
> +static TCGv dest_gprh(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num =3D=3D 0) {
> +        return temp_new(ctx);
> +    }
> +    return cpu_gprh[reg_num];
> +}
> +
>  static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
>  {
>      if (reg_num !=3D 0) {
> @@ -250,11 +276,25 @@ static void gen_set_gpr(DisasContext *ctx, int reg_=
num, TCGv t)
>              tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
>              break;
>          case MXL_RV64:
> +        case MXL_RV128:
>              tcg_gen_mov_tl(cpu_gpr[reg_num], t);
>              break;
>          default:
>              g_assert_not_reached();
>          }
> +
> +        if (get_xl_max(ctx) =3D=3D MXL_RV128) {
> +            tcg_gen_sari_tl(cpu_gprh[reg_num], cpu_gpr[reg_num], 63);
> +        }
> +    }
> +}
> +
> +static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv=
 rh)
> +{
> +    assert(get_ol(ctx) =3D=3D MXL_RV128);
> +    if (reg_num !=3D 0) {
> +        tcg_gen_mov_tl(cpu_gpr[reg_num], rl);
> +        tcg_gen_mov_tl(cpu_gprh[reg_num], rh);
>      }
>  }
>
> @@ -673,6 +713,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      ctx->lmul =3D FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen =3D 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->misa_mxl_max =3D env->misa_mxl_max;
>      ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
>      ctx->cs =3D cs;
>      ctx->ntemp =3D 0;
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index 710f5e6a85..e572976e88 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -134,7 +134,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a=
)
>      return gen_branch(ctx, a, TCG_COND_GEU);
>  }
>
> -static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
> +static bool gen_load_tl(DisasContext *ctx, arg_lb *a, MemOp memop)
>  {
>      TCGv dest =3D dest_gpr(ctx, a->rd);
>      TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> @@ -151,6 +151,45 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, M=
emOp memop)
>      return true;
>  }
>
> +/* Compute only 64-bit addresses to use the address translation mechanis=
m */
> +static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
> +{
> +    TCGv src1l =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv destl =3D dest_gpr(ctx, a->rd);
> +    TCGv desth =3D dest_gprh(ctx, a->rd);
> +    TCGv addrl =3D tcg_temp_new();
> +
> +    tcg_gen_addi_tl(addrl, src1l, a->imm);
> +
> +    if ((memop & MO_SIZE) <=3D MO_64) {
> +        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, memop);
> +        if (memop & MO_SIGN) {
> +            tcg_gen_sari_tl(desth, destl, 63);
> +        } else {
> +            tcg_gen_movi_tl(desth, 0);
> +        }
> +    } else {
> +        /* assume little-endian memory access for now */
> +        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, MO_TEUQ);
> +        tcg_gen_addi_tl(addrl, addrl, 8);
> +        tcg_gen_qemu_ld_tl(desth, addrl, ctx->mem_idx, MO_TEUQ);
> +    }
> +
> +    gen_set_gpr128(ctx, a->rd, destl, desth);
> +
> +    tcg_temp_free(addrl);
> +    return true;
> +}
> +
> +static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
> +{
> +    if (get_xl(ctx) =3D=3D MXL_RV128) {
> +        return gen_load_i128(ctx, a, memop);
> +    } else {
> +        return gen_load_tl(ctx, a, memop);
> +    }
> +}
> +
>  static bool trans_lb(DisasContext *ctx, arg_lb *a)
>  {
>      return gen_load(ctx, a, MO_SB);
> @@ -166,6 +205,18 @@ static bool trans_lw(DisasContext *ctx, arg_lw *a)
>      return gen_load(ctx, a, MO_TESL);
>  }
>
> +static bool trans_ld(DisasContext *ctx, arg_ld *a)
> +{
> +    REQUIRE_64_OR_128BIT(ctx);
> +    return gen_load(ctx, a, MO_TESQ);
> +}
> +
> +static bool trans_lq(DisasContext *ctx, arg_lq *a)
> +{
> +    REQUIRE_128BIT(ctx);
> +    return gen_load(ctx, a, MO_TEUO);
> +}
> +
>  static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
>  {
>      return gen_load(ctx, a, MO_UB);
> @@ -178,17 +229,17 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a=
)
>
>  static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
>  {
> -    REQUIRE_64BIT(ctx);
> +    REQUIRE_64_OR_128BIT(ctx);
>      return gen_load(ctx, a, MO_TEUL);
>  }
>
> -static bool trans_ld(DisasContext *ctx, arg_ld *a)
> +static bool trans_ldu(DisasContext *ctx, arg_ldu *a)
>  {
> -    REQUIRE_64BIT(ctx);
> +    REQUIRE_128BIT(ctx);
>      return gen_load(ctx, a, MO_TEUQ);
>  }
>
> -static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
> +static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
>  {
>      TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
>      TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
> @@ -204,6 +255,37 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, =
MemOp memop)
>      return true;
>  }
>
> +static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
> +{
> +    TCGv src1l =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2l =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGv src2h =3D get_gprh(ctx, a->rs2);
> +    TCGv addrl =3D tcg_temp_new();
> +
> +    tcg_gen_addi_tl(addrl, src1l, a->imm);
> +
> +    if ((memop & MO_SIZE) <=3D MO_64) {
> +        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
> +    } else {
> +        /* little-endian memory access assumed for now */
> +        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, MO_TEUQ);
> +        tcg_gen_addi_tl(addrl, addrl, 8);
> +        tcg_gen_qemu_st_tl(src2h, addrl, ctx->mem_idx, MO_TEUQ);
> +    }
> +
> +    tcg_temp_free(addrl);
> +    return true;
> +}
> +
> +static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
> +{
> +    if (get_xl(ctx) =3D=3D MXL_RV128) {
> +        return gen_store_i128(ctx, a, memop);
> +    } else {
> +        return gen_store_tl(ctx, a, memop);
> +    }
> +}
> +
>  static bool trans_sb(DisasContext *ctx, arg_sb *a)
>  {
>      return gen_store(ctx, a, MO_SB);
> @@ -221,10 +303,16 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
>
>  static bool trans_sd(DisasContext *ctx, arg_sd *a)
>  {
> -    REQUIRE_64BIT(ctx);
> +    REQUIRE_64_OR_128BIT(ctx);
>      return gen_store(ctx, a, MO_TEUQ);
>  }
>
> +static bool trans_sq(DisasContext *ctx, arg_sq *a)
> +{
> +    REQUIRE_128BIT(ctx);
> +    return gen_store(ctx, a, MO_TEUO);
> +}
> +
>  static bool trans_addi(DisasContext *ctx, arg_addi *a)
>  {
>      return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
> --
> 2.34.0
>
>

