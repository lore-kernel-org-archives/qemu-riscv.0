Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3BP6-000428-Ko
	for mharc-qemu-riscv@gnu.org; Fri, 31 Dec 2021 01:28:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n3BP4-0003zA-2U; Fri, 31 Dec 2021 01:28:39 -0500
Received: from [2607:f8b0:4864:20::b32] (port=44994
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n3BP2-0005t9-Fn; Fri, 31 Dec 2021 01:28:37 -0500
Received: by mail-yb1-xb32.google.com with SMTP id i3so63737084ybh.11;
 Thu, 30 Dec 2021 22:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qC4p5MBo1f2jzshZnn28VPpiyg3eAGA22vMrjRj/y8k=;
 b=jXTm41uvD+1pLnNvqKASuOwYP/siy2O88y4i4N3QkEAwc6FTiNB6mffCK5drVR/Uqw
 yiSJOtdVD0kK2dXQfgCN2Gcqc9lOq0kWYdhbb/nJtdlEjMnX4kMEyj90dDWuHAF5FRVW
 7zq6WQauyoodxZ5R6sRhlu+C8d9k1q37u1guRJ1jsJeGpPltvWzrnuSaFGvrdfFMz6xH
 FXhgGa+EypqCtZFFkcpcYu/x3zpHsgy94QXwkMkTgWWSbTmg+tT1oeQ3B1poyWiB+CJd
 Thg1r9Y1FbckI/homy74HhNmYbkOYzDIo2ft/t7Ae8Q0p781YWmFicWRuu2SlALUWANY
 Mwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qC4p5MBo1f2jzshZnn28VPpiyg3eAGA22vMrjRj/y8k=;
 b=y/x5gEjS2WROzMtUqX1XSQpnWjqpKylvumR9wlZMBODb9+b8RF37pbp2LwI2JCn01X
 AV2Q/rG+rCez5iD0bsCo8nINc8b8KNdvvHoHxcRf4x/njioPojafAhV5raZTsT1XzQ4/
 BOYhwMnr0ku0HZUCMW66p5WF0QBmSE9hexGXqeAtAHdsDmq9nGhImmjRrjSr24e2d8jd
 qVyHvC7vCIgxuP/agGJ/fElYxf1gwU294FRYPxh9UQ4Kh79UJm2Qf/na8if9zk7d06LE
 GezjjkMIsNADuVbpwW96x7+0aVnakquqsJ1gcA6zgDudVp0xzMvZHiJy+ie8dfTkggz1
 qoQg==
X-Gm-Message-State: AOAM532qNef09g8DDPwK5MrG5OOlZxLxu/0GmT07WiwqydKJuMta0cW+
 M86syQU6LmX93QM0YUKJfToI8e5mdddTTjDu7Yw=
X-Google-Smtp-Source: ABdhPJw4i7j+UrTk5nbh7ej3FRN8jC8N0ACEWUoglUi9+7jKpXTHcOaQYusq2VtX2TFmqxQmlAhp93xqjHURMlA7fHQ=
X-Received: by 2002:a25:3242:: with SMTP id y63mr27856104yby.670.1640932115091; 
 Thu, 30 Dec 2021 22:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20211231032337.15579-2-liweiwei@iscas.ac.cn>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 31 Dec 2021 14:28:23 +0800
Message-ID: <CAEUhbmWG-G96R6k8frQg+cdwkEV84xkQKt3h8zd=Wg1H8_aSfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] target/riscv: add cfg properties for zfinx, zdinx
 and zhinx{min}
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 ardxwe@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 31 Dec 2021 06:28:39 -0000

On Fri, Dec 31, 2021 at 11:26 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> From: liweiwei <liweiwei@iscas.ac.cn>

You missed here, "From" should match "SoB" name

>
> Co-authored-by: ardxwe <ardxwe@gmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu.c       | 12 ++++++++++++
>  target/riscv/cpu.h       |  4 ++++
>  target/riscv/translate.c |  8 ++++++++
>  3 files changed, 24 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6ef3314bce..d9ea005724 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -491,6 +491,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_d = true;
>          }
>
> +        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> +            cpu->cfg.ext_zhinxmin) {
> +            cpu->cfg.ext_zfinx = true;
> +        }
> +
>          /* Set the ISA extensions, checks should have happened above */
>          if (cpu->cfg.ext_i) {
>              ext |= RVI;
> @@ -565,6 +570,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (cpu->cfg.ext_j) {
>              ext |= RVJ;
>          }
> +        if (cpu->cfg.ext_zfinx && ((ext & (RVF | RVD)) || cpu->cfg.ext_zfh ||
> +                                   cpu->cfg.ext_zfhmin)) {
> +            error_setg(errp,
> +                    "'Zfinx' cannot be supported together with 'F', 'D', 'Zfh',"
> +                    " 'Zfhmin'");
> +            return;
> +        }
>
>          set_misa(env, env->misa_mxl, ext);
>      }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index dc10f27093..6fba31c5cd 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -315,8 +315,12 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_zdinx;
>          bool ext_zfh;
>          bool ext_zfhmin;
> +        bool ext_zfinx;
> +        bool ext_zhinx;
> +        bool ext_zhinxmin;
>
>          char *priv_spec;
>          char *user_spec;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 5df6c0d800..8b1cdacf50 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -76,8 +76,12 @@ typedef struct DisasContext {
>      RISCVMXL ol;
>      bool virt_enabled;
>      bool ext_ifencei;
> +    bool ext_zdinx;
>      bool ext_zfh;
>      bool ext_zfhmin;
> +    bool ext_zfinx;
> +    bool ext_zhinx;
> +    bool ext_zhinxmin;
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> @@ -703,8 +707,12 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->misa_ext = env->misa_ext;
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
> +    ctx->ext_zdinx = cpu->cfg.ext_zdinx;
>      ctx->ext_zfh = cpu->cfg.ext_zfh;
>      ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
> +    ctx->ext_zfinx = cpu->cfg.ext_zfinx;
> +    ctx->ext_zhinx = cpu->cfg.ext_zhinx;
> +    ctx->ext_zhinxmin = cpu->cfg.ext_zhinxmin;
>      ctx->vlen = cpu->cfg.vlen;
>      ctx->elen = cpu->cfg.elen;
>      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
> --

Regards,
Bin

