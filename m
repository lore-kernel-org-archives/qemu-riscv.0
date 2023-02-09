Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPuvu-0007TX-IR
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 19:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPuvt-0007TI-Dd; Wed, 08 Feb 2023 19:37:01 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPuvr-00071z-KZ; Wed, 08 Feb 2023 19:37:01 -0500
Received: by mail-vs1-xe33.google.com with SMTP id l8so442474vsi.12;
 Wed, 08 Feb 2023 16:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BiUzbOY1MLR//9ObUUlPGaeTQpNE5MoWmlIR+EVe0H4=;
 b=SsiBV/OnYqjSVZViD+/BVyVnFPrV5PFNvcXfoR2O49CrfVp/RyFJuHDZEI46c91uCR
 GRZ3zRyJbJhJMpxsrDMSD7B8k09by9CIaH2diIvP60vc98slfgKNPNyigVR0iZvlA59/
 jIRxx6VJ0g2JEc3rS9kv+Q6fZyhcUMkIlt/aUnRtt2lBt6TCZ5DorJVEi/RJPp7Mcj3y
 ydrGQz6qQXxbxlu2gwxA1nZNb/hsfd9lh8FX8BIFUXuDV2y6qS5h3asi4mWmSNYDcyKq
 F+CnFMu+6ev0lV5r8Ete+FuQGcEbq9H26XKJR/Ec3RY/ETbnvIw9mSX87tZklM/FOD24
 dIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BiUzbOY1MLR//9ObUUlPGaeTQpNE5MoWmlIR+EVe0H4=;
 b=QTNaqvorHz5ciAHen3vD4pSNbCk/zvhAUeVOcER4oEGhdcHjauteaRL3E07KHQuW14
 6HL+ogJ7w0n6DhH9NFYFMsOTbDMYtU+r4Qrt0tAULNpymDrUm19lesDiZ2868SMy7GPG
 WLjfHnTmMwJx9QyLlMx5U8/Ic8uF/23JojsA6rNB6YoyrJJa+KwudtWRI/GlvoKrH6jQ
 OXqn8JxL/toJZtISnZ8sxR3lTCIXHygLOtBuAJuL9Q/rjA66Nr7SEu0wJpsv3p29DoGs
 tFc1civHtFydNkR2QFpAV2nEi1x1gZXcWGoU5RxvowP8HDdrL7NmnBN7JrYY071fpuuh
 gbfg==
X-Gm-Message-State: AO0yUKUjKbVEkg5VjKlyQzUtd3FD+DtQ3mW1dXVTi42uXZGvHr5+L5p4
 x68uSMOnszdxnsasEv1QQ7DwSjgZIC0eTDJX7wk=
X-Google-Smtp-Source: AK7set+dAPkTayiz1Sq9FdraEiVpQFqYT8nOsZjBk3h8bqudimLIZxONQtbzWIsdCPDoqU1bP2zK+uMqdb5wn8p3ZkM=
X-Received: by 2002:a67:e11e:0:b0:3f9:3f38:ca46 with SMTP id
 d30-20020a67e11e000000b003f93f38ca46mr2360623vsl.73.1675903018042; Wed, 08
 Feb 2023 16:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:36:32 +1000
Message-ID: <CAKmqyKMZjRw6+fZag8ua8w_genvgfEGs9HGEu0OaWcaEHa8yEg@mail.gmail.com>
Subject: Re: [PATCH v11 0/3] Consolidate all kernel init in load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 00:37:01 -0000

On Tue, Feb 7, 2023 at 12:03 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this new version patch 1 was changed to extract the lower 32 bits of
> the 64 bit address when running 32 bit CPUs. The difference now, in comparison
> with what was being done in version 6, is that now we're doing that for
> all uses of kernel_entry, not just the one resulting from load_elf_ram_sym().
>
> This will ensure that the current behavior, that is now based on the fact that
> load_initrd() uses the target_ulong returned by load_kernel(), that happens to
> be a 32 bit var when running in 32 bit targets, is preserved by doing a
> explicit 32 bit extract of the uint64_t kernel_entry for 32 bit CPUs.
>
> Changes in v10:
> - patch 1:
>   - extract the lower 32 bits of kernel_entry for all cases, not just
>     the one from load_elf_ram_sym().
> - v10 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg00529.html
>
> Daniel Henrique Barboza (3):
>   hw/riscv: handle 32 bit CPUs kernel_entry in riscv_load_kernel()
>   hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
>   hw/riscv/boot.c: make riscv_load_initrd() static

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/boot.c            | 97 ++++++++++++++++++++++++--------------
>  hw/riscv/microchip_pfsoc.c | 12 +----
>  hw/riscv/opentitan.c       |  4 +-
>  hw/riscv/sifive_e.c        |  4 +-
>  hw/riscv/sifive_u.c        | 12 +----
>  hw/riscv/spike.c           | 14 ++----
>  hw/riscv/virt.c            | 12 +----
>  include/hw/riscv/boot.h    |  3 +-
>  8 files changed, 78 insertions(+), 80 deletions(-)
>
> --
> 2.39.1
>
>

