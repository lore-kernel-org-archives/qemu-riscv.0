Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5ew9-0005qs-3R
	for mharc-qemu-riscv@gnu.org; Sun, 26 Jun 2022 22:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5ew7-0005pe-5h; Sun, 26 Jun 2022 22:57:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5ew5-000566-K3; Sun, 26 Jun 2022 22:57:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id o18so6977399plg.2;
 Sun, 26 Jun 2022 19:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ocJMx5braf/Tcbazu0fo4ojAZEssTxn8bZphIE6Wv00=;
 b=ApqHIHWF2Zd+KCy+84Lh9lLTi2CsVYhiWHv0EENOhmYY0Zt1w8lAeCiSvBsXTpBzFQ
 Z5u0lHUnDRg6BrkzSjFAPZmrQ1frv++gTLLJdx8chwiIAED++Y2r0Llmr1Vg+EGLNL6K
 s4jzDbCU3rSd3YRLzHuIKMWm/gk2ANbvlj451wDMLzixqRNX6FDSdmbAdFLnvmfORCpC
 7gKpcFGsFjfU6i2th6cBGilGy1YRugvFF14XgYfwSuTyWw7hBjHXnxxggIZbDxJVz3jJ
 z0yRXWR1BU2OkNu0nZPwFnh2udaN/2rDDENW0zgfJpWqyPpNgpt1S6sbbgDvOGS+7v6x
 XdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ocJMx5braf/Tcbazu0fo4ojAZEssTxn8bZphIE6Wv00=;
 b=o3XnFXVWuDlpIbh1Gz/1dol3b5d8PJaMfG54m2uK996WLx9FyfkB3GG0YTnlxe2zbE
 Cs+YflsQ1QfZiEkKgIUBxNMHvYbWIIO0fx7hZ5Qj4vNkCOCfEr1O99D+OvMugA6e2kj1
 NvBQmohSxD74SdrYSottp/SRxHyP57MAaAtBib+/hfv8RkhAw3qya14xyMmverRrSXZq
 n5W2EMrOrO+Hw2IT7SoFwPy5a7RwsCgWYdTHxPrqRtLb+0tjQEvJ0yA2MloQYdcXTn21
 GLpkZktAbS3ER9MmLA8Y8VNG/UKlUqH8pdT5t1wXiPVvZZNd1IpPrcC1V2bIyAoanwR8
 yHlw==
X-Gm-Message-State: AJIora9YY4kavbdobwBHaIOIeknzJs3Ud6xEV5YIIXzWYy7soNOhiiuM
 1/KA+NowAhzZKxAy4WhP0lgwOpgOjKLuw3LCP4U=
X-Google-Smtp-Source: AGRyM1sAuol3KvcXnf9jUssYTvgyna/8ob6Ow3NGWIIW8i9t5Ipsmdf5ZMk0v+/oCORYi1b9pxD0ZiEldSdAfpFS2ww=
X-Received: by 2002:a17:90a:590e:b0:1ed:59f0:bc2f with SMTP id
 k14-20020a17090a590e00b001ed59f0bc2fmr6293777pji.120.1656298631860; Sun, 26
 Jun 2022 19:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220611080107.391981-1-apatel@ventanamicro.com>
In-Reply-To: <20220611080107.391981-1-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jun 2022 12:56:45 +1000
Message-ID: <CAKmqyKORb4Tcc2qPZN8EjEKdffQ7SPyg88nBu6-Jm8w0Di5XJw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] QEMU RISC-V nested virtualization fixes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Mon, 27 Jun 2022 02:57:15 -0000

On Sat, Jun 11, 2022 at 6:20 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series does fixes and improvements to have nested virtualization
> on QEMU RISC-V.
>
> These patches can also be found in riscv_nested_fixes_v6 branch at:
> https://github.com/avpatel/qemu.git
>
> The RISC-V nested virtualization was tested on QEMU RISC-V using
> Xvisor RISC-V which has required hypervisor support to run another
> hypervisor as Guest/VM.
>
> Changes since v5:
>  - Correctly set "Addr. Offset" for misaligned load/store traps in PATCH3
>  - Use offsetof() instead of pointer in PATCH4
>
> Changes since v4:
>  - Updated commit description in PATCH1, PATCH2, and PATCH4
>  - Use "const" for local array in PATCH5
>
> Changes since v3:
>  - Updated PATCH3 to set special pseudoinstructions in htinst for
>    guest page faults which result due to VS-stage page table walks
>  - Updated warning message in PATCH4
>
> Changes since v2:
>  - Dropped the patch which are already in Alistair's next branch
>  - Set "Addr. Offset" in the transformed instruction for PATCH3
>  - Print warning in riscv_cpu_realize() if we are disabling an
>    extension due to privilege spec verions mismatch for PATCH4
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
> Anup Patel (4):
>   target/riscv: Don't force update priv spec version to latest
>   target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11 or
>     higher
>   target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
>   target/riscv: Force disable extensions if priv spec version does not
>     match

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c        | 154 ++++++++++++++++-----------
>  target/riscv/cpu.h        |   3 +
>  target/riscv/cpu_bits.h   |   3 +
>  target/riscv/cpu_helper.c | 214 ++++++++++++++++++++++++++++++++++++--
>  target/riscv/csr.c        |   2 +
>  target/riscv/instmap.h    |  45 ++++++++
>  6 files changed, 356 insertions(+), 65 deletions(-)
>
> --
> 2.34.1
>
>

