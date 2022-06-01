Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwDQc-00030i-FA
	for mharc-qemu-riscv@gnu.org; Tue, 31 May 2022 21:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwDQb-000304-B8; Tue, 31 May 2022 21:45:41 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:42101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwDQZ-00078X-Ao; Tue, 31 May 2022 21:45:40 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so803151fac.9; 
 Tue, 31 May 2022 18:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4g3S1yBg3//u9XiRsD+wapcjuHtRlr2CGt1E0dwjhzg=;
 b=h4QzMdZZlttkEFfu0TQ9MPQJIME/6VwrcdK6DxhjjMVMuexVI28keWq1QhtoGhWApq
 6o1vThgBCbgAv/VpUpRRkiQB1GkVe3gGcV0pM4sAV0fvwfCveVIACbLEOG4K/q9qNRNu
 zLNnccX5MSR+DgUOZoTUvK5Li0wjld0t7gMmmCE8xY98G7m2m64Aou86IEExLRzm/Dg/
 CMCyVrgXcxlP0UZNySpBk8yWGDhRJoEdI/2vvXmgUWfOKai721bzJpMvFTYPsH3CVIQi
 U7BVoOJPukLF8ccwNrx0VTsXfcY2717QSQa0s2LbmPt4/nMO98gRtOxYlvVrQwSjlXIW
 1hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4g3S1yBg3//u9XiRsD+wapcjuHtRlr2CGt1E0dwjhzg=;
 b=zdyNuzusAwRcZpc9v9plHB/eJz/2ivA7U2IQD/ObodC94Ut6CPJmKCq3YtdKQmPEpy
 /mSHXKckiizzf9FYMHowYt3aBaYSyo030gde+zdwdm2cNBqWHQH8s8fPhS96izxzLpVi
 T8oLbm3IPaGS7gSfTZPTjCZq7TSnLumeNQJBu5NdaE7apSY3MK4TDHRddwFdj56CLLMJ
 fBLfbPJT5BNocbUsRmGsnHZxSvFb1ICE+3yh3AxO7bHjIxLoknTTaILDPAsDD0rqiNA9
 LaymVKEqLQD+u+hxQuaPHXM9LMWHjiiyFVnuHCEJy4Vm0S9cwqS9howdtd4kpZktb1gg
 HHyg==
X-Gm-Message-State: AOAM532xAbwzLIdGlb8pVHZtV8e51CjqDTpjxs6pg60jHFhhXv3iwcaQ
 6WcA4ogZ6TOzNlQjNkoVlqEbSDyKkXLFIkZLXI4=
X-Google-Smtp-Source: ABdhPJxQQmYzLHUvgSVX0HAh4yhs3IoJzrTyFYIC1gL6TNWvBZa8k+PXOOy+KZcu9g5dkL++27PcaJsyOgDuyOpbMHw=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr15147431oae.278.1654047937067; Tue, 31
 May 2022 18:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220531030732.3850-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220531030732.3850-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jun 2022 11:45:11 +1000
Message-ID: <CAKmqyKOdKgfK2EnxMnvgCuc8XJxoQUQz4Ri2uYBjqY7TQqq8wg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: add support for zmmul extension v0.1
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 01 Jun 2022 01:45:41 -0000

On Tue, May 31, 2022 at 1:08 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - includes all multiplication operations for M extension

The commit message should be full sentences and understandable outside
of the commit title.

I changed the commit message to:

Add support for the zmmul extension v0.1. This extension includes all
multiplication operations from the M extension but not the divide ops.

>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> v2:
> * disable M when both M and Zmmul are enabled
>
> v3:
> * add reviewed-by info, rebase to upstream/master

The changelog should be...

>
> ---

Below this line so that it isn't included in the commit message.

Applied to riscv-to-apply.next with the commit message edited

Alistair


>  target/riscv/cpu.c                      |  7 +++++++
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
>  3 files changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a91253d4bd..bcbba3fbd5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -600,6 +600,11 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
>              cpu->cfg.ext_ifencei =3D true;
>          }
>
> +        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
> +            warn_report("Zmmul will override M");
> +            cpu->cfg.ext_m =3D false;
> +        }
> +
>          if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>              error_setg(errp,
>                         "I and E extensions are incompatible");
> @@ -905,6 +910,7 @@ static Property riscv_cpu_properties[] =3D {
>
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> +    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> @@ -1031,6 +1037,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)
>      struct isa_ext_data isa_edata_arr[] =3D {
>          ISA_EDATA_ENTRY(zicsr, ext_icsr),
>          ISA_EDATA_ENTRY(zifencei, ext_ifencei),
> +        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f08c3e8813..890d33cebb 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -411,6 +411,7 @@ struct RISCVCPUConfig {
>      bool ext_zhinxmin;
>      bool ext_zve32f;
>      bool ext_zve64f;
> +    bool ext_zmmul;
>
>      uint32_t mvendorid;
>      uint64_t marchid;
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_=
trans/trans_rvm.c.inc
> index 16b029edf0..ec7f705aab 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -18,6 +18,12 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
> +    if (!ctx->cfg_ptr->ext_zmmul && !has_ext(ctx, RVM)) { \
> +        return false;                                     \
> +    }                                                     \
> +} while (0)
> +
>  static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, =
TCGv bh)
>  {
>      TCGv tmpl =3D tcg_temp_new();
> @@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
>
>  static bool trans_mul(DisasContext *ctx, arg_mul *a)
>  {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
>  }
>
> @@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
>
>  static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
>  {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
>                              gen_mulh_i128);
>  }
> @@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv ar=
g2)
>
>  static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
>  {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
>                              gen_mulhsu_i128);
>  }
> @@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
>
>  static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
>  {
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      /* gen_mulh_w works for either sign as input. */
>      return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
>                              gen_mulhu_i128);
> @@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a=
)
>  static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
>  {
>      REQUIRE_64_OR_128BIT(ctx);
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      ctx->ol =3D MXL_RV32;
>      return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
>  }
> @@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw =
*a)
>  static bool trans_muld(DisasContext *ctx, arg_muld *a)
>  {
>      REQUIRE_128BIT(ctx);
> -    REQUIRE_EXT(ctx, RVM);
> +    REQUIRE_M_OR_ZMMUL(ctx);
>      ctx->ol =3D MXL_RV64;
>      return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
>  }
> --
> 2.17.1
>
>

