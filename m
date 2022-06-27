Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5pkV-00033w-Fb
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 10:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o5pkT-00031X-0Q; Mon, 27 Jun 2022 10:29:57 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:41896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o5pkR-0002T4-Cj; Mon, 27 Jun 2022 10:29:56 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id q4so14919175qvq.8;
 Mon, 27 Jun 2022 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2NgUqvqHEeTrLEgVSWGWamO1AwSS+OIhS8h0F1XtfQo=;
 b=ZNJ/RMbJbAupUedHgK4QhyQH+C1qfDa/Av5eoeUpAbqkSZvKkm9nqoPLt5uYvwowni
 K/POTcB8RO2oupCltRo5DbH5NnFfBuOTbAMmVTxxeWW61PdFUgDVOhJkzfNacF55YiL4
 nkTqwIWnhXvwavNo1rEfYiwfCl6XczgXVn5WoZceUZ1DgMI2XlZ4K56/UAwOgbIGVQL+
 keRHogd8LzZ6DWbQ6SsndXFNGYrYOEZ1Y8bfA8ZHoN3JAV7VWkvc8gbUVchvzwf/NXkZ
 Y6SsU4B/iH6kFxDUtUh/EJWPbk107Ovxey/2kdp9FZOjM6/zAfb00RLA4kuIe501innW
 pKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NgUqvqHEeTrLEgVSWGWamO1AwSS+OIhS8h0F1XtfQo=;
 b=q2FJAnfD1+9WuoLN7fyXU60RpAI7wzaMQ5tQ1dg13QzQjF1+5uOoWNxJxw04oNnSqo
 rrRrqmIitfk3D7G9ldQ3IpZq3yWuPqzkEP3FN18zh2KslzLWnExvidU/Q6iaZT9R4p09
 StlIqVJ1HdrWLgEAI3TkrDAHePwWd/3orgxMbmQdqcV/rueJTM8O2MXW3/m5NVYw7bDF
 UXk+FT2JtiKYytXOBDRtr1OjvmnqEY0L/JKuxarLEemgfpIQL8XXczxEGBZMZ8Esu7kY
 vYID0Brp9ebDc+6DRPRvC7x4jLgJWxpkA45NgTanaaymY9861ieqK7rwcXGWXfIhGJK1
 XzUA==
X-Gm-Message-State: AJIora/Eg3i6Y6xp6MycATA8kt7AqAatHqJS5a9esHRXnJq+IATdgYQX
 5mv1Mqxs94+ECNpQS/9ENep7n3Yf3m1ARhJWhRs=
X-Google-Smtp-Source: AGRyM1v1KaDKINCWktmli1IvafIJikpYVh4PIg1ioLdtn/N4EFvc7sbx2hLUyd/hD7KM2ts3rjekuPA4kHdg0sq954Q=
X-Received: by 2002:a0c:cc0b:0:b0:470:b4f5:aae2 with SMTP id
 r11-20020a0ccc0b000000b00470b4f5aae2mr6223447qvk.114.1656340194052; Mon, 27
 Jun 2022 07:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220627094029.1379700-1-rpathak@ventanamicro.com>
In-Reply-To: <20220627094029.1379700-1-rpathak@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Jun 2022 22:29:42 +0800
Message-ID: <CAEUhbmUcyDNN5APO4yXALposd8Vt6f5RV=t4_VfPL6bHnGkNUQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix user-mode build issue because mhartid
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <apatel@ventanamicro.com>, 
 Rahul Pathak <rpathakmailbox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 27 Jun 2022 14:29:57 -0000

On Mon, Jun 27, 2022 at 5:40 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> mhartid csr is not available in user-mode code path and
> user-mode build fails because of its reference in
> riscv_cpu_realize function
>

Normally a "Fixes" tag should be added, but see below:

> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0a794ef622..03f23d4b6d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -643,9 +643,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
>              (env->priv_ver < isa_edata_arr[i].min_version)) {
>              isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +#ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x%lx because "
>                          "privilege spec version does not match",
>                          isa_edata_arr[i].name, (unsigned long)env->mhartid);

I can't find this in the mainline codes, so I assume this code exists
in Alistair's tree?

If that, please indicate in the commit message that this patch should
be squashed into the offending commit in Alistair's tree.

> +#else
> +            warn_report("disabling %s extension for hart 0x%lx because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name);
> +#endif

Regards,
Bin

