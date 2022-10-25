Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1on8nW-0006KR-9X
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 21:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on8nT-0006K3-Si; Mon, 24 Oct 2022 21:32:04 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on8nS-0005FQ-Ay; Mon, 24 Oct 2022 21:32:03 -0400
Received: by mail-pj1-x1029.google.com with SMTP id l6so5890369pjj.0;
 Mon, 24 Oct 2022 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vuIkfDO4m5o3Ad3XRyletIEgZ0DuF5thd2iKsI/PA20=;
 b=ewxr31IEqsx9DMEFwjjRZI5jHx587vn5pLLbuF9oZkO/JaNapqlGmGwYK2gUT16yxU
 sSrEXFY3hbjrJ9QsmZ425+kI72yHn4bQgqHquhWKCLT3NW2HBJWyEhhUFEzbPrjiwbAe
 dkDPgb4eaTTa90a5Zzu5yzVHrujDXpliUz6+n7y6BX/Kt38VpKuBAMP8BSe79qt4W6sz
 ZN/lbVbcXWtQOHKEiIThFcvn/GjziEwT4GtKYNvouFUzEofcgJChgHlSN79QrLlwGznb
 5jhEpyIlFvH2tKrOOY6IPXJiQGdVcprkcLFrIalXO/LzR3FioxEsaM4b+6atgWItuLgd
 /0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vuIkfDO4m5o3Ad3XRyletIEgZ0DuF5thd2iKsI/PA20=;
 b=jRETQ/9p43H+R09ysJqGKFMeB6Cu/lqreq92x2nYu880PAQNNiE+yTpLZjMBV+aTZm
 V5LnjXJ4BR2p9pJYRs6QwPMdOgEXnCmYfA5cw6gyJBHkhEyII3dYCL9TjkNsYNReqMy+
 25XZcX4QhY814TpcA55LS70Z1kkI9wg2t7YzmUuZ0Fvgcf5SRBgUi3jCZTVLiSduHd2S
 PVzojJwQtQF3nqm4Oto4JMAr6dWAYEI2LQeR3QEg18DO98ZxC4myYMIMI/HdvEyHIlWj
 wNFhA8++0KPXUHuCvBLA7xxCq51Df8Px5I1IUV0Oy7hUb1f1vx8d9hmm5YjrUTdRlx3v
 SxmQ==
X-Gm-Message-State: ACrzQf00whfeYvOQXIhAOQQcwjoTF78ApV8EOZQP57owYaA2wBQiSRxr
 /5uSUkuqlNjyHbJBo+9aAX+9vurSG+QFKefI5As=
X-Google-Smtp-Source: AMsMyM5Gue4QELbd1b3//4u1fqmNFh5M35iN2fDujLvJUmPO9IlzmGbdnEWlX9ymxKSD/DtoYRATj0/PN3ovEBHsEe8=
X-Received: by 2002:a17:90b:314a:b0:20d:904b:18a8 with SMTP id
 ip10-20020a17090b314a00b0020d904b18a8mr76422189pjb.96.1666661520562; Mon, 24
 Oct 2022 18:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-6-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-6-Jason@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 11:31:34 +1000
Message-ID: <CAKmqyKODBH20Ba0ruuC6--s6xqJsmkepZL7Kuj7wh3o-rfZyFg@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] riscv: re-randomize rng-seed on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 richard.henderson@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 01:32:05 -0000

On Tue, Oct 25, 2022 at 10:47 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index e82bf27338..ebd351c840 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -30,6 +30,7 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/reset.h"
>
>  #include <libfdt.h>
>
> @@ -241,6 +242,8 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>
>      rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
>                            &address_space_memory);
> +    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
> +                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
>
>      return fdt_addr;
>  }
> --
> 2.38.1
>
>

