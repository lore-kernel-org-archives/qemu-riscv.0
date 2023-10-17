Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AD8CDB465
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 00:55:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsYMj-00033t-Ga; Mon, 16 Oct 2023 20:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsYMf-000316-Br; Mon, 16 Oct 2023 20:55:17 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsYMa-0003F3-9e; Mon, 16 Oct 2023 20:55:17 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7b61de8e456so1649138241.0; 
 Mon, 16 Oct 2023 17:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697504111; x=1698108911; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TsqcS5xtjBJPhr3wHZG8wAp/K/rbX/Q53TYOIKjjMVE=;
 b=A7tCPFPNJg3bcN79SWNw5WUzk56o6R3qMkHsx294Nhnco3raSHns7ryb52JeGDBw6p
 n8rfkeyL/khampqrIJYORDsrNiMsA8onRdtJgjurlc/bctPDU58xihDg0A3cHbf1KwuQ
 vRfo5Y0iUu9L73QuzrvptYIpNiy5/p1tTP3J3JgzqsnlArTVjFgDLGBUyLRDRzzAZf4U
 45COoo9E3pxp+dBbb0gMXIBlFiByA7DED6rGoph6060D3r7UR0V5CUG/9uQSzZxfyBqM
 gqmoCOOUxJ17l48UUH2KFMHNk74Nz4m3vsO6e1UQwOR7MjusKDnZeXym1MxoU/Q7xaqP
 L1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697504111; x=1698108911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TsqcS5xtjBJPhr3wHZG8wAp/K/rbX/Q53TYOIKjjMVE=;
 b=Rb0sZ5yZZGJtKbZcG/RUXVLVhwHUohHcdU/lb8irYlACxk/A+xvT+decqAB5Y3KerB
 XfUNhEsYusDjXtoIh8vdT/VAXoACWy1WnAlIMHvbM9ySx0J38E2My3sDwypd8f1hSYND
 9b1kRjdwOEKU/2/0Gspx1DU5XRzhVDm7Ljt5F6VqKNgqVkb6PWEq128cYdA+lArn/pJq
 lgNhfxGr8QLQDrm3DXO56iTW+uOqQVa7AfXRDGvaOqJAQ6SDKoHE3eZPNLrryx1KbjXG
 attuBhS88b1J8v+Dvc1MznjAVPpq50wbe3v5CDhA1eH57xM6/J7cKF+HFFZ/3pOR5Adm
 JuQA==
X-Gm-Message-State: AOJu0YyPRhVNCZ0WRc5+SpfRs5BFai2iCBURGFt6hsRz3H5RSRWRMM8g
 /PWa8ygvapdKtUGl5t/beHt7YG8FHJt3Oe0BdL4=
X-Google-Smtp-Source: AGHT+IFDwLHG/PI33fbjlg4nTEbV5xbJHELMsF8668qpFyWMTl/If35v6afKuQrghEu/hDae/WUFkTKjA04kPpyu4wM=
X-Received: by 2002:a1f:9b85:0:b0:49b:adce:e2d1 with SMTP id
 d127-20020a1f9b85000000b0049badcee2d1mr1043441vke.10.1697504110703; Mon, 16
 Oct 2023 17:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231016111736.28721-1-rkanwal@rivosinc.com>
In-Reply-To: <20231016111736.28721-1-rkanwal@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Oct 2023 10:54:43 +1000
Message-ID: <CAKmqyKN+w_57hMhqi7WNbLdK7nQNJFQL5YNB-cAyuc_hrgW0kQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] target/riscv: Add RISC-V Virtual IRQs and IRQ
 filtering support
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, 
 apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Oct 16, 2023 at 9:19=E2=80=AFPM Rajnesh Kanwal <rkanwal@rivosinc.co=
m> wrote:
>
> This series adds M and HS-mode virtual interrupt and IRQ filtering suppor=
t.
> This allows inserting virtual interrupts from M/HS-mode into S/VS-mode
> using mvien/hvien and mvip/hvip csrs. IRQ filtering is a use case of
> this change, i-e M-mode can stop delegating an interrupt to S-mode and
> instead enable it in MIE and receive those interrupts in M-mode and then
> selectively inject the interrupt using mvien and mvip.
>
> Also, the spec doesn't mandate the interrupt to be actually supported
> in hardware. Which allows M/HS-mode to assert virtual interrupts to
> S/VS-mode that have no connection to any real interrupt events.
>
> This is defined as part of the AIA specification [0], "5.3 Interrupt
> filtering and virtual interrupts for supervisor level" and "6.3.2 Virtual
> interrupts for VS level".
>
> Most of the testing is done by hacking around OpenSBI and linux host.
> The changes for those can be found at [1] and [2].
>
> It's my first touch on RISC-V qemu IRQ subsystem. Any feedback would
> be much appreciated.
>
> The change can also be found on github [3].
>
> TODO: This change doesn't support delegating virtual interrupts injected
> by M-mode to VS-mode by the Hypervisor. This is true for bits 13:63 only.

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Thanks
> Rajnesh
>
> [0]: https://github.com/riscv/riscv-aia/releases/download/1.0/riscv-inter=
rupts-1.0.pdf
> [1]: https://github.com/rajnesh-kanwal/opensbi/tree/dev/rkanwal/irq_filte=
r
> [2]: https://github.com/rajnesh-kanwal/linux/commits/dev/rkanwal/aia_irq_=
filter
> [3]: https://github.com/rajnesh-kanwal/qemu/tree/dev/rkanwal/riscv_irq_fi=
lter
>
> v5:
>  * Rebased the patches onto alister/riscv-to-apply.next again. Updated
>    version_id and minimum_version_id in vmstate_riscv_cpu and
>    vmstate_hyper. Also updated AIA spec links.
>
> v4:
>  * Rebased the patches onto alister/riscv-to-apply.next. There were
>    some rebasing conflicts due to code restructuring.
>
> v3:
>  * Rebased the patches and added reviewed-by tags.
>
> v2:
>  * Move RISCV_EXCP_SEMIHOST to switch case and remove special handling.
>  * Fix linux-user build.
>
> Rajnesh Kanwal (6):
>   target/riscv: Without H-mode mask all HS mode inturrupts in mie.
>   target/riscv: Check for async flag in case of RISCV_EXCP_SEMIHOST.
>   target/riscv: Set VS* bits to one in mideleg when H-Ext is enabled
>   target/riscv: Split interrupt logic from riscv_cpu_update_mip.
>   target/riscv: Add M-mode virtual interrupt and IRQ filtering support.
>   target/riscv: Add HS-mode virtual interrupt and IRQ filtering support.
>
>  target/riscv/cpu.c         |   4 +-
>  target/riscv/cpu.h         |  23 ++
>  target/riscv/cpu_bits.h    |   6 +
>  target/riscv/cpu_helper.c  |  99 ++++++--
>  target/riscv/csr.c         | 477 +++++++++++++++++++++++++++++++++----
>  target/riscv/machine.c     |  14 +-
>  target/riscv/tcg/tcg-cpu.c |   7 +-
>  7 files changed, 551 insertions(+), 79 deletions(-)
>
> --
> 2.34.1
>
>

