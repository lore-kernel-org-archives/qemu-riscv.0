Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3BCW-0006aG-4v
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3BCU-0006Xc-Kr; Mon, 20 Jun 2022 02:47:54 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3BCO-0003tw-G6; Mon, 20 Jun 2022 02:47:54 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e63so7966063pgc.5;
 Sun, 19 Jun 2022 23:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DOH6PDWCU7YY5Ck1+OmpszPEgbrh1INv2/qfBux1kc=;
 b=WBeQjGhV9sTMHz4vURCxr1v+BHQgnvkLQXatXYf6xaYMZLVPQe/btaTsKJ9qJA0kU3
 1yWY4eM/u7wqLEs9ufJS0WoHPvG8OIs+drcMoWzrPJ184ZF7tEXtBnwNvOLY18841VuK
 3J5tqDzk5e7VyJxo+D1/kfHP56F8yI8uCbCLxhkJ+/5UQhuCwiax5nKHtZjF2eyquMA8
 JYKJ/qj39c6aHQ5ih09Mg4+tjFGpl1emOuUJH4IM3gSQrgspw69Edu0ql9sI+0qkLkd4
 LPeTPJkX4IA8JeQvwbJ2nOfEK/KEDcyeqJb3wEaf9Qbm+zs1JBF3F6ypuCspaTXsYGd0
 JRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DOH6PDWCU7YY5Ck1+OmpszPEgbrh1INv2/qfBux1kc=;
 b=ouPK/e2ehsJEarCCEQ5nAMK1RzBU926xVt5GhvnHCk9M7k61mMgSekUfPQPP/bje5K
 8m7NaNhUCioTZDerv4htBOj6bFGNcvwFEdsQ53hTtxDVsE2sPkANMf362z8BcS3ZropO
 5XSBYOE+zp5kjMFMRXGXCSu6cIN5DNaUTcRNUsZtRJ+ZBsLwymRJ88sOi2NGOlHr5LQ7
 Fvo945RmPmaPCU//c9taWmuhOfwF0VOxOaaDVQ96xbo0ByT9V00mkERKO+wCzRksLoMY
 tIlTR7QckfdAZIyawVdeC3sfObNUKmpsHuHmJsOFvgH71sI80T2t9KwbOOCfIPzd3Nko
 ulcw==
X-Gm-Message-State: AJIora95YQWP5kpIkb8fdIxPhzTSib+DBumUiLlX3Bk8gF04FM1GXSYD
 E/1oc+y9QkNKm9Ih6e0ETr4gT/ZY+J3ytAa1Gn4=
X-Google-Smtp-Source: AGRyM1tITq8Dh4ISdoB6r8IsJ5a44zPREqDCzmsDlJSt7Jefkjfd6oIRteRBWkeLXUml48cjb7pF5Rh3W+Fz/t7t/FY=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr19895232pgw.223.1655707666719; Sun, 19
 Jun 2022 23:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220618201433.240973-1-qemu@ben.fluff.org>
 <20220618201433.240973-4-qemu@ben.fluff.org>
In-Reply-To: <20220618201433.240973-4-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Jun 2022 16:47:20 +1000
Message-ID: <CAKmqyKPc00DCo8ArcakGktu3_CQA3UK+3AZczXASzQCjL+LFKw@mail.gmail.com>
Subject: Re: [PATCH 3/4] device_tree: add qemu_fdt_setprop_strings() helper
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Mon, 20 Jun 2022 06:47:55 -0000

On Sun, Jun 19, 2022 at 6:20 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Add a helper to set a property from a set of strings
> to reduce the following code:
>
>     static const char * const clint_compat[2] = {
>         "sifive,clint0", "riscv,clint0"
>     };
>
>     qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
>         (char **)&clint_compat, ARRAY_SIZE(clint_compat));
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> --
> v2:
> - fix node/path in comment
> ---
>  include/sysemu/device_tree.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 79ce009a22..28b68bacaf 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -87,6 +87,21 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>  int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
>                                    const char *prop, char **array, int len);
>
> +/**
> + * qemu_fdt_setprop_strings: set a property from a set of strings
> + *
> + * @fdt: pointer to the dt blob
> + * @path: node name
> + * @prop: property array
> + */
> +#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
> +    do {                                                        \
> +        static const char * const __strs[] = { __VA_ARGS__ };   \
> +        qemu_fdt_setprop_string_array(fdt, path, prop,          \
> +                (char **)&__strs, ARRAY_SIZE(__strs));          \
> +    } while(0)
> +
> +
>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *property,
>                               const char *target_node_path);
> --
> 2.35.1
>
>

