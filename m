Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oRMlI-0008Vt-RI
	for mharc-qemu-riscv@gnu.org; Thu, 25 Aug 2022 19:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oRMlE-0008U1-Aj; Thu, 25 Aug 2022 19:59:44 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oRMlC-0001XQ-6o; Thu, 25 Aug 2022 19:59:43 -0400
Received: by mail-pf1-x436.google.com with SMTP id y141so27306pfb.7;
 Thu, 25 Aug 2022 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=MSlh99YXphVVQx0G0Hj/7MtBmF69zYZbj5NnFMRMIPU=;
 b=QBB9eEjPrslhKALAoggPUzDAntrzfqmKHRqfU9Rq/shiYyEW38bvhGDClc2ttx0clC
 4+1TZrS/+CoFGyK3J4RV8Jj5jHLxZWZU7WEv/2RZu3hetcAskDbEaMfF5EzSvJJIFU3s
 2f+waJEUq3gGE77BT5cGPN8PtTCLuQMpiT/aEy4jpPyB5tuEWCU5p3FXEKu7xz2NmyIE
 keOpVjdR8Mnc/3S9jJhTkfji0sQ469jj+Md0CwcQ5MimOOjIQxWozcetsGOH0FIsj19m
 /QyWOwCepGuKN3b+yb8XxuhIE0oE3VJIAJUxnrPheJlls4Y1rrAr+nhcmVznCjt9pzSt
 HjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MSlh99YXphVVQx0G0Hj/7MtBmF69zYZbj5NnFMRMIPU=;
 b=NqEmNpvfM5OjmfOToFA3+QtIaQ8dGBxfsbCl1uASqZ9PFGaHQjYlWH8uXj4Z7wMqMB
 /Ct+naKlU3OGjquBFxG0lmnsF060VqRXlhiI3/1BWtocaOEzSdpCBzhu7+CiIVABWN9P
 KRn1VEPVheIK/+KHXNO/Agj7FKDiEia5YqwV2038WUWCelQPm2HebH8TE7EhL91W3ruv
 6E7iLXdDCSys9HNoZ4G3SpTb6cJ3SUCOBrrqjZFcntCTEMpXsppiCXOKanqJx7Di+soG
 nj0qQNeCxzVwQ2/xpjZS5xO7VTp5m30QUEX6Y07PKs3kzpO8bE9DgTYmoGzQVJBaMK0T
 rcFg==
X-Gm-Message-State: ACgBeo2+zy2d4TaYFbwt+uS0xtrI7wm4P4mPkCsnC1Nka19iRl01tXOP
 vQSfyrUcBb7QJoDsj3SZKZj0LxI5vhAOr/ODIP0=
X-Google-Smtp-Source: AA6agR6xoKEvV0LA5uZ8fOO8zv/qlFlNM63S1eB+fBJn6R0KxoPU+YmLyE39wWDWEGZeOIk3kJC7KE7RNALeUpwOeOU=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr1289088pfj.83.1661471978101; Thu, 25
 Aug 2022 16:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220824221357.41070-1-atishp@rivosinc.com>
In-Reply-To: <20220824221357.41070-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Aug 2022 09:59:11 +1000
Message-ID: <CAKmqyKMrPsOqVojAfWrano+Qb3oG2tO6axRY-PSPK-WrKQH1Sw@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Implement Sstc extension
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Thu, 25 Aug 2022 23:59:46 -0000

On Thu, Aug 25, 2022 at 8:14 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> This series implements Sstc extension[1] which was ratified recently.
>
> The first patch is a prepartory patches while PATCH 2 adds stimecmp
> support while PATCH 3 adds vstimecmp support. This series is based on
> on top of upstream commit (faee5441a038).
>
> The series can also be found at
> https://github.com/atishp04/qemu/tree/sstc_v10
>
> It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
> patches.
>
> Changes from v9->v10:
> 1. Fixed the multi socket booting issue by using the relative hartid.
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
> hw/intc/riscv_aclint.c         |  48 +++++++---
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
> 13 files changed, 397 insertions(+), 34 deletions(-)
> create mode 100644 target/riscv/time_helper.c
> create mode 100644 target/riscv/time_helper.h
>
> --
> 2.25.1
>
>

