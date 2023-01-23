Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5m4-0003Kj-FZ
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 17:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5m2-0003I2-DN; Mon, 23 Jan 2023 17:58:46 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5ly-0007x4-SA; Mon, 23 Jan 2023 17:58:45 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id q125so14796928vsb.0;
 Mon, 23 Jan 2023 14:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iXLk6J23k8OrWo398qKVjyGxcHWylUq6dtZsE/IN038=;
 b=aZir+biUzKY8wskexuzT0pH8JXb2EJWkZAzc7RMsoyQPGJrpdzhPXUhknbQ1bmAI6Y
 jdx6Afu9EDKWTtYw3QrhPZPCRPFK6+LslGIXgzz6qYPt1c/AKNnjiGC5VUd5Ch+yAFgh
 +/NGuBuwj3f3ZHy3zxwYApSZkQ5h2OZ2wuzO0sfC1aZkzI62bYZFny/vF4FrXshn0IC8
 Hm9krkevmMUssW3VUnm88IYkvy4/Yn0dSbCKyMz/u1ZC4LHvpdt/IWvUZKCpeFQrAzos
 Oe7vNCi4y63IEu1gZxjVT/tVypmb5czTxG012PPU/5XDpZ299+8OOhOhsAw8/rP1FUzP
 B7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXLk6J23k8OrWo398qKVjyGxcHWylUq6dtZsE/IN038=;
 b=6nsmK7FQgizw7GAK9Yz5RFomFwu1BlwIVx0LeloY5kJZCXQ6BxcM9FTt81rdhS1FbF
 PuUQqcS8k/bNk/b2aMUmsXNUFzUanKFJPpFWCxWJZBrLGPP9l3wJ3MET/MHdaikkjir6
 YkWs89z1U2R17WciRVRIpa11D0dSZs9kIJ/jMAUq7PoHtZ/7F8HO+Cqt807dTXoo1VXk
 3jVxDdU3+4rEdTv22qTThk/nAXME75yAXrw7viZlgPlD0Me8M0oHWER7IjEDRAEfn63K
 4bnFws0jL6lHZuq3KyKPAvX5yF5/o0wxVAv6u8Rpw5flQgGziF0ipykVuHxI06v2D7Z6
 ncVQ==
X-Gm-Message-State: AFqh2kq9i2STCivKNByUhbsNUj9eNfVsy8c7KkGGqRa73QfZdjKPC83P
 fiGUQx6TXdTiCI9vs31kncI8QgmONUjNKiIOxrY=
X-Google-Smtp-Source: AMrXdXtSiQ9W/VmlyLWS4+OuhZEyeYMWA6sePombNS1InDMpL0E889krbcx42mr7UAfCmaluVthDCpQV4gRvd07EuVc=
X-Received: by 2002:a67:ba0c:0:b0:3ce:f2da:96a with SMTP id
 l12-20020a67ba0c000000b003cef2da096amr3058204vsn.64.1674514721565; Mon, 23
 Jan 2023 14:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-6-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-6-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 08:58:15 +1000
Message-ID: <CAKmqyKMpU1KTHqzZWU9X6+4BoUj7OoSnd4H9x8SZfBBAti+LYg@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] RISC-V: Adding XTheadBs ISA extension
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 22:58:46 -0000

On Sat, Dec 24, 2022 at 4:01 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the XTheadBs ISA extension.
> The patch uses the T-Head specific decoder and translation.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Split XtheadB* extension into individual commits
> - Use single decoder for XThead extensions
>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |  2 ++
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 15 +++++++++++++++
>  target/riscv/translate.c                   |  3 ++-
>  target/riscv/xthead.decode                 |  3 +++
>  5 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b5285fb7a7..17273425a8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -110,6 +110,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
>      ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba=
),
>      ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb=
),
> +    ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs=
),
>      ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
>      ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
> @@ -1066,6 +1067,7 @@ static Property riscv_cpu_extensions[] =3D {
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
>      DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
> +    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>      DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0ac1d3f5ef..5f68cb1e1e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -467,6 +467,7 @@ struct RISCVCPUConfig {
>      /* Vendor-specific custom extensions */
>      bool ext_xtheadba;
>      bool ext_xtheadbb;
> +    bool ext_xtheadbs;
>      bool ext_xtheadcmo;
>      bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index a55d1491fa..fb1f2c5731 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -28,6 +28,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADBS(ctx) do {               \
> +    if (!ctx->cfg_ptr->ext_xtheadbs) {           \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XTHEADCMO(ctx) do {              \
>      if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
>          return false;                            \
> @@ -191,6 +197,15 @@ static bool trans_th_tstnbz(DisasContext *ctx, arg_t=
h_tstnbz *a)
>      return gen_unary(ctx, a, EXT_ZERO, gen_th_tstnbz);
>  }
>
> +/* XTheadBs */
> +
> +/* th.tst is an alternate encoding for bexti (from Zbs) */
> +static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
> +{
> +    REQUIRE_XTHEADBS(ctx);
> +    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
> +}
> +
>  /* XTheadCmo */
>
>  static inline int priv_level(DisasContext *ctx)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8439ff0bf4..fc326e0a79 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -128,7 +128,8 @@ static bool always_true_p(DisasContext *ctx  __attrib=
ute__((__unused__)))
>  static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
>  {
>      return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
> -           ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
> +           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
> +           ctx->cfg_ptr->ext_xtheadsync;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index 8cd140891b..8494805611 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -58,6 +58,9 @@ th_rev           1000001 00000 ..... 001 ..... 0001011 =
@r2
>  th_revw          1001000 00000 ..... 001 ..... 0001011 @r2
>  th_tstnbz        1000000 00000 ..... 001 ..... 0001011 @r2
>
> +# XTheadBs
> +th_tst           100010 ...... ..... 001 ..... 0001011 @sh6
> +
>  # XTheadCmo
>  th_dcache_call   0000000 00001 00000 000 00000 0001011
>  th_dcache_ciall  0000000 00011 00000 000 00000 0001011
> --
> 2.38.1
>
>

