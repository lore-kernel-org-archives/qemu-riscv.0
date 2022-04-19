Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngwBh-0005ml-4O
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 18:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngwBX-0005mA-Vi; Tue, 19 Apr 2022 18:19:00 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngwBW-0008P9-Ie; Tue, 19 Apr 2022 18:18:59 -0400
Received: by mail-io1-xd32.google.com with SMTP id i196so18990ioa.1;
 Tue, 19 Apr 2022 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u0EjLXEvSXFRSi5Rk1HFZpkBkuPXsgxQtcNhK//s22c=;
 b=Z+KBgrABNJaKxB8Qrkm9D/YrdUbPV4qOyOqDslrvf4xxRlZhnm3c1OzT3ZNBQbxReI
 MLRsN8aEFBl99z5rNOG5JjD8rU9O9nRqYap+IZIFQWIRraMy0kZ11s9OMMayfOBbY9GB
 6bgTRtTrRpn8MvMo0k91SNV44t8b5VIleJtONqsBKsMRHHPOvp6vIdWnyfe65VfuzUfG
 dol46i+KQXMeqTfvIKriUIAjIbYn/a0AEeSO4TyH8cRf/f6wMsbL6aFKAyL1wh/A0GM0
 dU++VpXQJW9ZhZ9OxidX6BIsVzPcNn6VibRVr//mBy/hGzSdM4MjI2FCgxCPAAxhKDcw
 hjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u0EjLXEvSXFRSi5Rk1HFZpkBkuPXsgxQtcNhK//s22c=;
 b=aJuQw5axNx1Rm/bamCoP3wtWw5GA/nysYYO+IrzcvBb+JYwHtdgQaIig8eL57LDq86
 8pBFuq/8lahQYENorhbH7yM+XJaiGhJZ7KRC+GivySdwqT4B6xqmcv5TDf+9BILR90Bl
 FUXGwPxGCkPdOVhhNxfqEV+e8d2DrIH6AvKc9+Q+hL26Ja9DZt2+E8SGbpnD9FQa7TCu
 5AXn2NPpSACvSwOVmnWNwDL2c66t71Ldqm8JISFM1whNaMIg4pbNh4FLdv8nGPun9xvj
 FSEa6FweBOsiFupyH9YqAQTohbPFhmL+WyrGMQGtGs5W9lAlEWWYLuXvCk7JcU+Ky5/a
 p0vA==
X-Gm-Message-State: AOAM532VVZnspUH67OpoyRAe/ShokBpBOUxjNj9TbbrsJMxLcGMlPyjH
 NA1CefbuzoL11YKqVtFHN/sx5ZtvxHQIJDxXv9TUeRh7danL51o4
X-Google-Smtp-Source: ABdhPJxyS4b1wapqaZlp+ggkyb1hUyFhas1Q2QzCScbZ96UtOwagkG72iCLxhDs+sa+r3NmeZVX67+hMSoyEfSVHf3E=
X-Received: by 2002:a05:6638:14d0:b0:328:8953:586f with SMTP id
 l16-20020a05663814d000b003288953586fmr5611676jak.66.1650406737041; Tue, 19
 Apr 2022 15:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220416193034.538161-1-qemu@ben.fluff.org>
 <20220416193034.538161-2-qemu@ben.fluff.org>
In-Reply-To: <20220416193034.538161-2-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Apr 2022 08:18:31 +1000
Message-ID: <CAKmqyKP066+Yin9JJ8n0S7P1iGtP_Dqi1ssUbdDgnWpVbS2gLg@mail.gmail.com>
Subject: Re: [PATCH 1/4] device_tree: add qemu_fdt_setprop_reg64 helper
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Tue, 19 Apr 2022 22:19:03 -0000

On Mon, Apr 18, 2022 at 7:15 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Add a macro qemu_fdt_setprop_reg64() to set the given
> node's reg property directly from the memory map entry
> to avoid open coding of the following:
>
>     qemu_fdt_setprop_cells(fdt, nodename, "reg",
>         0x0, memmap[SIFIVE_U_DEV_OTP].base,
>         0x0, memmap[SIFIVE_U_DEV_OTP].size);
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
>  include/sysemu/device_tree.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..28352e7fcb 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -135,6 +135,21 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>                           sizeof(qdt_tmp));                                    \
>      } while (0)
>
> +/**
> + * qemu_fdt_setprop_reg64:
> + * @fdt: the device tree path
> + * @node_path: node to set property on
> + * @map: the map entry to set the reg from
> + *
> + * A helper tp set the 'reg' node on the specified node from the given map
> + * entry.
> + */
> +#define qemu_fdt_setprop_reg64(fdt, path, map)                  \

Maybe the name should include memmap?

qemu_fdt_setprop_reg64_memmap() ?

Alistair

> +    qemu_fdt_setprop_cells(fdt, path, "reg",                    \
> +                           (map)->base >> 32, (map)->base,      \
> +                           (map)->size >> 32, (map)->size)
> +
> +
>  void qemu_fdt_dumpdtb(void *fdt, int size);
>
>  /**
> --
> 2.35.1
>
>

