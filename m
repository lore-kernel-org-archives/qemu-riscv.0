Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQJYu-0003gx-8E
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 21:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQJYr-0003fG-KG; Tue, 14 Sep 2021 21:18:06 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:42893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQJYp-0005Km-3b; Tue, 14 Sep 2021 21:18:05 -0400
Received: by mail-io1-xd2a.google.com with SMTP id b10so1299042ioq.9;
 Tue, 14 Sep 2021 18:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oA/6H/fpfAMxUa/c02AtlY0ykCkbNp1a5+7pLBejK/E=;
 b=L+qNuyG1H9gGoX/DPwuDIWcJ2/SQQNT8BxgMScZW+z4wFiLFstaMUZID4HTt9T3v9J
 xb4WnBCRIgVL4aS13y1XGAHK74SEOid3PzCaQFvP2AGH/2eD/8CO1VT3eucTtBE5Cw83
 8VRxvP/IQeOmC7h4YY2I/m1J4CyyrTV00RCVEArCFBSSWqNoZxaLbBrNb+5IX//PqML0
 RPaFNvvbZhBOX4GK3ysf5e3tp4PDVOPBVma8NlfAh76e9WHb93InFkSOSzLgRYvaagIr
 Q/y2hPDwvWy5msWUbQJzLXaskZxFmCecdm2GjKun6SkpBVXcG9z5nYjK6GawloUgsEsj
 dqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oA/6H/fpfAMxUa/c02AtlY0ykCkbNp1a5+7pLBejK/E=;
 b=7uYDYuy+DRzHFJq8ribkX3pl+ENxWIoXK0P6nubGGQl6iC4ShgWFc7/sjikwKfuyZt
 ySLggtyHoO7IgVXtQ9BCrPXriX2ez3kcLxfk2u1yj4CbLICpB6OAB6zg0Y8Ce4VtwORA
 HdVz1UV/5qvn/pxnAzSWX4RvQl4WJ3yZeWasOtL97y1gGSaaFJHqQEdkqORNI1Hw273S
 VDr8HsF3KOAwiSG5k2P7HjZXkvUZC74iT5vhL9JpSL5IA2WVksTf+hzXj+9njCnDebnU
 CZtRzw1nobV9WXhHRkxDin0WZuw5umHyN5Q6/GSC2/2MtAzMqwxitt2DlXE0X6A0dwBy
 6oUg==
X-Gm-Message-State: AOAM532WLFem6hWMepdTki/fcLWZVz2NHBgMCeeXPJ1Mp30Oku63JSlW
 TqL6yISTD02v9heYqI6cx3EU1y6iv5HZD8jm7yE=
X-Google-Smtp-Source: ABdhPJx9bnQVc1XcHbH4TeXtrK9XP/oAdCqhUG/OeWdECb9egDWHACSswQeEt2tH8n1qiNFi8m/524ZcbY37f46KcNQ=
X-Received: by 2002:a6b:ce17:: with SMTP id p23mr16156269iob.90.1631668681626; 
 Tue, 14 Sep 2021 18:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-17-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-17-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 11:17:35 +1000
Message-ID: <CAKmqyKNsihYsOtmKQKv51aAy7atWZoRziOzuLtAo-WmoCftdXw@mail.gmail.com>
Subject: Re: [PATCH v2 16/22] hw/riscv: virt: Use AIA INTC compatible string
 when available
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Sep 2021 01:18:06 -0000

On Thu, Sep 2, 2021 at 9:58 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We should use the AIA INTC compatible string in the CPU INTC
> DT nodes when the CPUs support AIA feature. This will allow
> Linux INTC driver to use AIA local interrupt CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ec0cb69b8c..f43304beca 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          qemu_fdt_add_subnode(mc->fdt, intc_name);
>          qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
>              intc_phandles[cpu]);
> -        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> -            "riscv,cpu-intc");
> +        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> +                          RISCV_FEATURE_AIA)) {
> +            static const char * const compat[2] = {
> +                "riscv,cpu-intc-aia", "riscv,cpu-intc"
> +            };
> +            qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
> +                                      (char **)&compat, ARRAY_SIZE(compat));
> +        } else {
> +            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> +                "riscv,cpu-intc");
> +        }
>          qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
>
> --
> 2.25.1
>
>

