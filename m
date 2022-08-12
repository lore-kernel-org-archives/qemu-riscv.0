Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMK2j-000709-KQ
	for mharc-qemu-riscv@gnu.org; Thu, 11 Aug 2022 22:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oMK2i-0006yp-DX
 for qemu-riscv@nongnu.org; Thu, 11 Aug 2022 22:04:56 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oMK2e-0008SF-GH
 for qemu-riscv@nongnu.org; Thu, 11 Aug 2022 22:04:56 -0400
Received: by mail-yb1-xb29.google.com with SMTP id 199so30959108ybl.9
 for <qemu-riscv@nongnu.org>; Thu, 11 Aug 2022 19:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=UZHBFpD9QySZocV3+rOL56pKKCw8hM/oCSCsczw/Ofo=;
 b=snbWKpuLvmozv5dsKYY7e8qr8qh0+tdzois+CajkBD/pD2Em+0EXqhOu756tzeOLJA
 pFrBOZ5/F/SiCrhMP72IruwkJT8sO3t/VAAjDc2Gs+kfJsgV7wGAWznvJRgmKplynyPr
 eZW0cpb1F6YeK/3DdjJLavsKfL6LIRs3cvTcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=UZHBFpD9QySZocV3+rOL56pKKCw8hM/oCSCsczw/Ofo=;
 b=z9nloiWtigbXJgHQtJSCUJs78E3Y55UZHSrCd1aLzRkftwn9AAMVAyzebs8XleFfz2
 CO/WeXNm9ILc0LYp4mWjrADX3TEtLf9P0H1BkQNnkaGPJcwvQdb0/ssiMz7GNwm09v76
 EhLXKncy32rIWMwRCYfZhllvY7RkuHQfianDvjakSIuNJd5/KRyVcamS1aD9XsH/xaNX
 XgAkuqDjaUxtdBo1iqH0m3DmILcO394FrJ+LEIORshVIDTTvtb+W+5KLI95fs0RzbLOJ
 Rr2AGeyYGts9yuIUvG7rQvfVVZAOI+3fVEeBPrG2jHeIDsKKVKB0uSzCeMF3DsQAtPjt
 DUiw==
X-Gm-Message-State: ACgBeo0kk+8Tuw1FmnQHyJAyuKi3zY2+Fab4DeBwsT3FqyhJVHATBCsR
 KGoNIjFVmKjToqZIb0a1/l6I0dIyjGmFhIrd+T/G
X-Google-Smtp-Source: AA6agR5zSuxTHuvi3QWxUGpuYOAqmHDhM1+lUwaZ03LnIZT9PWuvM1Uh2VaJHZlpIkCA7mpcOBa4W+w+XLcM7mCCl4Y=
X-Received: by 2002:a25:9e8c:0:b0:67c:3305:eb71 with SMTP id
 p12-20020a259e8c000000b0067c3305eb71mr1842917ybq.160.1660269890821; Thu, 11
 Aug 2022 19:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220802233307.2106839-1-atishp@rivosinc.com>
In-Reply-To: <20220802233307.2106839-1-atishp@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 11 Aug 2022 19:04:39 -0700
Message-ID: <CAOnJCULUCvLrofjeCP5ROBn+Nt77=ay0sFOWpLAUh-hwNP+DTw@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Improve PMU support
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 12 Aug 2022 02:04:56 -0000

On Tue, Aug 2, 2022 at 4:33 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> The latest version of the SBI specification includes a Performance Monito=
ring
> Unit(PMU) extension[1] which allows the supervisor to start/stop/configur=
e
> various PMU events. The Sscofpmf ('Ss' for Privileged arch and Supervisor=
-level
> extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
> extension[2] allows the perf like tool to handle overflow interrupts and
> filtering support.
>
> This series implements remaining PMU infrastructure to support
> PMU in virt machine. The first seven patches from the original series
> have been merged already.
>
> This will allow us to add any PMU events in future.
> Currently, this series enables the following omu events.
> 1. cycle count
> 2. instruction count
> 3. DTLB load/store miss
> 4. ITLB prefetch miss
>
> The first two are computed using host ticks while last three are counted =
during
> cpu_tlb_fill. We can do both sampling and count from guest userspace.
> This series has been tested on both RV64 and RV32. Both Linux[3] and Open=
sbi[4]
> patches are required to get the perf working.
>
> Here is an output of perf stat/report while running hackbench with latest
> OpenSBI & Linux kernel.
>
> Perf stat:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [root@fedora-riscv ~]# perf stat -e cycles -e instructions -e dTLB-load-m=
isses -e dTLB-store-misses -e iTLB-load-misses \
> > perf bench sched messaging -g 1 -l 10
> # Running 'sched/messaging' benchmark:
> # 20 sender and receiver processes per group
> # 1 groups =3D=3D 40 processes run
>
>      Total time: 0.265 [sec]
>
>  Performance counter stats for 'perf bench sched messaging -g 1 -l 10':
>
>      4,167,825,362      cycles
>      4,166,609,256      instructions              #    1.00  insn per cyc=
le
>          3,092,026      dTLB-load-misses
>            258,280      dTLB-store-misses
>          2,068,966      iTLB-load-misses
>
>        0.585791767 seconds time elapsed
>
>        0.373802000 seconds user
>        1.042359000 seconds sys
>
> Perf record:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [root@fedora-riscv ~]# perf record -e cycles -e instructions \
> > -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -c 10000 \
> > perf bench sched messaging -g 1 -l 10
> # Running 'sched/messaging' benchmark:
> # 20 sender and receiver processes per group
> # 1 groups =3D=3D 40 processes run
>
>      Total time: 1.397 [sec]
> [ perf record: Woken up 10 times to write data ]
> Check IO/CPU overload!
> [ perf record: Captured and wrote 8.211 MB perf.data (214486 samples) ]
>
> [root@fedora-riscv riscv]# perf report
> Available samples
> 107K cycles                                                              =
      =E2=97=86
> 107K instructions                                                        =
      =E2=96=92
> 250 dTLB-load-misses                                                     =
      =E2=96=92
> 13 dTLB-store-misses                                                     =
      =E2=96=92
> 172 iTLB-load-misses
> ..
>
> Changes from v11->v12:
> 1. Rebased on top of the apply-next.
> 2. Aligned the write function & .min_priv to the previous line.
> 3. Fixed the FDT generations for multi-socket scenario.
> 4. Dropped interrupt property from the DT.
> 5. Generate illegal instruction fault instead of virtual instruction faul=
t
>    for VS/VU access while mcounteren is not set.
>
> Changes from v10->v11:
> 1. Rebased on top of the master where first 7 patches were already merged=
.
> 2. Removed unnecessary additional check in ctr predicate function.
> 3. Removed unnecessary priv version checks in mcountinhibit read/write.
> 4. Added Heiko's reviewed-by/tested-by tags.
>
> Changes from v8->v9:
> 1. Added the write_done flags to the vmstate.
> 2. Fixed the hpmcounter read access from M-mode.
>
> Changes from v7->v8:
> 1. Removeding ordering constraints for mhpmcounter & mhpmevent.
>
> Changes from v6->v7:
> 1. Fixed all the compilation errors for the usermode.
>
> Changes from v5->v6:
> 1. Fixed compilation issue with PATCH 1.
> 2. Addressed other comments.
>
> Changes from v4->v5:
> 1. Rebased on top of the -next with following patches.
>    - isa extension
>    - priv 1.12 spec
> 2. Addressed all the comments on v4
> 3. Removed additional isa-ext DT node in favor of riscv,isa string update
>
> Changes from v3->v4:
> 1. Removed the dummy events from pmu DT node.
> 2. Fixed pmu_avail_counters mask generation.
> 3. Added a patch to simplify the predicate function for counters.
>
> Changes from v2->v3:
> 1. Addressed all the comments on PATCH1-4.
> 2. Split patch1 into two separate patches.
> 3. Added explicit comments to explain the event types in DT node.
> 4. Rebased on latest Qemu.
>
> Changes from v1->v2:
> 1. Dropped the ACks from v1 as signficant changes happened after v1.
> 2. sscofpmf support.
> 3. A generic counter management framework.
>
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.=
adoc
> [2] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edi=
t
> [3] https://github.com/atishp04/qemu/tree/riscv_pmu_v12
>
> Atish Patra (6):
> target/riscv: Add sscofpmf extension support
> target/riscv: Simplify counter predicate function
> target/riscv: Add few cache related PMU events
> hw/riscv: virt: Add PMU DT node to the device tree
> target/riscv: Update the privilege field for sscofpmf CSRs
> target/riscv: Remove additional priv version check for mcountinhibit
>
> hw/riscv/virt.c           |  16 ++
> target/riscv/cpu.c        |  12 ++
> target/riscv/cpu.h        |  25 +++
> target/riscv/cpu_bits.h   |  55 +++++
> target/riscv/cpu_helper.c |  25 +++
> target/riscv/csr.c        | 312 +++++++++++++++++-----------
> target/riscv/machine.c    |   1 +
> target/riscv/pmu.c        | 414 +++++++++++++++++++++++++++++++++++++-
> target/riscv/pmu.h        |   8 +
> 9 files changed, 749 insertions(+), 119 deletions(-)
>
> --
> 2.25.1
>
>

Any other comments on this series ?


--=20
Regards,
Atish

