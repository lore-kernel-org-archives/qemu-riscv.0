Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHHvw-0003RX-Lu
	for mharc-qemu-riscv@gnu.org; Mon, 07 Feb 2022 23:16:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHHvu-0003RG-LI; Mon, 07 Feb 2022 23:16:50 -0500
Received: from [2607:f8b0:4864:20::d34] (port=37478
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHHvs-0000X4-Bt; Mon, 07 Feb 2022 23:16:50 -0500
Received: by mail-io1-xd34.google.com with SMTP id n17so19651260iod.4;
 Mon, 07 Feb 2022 20:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pQOE2xSxnHcPeIt36QOVMLYZ1yFNoMVePyRGf93Cbi8=;
 b=P6q4yTD1YziCnp/tk91pKlmUz2OwtqH598Q+nM0RoO1RmsPcaknXtnhG0ybxLkRPy7
 O7IlgMHQHxjqwbVsNMOuk9Sf6LpdLqkB/rMSZy5KAcaq+gy4KJG4u4c5OGd2A+rW7xpw
 xMSJYIa6QzO1VQddAHLog0ZT1gknAcjoZcuHFRfdzYFBelgeEAig/F6lGOND9AGn5WhZ
 MemOxTtiF1l2aQ71QY9hu3EmxFfY6fNb7P38+L4AGZdBJSJQJSpN37y1W2gJ2UCzyGN5
 HqSpVKrsajMeLK4Dg1N7VskB243/leMGR05C5+aKo+9oG02nTA64TQh7Jd/2SEoEYJOa
 oyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pQOE2xSxnHcPeIt36QOVMLYZ1yFNoMVePyRGf93Cbi8=;
 b=Y/UUydXaO4lZmdFp5vmKR6dZfUMBqiQZT8A+Stg2hzjNh/h/G81NzSc3JkMwVyYb10
 4j9ErKQqybq8i2KSuDMI3Xvyhfh9eXGbF+vPxijUUslGT9tV0kQMvlFoby0ULcf/Sbu6
 cpBVglE6+0BX4BjqOP1JFOB4ibrk5kNYS71BUhCIplx9jpyWj9Vwl05mPGD6M4/FLI9r
 vcTNOu9wFefEhSRGlzGbf6kAHtioeIfDJxsYwAAR/gXZMTw9jgzLDBBh3l+n3PB6aDeA
 z9+uKxqwdUFV5jYHAcOmb8Zj2CQ34Z/5XBNBRqFB5k78OyfddQAwa1mX9dZUspI2QN3W
 qN4Q==
X-Gm-Message-State: AOAM533FOXnzoIEIEvztIs9EU5WQefgQoFg9SZ2/wi/OvArQvAZ/nuOv
 92SJ+ZLXQ8bpxkYxUaXsRgD3MONzQSTHuuKmi3M=
X-Google-Smtp-Source: ABdhPJxAbGoR8Plbj9F5boxfqAlhuHI8ooyFtNei5yfDp/4vnvLdax43Qx7NJp75Pkk0ZFZqUlEKUqmWSq1YKYa9msk=
X-Received: by 2002:a05:6638:1028:: with SMTP id
 n8mr1365397jan.318.1644293805868; 
 Mon, 07 Feb 2022 20:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20220204174700.534953-1-anup@brainfault.org>
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Feb 2022 14:16:19 +1000
Message-ID: <CAKmqyKO7QnMwSL1Mpa5BJU44EAQxyG2M-sOE8+yAH0SWrmVDug@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] QEMU RISC-V AIA support
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 08 Feb 2022 04:16:50 -0000

On Sat, Feb 5, 2022 at 3:47 AM Anup Patel <anup@brainfault.org> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> The advanced interrupt architecture (AIA) extends the per-HART local
> interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
> and Advanced PLIC (wired interrupt controller).
>
> The latest AIA draft specification can be found here:
> https://github.com/riscv/riscv-aia/releases/download/0.2-draft.28/riscv-interrupts-028.pdf
>
> This series adds RISC-V AIA support in QEMU which includes emulating all
> AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
> not implemented because we don't have any local interrupt greater than 12.
>
> To enable AIA in QEMU, use one of the following:
> 1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
>    in the QEMU command-line
> 2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
>    in the QEMU command-line
> 3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
>    machine parameter in the QEMU command-line
> 4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
>    "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
>    command-line
>
> To test series, we require OpenSBI and Linux with AIA support which can
> be found in:
> riscv_aia_v2 branch at https://github.com/avpatel/opensbi.git
> riscv_aia_v1 branch at https://github.com/avpatel/linux.git
>
> This series can be found riscv_aia_v9 branch at:
> https://github.com/avpatel/qemu.git
>
> Changes since v8:
>  - Use error_setg() in riscv_imsic_realize() added by PATCH20
>
> Changes since v7:
>  - Rebased on latest riscv-to-apply.next branch of Alistair's repo
>  - Improved default priority assignment in PATCH9
>
> Changes since v6:
>  - Fixed priority comparison in riscv_cpu_pending_to_irq() of PATCH9
>  - Fixed typos in comments added by PATCH11
>  - Added "pend = true;" for CSR_MSETEIPNUM case of rmw_xsetclreinum()
>    in PATCH15
>  - Handle ithreshold == 0 case in riscv_aplic_idc_topi() of PATCH18
>  - Allow setting pending bit for Level0 or Level1 interrupts in
>    riscv_aplic_set_pending() of PATCH18
>  - Force DOMAINCFG[31:24] bits to 0x80 in riscv_aplic_read() of PATCH18
>  - For APLIC direct mode, set target.iprio to 1 when zero is writtern
>    in PATCH18
>  - Handle eithreshold == 0 case in riscv_imsic_topei() of PATCH20
>
> Changes since v5:
>  - Moved VSTOPI_NUM_SRCS define to top of the file in PATCH13
>  - Fixed typo in PATCH16
>
> Changes since v4:
>  - Changed IRQ_LOCAL_MAX to 16 in PATCH2
>  - Fixed typo in PATCH10
>  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH11
>  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH14
>  - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH15
>  - Replaced TARGET_LONG_BITS with xlen passed via ireg callback in PATCH20
>  - Retrict maximum IMSIC guest files per-HART of virt machine to 7 in
>    PATCH21.
>  - Added separate PATCH23 to increase maximum number of allowed CPUs
>    for virt machine
>
> Changes since v3:
>  - Replaced "aplic,xyz" and "imsic,xyz" DT properties with "riscv,xyz"
>    DT properties because "aplic" and "imsic" are not valid vendor names
>    required by Linux DT schema checker.
>
> Changes since v2:
>  - Update PATCH4 to check and inject interrupt after V=1 when
>    transitioning from V=0 to V=1
>
> Changes since v1:
>  - Revamped whole series and created more granular patches
>  - Added HGEIE and HGEIP CSR emulation for H-extension
>  - Added APLIC emulation
>  - Added IMSIC emulation
>
> Anup Patel (23):
>   target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV64
>     HS-mode
>   target/riscv: Implement SGEIP bit in hip and hie CSRs
>   target/riscv: Implement hgeie and hgeip CSRs
>   target/riscv: Improve delivery of guest external interrupts
>   target/riscv: Allow setting CPU feature from machine/device emulation
>   target/riscv: Add AIA cpu feature
>   target/riscv: Add defines for AIA CSRs
>   target/riscv: Allow AIA device emulation to set ireg rmw callback
>   target/riscv: Implement AIA local interrupt priorities
>   target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
>   target/riscv: Implement AIA hvictl and hviprioX CSRs
>   target/riscv: Implement AIA interrupt filtering CSRs
>   target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
>   target/riscv: Implement AIA xiselect and xireg CSRs
>   target/riscv: Implement AIA IMSIC interface CSRs
>   hw/riscv: virt: Use AIA INTC compatible string when available
>   target/riscv: Allow users to force enable AIA CSRs in HART
>   hw/intc: Add RISC-V AIA APLIC device emulation
>   hw/riscv: virt: Add optional AIA APLIC support to virt machine
>   hw/intc: Add RISC-V AIA IMSIC device emulation
>   hw/riscv: virt: Add optional AIA IMSIC support to virt machine
>   docs/system: riscv: Document AIA options for virt machine
>   hw/riscv: virt: Increase maximum number of allowed CPUs

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  docs/system/riscv/virt.rst    |   16 +
>  hw/intc/Kconfig               |    6 +
>  hw/intc/meson.build           |    2 +
>  hw/intc/riscv_aplic.c         |  975 +++++++++++++++++++++++++
>  hw/intc/riscv_imsic.c         |  448 ++++++++++++
>  hw/riscv/Kconfig              |    2 +
>  hw/riscv/virt.c               |  706 +++++++++++++++---
>  include/hw/intc/riscv_aplic.h |   79 ++
>  include/hw/intc/riscv_imsic.h |   68 ++
>  include/hw/riscv/virt.h       |   41 +-
>  target/riscv/cpu.c            |  103 ++-
>  target/riscv/cpu.h            |   72 +-
>  target/riscv/cpu_bits.h       |  123 ++++
>  target/riscv/cpu_helper.c     |  343 ++++++++-
>  target/riscv/csr.c            | 1280 ++++++++++++++++++++++++++++++---
>  target/riscv/machine.c        |   24 +-
>  16 files changed, 3988 insertions(+), 300 deletions(-)
>  create mode 100644 hw/intc/riscv_aplic.c
>  create mode 100644 hw/intc/riscv_imsic.c
>  create mode 100644 include/hw/intc/riscv_aplic.h
>  create mode 100644 include/hw/intc/riscv_imsic.h
>
> --
> 2.25.1
>
>

