Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5nw-0004n8-MY
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5nt-0004l7-5J; Mon, 23 Jan 2023 18:00:41 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5nl-0008Hj-78; Mon, 23 Jan 2023 18:00:40 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id d66so14687709vsd.9;
 Mon, 23 Jan 2023 15:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vQGA0HFuaL7z/o2BSzL7L7mYrQyy/xNZ0/GqNXGZJ0=;
 b=muU7mLOWKzYDA58ZEedER84HE6vMAH+GYrjzFzUOhDZWis6/PTMDOsFYul3qrdNhVG
 AnjvdjUZcnyTYRyajXwa9qAPDuSRGMCEWJoBxfHACYvtUyYA2zFH+ZMBQBxs7g0XibDK
 KmshDlXC5SaDUxQ6c24putlZC73TvEjaTuxiKawJ1aeIGMLmniV9nbV9GnQwrQtt+E6O
 mkwkK5hWbukgxDCdd6RPK1tpEgfGQPhXkpYWCSSgtC5QmbF0z3oB7Gzri/ELmnK3onah
 y57UfBYbSLI2mfginE9gP0W3nIHycg2xtmvOPqRnSqilk5dFu0EVGvMhg2SLbnnKj6TW
 8CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vQGA0HFuaL7z/o2BSzL7L7mYrQyy/xNZ0/GqNXGZJ0=;
 b=vIzbViwqeCTXw0l6JISSk4TJ/m5ozcFHCAgCeJIOw7AIee436XZ0msbW1HCYI1IAVQ
 ndDarm/sfzrUabRMbjqvkJ9M49Ou1+PpxlRDQLt3HpyWLTxVziX5TAfvF8URNFEGxlSZ
 EaVDBUfOhHav/PJQkuuG24n27HirdXfb6b5Z9Xmn9Uu4z3GmCd6nSL3OvJxJKWMzxGT6
 HVS07dI/l8XdeaH+7ilBi/iEkHUZxcDwX9wkg4VmdsOOhOj3IeBGZUj5ffSvbGRj+Q9l
 p0mXnXU/rDvgr9ftJpYVeexQOaip6WthMIBtrGmIOmFebiiUtLNN+zoBq2N7WF34ezu/
 eFfA==
X-Gm-Message-State: AFqh2krHXKP15BoFk9pMzyhEipY53fttEBIz1Yy22kMeHYmTvHVki07u
 vNHBZ/f7q31GBuquyHvyg/myNYhilD3Yq1MwanM=
X-Google-Smtp-Source: AMrXdXtxpbDMsv2wAgnyZMGI80W9OsZD0/h0DlEMTMArTmdPxvMugViOlASm4sEScZuLA/IRAzVoq4dXE5x49pT+OOc=
X-Received: by 2002:a67:ba0c:0:b0:3ce:f2da:96a with SMTP id
 l12-20020a67ba0c000000b003cef2da096amr3058899vsn.64.1674514831651; Mon, 23
 Jan 2023 15:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-8-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-8-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:00:05 +1000
Message-ID: <CAKmqyKO5J3ZdZNmq==fm5o=4EUTapCiWJw9M=rda4HcvYSSadg@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] RISC-V: Adding T-Head multiply-accumulate
 instructions
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:00:43 -0000

On Sat, Dec 24, 2022 at 4:04 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the T-Head MAC instructions.
> The patch uses the T-Head specific decoder and translation.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Use single decoder for XThead extensions
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |  2 +
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 83 ++++++++++++++++++++++
>  target/riscv/translate.c                   |  3 +-
>  target/riscv/xthead.decode                 |  8 +++
>  5 files changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 36a53784dd..88ad2138db 100644
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
> +    ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadm=
ac),
>      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
>  };
> @@ -1071,6 +1072,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
> +    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
>      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 01f035d8e9..92198be9d8 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -470,6 +470,7 @@ struct RISCVCPUConfig {
>      bool ext_xtheadbs;
>      bool ext_xtheadcmo;
>      bool ext_xtheadcondmov;
> +    bool ext_xtheadmac;
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index bf549bbd74..109be58c9b 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -46,6 +46,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADMAC(ctx) do {              \
> +    if (!ctx->cfg_ptr->ext_xtheadmac) {          \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADSYNC(ctx) do {             \
>      if (!ctx->cfg_ptr->ext_xtheadsync) {         \
>          return false;                            \
> @@ -307,6 +313,83 @@ static bool trans_th_mvnez(DisasContext *ctx, arg_th=
_mveqz *a)
>      return gen_th_condmove(ctx, a, TCG_COND_NE);
>  }
>
> +/* XTheadMac */
> +
> +static bool gen_th_mac(DisasContext *ctx, arg_r *a,
> +                       void (*accumulate_func)(TCGv, TCGv, TCGv),
> +                       void (*extend_operand_func)(TCGv, TCGv))
> +{
> +    TCGv dest =3D dest_gpr(ctx, a->rd);
> +    TCGv src0 =3D get_gpr(ctx, a->rd, EXT_NONE);
> +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGv tmp =3D tcg_temp_new();
> +
> +    if (extend_operand_func) {
> +        TCGv tmp2 =3D tcg_temp_new();
> +        extend_operand_func(tmp, src1);
> +        extend_operand_func(tmp2, src2);
> +        tcg_gen_mul_tl(tmp, tmp, tmp2);
> +        tcg_temp_free(tmp2);
> +    } else {
> +        tcg_gen_mul_tl(tmp, src1, src2);
> +    }
> +
> +    accumulate_func(dest, src0, tmp);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    tcg_temp_free(tmp);
> +
> +    return true;
> +}
> +
> +/* th.mula: "rd =3D rd + rs1 * rs2" */
> +static bool trans_th_mula(DisasContext *ctx, arg_th_mula *a)
> +{
> +    REQUIRE_XTHEADMAC(ctx);
> +    return gen_th_mac(ctx, a, tcg_gen_add_tl, NULL);
> +}
> +
> +/* th.mulah: "rd =3D sext.w(rd + sext.w(rs1[15:0]) * sext.w(rs2[15:0]))"=
 */
> +static bool trans_th_mulah(DisasContext *ctx, arg_th_mulah *a)
> +{
> +    REQUIRE_XTHEADMAC(ctx);
> +    ctx->ol =3D MXL_RV32;
> +    return gen_th_mac(ctx, a, tcg_gen_add_tl, tcg_gen_ext16s_tl);
> +}
> +
> +/* th.mulaw: "rd =3D sext.w(rd + rs1 * rs2)" */
> +static bool trans_th_mulaw(DisasContext *ctx, arg_th_mulaw *a)
> +{
> +    REQUIRE_XTHEADMAC(ctx);
> +    REQUIRE_64BIT(ctx);
> +    ctx->ol =3D MXL_RV32;
> +    return gen_th_mac(ctx, a, tcg_gen_add_tl, NULL);
> +}
> +
> +/* th.muls: "rd =3D rd - rs1 * rs2" */
> +static bool trans_th_muls(DisasContext *ctx, arg_th_muls *a)
> +{
> +    REQUIRE_XTHEADMAC(ctx);
> +    return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
> +}
> +
> +/* th.mulsh: "rd =3D sext.w(rd - sext.w(rs1[15:0]) * sext.w(rs2[15:0]))"=
 */
> +static bool trans_th_mulsh(DisasContext *ctx, arg_th_mulsh *a)
> +{
> +    REQUIRE_XTHEADMAC(ctx);
> +    ctx->ol =3D MXL_RV32;
> +    return gen_th_mac(ctx, a, tcg_gen_sub_tl, tcg_gen_ext16s_tl);
> +}
> +
> +/* th.mulsw: "rd =3D sext.w(rd - rs1 * rs2)" */
> +static bool trans_th_mulsw(DisasContext *ctx, arg_th_mulsw *a)
> +{
> +    REQUIRE_XTHEADMAC(ctx);
> +    REQUIRE_64BIT(ctx);
> +    ctx->ol =3D MXL_RV32;
> +    return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
> +}
> +
>  /* XTheadSync */
>
>  static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *=
a)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f15883b16b..36f512baa8 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -129,7 +129,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
>  {
>      return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
>             ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
> -           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadsy=
nc;
> +           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadma=
c ||
> +           ctx->cfg_ptr->ext_xtheadsync;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index a8ebd8a18b..696de6cecf 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -88,6 +88,14 @@ th_l2cache_iall  0000000 10110 00000 000 00000 0001011
>  th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
>  th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
>
> +# XTheadMac
> +th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
> +th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
> +th_mulaw         00100 10 ..... ..... 001 ..... 0001011 @r
> +th_muls          00100 01 ..... ..... 001 ..... 0001011 @r
> +th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
> +th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
> +
>  # XTheadSync
>  th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
>  th_sync          0000000 11000 00000 000 00000 0001011
> --
> 2.38.1
>
>

