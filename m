Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqk36-0008OF-Vr
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 19:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk2u-0008MB-UQ; Mon, 16 May 2022 19:22:37 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:33562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk2t-0006oS-A1; Mon, 16 May 2022 19:22:36 -0400
Received: by mail-io1-xd31.google.com with SMTP id q203so1854079iod.0;
 Mon, 16 May 2022 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O2gCER8bI8bu7k24fhddFedq1ib4zZY8xb9hZyo0K2M=;
 b=dM6/IeHLhfNGJ8eloNAdSodMOitCCXhXN2UusSwWiEbAHUQxzfCca/dgEnPdrddH18
 JwepONBVS6W2HY6fiB0Luhe49FFZbEOydlYUHsBh0T3IzPT0z/ChBAbxUYPGRIMQIUKI
 ocmgJk0Y56SXQQ6oMcAD1yfWiE1yxLCZ6i5SUCKdVr+j8o3fB5Uf1WHga+voUrRqlKL2
 E5sH29twzBZh0bWAUmk2Qt6o4f74IxYTmdNij5y7VY16rWDkjcG7xHmL9392s/Z0potA
 wIKhoHPN5Fnl7B+li1DFl8NikG3Yc9TVEHNFywWu1sqSXMCKmFnsssVgLD3mt3AstwNS
 1cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2gCER8bI8bu7k24fhddFedq1ib4zZY8xb9hZyo0K2M=;
 b=NiE7AzgU4gEXQC65NS5sWI6yrWsNP7j9/lxRbDsC77FuByCR8uqYPXkLgHv+vKVL/r
 Z4CKltwOqEbIawl2gLsddaFFKcL8qgNXKcqvCj5ExOmufyqjtrr/louPK9/I7MRql+qH
 TXOBVlTJ5oFS2etgL2vTqAHi3zI59jz0kXaNtuJGHyDzQ+JAWZ+KewxD3klzT8lONaFG
 kQmm/6hCehflTflFIvDcR0FLfeGudEE5lLDd0Rs9qbHehbYkdCBPaf4UwY6iKNDnQcKs
 KROmJV5/jl98p0ZhXS56zsiz0m5JZz55eN74Qzv9Ce8RjKG4rHAAQeJzJ8CIJ32NdeTt
 Bbag==
X-Gm-Message-State: AOAM5329VyAQy4cn25ScpB9/9i/uen7/E+PnzFsD3b2BnfcPxpX9dmm0
 gsKBuiZHSuUeIU7GgoZip9vd8SDmKjMY36GQbR8=
X-Google-Smtp-Source: ABdhPJyRtN5oXHwLmzHBIg+eSE4jFjjqKwzniT53yUi1RZn9hsWao1syKTlE7vsT24AYD0K2cF77xI3QteU7YKjmGIU=
X-Received: by 2002:a5d:948a:0:b0:64d:23a4:9afa with SMTP id
 v10-20020a5d948a000000b0064d23a49afamr9062732ioj.114.1652743353441; Mon, 16
 May 2022 16:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220512182103.408627-1-dgreid@rivosinc.com>
In-Reply-To: <20220512182103.408627-1-dgreid@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 09:22:07 +1000
Message-ID: <CAKmqyKPzTP6MxATeQ9iMmDsj1h1rU6PFPGSEbPZ9DH6DV76kmg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Avoid double FDT platform node
To: Dylan Reid <dylan@rivosinc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Dylan Reid <dgreid@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Mon, 16 May 2022 23:22:38 -0000

On Fri, May 13, 2022 at 5:12 AM Dylan Reid <dylan@rivosinc.com> wrote:
>
> When starting the virt machine with `-machine virt,aia=aplic-imsic`,
> both the imsic and aplic init code will add platform fdt nodes by
> calling `platform_bus_add_all_fdt_nodes`. This leads to an error at
> startup:
> ```
> qemu_fdt_add_subnode: Failed to create subnode /platform@4000000: FDT_ERR_EXISTS
> ```
>
> The call from `create_fdt_imsic` is not needed as an imsic is currently
> always combined with an aplic that will create the nodes.
>
> Fixes: 3029fab64309 ("hw/riscv: virt: Add support for generating platform FDT entries")
> Signed-off-by: Dylan Reid <dgreid@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3326f4db96..d625f776a6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -561,11 +561,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>      }
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
>
> -    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
> -                                   memmap[VIRT_PLATFORM_BUS].base,
> -                                   memmap[VIRT_PLATFORM_BUS].size,
> -                                   VIRT_PLATFORM_BUS_IRQ);
> -
>      g_free(imsic_name);
>
>      /* S-level IMSIC node */
> --
> 2.30.2
>
>

