Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ55-0000Go-B0
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lSQ53-0000DW-Vp; Fri, 02 Apr 2021 16:07:45 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lSQ50-0004qW-N4; Fri, 02 Apr 2021 16:07:45 -0400
Received: by mail-io1-xd34.google.com with SMTP id j26so1176971iog.13;
 Fri, 02 Apr 2021 13:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0O/yA3qyej1tmGaNUAhGdoC8z8bWASm8BGnCvWUAI/Y=;
 b=mJZw6+dcrmh/MZniqs5MunD/u62Q2D7wW2j1PToeytu+NlTjFSLdbgSbGX7F+kD6/8
 b49gGSzXDfOwg5AGwlXKFyOON8r0b73VgdGJX/8SYPt7v123dsvdjsvg2jEtZq3IwvyH
 I22Yv7hD1QFYVie9oxeNQWQn0Fqd0U1f7/IZSp8btw+bdQctH0es9zZReuttZWHMdRE3
 dWdwMsstKFpuwBrPYyNd8Pn4fVh1i4Fj1k/vMnKJOcp/WILI9GHZ2h/LX1S/MX3BVF4F
 48a4+1gOQshF6KwutMimoyumr8wVU9zPtk81PFzxBQcZ+VOvg3n0/+sTaZD3PlkjLUo6
 IIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0O/yA3qyej1tmGaNUAhGdoC8z8bWASm8BGnCvWUAI/Y=;
 b=EUCEZOAMn3Pz9r3se/D1P/lFYe5YuaRoWOfL7iLskZuxsZPNjTUQ//CjCqXblI5bmQ
 ImsW01ensueRjGtY0sgzsM5cM968FAnROHKtNvR7/vL6EyKMH9hsTfQYCEx3hOl5rn+0
 /sFCALYh3x0t93qZE2bxWkAeG0JeoQ+0PoNUmPX2RvXQVgTaMU8IcYJVz/t8h5Jjl4Ix
 7hSvOrzeMhEXtEcyJw/lodT/POL3FA1EVG7ChHjot2Zaa58xQ5r7Aw9CKhxnOyb84oVu
 HcNpWAor2WbDFyI/5drLMXAyJuhs8/xjphkbCV+GqP85kTS4q1AF6zel8V8PIw46CkLe
 S7MA==
X-Gm-Message-State: AOAM531Tq+xy1X0dhoCR0oNumawrbpIMaiJkUuD8IAcv3vISn2PIwgnU
 KTZpGgJPEJ4/0jRW+FjtHXv4UMZEnqe70tWAuv4H/opfftlZzg==
X-Google-Smtp-Source: ABdhPJyBc05eXzMd9u3CJOlM3gW/REYLzbPp7YX4jhGG+VgKK9yD+Pyk+J9liRDZe6nyAQTZHHDSUIEp1VLusPfVU9I=
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr14121139jap.106.1617394061009; 
 Fri, 02 Apr 2021 13:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210401181457.73039-1-vijai@behindbytes.com>
In-Reply-To: <20210401181457.73039-1-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Apr 2021 16:05:25 -0400
Message-ID: <CAKmqyKPAXLHPi_anf_Xbe6=9j-nkBP-b6QRqC4xDUT3u-7riUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for Shakti SoC from IIT-M
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Fri, 02 Apr 2021 20:07:46 -0000

On Thu, Apr 1, 2021 at 2:15 PM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> Changes in v3:
>  - Drop SHAKTI_C_DEBUG register
>
> Changes in v2:
>  - Moved CPU addition to a separate patch(P1)
>  - Use riscv_setup_rom_resetvec API to setup reset vector
>  - Dropped unused DPRINTF and unwanted break statements
>  - Fixed uart_can_receive logic
>  - Reused sifive_u_cpu_init routine for shakti
>  - Error out when an unsupported CPU is specified
>  - Addressed formatting changes pointed out in review

Thanks, I have reviewed these patches and applied them.

Can you add details to the docs on how to build images and run this machine?

This is an example for a different board:
https://gitlab.com/qemu-project/qemu/-/blob/master/docs/system/riscv/microchip-icicle-kit.rst

That way others can use this machine and I can generate tests for it.

Alistair

>
> Vijai Kumar K (4):
>   target/riscv: Add Shakti C class CPU
>   riscv: Add initial support for Shakti C machine
>   hw/char: Add Shakti UART emulation
>   hw/riscv: Connect Shakti UART to Shakti platform
>
>  MAINTAINERS                                 |   9 +
>  default-configs/devices/riscv64-softmmu.mak |   1 +
>  hw/char/meson.build                         |   1 +
>  hw/char/shakti_uart.c                       | 185 ++++++++++++++++++++
>  hw/char/trace-events                        |   4 +
>  hw/riscv/Kconfig                            |  10 ++
>  hw/riscv/meson.build                        |   1 +
>  hw/riscv/shakti_c.c                         | 178 +++++++++++++++++++
>  include/hw/char/shakti_uart.h               |  74 ++++++++
>  include/hw/riscv/shakti_c.h                 |  75 ++++++++
>  target/riscv/cpu.c                          |   1 +
>  target/riscv/cpu.h                          |   1 +
>  12 files changed, 540 insertions(+)
>  create mode 100644 hw/char/shakti_uart.c
>  create mode 100644 hw/riscv/shakti_c.c
>  create mode 100644 include/hw/char/shakti_uart.h
>  create mode 100644 include/hw/riscv/shakti_c.h
>
> --
> 2.25.1
>
>

