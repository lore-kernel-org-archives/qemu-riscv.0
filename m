Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my6Vi-0002qR-RH
	for mharc-qemu-riscv@gnu.org; Fri, 17 Dec 2021 01:14:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my6Vd-0002pY-0s; Fri, 17 Dec 2021 01:14:25 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=45003
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my6VV-0002u2-Jo; Fri, 17 Dec 2021 01:14:20 -0500
Received: by mail-io1-xd2f.google.com with SMTP id b187so1513545iof.11;
 Thu, 16 Dec 2021 22:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsQlIPbfs63bgVZMq0eatUFJtXb7PqaqeZ12GSkL7a8=;
 b=UL8Vpy+zut8jXorjTLjqv0Z0oUy4ZoS8mzMgWJTN1dFAaJ+mJPZvz654g/x9gL5Pnm
 vR4MXdyyfskVn12k+aNGZr4QnyJoGnbU10U/wc3mxIRPaH6kKqEjD+6kYQee/obNuenn
 vqOBjWI5/otbi0R2xOFsYd2VVDer6oiBhy/ItWcCc0HPCOwVwQ1JIzAzxAXrYVFR9gsF
 x7GayBpPPDkGiTi2yDOaEs7M80tVEyqyQgDUEoV33u0jHp8z6FBCqkqTZ7OTYD+zJV7v
 itBeGes2/LsfFVV9pqTIl07SNmfjsNlnp5m7atEnrrIVL/y5850WYpakpK9Db+mZWL6W
 MFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsQlIPbfs63bgVZMq0eatUFJtXb7PqaqeZ12GSkL7a8=;
 b=RXB5qIpSnbKSqICY+TjtBz/17hdghhANGIqAEgfRA8oWwRfCL3HFKhDFTQJsMn874Y
 07bXQu8DtkOq2FSEWQhNhHS75lmVBljYErfz7kyStKFnAhO0XEPTVUV/qmNU4oqA93tm
 EUkfLbZR23b2paeL+Z52I0fQkBt2vE6clX4DMj50OaCycs7whZuTFKYoudHM/vqW6nVz
 MQlFizuNY20GtdwIzsQF760DNl++aMTHhDe6yRrZmkZdQBiC20sjmJbyGv5lWYW6G+UE
 LMaW0XcaGY2sPExzmSBkIXoHAhgHXBC6f+bySEe3a9WpDqUrbNvIlmz5XQyDlRGh3bM0
 LYwg==
X-Gm-Message-State: AOAM533GReWdfaYKpuZQgmVhgbitYCIrBuRlXn5xcmEOrKDs7MEHxNUF
 7E+hBxk51i8nqNqcN3XcDqjXcYsE3qWkNEkKKvSIx+MAxychukGG
X-Google-Smtp-Source: ABdhPJyS+ILVSV2r6dHC+fB0Re3ZPtQ3JUs+P4dAMNHtpyolD7i9rjlQQS9zdnhxjwPBbpg9hiZaITSbiCbdi+PT8Ws=
X-Received: by 2002:a6b:ea0a:: with SMTP id m10mr854808ioc.91.1639721652768;
 Thu, 16 Dec 2021 22:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20211214032456.70203-1-jrtc27@jrtc27.com>
In-Reply-To: <20211214032456.70203-1-jrtc27@jrtc27.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 16:13:46 +1000
Message-ID: <CAKmqyKNyatQmXx6Q4_4yYenYRwMB8oSWk1ze2fhaoxLEmRHDQw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Use load address rather than entry point for
 fw_dynamic next_addr
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 17 Dec 2021 06:14:25 -0000

On Tue, Dec 14, 2021 at 1:25 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> The original BBL boot method had the kernel embedded as an opaque blob
> that was blindly jumped to, which OpenSBI implemented as fw_payload.
> OpenSBI then implemented fw_jump, which allows the payload to be loaded
> elsewhere, but still blindly jumps to a fixed address at which the
> kernel is to be loaded. Finally, OpenSBI introduced fw_dynamic, which
> allows the previous stage to inform it where to jump to, rather than
> having to blindly guess like fw_jump, or embed the payload as part of
> the build like fw_payload. When used with an opaque binary (i.e. the
> output of objcopy -O binary), it matches the behaviour of the previous
> methods. However, when used with an ELF, QEMU currently passes on the
> ELF's entry point address, which causes a discrepancy compared with all
> the other boot methods if that entry point is not the first instruction
> in the binary.
>
> This difference specific to fw_dynamic with an ELF is not apparent when
> booting Linux, since its entry point is the first instruction in the
> binary. However, FreeBSD has a separate ELF entry point, following the
> calling convention used by its bootloader, that differs from the first
> instruction in the binary, used for the legacy SBI entry point, and so
> the specific combination of QEMU's default fw_dynamic firmware with
> booting FreeBSD as an ELF rather than a raw binary does not work.
>
> Thus, align the behaviour when loading an ELF with the behaviour when
> loading a raw binary; namely, use the base address of the loaded kernel
> in place of the entry point.
>
> The uImage code is left as-is in using the U-Boot header's entry point,
> since the calling convention for that entry point is the same as the SBI
> one and it mirrors what U-Boot will do.
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/boot.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 519fa455a1..f67264374e 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -151,12 +151,19 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
>                                 target_ulong kernel_start_addr,
>                                 symbol_fn_t sym_cb)
>  {
> -    uint64_t kernel_entry;
> +    uint64_t kernel_load_base, kernel_entry;
>
> +    /*
> +     * NB: Use low address not ELF entry point to ensure that the fw_dynamic
> +     * behaviour when loading an ELF matches the fw_payload, fw_jump and BBL
> +     * behaviour, as well as fw_dynamic with a raw binary, all of which jump to
> +     * the (expected) load address load address. This allows kernels to have
> +     * separate SBI and ELF entry points (used by FreeBSD, for example).
> +     */
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> -                         &kernel_entry, NULL, NULL, NULL, 0,
> +                         NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        return kernel_entry;
> +        return kernel_load_base;
>      }
>
>      if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
> --
> 2.33.1
>
>

