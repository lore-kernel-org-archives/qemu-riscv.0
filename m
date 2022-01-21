Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAnDK-00089J-6X
	for mharc-qemu-riscv@gnu.org; Fri, 21 Jan 2022 01:15:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAnDI-00084T-Hl; Fri, 21 Jan 2022 01:15:56 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=41693
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAnDG-0007cr-S6; Fri, 21 Jan 2022 01:15:56 -0500
Received: by mail-io1-xd2f.google.com with SMTP id i82so9671688ioa.8;
 Thu, 20 Jan 2022 22:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sS8bxuVr9vyDJQYr4KLcl3tCSilbVPxiulOdmrS0so0=;
 b=H1KdhbdjRtZZJvkO8w9sIeocqVhs3mknHcLSOLlKZx4bOF6l28JeCEvfsgwfDMCNoD
 H/0TIl5XxPEKbYgjucNb5WC61CpArZqt/39Py0t3FToYmFKZfsGRMkAUzmrsIDq57gSv
 Nk59M6guAOUG3y8XFe4s/QYoBv1HjS3iYz1xnP7cO7AD8yyHf0aCYZJ3XAoMFRmDqud+
 1FHYEOWX8OrUxeH+5pmeSbPO1bkAs5wsMGwiZuWuuYkyC8Y1T5S8ejgIESNzPobMtAgN
 Nbtnzd/nXJGEh5r0C1kYWuzMBkj795nJjZJdZJg5KAAwzcWZcPwSdflEJ1fJKcYdsglc
 CS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sS8bxuVr9vyDJQYr4KLcl3tCSilbVPxiulOdmrS0so0=;
 b=P8d5zaD/5h5hU+PzZ5QMiKD79wk8tXaqCCaYj9lXrDpGBBW+RbG9o/9X3ngM/T1sBw
 m5gEI9OZ4eaDxYHPzbW/2tckQtlhEO/kjXcyIBD7i0+2PZ2IBvP780jTDuX20DS9kqo7
 N3ZW6E7rX/eL+6bsjv2rcXmwb77p+7UZmVQKxySXauwspN1hdm9z3VPGU8lo7oy8EHGw
 qS8H/cwy6xmU+hSekahjgqLgrW8jMjrfu6FTuGWtLwFMcpjH4EHBVEmN+L3NuqcQBr6B
 x+Z1n+sbDNnaEVURgiaWCR0vKnu70ICJsxiMxd9dAaAaVjuuHNpa84HucyPBOjlZimWs
 EL6A==
X-Gm-Message-State: AOAM533peU0aOA1sdTrqCAskRIMIq11LyciOauWtGxs3CfDHp2Fr67kD
 sqdFY45vi/Jlrx/DDX6h1n/qlGkZZ8GxIHYlQjw=
X-Google-Smtp-Source: ABdhPJzYLY2FhCQHfWO6LEMFldiSYPaWNjyWWv/Riviuu+6LAscADBgC/K68IE3USl4CFnJSqajXaaUkYVf3J4aQQLU=
X-Received: by 2002:a05:6602:14cd:: with SMTP id
 b13mr1236094iow.57.1642745753274; 
 Thu, 20 Jan 2022 22:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20220121055005.3159846-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220121055005.3159846-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 16:15:27 +1000
Message-ID: <CAKmqyKM9yx0x_XiA0WVkMXHstg-ePxe1c8tuNWtbHjYaNV0JRg@mail.gmail.com>
Subject: Re: [PATCH v1] include: hw: remove ibex_plic.h
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com
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
X-List-Received-Date: Fri, 21 Jan 2022 06:15:57 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

