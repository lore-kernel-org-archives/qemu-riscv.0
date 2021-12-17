Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my65D-0005lq-24
	for mharc-qemu-riscv@gnu.org; Fri, 17 Dec 2021 00:47:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my657-0005l2-Js; Fri, 17 Dec 2021 00:47:03 -0500
Received: from [2607:f8b0:4864:20::d33] (port=39516
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my655-0003bw-Vz; Fri, 17 Dec 2021 00:47:01 -0500
Received: by mail-io1-xd33.google.com with SMTP id c3so1480970iob.6;
 Thu, 16 Dec 2021 21:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MR8IyO1wlDBy4M1pGrAdlcj6CT6XwwZ+bZlEK4UwxpU=;
 b=osgGIOctdKf1w186wxh3deYirdKwaWUUImMFifbs+8ZdrTZRpYmvAs67rgfzQMcR+v
 Npj/cANPnoEI5pri5NkHFQoBfJQkMck1t+tPGEc2kkqDr6aTZG8euOic3aDd2nWoSQ7B
 5kaddFFaiJ4Zx3rbZN9ZHTwoNoqKQnRu/LxZism5Ih2ZtDHh2YiTQQouTyAP4kEMuUqs
 ryNLgP96BUS46fe7jqm0UzZ3YsGhsdNI//Zbgu8/dV0z3RK1bbbxtgeoAomTbX3BqpQi
 t2CYQEeUEwft3QikAe/pJo1ec5wT9HT0B0zzk8ElZNX4YpQD7ssYDUWNhDRsPEvDddnT
 X7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MR8IyO1wlDBy4M1pGrAdlcj6CT6XwwZ+bZlEK4UwxpU=;
 b=nOMmb4YgbOYeYlw0slLwqvBKwTz4U/CDzSKOLsg0c8o/ZT0ORwVqbo2TkgOwz5pgG4
 gj0ZOSkRcWZuLyz3FB6bn0mThY7wTWiiVicef/E/nUSNuMIYlVWvigGy2emPRaNsiXSX
 MfHZasS4Pk4dB0J7D7Z3FQs6DS6VI3XUY0keMogEdmgAuea80joedUgTn6RfTLDVLIye
 3YJ0XO4jszKM3W5v4OcrxXMgQqLhdvkPS8zJ44tfuc4LGGSoIynspHq74BBh9VMWlkLY
 Bgag/wFvdsZOA/IUTAIVgqzbQHQx8o/zQELirn+4SwT+d0ORXCNlpgEF3QxT4yymDfHs
 W/UA==
X-Gm-Message-State: AOAM531DhtS39MRmeRQVUPox93UezUoDEq+P9XgkEZ1r4PLO7OWPyvOu
 cs2R/yJbnHliiRzybFxCfnZaJ2bJKlDJYxoGq5Y=
X-Google-Smtp-Source: ABdhPJztc1+4Cx40HejjQuajZAVMUEtBgQ6Mt2njFj60NBVB4ba8wFsGs6+V7hxZTfq3IWMazaheiNyiBgXFUzIndYo=
X-Received: by 2002:a05:6638:3384:: with SMTP id
 h4mr806758jav.169.1639720018497; 
 Thu, 16 Dec 2021 21:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20211214032456.70203-1-jrtc27@jrtc27.com>
In-Reply-To: <20211214032456.70203-1-jrtc27@jrtc27.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 15:46:32 +1000
Message-ID: <CAKmqyKOuydbUXerGWPZDgJFoA1zSM4+octxJAoYC3ZQquMdvqg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Use load address rather than entry point for
 fw_dynamic next_addr
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Fri, 17 Dec 2021 05:47:04 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

