Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJrz7-0002iW-So
	for mharc-qemu-riscv@gnu.org; Wed, 10 Mar 2021 01:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJrz5-0002hC-SS; Wed, 10 Mar 2021 01:06:15 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJryx-0000Aa-0o; Wed, 10 Mar 2021 01:06:15 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id h82so16568264ybc.13;
 Tue, 09 Mar 2021 22:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QlFFmyxfJR9imsaGqI3CYGhNvV8cfUBC5q+LTnxpZe4=;
 b=F80cs4T1ZwsJBnbdqCkoG9s8NAjXkDuwKlqYMmCOyPZPFFOjk1+Tu0/wnez2/WQpBS
 oQWviNXn2bqgYN+7kv/XCivXGUsI+boq+Of0Y4WBCkCNVlcRyVCC6u2QyHYidZ7OTCUn
 Ai+P7bGtdhM7QNG3GwNaXuHkPBfa5N+TmOHz+LVTVX75LSIM3ZItsL5AxmMfHymaWz0o
 l4aK7rANFi3IQgZ5hnzxhJdC09u8zwMg4zbY6shvRB5wCTaNIsy+o0exSDKdbXq+xC/3
 I0Kuw88wKmkUdnlaLM4aYPLH8CRmg15UkWJrjmovY/z4e3olZXb+ijai5+2h+muJzPmC
 RQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QlFFmyxfJR9imsaGqI3CYGhNvV8cfUBC5q+LTnxpZe4=;
 b=BEkW3p5MYYgXstoZA8N+XhpHqPOzaVt65SbBJ/j+VQj3OECI0Y5V5LyVKoc6K0vQ0q
 hkNlvE+0KyljZgBuiZEN3N+/RrP/aNZmtBl5N8WmyFBbVxnANh5O2LtOiVgKUhFIL1Uq
 CtqPMWhiUE7PWiWGckvn213lOQOFUuGR1IkR9q5aqcgVJp6kBEoyi4OL17xZvE+P9Fam
 SD9yVd5xREm2ttKUzzn+gQPFnWFYzS4488nfRTaYA8L7cW1eSnB3hT3Wq0G5MSb7/5cT
 ++JHFsuvhuUw6cL2cQLOoYlUej6eJJOXWExeAOVhET7oeTUQOYT4Vs/GxGrcD4XgQ4gs
 nVDQ==
X-Gm-Message-State: AOAM532xpGVqnz3CAas5YxWCkssiTGEagtQugcAhmdkB0Q9A79aG43p0
 4rTyU3B5W50AlXxJ43I2lF3mAfscBVdn5qma7dw=
X-Google-Smtp-Source: ABdhPJzXyM4WvaYR8qIYzUMTtFkgs7VDP16Gp0gdMBDOO7w+OMP/0OuVqC1cj63yNvhVQLSy+0CLZMOyR8WnBulnYVw=
X-Received: by 2002:a25:8712:: with SMTP id a18mr2046398ybl.306.1615356362507; 
 Tue, 09 Mar 2021 22:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20210310033358.30499-1-dylan@andestech.com>
 <20210310033358.30499-2-dylan@andestech.com>
In-Reply-To: <20210310033358.30499-2-dylan@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 14:05:51 +0800
Message-ID: <CAEUhbmVgQzzS4DSOKM_zBxMMAb0bCZBJOZfQ7BUop84SaikZxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Andes RISC-V PLIC
To: Dylan Jhong <dylan@andestech.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, ruinland@andestech.com, 
 Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Mar 2021 06:06:16 -0000

On Wed, Mar 10, 2021 at 11:34 AM Dylan Jhong <dylan@andestech.com> wrote:
>
> Andes PLIC (Platform-Level Interrupt Controller) device provides an
> interrupt controller functionality based on Andes's PLIC specification.
>
> The Andes PLIC can handle either external interrupts (PLIC)
> or interprocessor interrupts (PLICSW).
>
> While Andes PLIC spec includes vector interrupt and interrupt preemption,
> we leave them as future items for now.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> ---
>  hw/intc/Kconfig              |   3 +
>  hw/intc/andes_plic.c         | 505 +++++++++++++++++++++++++++++++++++
>  hw/intc/meson.build          |   1 +
>  include/hw/intc/andes_plic.h | 130 +++++++++
>  4 files changed, 639 insertions(+)
>  create mode 100644 hw/intc/andes_plic.c
>  create mode 100644 include/hw/intc/andes_plic.h

Is the Andes PLIC spec public available?

What's the difference between Andres's implementation and the SiFive's?

Regards,
Bin

