Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5qt-00079A-AD
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5qr-00078n-Vx; Mon, 23 Jan 2023 18:03:46 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5ql-0000IG-M6; Mon, 23 Jan 2023 18:03:42 -0500
Received: by mail-vk1-xa31.google.com with SMTP id q21so6790576vka.3;
 Mon, 23 Jan 2023 15:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G6uotCIrH9kgx39hALGEYozhwzXnjW5ND5izePuTzZ0=;
 b=dGLYYnf0wk2elxDEc+6JKI2x0fZYoASFp0Eh62R+E24xtskE5qX2x1wmRwdYkC3H6e
 uiR9Wyce/fvetmrU5JekFm23tAjAntpWgVJunb3JVa1z0Y+JntmauAo/fpxE0Hra9gI2
 Y95P8Q0I62nBZedOMzCQLzQcK2bivCWUY+fV0lBP5FUntGuEzUt910JCTT0jYbKMfnB/
 VNdHrbwvnUIAwoC7xhg8xA8wLL0rtn0a/rsyQbzKyIKVxn/c5+UhqzCTpKSMWsIGM3Hu
 resWh+bb193SGZ5LEpde0Q2HYtxzrXdUlLIPOV/ncpTQ4YZgESxFYwEAB9VLU/SuK7aE
 BDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G6uotCIrH9kgx39hALGEYozhwzXnjW5ND5izePuTzZ0=;
 b=fdhYnBs4i/M6u5Q8R5etXLW9n0D7u4yiPtDrxD0gtlOr8QHTB0WigVQqXCJCSYV7ZV
 puVw2I4lW3cpGZfXOrZSSuK8QOq0uSHbhx7ZKvVE3sswYjg+qEsJPwRP+Bu4D+a5McnX
 8/7b4cRfEv6yXDmafYo4HfNy9F7YPrD9S1x+1258Kf4AfCT3JA/QQ6t4isi3MGYowV1r
 K6VjPZ8Mf69PUya7al/hlmIvSNmaMyLPjEOUby8APC16w+b2fHxah9fcsaAcEJpjylxl
 22y+xRAfCOtkN9HL0h8ih6vWvzo8MAiXX1QX617lNroQh/PVSnFFtuKBTt6hJqcOjkYT
 rCeQ==
X-Gm-Message-State: AFqh2krE0r3WFGioaATh1RDRm91O4THcm71RksmeYIacXZzIEN/f2ahF
 0yjhe4+OqymsU2/4kd00bC8b84ZTuCZn8dRiMFM=
X-Google-Smtp-Source: AMrXdXtEsyDx358zHdtCK1PACgSp/Ka9n/+WbqOmBGI5GtM+JwjCJ9yxmXsR9vVjWSqgZu9DbEEpwZQRmhSLui3Oszs=
X-Received: by 2002:a1f:2c0c:0:b0:3e1:7e08:a117 with SMTP id
 s12-20020a1f2c0c000000b003e17e08a117mr3451644vks.34.1674515018331; Mon, 23
 Jan 2023 15:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-9-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-9-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:03:12 +1000
Message-ID: <CAKmqyKNqH1xTj_Fc2gRsxbf4qN3Qi0WRsMgVOPoZA5QgVekJpg@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] RISC-V: Adding T-Head MemPair extension
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:03:46 -0000

On Sat, Dec 24, 2022 at 4:01 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the T-Head MemPair instructions.
> The patch uses the T-Head specific decoder and translation.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Use single decoder for XThead extensions
> - Use get_address() to calculate addresses
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |  2 +
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 88 ++++++++++++++++++++++
>  target/riscv/translate.c                   |  2 +-
>  target/riscv/xthead.decode                 | 13 ++++
>  5 files changed, 105 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 88ad2138db..de00f69710 100644
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
> +    ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
>      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
>  };
> @@ -1073,6 +1074,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
>      DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
> +    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
>      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 92198be9d8..836445115e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -471,6 +471,7 @@ struct RISCVCPUConfig {
>      bool ext_xtheadcmo;
>      bool ext_xtheadcondmov;
>      bool ext_xtheadmac;
> +    bool ext_xtheadmempair;
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 109be58c9b..49314306eb 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -52,6 +52,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADMEMPAIR(ctx) do {          \
> +    if (!ctx->cfg_ptr->ext_xtheadmempair) {      \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADSYNC(ctx) do {             \
>      if (!ctx->cfg_ptr->ext_xtheadsync) {         \
>          return false;                            \
> @@ -390,6 +396,88 @@ static bool trans_th_mulsw(DisasContext *ctx, arg_th=
_mulsw *a)
>      return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
>  }
>
> +/* XTheadMemPair */
> +
> +static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp mem=
op,
> +                            int shamt)
> +{
> +    TCGv rd1 =3D dest_gpr(ctx, a->rd1);
> +    TCGv rd2 =3D dest_gpr(ctx, a->rd2);
> +    TCGv addr1 =3D tcg_temp_new();
> +    TCGv addr2 =3D tcg_temp_new();
> +
> +    addr1 =3D get_address(ctx, a->rs, a->sh2 << shamt);
> +    if ((memop & MO_SIZE) =3D=3D MO_64) {
> +        addr2 =3D get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
> +    } else {
> +        addr2 =3D get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
> +    }
> +
> +    tcg_gen_qemu_ld_tl(rd1, addr1, ctx->mem_idx, memop);
> +    tcg_gen_qemu_ld_tl(rd2, addr2, ctx->mem_idx, memop);
> +    gen_set_gpr(ctx, a->rd1, rd1);
> +    gen_set_gpr(ctx, a->rd2, rd2);
> +
> +    tcg_temp_free(addr1);
> +    tcg_temp_free(addr2);
> +    return true;
> +}
> +
> +static bool trans_th_ldd(DisasContext *ctx, arg_th_pair *a)
> +{
> +    REQUIRE_XTHEADMEMPAIR(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_loadpair_tl(ctx, a, MO_TESQ, 4);
> +}
> +
> +static bool trans_th_lwd(DisasContext *ctx, arg_th_pair *a)
> +{
> +    REQUIRE_XTHEADMEMPAIR(ctx);
> +    return gen_loadpair_tl(ctx, a, MO_TESL, 3);
> +}
> +
> +static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
> +{
> +    REQUIRE_XTHEADMEMPAIR(ctx);
> +    return gen_loadpair_tl(ctx, a, MO_TEUL, 3);
> +}
> +
> +static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp me=
mop,
> +                             int shamt)
> +{
> +    TCGv data1 =3D get_gpr(ctx, a->rd1, EXT_NONE);
> +    TCGv data2 =3D get_gpr(ctx, a->rd2, EXT_NONE);
> +    TCGv addr1 =3D tcg_temp_new();
> +    TCGv addr2 =3D tcg_temp_new();
> +
> +    addr1 =3D get_address(ctx, a->rs, a->sh2 << shamt);
> +    if ((memop & MO_SIZE) =3D=3D MO_64) {
> +        addr2 =3D get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
> +    } else {
> +        addr2 =3D get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
> +    }
> +
> +    tcg_gen_qemu_st_tl(data1, addr1, ctx->mem_idx, memop);
> +    tcg_gen_qemu_st_tl(data2, addr2, ctx->mem_idx, memop);
> +
> +    tcg_temp_free(addr1);
> +    tcg_temp_free(addr2);
> +    return true;
> +}
> +
> +static bool trans_th_sdd(DisasContext *ctx, arg_th_pair *a)
> +{
> +    REQUIRE_XTHEADMEMPAIR(ctx);
> +    REQUIRE_64BIT(ctx);
> +    return gen_storepair_tl(ctx, a, MO_TESQ, 4);
> +}
> +
> +static bool trans_th_swd(DisasContext *ctx, arg_th_pair *a)
> +{
> +    REQUIRE_XTHEADMEMPAIR(ctx);
> +    return gen_storepair_tl(ctx, a, MO_TESL, 3);
> +}
> +
>  /* XTheadSync */
>
>  static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *=
a)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 36f512baa8..348fe511e1 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -130,7 +130,7 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
>      return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
>             ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
>             ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadma=
c ||
> -           ctx->cfg_ptr->ext_xtheadsync;
> +           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsy=
nc;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index 696de6cecf..ff2a83b56d 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -11,16 +11,21 @@
>
>  # Fields:
>  %rd        7:5
> +%rd1       7:5
> +%rs        15:5
>  %rs1       15:5
> +%rd2       20:5
>  %rs2       20:5
>  %sh5       20:5
>  %sh6       20:6
> +%sh2       25:2
>
>  # Argument sets
>  &r         rd rs1 rs2                               !extern
>  &r2        rd rs1                                   !extern
>  &shift     shamt rs1 rd                             !extern
>  &th_bfext  msb lsb rs1 rd
> +&th_pair   rd1 rs rd2 sh2
>
>  # Formats
>  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
> @@ -30,6 +35,7 @@
>  @th_bfext   msb:6  lsb:6  .....  ... ..... .......  &th_bfext %rs1 %rd
>  @sh5        ....... ..... .....  ... ..... .......  &shift  shamt=3D%sh5=
      %rs1 %rd
>  @sh6        ...... ...... .....  ... ..... .......  &shift shamt=3D%sh6 =
%rs1 %rd
> +@th_pair    ..... .. ..... ..... ... ..... .......  &th_pair %rd1 %rs %r=
d2 %sh2
>
>  # XTheadBa
>  # Instead of defining a new encoding, we simply use the decoder to
> @@ -96,6 +102,13 @@ th_muls          00100 01 ..... ..... 001 ..... 00010=
11 @r
>  th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
>  th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
>
> +# XTheadMemPair
> +th_ldd           11111 .. ..... ..... 100 ..... 0001011 @th_pair
> +th_lwd           11100 .. ..... ..... 100 ..... 0001011 @th_pair
> +th_lwud          11110 .. ..... ..... 100 ..... 0001011 @th_pair
> +th_sdd           11111 .. ..... ..... 101 ..... 0001011 @th_pair
> +th_swd           11100 .. ..... ..... 101 ..... 0001011 @th_pair
> +
>  # XTheadSync
>  th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
>  th_sync          0000000 11000 00000 000 00000 0001011
> --
> 2.38.1
>
>

