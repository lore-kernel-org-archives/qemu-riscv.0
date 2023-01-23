Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6P7-0006bJ-Mw
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6P5-0006ax-BY; Mon, 23 Jan 2023 18:39:07 -0500
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6P3-00067B-87; Mon, 23 Jan 2023 18:39:07 -0500
Received: by mail-vk1-xa29.google.com with SMTP id z3so4711748vkb.11;
 Mon, 23 Jan 2023 15:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubGspUKcffzoh4eacrgeVPlDL0KAstMlB+WGpWJjB3o=;
 b=jzNF0XASDl5tNIaS/R+n4sJM6+wNE1qpA+oKF8+A+1/LzUoTzbmQwNZmPjofLp4vWW
 bRPFEnk9wrb6Q5fKDNAGnXPGHzLV6vpvF5oklsoU6CmbdC+aEUBblEsJEeE1P7LQ06TR
 eoswJEm4q68Ix65uPNJNsx6sQa6QRIp26RWd5s+sUIyMPp9AASEqsxwoMRCBv1S5Rw0S
 0x3xjtWRC9ko48lwBHkhW7QbFhZgXPm9vWulnHs+bd8iT5IXUs6DRIx8N8ecklC6Jozq
 fiRNiLF+1ddyGHFBRG6Y66FFASbmC4jte1oMORtvD450FfNBa5gFuIgqaQdfZVaWJiCw
 MxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubGspUKcffzoh4eacrgeVPlDL0KAstMlB+WGpWJjB3o=;
 b=lgNWTBqvDpL2uzmYmpjxYIAekyGnknXXuAeI5xGEAYZUFdRUPecUNNRpw8MgapOFXI
 3DoM/Y620PNaY7YNtKtXdclr9/Zk8t4+qRDRmusuEHK9qg4XGyf3hCkzAFkEnK8Iiu6g
 fcnu9hDg2pfe0snYNHeoFmIwgrDXRq2IFUR6T4Jdgdmh37TbtMI6Uq7/N1sq6DgvBAKz
 qxU99ckkXT5vYn9jmWlB1k3P3kznfrJ5OcHxPg3hUQzdTuyUnZIYn1Ty7PWYSnRT4EQT
 ShwSDTEEUXUl+nA2iV72wQ9znwY3E7BqbqCQKSpY6hzcB8SL/X70IAxqbVPm5xJebibF
 6BOA==
X-Gm-Message-State: AFqh2kovkxh19QDRjKrCfxXDu+Ik+iEfFiL95I9tZzuAMsEo/MBQ0qvL
 N7jEiTy5HWdY53ZX/f2xuULujmbwCjowTBWywbM=
X-Google-Smtp-Source: AMrXdXsAoUNDzI63RGhMUy3F8sqcRX4sqO9bTb3PrnUTuIfdOIOrkxCZExKOItHIzsBwrkjdfwJMhnA7p2FVPBt8NF0=
X-Received: by 2002:a1f:b681:0:b0:3dd:fc42:994d with SMTP id
 g123-20020a1fb681000000b003ddfc42994dmr3531397vkf.25.1674517143698; Mon, 23
 Jan 2023 15:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-11-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-11-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:38:37 +1000
Message-ID: <CAKmqyKMH0QNeEgP2VGbYULPmm34oUGYTFf7-Md7kUKz3kxk7Eg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] RISC-V: Adding T-Head FMemIdx extension
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:39:07 -0000

On Sat, Dec 24, 2022 at 4:09 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the T-Head FMemIdx instructions.
> The patch uses the T-Head specific decoder and translation.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Use single decoder for XThead extensions
> - Use get_th_address_indexed for address calculations
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |   2 +
>  target/riscv/cpu.h                         |   1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 108 +++++++++++++++++++++
>  target/riscv/translate.c                   |   3 +-
>  target/riscv/xthead.decode                 |  10 ++
>  5 files changed, 123 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1fbfb7ccc3..9c31a50e90 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -113,6 +113,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs=
),
>      ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
>      ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xth=
eadcondmov),
> +    ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xth=
eadfmemidx),
>      ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadm=
ac),
>      ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xthe=
admemidx),
>      ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
> @@ -1074,6 +1075,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
> +    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, f=
alse),
>      DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
>      DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
>      DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 965dc46591..c97c1c0af0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -470,6 +470,7 @@ struct RISCVCPUConfig {
>      bool ext_xtheadbs;
>      bool ext_xtheadcmo;
>      bool ext_xtheadcondmov;
> +    bool ext_xtheadfmemidx;
>      bool ext_xtheadmac;
>      bool ext_xtheadmemidx;
>      bool ext_xtheadmempair;
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 02b82ac327..dc1a11070e 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -46,6 +46,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADFMEMIDX(ctx) do {          \
> +    if (!ctx->cfg_ptr->ext_xtheadfmemidx) {      \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADMAC(ctx) do {              \
>      if (!ctx->cfg_ptr->ext_xtheadmac) {          \
>          return false;                            \
> @@ -349,6 +355,108 @@ static bool trans_th_mvnez(DisasContext *ctx, arg_t=
h_mveqz *a)
>      return gen_th_condmove(ctx, a, TCG_COND_NE);
>  }
>
> +/* XTheadFMem */
> +
> +/*
> + * Load 64-bit float from indexed address.
> + * If !zext_offs, then address is rs1 + (rs2 << imm2).
> + * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
> + */
> +static bool gen_fload_idx(DisasContext *ctx, arg_th_memidx *a, MemOp mem=
op,
> +                          bool zext_offs)
> +{
> +    TCGv_i64 rd =3D cpu_fpr[a->rd];
> +    TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
> +
> +    tcg_gen_qemu_ld_i64(rd, addr, ctx->mem_idx, memop);
> +    if ((memop & MO_SIZE) =3D=3D MO_32) {
> +        gen_nanbox_s(rd, rd);
> +    }
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +/*
> + * Store 64-bit float to indexed address.
> + * If !zext_offs, then address is rs1 + (rs2 << imm2).
> + * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
> + */
> +static bool gen_fstore_idx(DisasContext *ctx, arg_th_memidx *a, MemOp me=
mop,
> +                           bool zext_offs)
> +{
> +    TCGv_i64 rd =3D cpu_fpr[a->rd];
> +    TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
> +
> +    tcg_gen_qemu_st_i64(rd, addr, ctx->mem_idx, memop);
> +
> +    return true;
> +}
> +
> +static bool trans_th_flrd(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADFMEMIDX(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVD);
> +    return gen_fload_idx(ctx, a, MO_TEUQ, false);
> +}
> +
> +static bool trans_th_flrw(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADFMEMIDX(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +    return gen_fload_idx(ctx, a, MO_TEUL, false);
> +}
> +
> +static bool trans_th_flurd(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADFMEMIDX(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVD);
> +    return gen_fload_idx(ctx, a, MO_TEUQ, true);
> +}
> +
> +static bool trans_th_flurw(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADFMEMIDX(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +    return gen_fload_idx(ctx, a, MO_TEUL, true);
> +}
> +
> +static bool trans_th_fsrd(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADFMEMIDX(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVD);
> +    return gen_fstore_idx(ctx, a, MO_TEUQ, false);
> +}
> +
> +static bool trans_th_fsrw(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADFMEMIDX(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +    return gen_fstore_idx(ctx, a, MO_TEUL, false);
> +}
> +
> +static bool trans_th_fsurd(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADFMEMIDX(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVD);
> +    return gen_fstore_idx(ctx, a, MO_TEUQ, true);
> +}
> +
> +static bool trans_th_fsurw(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADFMEMIDX(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +    return gen_fstore_idx(ctx, a, MO_TEUL, true);
> +}
> +
>  /* XTheadMac */
>
>  static bool gen_th_mac(DisasContext *ctx, arg_r *a,
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f5a870a2ac..fb77df721e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -129,7 +129,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
>  {
>      return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
>             ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
> -           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadma=
c ||
> +           ctx->cfg_ptr->ext_xtheadcondmov ||
> +           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadma=
c ||
>             ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmem=
pair ||
>             ctx->cfg_ptr->ext_xtheadsync;
>  }
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index 69e40f22dc..81daf1d694 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -100,6 +100,16 @@ th_l2cache_iall  0000000 10110 00000 000 00000 00010=
11
>  th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
>  th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
>
> +# XTheadFMemIdx
> +th_flrd          01100 .. ..... ..... 110 ..... 0001011 @th_memidx
> +th_flrw          01000 .. ..... ..... 110 ..... 0001011 @th_memidx
> +th_flurd         01110 .. ..... ..... 110 ..... 0001011 @th_memidx
> +th_flurw         01010 .. ..... ..... 110 ..... 0001011 @th_memidx
> +th_fsrd          01100 .. ..... ..... 111 ..... 0001011 @th_memidx
> +th_fsrw          01000 .. ..... ..... 111 ..... 0001011 @th_memidx
> +th_fsurd         01110 .. ..... ..... 111 ..... 0001011 @th_memidx
> +th_fsurw         01010 .. ..... ..... 111 ..... 0001011 @th_memidx
> +
>  # XTheadMac
>  th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
>  th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
> --
> 2.38.1
>
>

