Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5mr-00042P-9d
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 17:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5mq-000425-FK; Mon, 23 Jan 2023 17:59:36 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5mn-00080u-Jy; Mon, 23 Jan 2023 17:59:36 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id b81so6775945vkf.1;
 Mon, 23 Jan 2023 14:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fA+g0ieOoZldjrJr5iwqwBGGsWDFSXZlbyv+KR3/2OU=;
 b=QpfWRLu1/6Ms0Y0vD5TyqQEqZ1v1f0oQ2NnZGDP8hJpJtxy2O7UoyZK2LvzLSySnR1
 cwB8kBQtoJEjW5+ikIEbMvlBdzLvec2Tokloe8NyEs5yRR2NsRrFF/Ai3M/kLZ1fK7pH
 au4ZlHWvTgYz2Y6pkxxhOUjY8zdBsf3C8XgxdJsvdAK5hqLERLsWIc+SjHbX8pRw5sNU
 kARZeRhiQQgJb2xbwwPtgKoHs+HNRQ9rl1ICQOZDrP8f4Tj9Xi2/Bkp1O2mzVkLSwNdb
 L9m6chqZznItyE5pYBk0dCrUEotLT55frjR5vU1HpAhyTJGhWpzv+eN2GuoJsrPNOrS0
 hioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fA+g0ieOoZldjrJr5iwqwBGGsWDFSXZlbyv+KR3/2OU=;
 b=xLWSQ7IXnXIK9GsYzuOlvMcc0o7LemVcqFVTxU+CIaWiaY2//bn18vgZkoYzbsnofv
 SCqOnW+jzUat69Ppyl+nnbYmqtGuN4Wg05DN/14BZRuFOxLPNu2Dn3/9UyVrcGVAVQID
 HPQQ9KHz4KIpHQY7Pk5MULCrnQWhHWmceDcZ72/mn+8FTI0Lgp8kkoBBmLfU8eUUmT9P
 8F+U/on+GzaMgmhINV2gBpsW62xle1KJ7VLRdQnpzWL8b1Dz2l1P/41GKXzJhP+Flz7y
 nuH2ht9ndDZJEwZcIS4QLgqC6u4DNZ01iCv7JSfuP7pjcVdX0RNoGFQ86QlJ6pi1J2YM
 fTNw==
X-Gm-Message-State: AFqh2krChSR/mpwtsnSkbUR9Oaf42PJ1BTlaMil+7B4P1+EGYX7nu0S8
 jrifjkdgCyJLrA8Qderax9oXV/MOdYR5Y7KRHO/iND0w93E=
X-Google-Smtp-Source: AMrXdXstDvY8lrrg4yr7HixtZ4yvN70brLjtvyL3ibmdfQTwUpRukuhx+LWuGqaT/KdFhljRDYuN2naqECzQgMs134w=
X-Received: by 2002:a05:6122:924:b0:3d5:5f93:53f with SMTP id
 j36-20020a056122092400b003d55f93053fmr3397568vka.7.1674514772479; Mon, 23 Jan
 2023 14:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-7-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-7-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 08:59:06 +1000
Message-ID: <CAKmqyKO+8n=6s3Y1z7jt81vn3r3o5tgXWYmmCV_Ba-kNE1FrsQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] RISC-V: Adding XTheadCondMov ISA extension
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
X-List-Received-Date: Mon, 23 Jan 2023 22:59:36 -0000

On Sat, Dec 24, 2022 at 4:08 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the XTheadCondMov ISA extension.
> The patch uses the T-Head specific decoder and translation.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Fix invalid use of register from dest_gpr()
> - Use single decoder for XThead extensions
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |  2 ++
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 35 ++++++++++++++++++++++
>  target/riscv/translate.c                   |  2 +-
>  target/riscv/xthead.decode                 |  4 +++
>  5 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 17273425a8..36a53784dd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -112,6 +112,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb=
),
>      ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs=
),
>      ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
> +    ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xth=
eadcondmov),
>      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
>  };
> @@ -1069,6 +1070,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
>      DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
> +    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
>      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5f68cb1e1e..01f035d8e9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -469,6 +469,7 @@ struct RISCVCPUConfig {
>      bool ext_xtheadbb;
>      bool ext_xtheadbs;
>      bool ext_xtheadcmo;
> +    bool ext_xtheadcondmov;
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index fb1f2c5731..bf549bbd74 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -40,6 +40,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADCONDMOV(ctx) do {          \
> +    if (!ctx->cfg_ptr->ext_xtheadcondmov) {      \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADSYNC(ctx) do {             \
>      if (!ctx->cfg_ptr->ext_xtheadsync) {         \
>          return false;                            \
> @@ -272,6 +278,35 @@ NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, RE=
QUIRE_PRIV_MHS)
>  NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>  NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>
> +/* XTheadCondMov */
> +
> +static bool gen_th_condmove(DisasContext *ctx, arg_r *a, TCGCond cond)
> +{
> +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGv old =3D get_gpr(ctx, a->rd, EXT_NONE);
> +    TCGv dest =3D dest_gpr(ctx, a->rd);
> +
> +    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, old);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +/* th.mveqz: "if (rs2 =3D=3D 0) rd =3D rs1;" */
> +static bool trans_th_mveqz(DisasContext *ctx, arg_th_mveqz *a)
> +{
> +    REQUIRE_XTHEADCONDMOV(ctx);
> +    return gen_th_condmove(ctx, a, TCG_COND_EQ);
> +}
> +
> +/* th.mvnez: "if (rs2 !=3D 0) rd =3D rs1;" */
> +static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
> +{
> +    REQUIRE_XTHEADCONDMOV(ctx);
> +    return gen_th_condmove(ctx, a, TCG_COND_NE);
> +}
> +
>  /* XTheadSync */
>
>  static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *=
a)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fc326e0a79..f15883b16b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -129,7 +129,7 @@ static bool has_xthead_p(DisasContext *ctx  __attribu=
te__((__unused__)))
>  {
>      return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
>             ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
> -           ctx->cfg_ptr->ext_xtheadsync;
> +           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadsy=
nc;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index 8494805611..a8ebd8a18b 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -84,6 +84,10 @@ th_l2cache_call  0000000 10101 00000 000 00000 0001011
>  th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
>  th_l2cache_iall  0000000 10110 00000 000 00000 0001011
>
> +# XTheadCondMov
> +th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
> +th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
> +
>  # XTheadSync
>  th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
>  th_sync          0000000 11000 00000 000 00000 0001011
> --
> 2.38.1
>
>

