Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5sJ-0007tJ-4h
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5s1-0007rl-VO; Mon, 23 Jan 2023 18:04:57 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5ry-0000NO-1j; Mon, 23 Jan 2023 18:04:56 -0500
Received: by mail-vs1-xe32.google.com with SMTP id 187so14712571vsv.10;
 Mon, 23 Jan 2023 15:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShWUKaBG04IPmEUdwFbTLWaNjz3exeiM/t4OFaWOwA4=;
 b=MxTeh7jUDobm1eOT7RKWDuN7FYgGRSC2VAEEHOWR/WcgKZUpRNnI9DwkcD/A57XZE0
 ScSHP4QOAbhhldk45nEHlMKuEt4lDs6ZDp17egi5mTxiBnPlNhTHS5cv/3eulrciOzDz
 alY9WGG+IJw09gHY7F8wth3QZ7MLBR7e6sBQZuH5P7leTlAIDN/wswzyUn88BxC033N7
 W15P87ezqfXVuqeezbIBM9OxWKNTuSCH2LldsXVFqaLyDt4LoO23XdS5oCJOS3mmRPUB
 91ofMeveDgMEom5k2jWhVsS/4d5GvIlVXzZW92CbNAkkG4ksF+Krg84nNgJeOoqBBJLD
 j2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShWUKaBG04IPmEUdwFbTLWaNjz3exeiM/t4OFaWOwA4=;
 b=8RIOqlNg7Aj5yewPF0D9uEtCP0edrDJ4A4kVzEhBX03WMxJrqrbraHHlcLu8JL8kiT
 XpEX5aC20ZvcZibt1+AUlgAvfi9isDlbjSWoce5XCWVH2q5stFDt9dRi0NmhvPD5jUNd
 NetsZXZsKRQNCWuShYXNnG7PxBj+TfuHz//adOiVM5WXtmMN5shh6XuCNrAR1tm59pvs
 5FbGFmnqCkpl/LJ9Bwh6HBjWIIs8alDJZI9nKFbZOE8/yAl55tRy7i+jnzzsazBPgN9i
 8JaKQGGfDup/tDrH42sxb80irmInVHYwEzxdTP5y6FoLwHATCe996CqW+ljlrSIUn/bj
 05kw==
X-Gm-Message-State: AFqh2krCCEoYOQVrMWvyqb8YfvXBcCjlNC5XWDsjh1AT/fouTpYFTavD
 edUBweJ7Jc4oCawdkWP7XBrNQKA5C6EsT+05NKY=
X-Google-Smtp-Source: AMrXdXs+U0QvSI/WfXPUcapQCTbb+rNU4Vtx0iluig39icsTY5p3qC+zpzXh1/9Efqq67T9AE962z02HWzhvcfXTOdo=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr3369826vst.54.1674515092015; Mon, 23
 Jan 2023 15:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-10-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-10-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:04:25 +1000
Message-ID: <CAKmqyKNZnZ1e5vTo0LC=4umFOziWvKZShcPM2BeEASj48eK+GA@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] RISC-V: Adding T-Head MemIdx extension
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:04:58 -0000

On Sat, Dec 24, 2022 at 4:04 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the T-Head MemIdx instructions.
> The patch uses the T-Head specific decoder and translation.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Use single decoder for XThead extensions
> - Avoid signed-bitfield-extraction by using signed immediate field imm5
> - Use get_address() to calculate addresses
> - Introduce helper get_th_address_indexed for rs1+(rs2<<imm2) calculation
> - Introduce get_address_indexed() for register offsets (like get_address(=
))
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |   2 +
>  target/riscv/cpu.h                         |   1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 377 +++++++++++++++++++++
>  target/riscv/translate.c                   |  21 +-
>  target/riscv/xthead.decode                 |  54 +++
>  5 files changed, 454 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index de00f69710..1fbfb7ccc3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -114,6 +114,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
>      ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xth=
eadcondmov),
>      ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadm=
ac),
> +    ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xthe=
admemidx),
>      ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
>      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
> @@ -1074,6 +1075,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
>      DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
> +    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
>      DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
>      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 836445115e..965dc46591 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -471,6 +471,7 @@ struct RISCVCPUConfig {
>      bool ext_xtheadcmo;
>      bool ext_xtheadcondmov;
>      bool ext_xtheadmac;
> +    bool ext_xtheadmemidx;
>      bool ext_xtheadmempair;
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 49314306eb..02b82ac327 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -52,6 +52,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADMEMIDX(ctx) do {           \
> +    if (!ctx->cfg_ptr->ext_xtheadmemidx) {       \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADMEMPAIR(ctx) do {          \
>      if (!ctx->cfg_ptr->ext_xtheadmempair) {      \
>          return false;                            \
> @@ -64,6 +70,30 @@
>      }                                            \
>  } while (0)
>
> +/*
> + * Calculate and return the address for indexed mem operations:
> + * If !zext_offs, then the address is rs1 + (rs2 << imm2).
> + * If  zext_offs, then the address is rs1 + (zext(rs2[31:0]) << imm2).
> + */
> +static TCGv get_th_address_indexed(DisasContext *ctx, int rs1, int rs2,
> +                                   int imm2, bool zext_offs)
> +{
> +    TCGv src2 =3D get_gpr(ctx, rs2, EXT_NONE);
> +    TCGv offs =3D tcg_temp_new();
> +
> +    if (zext_offs) {
> +        tcg_gen_extract_tl(offs, src2, 0, 32);
> +        tcg_gen_shli_tl(offs, offs, imm2);
> +    } else {
> +        tcg_gen_shli_tl(offs, src2, imm2);
> +    }
> +
> +    TCGv addr =3D get_address_indexed(ctx, rs1, offs);
> +
> +    tcg_temp_free(offs);
> +    return addr;
> +}
> +
>  /* XTheadBa */
>
>  /*
> @@ -396,6 +426,353 @@ static bool trans_th_mulsw(DisasContext *ctx, arg_t=
h_mulsw *a)
>      return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
>  }
>
> +/* XTheadMemIdx */
> +
> +/*
> + * Load with memop from indexed address and add (imm5 << imm2) to rs1.
> + * If !preinc, then the load address is rs1.
> + * If  preinc, then the load address is rs1 + (imm5) << imm2).
> + */
> +static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memo=
p,
> +                         bool preinc)
> +{
> +    TCGv rd =3D dest_gpr(ctx, a->rd);
> +    TCGv addr =3D get_address(ctx, a->rs1, preinc ? a->imm5 << a->imm2 :=
 0);
> +
> +    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
> +    addr =3D get_address(ctx, a->rs1, !preinc ? a->imm5 << a->imm2 : 0);
> +    gen_set_gpr(ctx, a->rd, rd);
> +    gen_set_gpr(ctx, a->rs1, addr);
> +
> +    return true;
> +}
> +
> +/*
> + * Store with memop to indexed address and add (imm5 << imm2) to rs1.
> + * If !preinc, then the store address is rs1.
> + * If  preinc, then the store address is rs1 + (imm5) << imm2).
> + */
> +static bool gen_store_inc(DisasContext *ctx, arg_th_meminc *a, MemOp mem=
op,
> +                          bool preinc)
> +{
> +    TCGv data =3D get_gpr(ctx, a->rd, EXT_NONE);
> +    TCGv addr =3D get_address(ctx, a->rs1, preinc ? a->imm5 << a->imm2 :=
 0);
> +
> +    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
> +    addr =3D get_address(ctx, a->rs1, !preinc ? a->imm5 << a->imm2 : 0);
> +    gen_set_gpr(ctx, a->rs1, addr);
> +
> +    return true;
> +}
> +
> +static bool trans_th_ldia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_load_inc(ctx, a, MO_TESQ, false);
> +}
> +
> +static bool trans_th_ldib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_load_inc(ctx, a, MO_TESQ, true);
> +}
> +
> +static bool trans_th_lwia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_TESL, false);
> +}
> +
> +static bool trans_th_lwib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_TESL, true);
> +}
> +
> +static bool trans_th_lwuia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_load_inc(ctx, a, MO_TEUL, false);
> +}
> +
> +static bool trans_th_lwuib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_load_inc(ctx, a, MO_TEUL, true);
> +}
> +
> +static bool trans_th_lhia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_TESW, false);
> +}
> +
> +static bool trans_th_lhib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_TESW, true);
> +}
> +
> +static bool trans_th_lhuia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_TEUW, false);
> +}
> +
> +static bool trans_th_lhuib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_TEUW, true);
> +}
> +
> +static bool trans_th_lbia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_SB, false);
> +}
> +
> +static bool trans_th_lbib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_SB, true);
> +}
> +
> +static bool trans_th_lbuia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_UB, false);
> +}
> +
> +static bool trans_th_lbuib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_inc(ctx, a, MO_UB, true);
> +}
> +
> +static bool trans_th_sdia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_store_inc(ctx, a, MO_TESQ, false);
> +}
> +
> +static bool trans_th_sdib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_store_inc(ctx, a, MO_TESQ, true);
> +}
> +
> +static bool trans_th_swia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_inc(ctx, a, MO_TESL, false);
> +}
> +
> +static bool trans_th_swib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_inc(ctx, a, MO_TESL, true);
> +}
> +
> +static bool trans_th_shia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_inc(ctx, a, MO_TESW, false);
> +}
> +
> +static bool trans_th_shib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_inc(ctx, a, MO_TESW, true);
> +}
> +
> +static bool trans_th_sbia(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_inc(ctx, a, MO_SB, false);
> +}
> +
> +static bool trans_th_sbib(DisasContext *ctx, arg_th_meminc *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_inc(ctx, a, MO_SB, true);
> +}
> +
> +/*
> + * Load with memop from indexed address.
> + * If !zext_offs, then address is rs1 + (rs2 << imm2).
> + * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
> + */
> +static bool gen_load_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memo=
p,
> +                         bool zext_offs)
> +{
> +    TCGv rd =3D dest_gpr(ctx, a->rd);
> +    TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
> +
> +    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
> +    gen_set_gpr(ctx, a->rd, rd);
> +
> +    return true;
> +}
> +
> +/*
> + * Store with memop to indexed address.
> + * If !zext_offs, then address is rs1 + (rs2 << imm2).
> + * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
> + */
> +static bool gen_store_idx(DisasContext *ctx, arg_th_memidx *a, MemOp mem=
op,
> +                          bool zext_offs)
> +{
> +    TCGv data =3D get_gpr(ctx, a->rd, EXT_NONE);
> +    TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
> +
> +    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
> +
> +    return true;
> +}
> +
> +static bool trans_th_lrd(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_load_idx(ctx, a, MO_TESQ, false);
> +}
> +
> +static bool trans_th_lrw(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_TESL, false);
> +}
> +
> +static bool trans_th_lrwu(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_load_idx(ctx, a, MO_TEUL, false);
> +}
> +
> +static bool trans_th_lrh(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_TESW, false);
> +}
> +
> +static bool trans_th_lrhu(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_TEUW, false);
> +}
> +
> +static bool trans_th_lrb(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_SB, false);
> +}
> +
> +static bool trans_th_lrbu(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_UB, false);
> +}
> +
> +static bool trans_th_srd(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_store_idx(ctx, a, MO_TESQ, false);
> +}
> +
> +static bool trans_th_srw(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_idx(ctx, a, MO_TESL, false);
> +}
> +
> +static bool trans_th_srh(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_idx(ctx, a, MO_TESW, false);
> +}
> +
> +static bool trans_th_srb(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_idx(ctx, a, MO_SB, false);
> +}
> +static bool trans_th_lurd(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_load_idx(ctx, a, MO_TESQ, true);
> +}
> +
> +static bool trans_th_lurw(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_TESL, true);
> +}
> +
> +static bool trans_th_lurwu(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_load_idx(ctx, a, MO_TEUL, true);
> +}
> +
> +static bool trans_th_lurh(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_TESW, true);
> +}
> +
> +static bool trans_th_lurhu(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_TEUW, true);
> +}
> +
> +static bool trans_th_lurb(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_SB, true);
> +}
> +
> +static bool trans_th_lurbu(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_load_idx(ctx, a, MO_UB, true);
> +}
> +
> +static bool trans_th_surd(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_store_idx(ctx, a, MO_TESQ, true);
> +}
> +
> +static bool trans_th_surw(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_idx(ctx, a, MO_TESL, true);
> +}
> +
> +static bool trans_th_surh(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_idx(ctx, a, MO_TESW, true);
> +}
> +
> +static bool trans_th_surb(DisasContext *ctx, arg_th_memidx *a)
> +{
> +    REQUIRE_XTHEADMEMIDX(ctx);
> +    return gen_store_idx(ctx, a, MO_SB, true);
> +}
> +
>  /* XTheadMemPair */
>
>  static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp mem=
op,
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 348fe511e1..f5a870a2ac 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -130,7 +130,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
>      return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
>             ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
>             ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadma=
c ||
> -           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsy=
nc;
> +           ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmem=
pair ||
> +           ctx->cfg_ptr->ext_xtheadsync;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> @@ -564,6 +565,24 @@ static TCGv get_address(DisasContext *ctx, int rs1, =
int imm)
>      return addr;
>  }
>
> +/* Compute a canonical address from a register plus reg offset. */
> +static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
> +{
> +    TCGv addr =3D temp_new(ctx);
> +    TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
> +
> +    tcg_gen_add_tl(addr, src1, offs);
> +    if (ctx->pm_mask_enabled) {
> +        tcg_gen_andc_tl(addr, addr, pm_mask);
> +    } else if (get_xl(ctx) =3D=3D MXL_RV32) {
> +        tcg_gen_ext32u_tl(addr, addr);
> +    }
> +    if (ctx->pm_base_enabled) {
> +        tcg_gen_or_tl(addr, addr, pm_base);
> +    }
> +    return addr;
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  /* The states of mstatus_fs are:
>   * 0 =3D disabled, 1 =3D initial, 2 =3D clean, 3 =3D dirty
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index ff2a83b56d..69e40f22dc 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -17,8 +17,10 @@
>  %rd2       20:5
>  %rs2       20:5
>  %sh5       20:5
> +%imm5      20:s5
>  %sh6       20:6
>  %sh2       25:2
> +%imm2      25:2
>
>  # Argument sets
>  &r         rd rs1 rs2                               !extern
> @@ -26,6 +28,8 @@
>  &shift     shamt rs1 rd                             !extern
>  &th_bfext  msb lsb rs1 rd
>  &th_pair   rd1 rs rd2 sh2
> +&th_memidx rd rs1 rs2 imm2
> +&th_meminc rd rs1 imm5 imm2
>
>  # Formats
>  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
> @@ -36,6 +40,8 @@
>  @sh5        ....... ..... .....  ... ..... .......  &shift  shamt=3D%sh5=
      %rs1 %rd
>  @sh6        ...... ...... .....  ... ..... .......  &shift shamt=3D%sh6 =
%rs1 %rd
>  @th_pair    ..... .. ..... ..... ... ..... .......  &th_pair %rd1 %rs %r=
d2 %sh2
> +@th_memidx  ..... .. ..... ..... ... ..... .......  &th_memidx %rd %rs1 =
%rs2 %imm2
> +@th_meminc  ..... .. ..... ..... ... ..... .......  &th_meminc %rd %rs1 =
%imm5 %imm2
>
>  # XTheadBa
>  # Instead of defining a new encoding, we simply use the decoder to
> @@ -102,6 +108,54 @@ th_muls          00100 01 ..... ..... 001 ..... 0001=
011 @r
>  th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
>  th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
>
> +# XTheadMemIdx
> +th_ldia          01111 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_ldib          01101 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lwia          01011 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lwib          01001 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lwuia         11011 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lwuib         11001 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lhia          00111 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lhib          00101 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lhuia         10111 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lhuib         10101 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lbia          00011 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lbib          00001 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lbuia         10011 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_lbuib         10001 .. ..... ..... 100 ..... 0001011 @th_meminc
> +th_sdia          01111 .. ..... ..... 101 ..... 0001011 @th_meminc
> +th_sdib          01101 .. ..... ..... 101 ..... 0001011 @th_meminc
> +th_swia          01011 .. ..... ..... 101 ..... 0001011 @th_meminc
> +th_swib          01001 .. ..... ..... 101 ..... 0001011 @th_meminc
> +th_shia          00111 .. ..... ..... 101 ..... 0001011 @th_meminc
> +th_shib          00101 .. ..... ..... 101 ..... 0001011 @th_meminc
> +th_sbia          00011 .. ..... ..... 101 ..... 0001011 @th_meminc
> +th_sbib          00001 .. ..... ..... 101 ..... 0001011 @th_meminc
> +
> +th_lrd           01100 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lrw           01000 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lrwu          11000 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lrh           00100 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lrhu          10100 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lrb           00000 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lrbu          10000 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_srd           01100 .. ..... ..... 101 ..... 0001011 @th_memidx
> +th_srw           01000 .. ..... ..... 101 ..... 0001011 @th_memidx
> +th_srh           00100 .. ..... ..... 101 ..... 0001011 @th_memidx
> +th_srb           00000 .. ..... ..... 101 ..... 0001011 @th_memidx
> +
> +th_lurd          01110 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lurw          01010 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lurwu         11010 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lurh          00110 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lurhu         10110 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lurb          00010 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_lurbu         10010 .. ..... ..... 100 ..... 0001011 @th_memidx
> +th_surd          01110 .. ..... ..... 101 ..... 0001011 @th_memidx
> +th_surw          01010 .. ..... ..... 101 ..... 0001011 @th_memidx
> +th_surh          00110 .. ..... ..... 101 ..... 0001011 @th_memidx
> +th_surb          00010 .. ..... ..... 101 ..... 0001011 @th_memidx
> +
>  # XTheadMemPair
>  th_ldd           11111 .. ..... ..... 100 ..... 0001011 @th_pair
>  th_lwd           11100 .. ..... ..... 100 ..... 0001011 @th_pair
> --
> 2.38.1
>
>

