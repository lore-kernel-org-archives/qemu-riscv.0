Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBmHr-0002YR-IT
	for mharc-qemu-riscv@gnu.org; Sun, 23 Jan 2022 18:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nBmHo-0002Y7-Nq; Sun, 23 Jan 2022 18:28:40 -0500
Received: from [2607:f8b0:4864:20::12a] (port=35353
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nBmHl-0004gB-Oj; Sun, 23 Jan 2022 18:28:39 -0500
Received: by mail-il1-x12a.google.com with SMTP id w5so8174358ilo.2;
 Sun, 23 Jan 2022 15:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3QVWb/PAPOpCoV7ZlSrhGJQo1DHob3bPVqW3ZRTT4E=;
 b=DVRR3PyTc56hOWuX8RDPN2YQ8LWmB1epYkix6sg4QErqNoYc0iwhu3V1vIN1Y8Tk0N
 i63yoBYL/DbydvNDLbp23h143A49rgAMMMwkcxsHaNAwy8AVFqbRbOQxOkxeN0yRWkJ6
 PlTzchrECNe57UJKHKMr8GFoMkT2rqJ+ANBcVyZXBh94OgVihpodvacifZkrvIm8nHzV
 2x8MsnrTyASHPOj7lj0ojmxipYqCLTOOnTTVORk0PxEVqIxynnA2B/9nwNI0aaGRkBgi
 j8AIfGSnWARAm+dBuLfZxyROa4raIlyw0v8R02K1MrmYnRJjKU7UfWARMtqBJE20LIpZ
 41Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3QVWb/PAPOpCoV7ZlSrhGJQo1DHob3bPVqW3ZRTT4E=;
 b=8L3J01Sid0YTz3XnoBpcYWnUfqF0RH7wf3OeOz881xIZzhj1x4pDXW4n2ie6KC4b3i
 jCHvCV44gcboz2l09ZpDORJnIE8OH+N1FqihD+oZjnQCLZH9B/BPuVAoO/mR6a4Axr2B
 EFt7daYgWghNY+wukBnkMporw52lQsiJ+/yAmEHLJ3EQMao7/l97LFj9mPgzZ+gjeZ4E
 A6WpWrUCIz0q/OW1iEuUA8e4lCYC6Ac//7j5/5F8880U9olfdZoBjZYajotkqNr3D3aL
 CbG0rA9QbbyOK88Lwulg5Dn731SqUDHXYfXcsI/g/FBC42LTe7IE/pYledFXtPUy2i3K
 JD2g==
X-Gm-Message-State: AOAM5300icYyHsrqvTPZ5lbXndehwN0QRIvsG09tO/Xq4StNG60tYf6R
 J+fqXdO1ADHDmIxm2aP7h8lDVlS5yiiZ10FhiiA=
X-Google-Smtp-Source: ABdhPJy+cVLUqf4zM61Ep0Y7E2dK3pamgGfZG8k8chetRAjl0ni1JhixG1M4rWUXvh9CfFMC3PmlCIRPITsIlluApn8=
X-Received: by 2002:a05:6e02:148b:: with SMTP id
 n11mr7255131ilk.208.1642980515772; 
 Sun, 23 Jan 2022 15:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20220121055005.3159846-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220121055005.3159846-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jan 2022 09:28:10 +1000
Message-ID: <CAKmqyKNiPyLAmL1X2e+WEq8MJ+Mb89hoxsCpiQaZj_Rm6nr-0w@mail.gmail.com>
Subject: Re: [PATCH v1] include: hw: remove ibex_plic.h
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Sun, 23 Jan 2022 23:28:41 -0000

On Fri, Jan 21, 2022 at 3:50 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch removes the left-over/unused `ibex_plic.h` file. Previously
> used by opentitan, which now follows the RISC-V standard and uses the
> SiFivePlicState.
>
> Fixes: 434e7e021 ("hw/intc: Remove the Ibex PLIC")
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  include/hw/intc/ibex_plic.h | 67 -------------------------------------
>  1 file changed, 67 deletions(-)
>  delete mode 100644 include/hw/intc/ibex_plic.h
>
> diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
> deleted file mode 100644
> index d596436e06..0000000000
> --- a/include/hw/intc/ibex_plic.h
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -/*
> - * QEMU RISC-V lowRISC Ibex PLIC
> - *
> - * Copyright (c) 2020 Western Digital
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2 or later, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
> - */
> -
> -#ifndef HW_IBEX_PLIC_H
> -#define HW_IBEX_PLIC_H
> -
> -#include "hw/sysbus.h"
> -#include "qom/object.h"
> -
> -#define TYPE_IBEX_PLIC "ibex-plic"
> -OBJECT_DECLARE_SIMPLE_TYPE(IbexPlicState, IBEX_PLIC)
> -
> -struct IbexPlicState {
> -    /*< private >*/
> -    SysBusDevice parent_obj;
> -
> -    /*< public >*/
> -    MemoryRegion mmio;
> -
> -    uint32_t *pending;
> -    uint32_t *hidden_pending;
> -    uint32_t *claimed;
> -    uint32_t *source;
> -    uint32_t *priority;
> -    uint32_t *enable;
> -    uint32_t threshold;
> -    uint32_t claim;
> -
> -    /* config */
> -    uint32_t num_cpus;
> -    uint32_t num_sources;
> -
> -    uint32_t pending_base;
> -    uint32_t pending_num;
> -
> -    uint32_t source_base;
> -    uint32_t source_num;
> -
> -    uint32_t priority_base;
> -    uint32_t priority_num;
> -
> -    uint32_t enable_base;
> -    uint32_t enable_num;
> -
> -    uint32_t threshold_base;
> -
> -    uint32_t claim_base;
> -
> -    qemu_irq *external_irqs;
> -};
> -
> -#endif /* HW_IBEX_PLIC_H */
> --
> 2.34.1
>

