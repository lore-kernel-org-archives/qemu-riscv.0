Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5EBI-0005Uu-FB
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 16:50:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EBG-0005OV-DK; Wed, 05 Jan 2022 16:50:50 -0500
Received: from [2607:f8b0:4864:20::12b] (port=42716
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EBE-00084g-OQ; Wed, 05 Jan 2022 16:50:50 -0500
Received: by mail-il1-x12b.google.com with SMTP id 9so583660ill.9;
 Wed, 05 Jan 2022 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KoPWOHbwZi5e6Ddsa6teYyKsr6XJSLNsuwS266C4Lo=;
 b=LbPDw8YREwFH2DeHXbaUMQwGmkuuRllnmajdJs8gKPwjPuKySF/xZQ5Q41ekEKsEWo
 fVkwLWZIYf1bPr6hE1l6TDEA9lMpsi9SuD4lfhhqBALZHJB+8wcbjNFfDlTQLoDVZ/F8
 AUEutenbgGc1NI37knKR4y3D+4utLkaZO8iyCaLAa0QzQFZ6tuxy1oJn8nmus5k/PPCO
 5s/5gJmWpsAQXL6kz4BDtygfSdnbXngVjlkW7Z5g5ZkNAkvG+8Hi3MwN4syF+iy/GlVX
 CBnvf50011uMR/iyWThqWVoAKlgaI9Plni6wDuyCn9HeppX2jRhPA381/M5G/DVxuMWi
 FbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KoPWOHbwZi5e6Ddsa6teYyKsr6XJSLNsuwS266C4Lo=;
 b=19TpjrM2wpHt6X99gAQcfvtmk4IBFlGqiYwDsbxCWVzfpfGIUGewFcdIPnNb04OY+x
 uWCLBQlcYXZSTBoSogjSwv8kjEcjWx/8cPiQ+W2eg2RBmQblQq6LlvDiqXXMOgj5Ywti
 fQc3TN0viwUJTaqcGzidcJR9zNW9ClONI49gDqni4H63Y5nxpkOsTVpsFwoEmKZAQsrJ
 CNqgvjfXdiB7sZsvsuYVbzIyHWYkzdNy0fLCbFeTRnOd2Ipys8MK2u1u20/nrbjvO+bg
 wePUL5q79G4da4frjoZ64C/tH5dA2L43CZDgYeJMIFE2J5JHtQivXFgHZMd+L/UPE4jz
 r2eA==
X-Gm-Message-State: AOAM530U4PRVggXsv5GHPk15VP8nfMQefcoQlMfSb0ng2MzYWMP2aFiJ
 sXsIWY9MdWkIj9SxXDrG5VUcgKKnZJg+Fu+z80k=
X-Google-Smtp-Source: ABdhPJzCJRkJn5KbiDl3C4ofCrmgTNctpBJFlGHQ59i6tqI77+yNHJBryObArqPugByd9abaHZQHjgDuFzIpBEI9o/o=
X-Received: by 2002:a05:6e02:194b:: with SMTP id
 x11mr2594409ilu.208.1641419446339; 
 Wed, 05 Jan 2022 13:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-24-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-24-anup@brainfault.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 07:50:20 +1000
Message-ID: <CAKmqyKNWfKb26BeZ1LSE6OqmcbgnoUpAqX2XhP4i9-kCf6NCFw@mail.gmail.com>
Subject: Re: [PATCH v6 23/23] hw/riscv: virt: Increase maximum number of
 allowed CPUs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 21:50:50 -0000

On Thu, Dec 30, 2021 at 11:06 PM Anup Patel <anup@brainfault.org> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> To facilitate software development of RISC-V systems with large number
> of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).
>
> We also add a detailed source level comments about limit defines which
> impact the physical address space utilization.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 10 ++++++++++
>  include/hw/riscv/virt.h |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 7579f7b41f..86b03736eb 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -44,6 +44,16 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
>
> +/*
> + * The virt machine physical address space used by some of the devices
> + * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
> + * number of CPUs, and number of IMSIC guest files.
> + *
> + * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
> + * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
> + * of virt machine physical address space.
> + */
> +
>  #define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
>  #if VIRT_IMSIC_GROUP_MAX_SIZE < \
>      IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e12e8ddcae..62d8e9c6d0 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -24,7 +24,7 @@
>  #include "hw/block/flash.h"
>  #include "qom/object.h"
>
> -#define VIRT_CPUS_MAX_BITS             3
> +#define VIRT_CPUS_MAX_BITS             9
>  #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
>  #define VIRT_SOCKETS_MAX_BITS          2
>  #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
> --
> 2.25.1
>
>

