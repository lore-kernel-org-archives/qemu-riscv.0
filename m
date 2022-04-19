Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngwCl-0006np-Ak
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 18:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngwCj-0006lK-ID; Tue, 19 Apr 2022 18:20:13 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:42502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngwCh-0000EB-4H; Tue, 19 Apr 2022 18:20:13 -0400
Received: by mail-io1-xd36.google.com with SMTP id c125so11907322iof.9;
 Tue, 19 Apr 2022 15:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jBcS4WKxJhZUb8y1VAN3QB/YAUI6wx+K83aorZprlf8=;
 b=ekNAV1fqVrwp8RaderYDNQmbUR5f061nkuyoVBrJoQRr2u9/IwB1oJER3UytmZddua
 1/ZlQeYOkSqSQaMrtfILNnX5FZwSE9X+jmquh1aTsXZBPs19DuSXYpqNQv71qzWtcU5O
 2ZcVqNhTak0FAYNxoIRz7PpVPIPde4vom7+p04HAJWmU0j2Z6dwSjTRw5fHePjYo2LGx
 0fwtSBLo0MQ33MjHuzX6VXJpQYtDNKxzFLvFQaGI/YKDVcrXdf4Z2DDg93CNTvXtbaYu
 stF22XMhzzDVrXEVFuVWDn/XRuysK1+WLj53M7Mwrw9lGTVUW+fo0RLUPAI3sdaC+G08
 rGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jBcS4WKxJhZUb8y1VAN3QB/YAUI6wx+K83aorZprlf8=;
 b=d6FF+QXgKQDe6nFUGR+0MsVOm39ILznQHZ4wt8VJVt5K017BRrg4ZLOO1MoqsF5qeS
 HvXXgPXrW08LyGjxNNd2URAVBkNg/eiz85aszju2jFYKGurhK2ygEGpFJVxehNV5UW48
 d8i8XK/eHR0LkF0GQ3uYD/arevWayF1F4idX67QSWRgWZdOJ7bnpiEx6rOpYRwueTPCQ
 V2kEEYe57M6JtDlVwpW/xNvPI62ul54gkHOkvRqz0BvlT/d1j2beo+r/SqqEb95ntxX0
 4ur5rtpdm82l/O50pRma2sUFmmQYLgeAUb5TLwSrx/8LDwSn2zAVvTSj7jYbDoJL9nbK
 3Tyw==
X-Gm-Message-State: AOAM5320R0KNdrmSg/MPzDVLzn7YQPW3m3AKg9ilWRYf6avpmVEvBYvr
 +qEcS96N2GeMTQwas+7Fqt/dDSB1pkSG7Q4bw41yXE72jIYcag==
X-Google-Smtp-Source: ABdhPJxiFHbuHQR9QXAud/QsVN0MkmGH0gEf2jMd6ZUxR7EEKHBPIzt5YNWHMGujndoRJOG5JzFWcw0cP36jMdTwhPI=
X-Received: by 2002:a05:6638:d06:b0:326:ba0:347 with SMTP id
 q6-20020a0566380d0600b003260ba00347mr8225962jaj.68.1650406808305; Tue, 19 Apr
 2022 15:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220416193034.538161-1-qemu@ben.fluff.org>
 <20220416193034.538161-4-qemu@ben.fluff.org>
In-Reply-To: <20220416193034.538161-4-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Apr 2022 08:19:42 +1000
Message-ID: <CAKmqyKOo1kD-eWgpnMgbskyv8pZBuziKjtGDD=4c-X79zq49QA@mail.gmail.com>
Subject: Re: [PATCH 3/4] device_tree: add qemu_fdt_setprop_strings() helper
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Tue, 19 Apr 2022 22:20:14 -0000

On Mon, Apr 18, 2022 at 7:14 AM Ben Dooks <qemu@ben.fluff.org> wrote:
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
> ---
>  include/sysemu/device_tree.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 28352e7fcb..6ad09564d7 100644
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
> + * @name: node name

This should be path instead of name (or change prop to name)

Alistair

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

