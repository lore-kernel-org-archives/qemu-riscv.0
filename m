Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMJTw-0006qe-Jb
	for mharc-qemu-riscv@gnu.org; Thu, 11 Aug 2022 21:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oMJTv-0006p3-2Y; Thu, 11 Aug 2022 21:28:59 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oMJTt-0003T4-Au; Thu, 11 Aug 2022 21:28:58 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z19so18412522plb.1;
 Thu, 11 Aug 2022 18:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6OZXR3woiYWd9UYiEm5BUY8KXL1P0MsDGYjUcui0jTo=;
 b=pcBCMWixBSb1tuy8BCzttSYkWIqs69kiU1Ix5AIF05BrP6u7S3eZ17vzUgJYw4PSad
 bZRge/U0Uap+obnmTBlLoZY7ombScbcX86Lx0V2PWxudY+jRIbEGUD8YRErR59Dm1YPN
 ub7E4qUxdFqjpC14wkxgw+zr/NCaQBCPqc2FLDJUDAWykAzdncioSzYiyZ+gyqNDBDsi
 FKVO1zXmQvuz1a8ZFKizMdn0ttMW1cbHKUn5pnJ6GC08mZexNVfgNIoe12uOxXfUj4oV
 2NSoG02yKHds0fWDFxWvrr2tVcEz8E/kEIyW4BEm15KqOvwNOlWxeV80wHvqpgt2F/JX
 XxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6OZXR3woiYWd9UYiEm5BUY8KXL1P0MsDGYjUcui0jTo=;
 b=RJaUGk0vHbmXnzv/PnZ0Eb16t6Z5GTCyaZaFytrorG3pJMc4crL1vLcZGxzUqoDwGQ
 Exzc61kK8KiM5yB2OvVB38WAGVI63ET2ElAuAHbwbEbExXeNWeweK3B+9uu2Vzs1NhDN
 4MS0DGovLXOs3cl0GHHKWKnotIacK81lNn1Le+lSABcZFhAvGip7+mWHO7D9IexXBydU
 gaHJybmghdB7OBxpKg2JZ/2CauDxIqWqcL3Ee2Z04OdaOfVfxkZYKf6SMGnXyrshw65V
 Gd1WcGrk3ou4E65inLujQF+kzfrMm1pMkXAtQW7O9y11qXacvemz7S71Q4IuKU9wxp2L
 7XZg==
X-Gm-Message-State: ACgBeo2biCzuQ0ik/0b9GCuuF+LjrDkucVqetakbpheudu+s2Zq5+D9R
 TOIBz7nAMCVVZN3mhyQcu72uJ+1PUdQkk8jeuYc=
X-Google-Smtp-Source: AA6agR5K5mro/X68LC4M+x2drW5gk4fh0wGbOEo+Ikmm2p7UwZ5Y7DO6ZmdDOg9Xznh1ip4Mqk9brue9tPGX3blYpfg=
X-Received: by 2002:a17:90b:100e:b0:1f3:a4a:2620 with SMTP id
 gm14-20020a17090b100e00b001f30a4a2620mr1709008pjb.120.1660267735241; Thu, 11
 Aug 2022 18:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184548.3620153-1-atishp@rivosinc.com>
In-Reply-To: <20220810184548.3620153-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Aug 2022 11:28:28 +1000
Message-ID: <CAKmqyKM1p+-B7skGEDNKZ4Ay+J+LDvTvi2VYzHDnieZ_so4CxQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Implement Sstc extension
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Fri, 12 Aug 2022 01:28:59 -0000

On Thu, Aug 11, 2022 at 5:02 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> This series implements Sstc extension[1] which was ratified recently.
>
> The first patch is a prepartory patches while PATCH 2 adds stimecmp
> support while PATCH 3 adds vstimecmp support. This series is based on
> on top of upstream commit (faee5441a038).
>
> The series can also be found at
> https://github.com/atishp04/qemu/tree/sstc_v9
>
> It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
> patches.
>
> Changes from v8->v9:
> 1. Updated alignment of few lines.
> 2. Improved predicate functions for sstc.
>
> Changes from v7->v8:
> 1. Removed redundant blank lines.
> 2. Invoke smode & hmode predicate function from sstc related predicate
>    functions.
>
> Changes from v6->v7:
> 1. Replaced g_malloc0 with g_new0.
> 2. Removed the over allocation for the timers.
>
> Changes from v5->v6:
> 1. Rebased on top of the latest HEAD commit.
>
> Changes from v4->v5:
> 1. Removed any ordering related flags and emulate the hardware more
>    closely.
>
> Changes from v3->v4:
> 1. Added [v]stimecmp_wr_done to the corresponding vmstate strucuture.
>
> Changes from v2->v3:
> 1. Dropped generic migration code improvement patches.
> 2. Removed the order constraints while updating stimecmp/vstimecmp.
>
> Changes from v1->v2:
> 1. Rebased on the latest upstream commit.
> 2. Replaced PATCH 1 with another patch where mtimer/timecmp is
>    moved from CPU to ACLINT.
> 3. Added ACLINT migration support.
>
> [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
> [2] https://github.com/atishp04/linux/tree/sstc_v8
>
> Atish Patra (3):
> hw/intc: Move mtimer/mtimecmp to aclint
> target/riscv: Add stimecmp support
> target/riscv: Add vstimecmp support

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> hw/intc/riscv_aclint.c         |  41 +++++---
> hw/timer/ibex_timer.c          |  18 ++--
> include/hw/intc/riscv_aclint.h |   2 +
> include/hw/timer/ibex_timer.h  |   2 +
> target/riscv/cpu.c             |   9 ++
> target/riscv/cpu.h             |  11 ++-
> target/riscv/cpu_bits.h        |   8 ++
> target/riscv/cpu_helper.c      |  11 ++-
> target/riscv/csr.c             | 168 +++++++++++++++++++++++++++++++++
> target/riscv/machine.c         |   7 +-
> target/riscv/meson.build       |   3 +-
> target/riscv/time_helper.c     | 114 ++++++++++++++++++++++
> target/riscv/time_helper.h     |  30 ++++++
> 13 files changed, 392 insertions(+), 32 deletions(-)
> create mode 100644 target/riscv/time_helper.c
> create mode 100644 target/riscv/time_helper.h
>
> --
> 2.25.1
>
>

