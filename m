Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6UI-0001jK-NH
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6UH-0001j0-Bz; Mon, 23 Jan 2023 18:44:29 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6UF-0007Rq-Ds; Mon, 23 Jan 2023 18:44:29 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id z190so6828386vka.4;
 Mon, 23 Jan 2023 15:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KqKKobQyU6SMZRVVBPaD97WE9IveGOyrtIFJoKE1SrQ=;
 b=JK3iKyCtJt/1nhHEdQchtuFiV257e8Vn55CgslbCzTnfFdiZjre2Xpcv9dxD2pjbbv
 XVVvoG5xBsyQqLmxMNy4EJWzW6OSzFT0PjljgKPVs1artaDqtASyeSjGj3uo/kOxENoT
 0YB18/Yiu/DYP4MQbDtWMsS67tgJXhU52awHszqA25FER5Wsjk2WC/3C9zWN8ocVmSkh
 PD5inT2BEp9yBE63j7KM62//CCahiJ/6LqHsRijZBi4gSjJdaqwK4Ac43gqXZLH8+kpu
 XluPAp45eBEupO7Ljj4GAJkRPFwVCDII9Is3S7rf4bUOHw+0SqkLg8eR39mVM1fyFoLy
 nHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KqKKobQyU6SMZRVVBPaD97WE9IveGOyrtIFJoKE1SrQ=;
 b=zx2RsPFKBjomcYlvIBq48MC2NFdMoDSuRBXCRzpm5b2BCzigpEqI7zfBw0qv5YCxYv
 35mqArVxq4Ym8ENL6EtRzcsbsuUrsC/xNON0J3DNil9Tya11mgf8KZ2qcWWSXwWEYIoY
 yPFWT+fC33oBAEHo+nEqFPRANMCvOTscF9DgNPV+mrGRiWtov4Rlm4ZdoofthU/Yr9Kv
 UFdM6tRR8msL/ow6I+fwcy8klIlFFL08bZBGqSbpk39uTe1UlLTaluEv98ATCaZlVErQ
 ZIuRk3Pr5LSzRyOeHwGI88SCXtfZ1HWGDLUjMRwQitYI+5CiQlKz2MCfe901nokcoZfQ
 Bd+w==
X-Gm-Message-State: AFqh2kpt/GVc+TxkyX1c1/Dp3XpVVqkRX+PGLVFZfCx5HGqx/gFIhsuU
 dDeWtgtpcCM1Sm2R8PXATehkUBeOCMBecGNu8QN+u6aIBTc=
X-Google-Smtp-Source: AMrXdXuZnIbSZaenE8ptjC5DqUDV5ZtuJ8IBT7D5OzhAoCcJelJuJIfoh2YCUFIil3xWNvpSaXQndM1gYpiNQ0X/axc=
X-Received: by 2002:a1f:b681:0:b0:3dd:fc42:994d with SMTP id
 g123-20020a1fb681000000b003ddfc42994dmr3532934vkf.25.1674517466102; Mon, 23
 Jan 2023 15:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-15-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-15-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:44:00 +1000
Message-ID: <CAKmqyKPYN5C-D9=J-2=eXP5y3=THKsQdWwVu0XWy3vdpAzx02Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] RISC-V: Adding XTheadFmv ISA extension
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:44:29 -0000

On Sat, Dec 24, 2022 at 4:07 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the XTheadFmv ISA extension.
> The patch uses the T-Head specific decoder and translation.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |  2 +
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 45 ++++++++++++++++++++++
>  target/riscv/translate.c                   |  6 +--
>  target/riscv/xthead.decode                 |  4 ++
>  5 files changed, 55 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d3d8587710..d3f711cc41 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -114,6 +114,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
>      ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xth=
eadcondmov),
>      ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xth=
eadfmemidx),
> +    ISA_EXT_DATA_ENTRY(xtheadfmv, true, PRIV_VERSION_1_11_0, ext_xtheadf=
mv),
>      ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadm=
ac),
>      ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xthe=
admemidx),
>      ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xth=
eadmempair),
> @@ -1107,6 +1108,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
>      DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, f=
alse),
> +    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
>      DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
>      DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
>      DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 28184bbe40..154c16208a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -473,6 +473,7 @@ struct RISCVCPUConfig {
>      bool ext_xtheadcmo;
>      bool ext_xtheadcondmov;
>      bool ext_xtheadfmemidx;
> +    bool ext_xtheadfmv;
>      bool ext_xtheadmac;
>      bool ext_xtheadmemidx;
>      bool ext_xtheadmempair;
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index dc1a11070e..12d5af4f75 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -52,6 +52,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADFMV(ctx) do {              \
> +    if (!ctx->cfg_ptr->ext_xtheadfmv) {          \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADMAC(ctx) do {              \
>      if (!ctx->cfg_ptr->ext_xtheadmac) {          \
>          return false;                            \
> @@ -457,6 +463,45 @@ static bool trans_th_fsurw(DisasContext *ctx, arg_th=
_memidx *a)
>      return gen_fstore_idx(ctx, a, MO_TEUL, true);
>  }
>
> +/* XTheadFmv */
> +
> +static bool trans_th_fmv_hw_x(DisasContext *ctx, arg_th_fmv_hw_x *a)
> +{
> +    REQUIRE_XTHEADFMV(ctx);
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVD);
> +
> +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> +    TCGv_i64 t1 =3D tcg_temp_new_i64();
> +
> +    tcg_gen_extu_tl_i64(t1, src1);
> +    tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], t1, 32, 32);
> +    tcg_temp_free_i64(t1);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_th_fmv_x_hw(DisasContext *ctx, arg_th_fmv_x_hw *a)
> +{
> +    REQUIRE_XTHEADFMV(ctx);
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVD);
> +    TCGv dst;
> +    TCGv_i64 t1;
> +
> +    dst =3D dest_gpr(ctx, a->rd);
> +    t1 =3D tcg_temp_new_i64();
> +
> +    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
> +    tcg_gen_trunc_i64_tl(dst, t1);
> +    gen_set_gpr(ctx, a->rd, dst);
> +    tcg_temp_free_i64(t1);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
>  /* XTheadMac */
>
>  static bool gen_th_mac(DisasContext *ctx, arg_r *a,
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fb77df721e..1c54c3c67d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -130,9 +130,9 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
>      return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
>             ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
>             ctx->cfg_ptr->ext_xtheadcondmov ||
> -           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadma=
c ||
> -           ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmem=
pair ||
> -           ctx->cfg_ptr->ext_xtheadsync;
> +           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfm=
v ||
> +           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx=
 ||
> +           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsy=
nc;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index 81daf1d694..d1d104bcf2 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -110,6 +110,10 @@ th_fsrw          01000 .. ..... ..... 111 ..... 0001=
011 @th_memidx
>  th_fsurd         01110 .. ..... ..... 111 ..... 0001011 @th_memidx
>  th_fsurw         01010 .. ..... ..... 111 ..... 0001011 @th_memidx
>
> +# XTheadFmv
> +th_fmv_hw_x      1010000  00000 ..... 001 ..... 0001011 @r2
> +th_fmv_x_hw      1100000  00000 ..... 001 ..... 0001011 @r2
> +
>  # XTheadMac
>  th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
>  th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
> --
> 2.38.1
>
>

