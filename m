Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGkG-0002VJ-Mp
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 23:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGkE-0002PQ-GL; Sun, 15 Jan 2023 23:05:14 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGkA-0002XW-Au; Sun, 15 Jan 2023 23:05:12 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id p1so11092375vsr.5;
 Sun, 15 Jan 2023 20:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ko8wM+0lNUujdvfZHCY206MVuXwb6Ui+NQjc1cY3s+I=;
 b=a0BRtNfd3mBfRL3lD1zr4V3KqbknDK2i8NoAPKWNsHuNZN1Qa/zJJ1Z7evEWoqiwEN
 5F80vGRY/B6gVKYuGMBTsr/5h3vhBNuxYd+FENgTh77Yoexel30mZzfewX0fDHzo0+vX
 HyQ7N1622Em3gFXGb0h3J05tKSaP9IFHOGhO2J6IrVjCcaqoQFFP9bNO1EAX8woHSqku
 eVIRu2DmexpOx9ProgbNwt09EL5b3L5dua+0HmottQv7EU2psN2VM+P1ayK0oU0dVcHZ
 Yl19dKkw13t10W5GW6qdMmItGcmT5kYc48+TubV448HSQFCdIj21+aJnPHcHgT4ApjZm
 Bxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ko8wM+0lNUujdvfZHCY206MVuXwb6Ui+NQjc1cY3s+I=;
 b=kxagAH7tEbgdo092ORX+gGwPKrqAml1rzyQmtP9/ZvMABTq+z1iy8RlJTrfoVPvgUv
 kI7cCFZM759/THILu1m1UR6Psfb/DNxV6MuuFPtwAlriHK4C5/L07EbSC+y/ggn2uBcr
 0n3ivABN+p6SW76Nn7EY0BssW+Xi0ryp7jcvU8QEnKhu3sthvBWhiv1SF6AsDdHvaU8W
 MEXFhXEyTVlkXTvdlFb9BQnzWbZho029Hvbds8IL6O2LhrTK4OVDX2b/W63rUEw2Ppyr
 iPhl7vNosvct0EtYK99RlUpZWN/DMNkyFIdPMKEjv8WVpGku3NSMcDt8tc3y3sMbfpu4
 sj2A==
X-Gm-Message-State: AFqh2kr5mTho0HC49b/XfrvSmAhr0YEj5C2dsC9IqRXgWInILq7UIyfY
 kz6Qimn9dCpYLDJVGl4oZwR3/HSMmW2hb9zKl60=
X-Google-Smtp-Source: AMrXdXsuKPK32FpbWGox4/z1aLiFrRZ8Ar9+Xu/bAGORKBPpqA6BXZGoGIlDvUGQ4l7WiLgkAqytoKfF4bWYqyHW4Ko=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr10391088vsv.73.1673841908546; Sun, 15
 Jan 2023 20:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 14:04:42 +1000
Message-ID: <CAKmqyKNacev-a0jE3_HQxoBSrgsT4dcCHXDv8TFonvUD7YoLnA@mail.gmail.com>
Subject: Re: [PATCH 00/10] riscv: create_fdt() related cleanups
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 04:05:15 -0000

On Thu, Jan 12, 2023 at 3:12 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This is a follow-up of:
>
> "[PATCH v5 00/11] riscv: OpenSBI boot test and cleanups"
>
> Patches were based on top of riscv-to-apply.next [1] + the series above.
>
> The recent FDT changes made in hw/riscv (all machines are now using the
> FDT via MachineState::fdt) allowed for most of the cleanups made here.
>
> Patches 9 and 10 were based on a suggestion made by Phil a few weeks ago.
> I decided to go for it.
>
> [1] https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>
> Daniel Henrique Barboza (10):
>   hw/riscv/spike.c: simplify create_fdt()
>   hw/riscv/virt.c: simplify create_fdt()
>   hw/riscv/sifive_u.c: simplify create_fdt()
>   hw/riscv/virt.c: remove 'is_32_bit' param from
>     create_fdt_socket_cpus()
>   hw/riscv: use MachineState::fdt in riscv_socket_fdt_write_id()
>   hw/riscv: use ms->fdt in riscv_socket_fdt_write_distance_matrix()
>   hw/riscv: simplify riscv_load_fdt()
>   hw/riscv/virt.c: calculate socket count once in create_fdt_imsic()
>   hw/riscv/virt.c: rename MachineState 'mc' pointers to 'ms'
>   hw/riscv/spike.c: rename MachineState 'mc' pointers to' ms'

Applied patches 1 to 6.

Alistair

>
>  hw/riscv/boot.c            |   4 +-
>  hw/riscv/microchip_pfsoc.c |   4 +-
>  hw/riscv/numa.c            |  14 +-
>  hw/riscv/sifive_u.c        |  11 +-
>  hw/riscv/spike.c           |  25 +-
>  hw/riscv/virt.c            | 484 +++++++++++++++++++------------------
>  include/hw/riscv/boot.h    |   2 +-
>  include/hw/riscv/numa.h    |  10 +-
>  8 files changed, 277 insertions(+), 277 deletions(-)
>
> --
> 2.39.0
>
>

