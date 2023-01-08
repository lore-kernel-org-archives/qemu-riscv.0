Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEMRe-0001mZ-OT
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 22:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEMRd-0001mF-6O; Sat, 07 Jan 2023 22:34:01 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEMRZ-0002rn-Vk; Sat, 07 Jan 2023 22:34:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id j16so7662986edw.11;
 Sat, 07 Jan 2023 19:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o1oFPtFyKAhBTQvfqqjrhngFuAaO5XhD7x1bAFZHIvA=;
 b=kkPiViqBmsu+MI4GavyzoQkOqiFqbFX0+2ZS1XUYIJ5hSCMl3e3ybGkCWOLyT6+BqZ
 Cd8ztN/LRUj1XyKlitYF+dMFJrzYft1kXLaNTviWx8qyc/INFYsn+RLVxCsQHlPE/gIr
 wwQMcyCSRVr4v0+pGUGf0r6WilulzPaNAqjkxASo7VfRPyGrnpx6B+EWAafC6xRBlv7o
 7JWeUHSGIHWHrLbPreNqEQ7owxz4gWqzT0Q7lkWAHf5lsRa2gAQOqrUOGkReChYdpmMD
 FlCQ8uollYWah8w82X6lruN7aqnD04mDNu/A3XT7lKCBd3+E0mNfkxNRR23QjR8VOsRk
 acug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o1oFPtFyKAhBTQvfqqjrhngFuAaO5XhD7x1bAFZHIvA=;
 b=NMIsjGnPZK4wqLps93acuVynTouLI+4s49h/M29ZSsGHfcdGO0fUrza8G6NFdq/eA4
 kMUUe+/QDFsN6yoTCzXaKv2BcHYq4XfCse7WRiLy9zGsWu1w1rASnGFPmMlKJyxSCaZN
 tf7BcemXF/johQPsYVjI0+Yj43ikjGXyZbaCIyJd2BpQXnt8RKIhiFq6hsiBU7805lSy
 lJWdqzbOE4NJAusi57/inf/UejFF8RWsQIgObnqe5GNuuWPNS8KfOHRYZgpF08VdWBaC
 5KbC0i5zp3D4Ri0d8BMbZdjBK22IzNTz6BItNW4wbn05vMUv90AXNjlfq5VsBO+0yNVr
 a0Og==
X-Gm-Message-State: AFqh2kpg4GUVWNEaVOf0qihsxCU3J4wZVx+gdQ6UNGHyVkKFRZSW9QOy
 Mh5BoAvgUi5F2s2Hmn4v8q8UgpthqSKW1ZRRtWc=
X-Google-Smtp-Source: AMrXdXuZZRgJzFtnPdMLWSOHzaIMZqdw119+dYyiegh2J8R6bD7NxAkIU3LBEqDwVKXrTaUwOutqe52D2y6Wuzo7lOE=
X-Received: by 2002:a05:6402:1843:b0:46b:1d60:f60a with SMTP id
 v3-20020a056402184300b0046b1d60f60amr6810212edy.193.1673148836232; Sat, 07
 Jan 2023 19:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-11-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 11:33:46 +0800
Message-ID: <CAEUhbmUfWbssTO1w8q_VdrWDHE4JLdJvZGkkt_w+KChsR5P32g@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
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
X-List-Received-Date: Sun, 08 Jan 2023 03:34:01 -0000

On Mon, Jan 2, 2023 at 7:55 PM Daniel Henrique Barboza
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
> repetition. To not change the behavior of boards that aren't calling
> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and

typo: should be riscv_load_initrd()

> allow these boards to opt out from initrd loading.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 22 +++++++++++++++++++---
>  hw/riscv/microchip_pfsoc.c | 12 ++----------
>  hw/riscv/opentitan.c       |  2 +-
>  hw/riscv/sifive_e.c        |  3 ++-
>  hw/riscv/sifive_u.c        | 12 ++----------
>  hw/riscv/spike.c           | 11 +----------
>  hw/riscv/virt.c            | 12 ++----------
>  include/hw/riscv/boot.h    |  1 +
>  8 files changed, 30 insertions(+), 45 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng@tinylab.org>

