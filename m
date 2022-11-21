Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox17C-00064W-Ta
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 02:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ox17B-00061J-V9; Mon, 21 Nov 2022 02:21:13 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ox178-0007aB-1Y; Mon, 21 Nov 2022 02:21:12 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id p4so10356145vsa.11;
 Sun, 20 Nov 2022 23:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YfgFvdlKn85PiEBEgBb+6Rnv2J2SWfU0TtDFciMICX8=;
 b=UOJBga2aKMHzp/ihcW7RqT4tsw7pPZbcIO4YqC0XtAh1lCzicKeas8hV9BNprSTT51
 728UqOdtRA3S8wMuXuu/XwVWRz6r11ECNmZKPq9o8zx99/ygaNUbn2tzlxWEtAyQT9P4
 z+If35ZyEuyXYTftoQrmt6D4k8Oz3hFYn02HSzAEmb3S0TUKCJfv7dmuJOuGG2BwdRBU
 gcyGAfL87RlIv2gjM9gexrrGYfwuQ6o43D+M93Rm3ntTN54SO+h6CI5Ek9XkbK/sMvyD
 i1BXowAES62GiqC/hpj0TDuR+HEdPiaG+75Ip0CFaffFu1By/6LmBfAnOzioIr/Gu+dj
 42HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YfgFvdlKn85PiEBEgBb+6Rnv2J2SWfU0TtDFciMICX8=;
 b=KpV975C9M2PIiXLlJpid3v6RIDnz6uoLG0TPQe11KiE/RN2TbAzd3smHb114rukigv
 3x0Jie2mmHr/10ftH5jLAI8PCrEIDfEnzMD0Ryy6pHy+jUI2SkDLxkeo1ukE8eI0ORJp
 QN1lHkAKPu/t+vZCfOmnBByUXsrh8OdCBiEF4S2z8w1PkOyFz5G7t71S+FdmxxmDU5iu
 Ny/5cNLMfzexcO3ozT038fwRSpXs7p9icq3vMOdcW2pEEl+k5YIvcaPzdU/SI3QJZCro
 BBzEX+U6wAnM5zBuWNGlbCI/RaiNJlzDDVwm79yc+fCKyDwwoBkSYw9rkS7GscsAIAVo
 3HlQ==
X-Gm-Message-State: ANoB5pn5kjzWiuGNZGuP8kHaCiHnpQ7Cjmq2nrjxz/AX4gHmfkeYNwP/
 7UIvAlvk5Eu/jlBFQua00jX+El2E54QQqb8GX1Q=
X-Google-Smtp-Source: AA0mqf4GkWgi3HOI9I9sNKBh37G++TLaIiFR5GuBv2rd2CGhx0EavHNKk92W/xADonrJFTl2EhEES8N/BwxQCq563NM=
X-Received: by 2002:a05:6102:11f1:b0:3a6:fde0:cf74 with SMTP id
 e17-20020a05610211f100b003a6fde0cf74mr1316236vsg.73.1669015267227; Sun, 20
 Nov 2022 23:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
 <20221118123728.49319-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20221118123728.49319-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 17:20:40 +1000
Message-ID: <CAKmqyKMRd3nvxqjz6VNhw-LHmLA52THnwiqV0+tBf02Jsqq8ew@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] target/riscv: add support for Zcd extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 21 Nov 2022 07:21:14 -0000

On Fri, Nov 18, 2022 at 10:40 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Separate c_fld/c_fsd from fld/fsd to add additional check for
> c.fld{sp}/c.fsd{sp} which is useful for zcmp/zcmt to reuse
> their encodings
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn16.decode              |  8 ++++----
>  target/riscv/insn_trans/trans_rvd.c.inc | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
> index f3ea650325..b62664b6af 100644
> --- a/target/riscv/insn16.decode
> +++ b/target/riscv/insn16.decode
> @@ -97,12 +97,12 @@
>  }
>  {
>    lq              001  ... ... .. ... 00 @cl_q
> -  fld             001  ... ... .. ... 00 @cl_d
> +  c_fld           001  ... ... .. ... 00 @cl_d
>  }
>  lw                010  ... ... .. ... 00 @cl_w
>  {
>    sq              101  ... ... .. ... 00 @cs_q
> -  fsd             101  ... ... .. ... 00 @cs_d
> +  c_fsd           101  ... ... .. ... 00 @cs_d
>  }
>  sw                110  ... ... .. ... 00 @cs_w
>
> @@ -148,7 +148,7 @@ addw              100 1 11 ... 01 ... 01 @cs_2
>  slli              000 .  .....  ..... 10 @c_shift2
>  {
>    lq              001  ... ... .. ... 10 @c_lqsp
> -  fld             001 .  .....  ..... 10 @c_ldsp
> +  c_fld           001 .  .....  ..... 10 @c_ldsp
>  }
>  {
>    illegal         010 -  00000  ----- 10 # c.lwsp, RES rd=0
> @@ -166,7 +166,7 @@ slli              000 .  .....  ..... 10 @c_shift2
>  }
>  {
>    sq              101  ... ... .. ... 10 @c_sqsp
> -  fsd             101   ......  ..... 10 @c_sdsp
> +  c_fsd           101   ......  ..... 10 @c_sdsp
>  }
>  sw                110 .  .....  ..... 10 @c_swsp
>
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 1397c1ce1c..def0d7abfe 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -31,6 +31,12 @@
>      } \
>  } while (0)
>
> +#define REQUIRE_ZCD(ctx) do { \
> +    if (!ctx->cfg_ptr->ext_zcd) {  \
> +        return false;     \
> +    } \
> +} while (0)
> +
>  static bool trans_fld(DisasContext *ctx, arg_fld *a)
>  {
>      TCGv addr;
> @@ -57,6 +63,18 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>      return true;
>  }
>
> +static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
> +{
> +    REQUIRE_ZCD(ctx);
> +    return trans_fld(ctx, a);
> +}
> +
> +static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
> +{
> +    REQUIRE_ZCD(ctx);
> +    return trans_fsd(ctx, a);
> +}
> +
>  static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
>  {
>      REQUIRE_FPU;
> --
> 2.25.1
>
>

