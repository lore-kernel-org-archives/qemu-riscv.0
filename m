Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxImS-0008W4-U0
	for mharc-qemu-riscv@gnu.org; Tue, 14 Dec 2021 20:08:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kip@rivosinc.com>) id 1mxImQ-0008VT-Si
 for qemu-riscv@nongnu.org; Tue, 14 Dec 2021 20:08:27 -0500
Received: from [2607:f8b0:4864:20::a2f] (port=34514
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kip@rivosinc.com>) id 1mxImM-0004JW-48
 for qemu-riscv@nongnu.org; Tue, 14 Dec 2021 20:08:26 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id j1so13660023vkr.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Dec 2021 17:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f5xrJSxk3ukYQZaL8pUkKgM5XqQMCay4PyBtgCmi7pU=;
 b=cOHNXeZ7Fdjnv1lmG+D53h4DjmxfEqzMqJwPjuN9XZQ8RYVA/vqwlOqpS/fEl+z7+i
 54I9sO7xHyxNtegl0vXrAkFFlcjavT4N9e29/BP7dEjUYLiYOHtg7j74No179rd0yBJc
 4rBhZ1y3dd4GB8+9iUO2ZBvaJAxpFwdnTeAb2kTmvuAFsPEUsbvV/8hXkgdwF9W6XImP
 Y4WmllSOjSL0eb1nvpWHb1feEKvBpHe1CsPoWsU1RxTBKjRTAazNrY4ZwKj5UJIe2bu0
 7BAICS+JX6eFd2QdwrkHR9KjxTAH0k5/Xc1JW9zaWnkWnJV1sLpf6tekP+J+WVQ+XCxU
 oPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f5xrJSxk3ukYQZaL8pUkKgM5XqQMCay4PyBtgCmi7pU=;
 b=XCv0u+0sDrq3FBxd8pkNVwhtc5vv5XxeTCuUIn01IbP7YjjH7GQbGOuHZvf1a7h0eW
 1I4LxBZL7XpgtXAUBcTuL5k0hJRmGXtKPcgJlXWIUCaf9UXS7BUNU1QPEToDbXQma3SA
 m1V1EYCx+MtRKQc0cXr2bvqLPjNwrd/b2gZTm50xaNK0LAHwKCcuTh6DqfVtLbm6oVMi
 zSBnfmSPK11A9qaDkS5XA9Nq7aZikIzThEAGAj1+VLAUGaGgYlDZGj2ST7S1IsAefthN
 oM8HaNuCByKiXWyYmNxlHJWoZ82LGIJOlHvDkI/9t5bcUfHZWSkjWlKMEhHOwiyDVdSv
 7J+A==
X-Gm-Message-State: AOAM530KOsEnZGcOsH0XnXVaHaJ+Wuua6pMQwpGh7FFT3GYrZ8nqs5+D
 ysPjlRh/ZKj23UcueN9dUaU4W190ihoIlsQP2B/y0A==
X-Google-Smtp-Source: ABdhPJwY0G4b37RSX5ZN2M3mH0TB+9fsCJV5G8TCdjK+kj+qbK8gXjUCMU6gK6NNX3p7ovtEPCIUakpIS93QpQfcYV0=
X-Received: by 2002:ac5:cdfa:: with SMTP id v26mr2403291vkn.12.1639530500319; 
 Tue, 14 Dec 2021 17:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-17-anup.patel@wdc.com>
In-Reply-To: <20211211041917.135345-17-anup.patel@wdc.com>
From: Kip Walker <kip@rivosinc.com>
Date: Tue, 14 Dec 2021 17:08:09 -0800
Message-ID: <CABYrWZ95qCu8QiEfpQEy+=1cecLf+ruODAEg-vL8z58aBJffXw@mail.gmail.com>
Subject: Re: [PATCH v5 16/23] hw/riscv: virt: Use AIA INTC compatible string
 when available
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=kip@rivosinc.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 15 Dec 2021 01:08:27 -0000

On Fri, Dec 10, 2021 at 8:35 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We should use the AIA INTC compatible string in the CPU INTC
> DT nodes when the CPUs support AIA feature. This will allow
> Linux INTC driver to use AIA local interrupt CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3af074148e..936156554c 100644
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

I think this should be intc_name rather than name.

Kip

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

