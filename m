Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nM2rh-0002yq-Vu
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 02:12:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nM2rg-0002vr-K9; Mon, 21 Feb 2022 02:12:08 -0500
Received: from [2607:f8b0:4864:20::d34] (port=38904
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nM2rd-00070C-Eb; Mon, 21 Feb 2022 02:12:07 -0500
Received: by mail-io1-xd34.google.com with SMTP id w7so14920518ioj.5;
 Sun, 20 Feb 2022 23:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ncvz0MehaMYhM7DtHeUns9mADOZ/Bx9H62AvaYPt5Ec=;
 b=mdv+badxMYSVUKEHH7qJsrr+ni1Ktn+PDuA8jfsfclstZ+QW9nfzxjjKDVZf5lH66c
 4AZfoDra+1xtFxsQY+nuR94QyqRMjGGtShzRJnzt1TaA3fG2a1HDC6ou9itoFDxY0fEl
 CbPhR/7YMmw4Tt66fUXpg5gQ0vbmq8VH9GtdYtstNm0CkSZt0IFd8YvDUB9Y9MowwoPa
 suIRN+9pguaLCSNsbrrfdJOuznPoVXgUjPf0kAH5iEUKhRgKRuQwEvxrtvSk1uR0FYc6
 rzp1Sw9phkF5HME3J888n3R0QKjYU0dnaaHb49dPhFjb1oVJmLcxEhPoK430QwBolxVZ
 KaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ncvz0MehaMYhM7DtHeUns9mADOZ/Bx9H62AvaYPt5Ec=;
 b=PbCyE5fm5U+p++PRId8Kswihbsp2j4W5Sc+BWsPMkZA9aM2zfBrHMF/vA/FhS4eM1m
 6taJgSsPCrUxEKrg0GgC2o2nzxQugVVSwlQ7a5fE/Zv7brZphZpjqRXW9iEUOLiE/9PG
 kfMC2K5qor93Fp6ygYVdB7xluvC5y8qI1Pky624xvLlUUPhi1BHwQlaTm9RG7r8zaZb7
 fmxbUBZfpS6tPrv5QXMI/F6vwARaWLgtwfFVnUe4KTUEuNveSNI+V+oty+5dKqfQc6o6
 IT+2dUu44Sj25mUQO1l+0aWl3q2IMUsbzSir4+6LxFhq5YAhIRPUbYNwz2DwtZJzTaKS
 CgEg==
X-Gm-Message-State: AOAM533I/kkNIPHEkTST8rP+d6OuBm0aQpNmJx2o51C9OnqqB20VYRo9
 5FgGMI2EW8hpwzrXJqZ+PfY+NlucDU8bsere8Ew=
X-Google-Smtp-Source: ABdhPJw2GIbx8kKzFQcyOiF9q1dlcSO29HAV41mBeib4J7J8V3NBBuy2EIGTxHLhtUqlBo7OelPfiF2N3MI51OefSW8=
X-Received: by 2002:a05:6602:2988:b0:640:9fdc:752f with SMTP id
 o8-20020a056602298800b006409fdc752fmr8680998ior.31.1645427523575; Sun, 20 Feb
 2022 23:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20220220085526.808674-1-anup@brainfault.org>
In-Reply-To: <20220220085526.808674-1-anup@brainfault.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Feb 2022 17:11:37 +1000
Message-ID: <CAKmqyKPooZqF-mo3gNdj0rd-fGephzmX4OVAARGcwCL14dF2Ew@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] QEMU RISC-V AIA support
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
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
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
X-List-Received-Date: Mon, 21 Feb 2022 07:12:09 -0000

On Sun, Feb 20, 2022 at 6:57 PM Anup Patel <anup@brainfault.org> wrote:
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
> To test series, we require Linux with AIA support which can be found in:
> riscv_aia_v1 branch at https://github.com/avpatel/linux.git
>
> This series can be found riscv_aia_v10 branch at:
> https://github.com/avpatel/qemu.git
>
> Changes since v9:
>  - Rebased on latest riscv-to-apply.next branch of Alistair's repo
>  - Removed first 18 PATCHs since these are already merged
>  - Fixed 32-bit system compile error in PATCH3
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
> Anup Patel (5):
>   hw/riscv: virt: Add optional AIA APLIC support to virt machine
>   hw/intc: Add RISC-V AIA IMSIC device emulation
>   hw/riscv: virt: Add optional AIA IMSIC support to virt machine
>   docs/system: riscv: Document AIA options for virt machine
>   hw/riscv: virt: Increase maximum number of allowed CPUs

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  docs/system/riscv/virt.rst    |  16 +
>  hw/intc/Kconfig               |   3 +
>  hw/intc/meson.build           |   1 +
>  hw/intc/riscv_imsic.c         | 448 ++++++++++++++++++++++
>  hw/riscv/Kconfig              |   2 +
>  hw/riscv/virt.c               | 698 ++++++++++++++++++++++++++++------
>  include/hw/intc/riscv_imsic.h |  68 ++++
>  include/hw/riscv/virt.h       |  41 +-
>  8 files changed, 1156 insertions(+), 121 deletions(-)
>  create mode 100644 hw/intc/riscv_imsic.c
>  create mode 100644 include/hw/intc/riscv_imsic.h
>
> --
> 2.25.1
>
>

