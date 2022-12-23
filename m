Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8haD-0006uG-Hy
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 07:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8haC-0006tT-2m; Fri, 23 Dec 2022 07:55:28 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8ha8-0002j7-LL; Fri, 23 Dec 2022 07:55:27 -0500
Received: by mail-ed1-x52b.google.com with SMTP id m19so6984339edj.8;
 Fri, 23 Dec 2022 04:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LzMrvAea4+aygOzGCIyqhw1hM42d4El7ZksSyN6EhmI=;
 b=ELieSjuEjKMIsgPbqWyHT0v2SetnDmdgR0g90LoNX8DicfEQppVHcxOACAtICIWHJ6
 hKbd2E+kEjdgIrWdwBsyry5+7rwy1aeCItbd360As8d3lHCB4FFmBpFU6AgiQFJ3icyW
 /J5S5IOE5c6tE1G7lsOkLyM38qCedG6PpOqJl60+/ozkK+8ekRltPlWMPOM3313xnZ3X
 YOTQS+05lCwIcC99Zik2E3F9pORm8L/M1s2hhZNGBq4akiUYk0hU6siSKLL0qN13NCFs
 M9qkxrHZo+xQZHNriSgBCzS31ndIx740BQAmdtsi0xmuqS6fU4CP+k6icfBCVqAMe4mL
 POew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LzMrvAea4+aygOzGCIyqhw1hM42d4El7ZksSyN6EhmI=;
 b=mIwj6Gys9u1Sa2yqjjqfOdtGHqnHYNfPc93U4HWCaTQ9rK2Y3QBcaclPcu4DvNtnwl
 rvXtErPdXcwctibqDgaxi8MmgypVd5Wlhpt6ScYKKYVBRhhLUspA/JicU3s+oMM5Xlqu
 q60bRvoeQoVV16sZzrT3V9QIxHOS3MSYFeNHOzgtnuSohYkfDhE8Per1KesBH7gn3mVy
 QmHMY7ngkMuvUHhUqPr4NsAAU4oqrt40ifmqCtfP92nVQxV7LPrVX4vc8ErBHO2x+Ofb
 MbdJfgZDrdaaKlKRTR0qO2V7XuT60o4QbWpduGDSOHB3dzi9kXImarqveUvr9MAV2iKK
 qtBQ==
X-Gm-Message-State: AFqh2krCr4JlwiTVLN9/ir0dhAtBzXT6G7Gvi3u+p0DvShM1t3ww9uNh
 kbRbWu/HnL8XT3S/JDqz5gEf4g63ylN+cpv0IjM=
X-Google-Smtp-Source: AMrXdXtiPqDQtgCcOyL62eKw41rwme+fCvQ+KoC3etFI8OVbmc8NBOD3lvpBnivHgLtlLlEnyYYRvdO3t2H7zYCjpnU=
X-Received: by 2002:aa7:d741:0:b0:47d:f760:d4b2 with SMTP id
 a1-20020aa7d741000000b0047df760d4b2mr1067136eds.202.1671800122296; Fri, 23
 Dec 2022 04:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-12-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-12-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 20:55:10 +0800
Message-ID: <CAEUhbmWkB73m_rQW463U-5bO10rKOOOgs2RXZh8rPDToh2Fb=w@mail.gmail.com>
Subject: Re: [PATCH 11/15] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 23 Dec 2022 12:55:28 -0000

On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> the same steps when '-kernel' is used:
>
> - execute load_kernel()
> - load init_rd()
> - write kernel_cmdline
>
> Let's fold everything inside riscv_load_kernel() to avoid code
> repetition. Every other board that uses riscv_load_kernel() will have
> this same behavior, including boards that doesn't have a valid FDT, so
> we need to take care to not do FDT operations without checking it first.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 21 ++++++++++++++++++---
>  hw/riscv/microchip_pfsoc.c |  9 ---------
>  hw/riscv/sifive_u.c        |  9 ---------
>  hw/riscv/spike.c           |  9 ---------
>  hw/riscv/virt.c            |  9 ---------
>  5 files changed, 18 insertions(+), 39 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

