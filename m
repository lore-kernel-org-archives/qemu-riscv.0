Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntcsY-0005Ph-Jb
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 18:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntcsX-0005MW-9U; Tue, 24 May 2022 18:19:49 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:42958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntcsV-0006rM-BF; Tue, 24 May 2022 18:19:48 -0400
Received: by mail-io1-xd34.google.com with SMTP id a10so19724766ioe.9;
 Tue, 24 May 2022 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FCxNat54XVa9fvViwb5QCTzo3HmxCeuIBWKQfTwUm1g=;
 b=Tke78/KGDD79ziXbcvR91aBsrE6W6kP3w8VrVGoCeAVgWd6503fwZV87mHiv2DPHUe
 EryTzlVM7Rs/bsXkXWmFhm0j9Np0p5Pbiw760mvhu+/DQphFQjci7HcvYP7B/tIQE2Tw
 r7msVIDfbpiyGp/Ad6GfwPuxZhhLojAA11aDtd99Wyfz0aCGW1jiw/3xGA0MSUvlrxv/
 4CMZ1uNS5UUuA8sjvz2qSHWdpLVh3X6LJdkISGG5RLQgYKSQNzAHtREfYEVptUPdikEg
 aYrF1POkamWtvtmH4Yw769F8m/gCqvKtfFsAjtvi0WTsmdpIY63PxQiowUGSiWiEwZrD
 u1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FCxNat54XVa9fvViwb5QCTzo3HmxCeuIBWKQfTwUm1g=;
 b=u6QQ1uW9k8ap4K7r2Ct8wG0PG1Ey1LvPgIGr410VlG2K6W9cexCrAEvsVNXVHBPlln
 u9FzRdcBHOasK0k36TNIII4iXXLSZKRpc6dv7vQ8H8sw1BaQksAQ8Hsva8KyL+e9rRMJ
 Hr1jv8Il1Ev0nez3CupmXPKNAWYoQ6fmGE/bhH8pL+5Idhvr49kyjMFyRXwvMtZyMU4P
 KA8IZA6G+p7JuJDmNE3EH+FP37ZZbYAHe+ethoz4cPdU+3wGdhedFJDFbYNfLm0cxvmJ
 8AREJCyRoyj0G0IZKCdYXcJwv4lgooAz+ludrCpqBUbDbjdcaYUMpllWm0qji07zRTR5
 oEaQ==
X-Gm-Message-State: AOAM530eEwHoR0JCqaTVdntqnA+p3pPnXPQ6SqA84+aF29tJE2MvCvhg
 qTp+3jW6l46y6Z8i1MHYTbn4YUssEHncWslLNlw=
X-Google-Smtp-Source: ABdhPJwVPE0OnvhL2O4ReZ71cSOXHSgOj3j6USKNoxcko6wFSKVuCNsODGY1+hToefUKktSA/vjWnvglXOue5AADoJ4=
X-Received: by 2002:a05:6638:160d:b0:32b:d9d2:f2f2 with SMTP id
 x13-20020a056638160d00b0032bd9d2f2f2mr14820438jas.68.1653430785664; Tue, 24
 May 2022 15:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 May 2022 08:19:19 +1000
Message-ID: <CAKmqyKPvFPsRDFi0Q5C=G6a27T-o6_u7Uhy4NdqDx2kc1wKWog@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] QEMU RISC-V nested virtualization fixes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 24 May 2022 22:19:49 -0000

On Thu, May 12, 2022 at 12:47 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series does fixes and improvements to have nested virtualization
> on QEMU RISC-V.
>
> These patches can also be found in riscv_nested_fixes_v2 branch at:
> https://github.com/avpatel/qemu.git
>
> The RISC-V nested virtualization was tested on QEMU RISC-V using
> Xvisor RISC-V which has required hypervisor support to run another
> hypervisor as Guest/VM.
>
> Changes since v1:
>  - Set write_gva to env->two_stage_lookup which ensures that for
>    HS-mode to HS-mode trap write_gva is true only for HLV/HSV
>    instructions
>  - Included "[PATCH 0/3] QEMU RISC-V priv spec version fixes"
>    patches in this series for easy review
>  - Re-worked PATCH7 to force disable extensions if required
>    priv spec version is not staisfied
>  - Added new PATCH8 to fix "aia=aplic-imsic" mode of virt machine
>
> Anup Patel (8):
>   target/riscv: Fix csr number based privilege checking
>   target/riscv: Fix hstatus.GVA bit setting for traps taken from HS-mode
>   target/riscv: Set [m|s]tval for both illegal and virtual instruction
>     traps
>   target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
>   target/riscv: Don't force update priv spec version to latest
>   target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11 or
>     higher
>   target/riscv: Force disable extensions if priv spec version does not
>     match
>   hw/riscv: virt: Fix interrupt parent for dynamic platform devices

Thanks!

I have applied some of these patches to riscv-to-apply.next

Alistair

>
>  hw/riscv/virt.c           |  25 +++---
>  target/riscv/cpu.c        |  46 +++++++++-
>  target/riscv/cpu.h        |   8 +-
>  target/riscv/cpu_bits.h   |   3 +
>  target/riscv/cpu_helper.c | 172 ++++++++++++++++++++++++++++++++++++--
>  target/riscv/csr.c        |  10 ++-
>  target/riscv/instmap.h    |  41 +++++++++
>  target/riscv/translate.c  |  17 +++-
>  8 files changed, 292 insertions(+), 30 deletions(-)
>
> --
> 2.34.1
>
>

