Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNOx6-00055S-Mk
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 21:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNOx5-00054v-18; Wed, 01 Feb 2023 21:03:51 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNOx3-0002Qb-9f; Wed, 01 Feb 2023 21:03:50 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id q76so182642vkb.4;
 Wed, 01 Feb 2023 18:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JgFJux2t2bDNEyA8Ayal9fQs7VCapb2GISdGEiemPE8=;
 b=qfxX10/xSRqh2b1afYLTDz5Oa724xSm2isyf/Ib616LUIj5Hg2ea3epxmkuqONPTTw
 UbR2uN+yRccWd4F5Wi3CG3kLe4EFktQwI7kso0bg44AA4s6vnUoWq8F87Wxy2jwt5S9C
 s0/Poz8G795DUfYQWqJ4gp3+5UIPmiUoDEv6tpLfsTbkGkCF3CyWpr/BQUcdEc49dQuX
 cXwyN9Lcso4pIQ85YxRhsmZOg/M/nkKxMhXBBEESBVufKdyg6kEyQPIapp9u+gPsWQRX
 PFpjZd/+P7EtRtXXJGVEYkP1G9ybOsT3P1e78q1J6XFb85IhlfHgPZc2XQ/Yo+CnfXS3
 pmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JgFJux2t2bDNEyA8Ayal9fQs7VCapb2GISdGEiemPE8=;
 b=YXuPWSGnUYd/XnDRAs7qxtTtkUW4fkJX7Ub4X0/sUqe7YZsOiyFPYCetSV6LIIa8WL
 s0tgRmvla4mlE7RlE+zet65PJkPOnagKGB73FY3SBWC7b0pgLJj/9kX7yE62+BO7+eGF
 d8PDwqj2XGtvC/Fs++S9aGfkadr4cAV4IRXq5RZH06D25osz0hiIUbJpTCe24a6Eb5EF
 hRM9lzYsVq+I9Tt1qUpgRqxnpMXBtVh3jAY35T4PSIBp51dmYsYeVbF9XlG6YD4Qm9Vs
 DeC70xG78VdeFG4vuKanxBDqT7z8/1d+Zdpk6KrRC9VnnYu/4tW9XZxajQ3xPtkOXDzU
 FbTQ==
X-Gm-Message-State: AO0yUKVxV/PYaFLhK76czWtUKmSCnCX4fzKK0uIzQIoDDSN256raXExE
 CxpXXkzEgZ1VqbDGFv8vOuWA7SAQ5KOTDF5wsq0=
X-Google-Smtp-Source: AK7set9zICPaxP+NO8Qu2OzFwFlhUaIku/BcNp8ApiJRjYAeSL+xmaFSQzYAXsg8j+BTWm5J2prbMdDUFdHdYLZ7c0c=
X-Received: by 2002:ac5:c1c1:0:b0:3e5:7064:1bf9 with SMTP id
 g1-20020ac5c1c1000000b003e570641bf9mr674495vkk.30.1675303427925; Wed, 01 Feb
 2023 18:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Feb 2023 12:03:21 +1000
Message-ID: <CAKmqyKP=tCNa_VV0XThA-BGAjRGRsGksP2ihOirEch=20d8a7g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] riscv_load_fdt() semantics change
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng.cn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 02:03:51 -0000

On Thu, Feb 2, 2023 at 3:12 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This version contains changed proposed by Bin in the v4 review.
>
> Patches are based on riscv-to-apply.next.
>
> Changes from v4:
> - patch 1:
>   - remove the fdt_pack() related lines instead of letting patch 2 do it
> - patch 2:
>   - make riscv_compute_fdt_addr() return an uint64_t
> - patch 3:
>   - do not change riscv_compute_fdt_addr() return type to hwaddr
>   - fix comment typo
>   - use a ternary instead of if/else in dram_end
> - v4 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg05828.html
>
> Daniel Henrique Barboza (3):
>   hw/riscv/boot.c: calculate fdt size after fdt_pack()
>   hw/riscv: split fdt address calculation from fdt load
>   hw/riscv: change riscv_compute_fdt_addr() semantics

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/boot.c            | 53 +++++++++++++++++++++++++++++++-------
>  hw/riscv/microchip_pfsoc.c |  7 +++--
>  hw/riscv/sifive_u.c        |  8 +++---
>  hw/riscv/spike.c           |  7 ++---
>  hw/riscv/virt.c            |  8 +++---
>  include/hw/riscv/boot.h    |  4 ++-
>  6 files changed, 65 insertions(+), 22 deletions(-)
>
> --
> 2.39.1
>
>

