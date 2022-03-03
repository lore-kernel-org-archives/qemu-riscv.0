Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPc1y-0003Gg-D4
	for mharc-qemu-riscv@gnu.org; Wed, 02 Mar 2022 22:21:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPc1w-0003Dq-TX; Wed, 02 Mar 2022 22:21:28 -0500
Received: from [2607:f8b0:4864:20::d32] (port=35400
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPc1u-0006HP-VT; Wed, 02 Mar 2022 22:21:28 -0500
Received: by mail-io1-xd32.google.com with SMTP id q8so4334701iod.2;
 Wed, 02 Mar 2022 19:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=54NHf36Nvw9KmsTGU7qTE+xBu6tv19mHHOi07IBytRs=;
 b=Vea29Q5UVyimnXOTvGZvrqI6asdSSh6L1hF8l9k0/vxYW+/u1L3AUqkrEfOR0geo+A
 t76hdFyqwDscJn2O6TzVijOAmDqTaffl+2lm0pOrbKA0ewvfCvPeVixCM6hfHFtNG5AB
 8myPUTIrmCBfrW++balClqZiSBMFpsCKeYGGVbMuW+2nVVjvFTHXTQOkX7J4cltL/GBR
 4HncA6byuI1fOcmg90HppGrz4YIZxCXuWhLIlOI1pxD9DFzsYP8V2bqFG3sQZ8a8uHjd
 UUPG5jWgUqyeBwBo/tfGCtdaK8w2NOWTRRcepdoBmMskd14qPP+r12d0SJV9A2L9XiMK
 TFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=54NHf36Nvw9KmsTGU7qTE+xBu6tv19mHHOi07IBytRs=;
 b=Xl81LkpY3rlDVH9h12Ceask9eQijMZFOBHwQKEcbw+HGihorz+avg8htiv0Qex0hny
 ox3W4ioNotJUuezZt7kUFunpZmAFi/jLDR+bqtvIa7ZAzYnQuiF0FZVvskpgz13qeDRl
 zw3WwCKmaSqoNsLbkReFRSW1d6ZaIXW5S7RebbBqWD8B1Wb6RVebUDq6OhH0loRhy1x5
 /rrzwCPfabZexG6E+68XUgRX09+XgDpeHBaYT7dO9SxsnAehuseLUUy+W7bRyjoqTtPT
 dp9aOFydX/p2caQqlX8MexiPNvE6O14b2Z9x83z42+MM2pRS9oWt1CweTdUYTzW2ufEP
 XJmQ==
X-Gm-Message-State: AOAM532/UH1JncNzU3nyM6CP63BthdDqkCWRJPShnU2jJOy8w8z8ltJ7
 lPGwHHbwghRNOtIQi+vGJf4mMpqN028+LYziOpM=
X-Google-Smtp-Source: ABdhPJwhiipwJcZfH0AhQDzntEtb1ZgVN/NjJ04EWkeOZwc8ePh15GMx/j9xUGmybaj5M6EJEHXlgToFtWYDTKJ1S9o=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr25399562iov.93.1646277685095; Wed, 02
 Mar 2022 19:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20220219002518.1936806-1-atishp@rivosinc.com>
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Mar 2022 13:20:58 +1000
Message-ID: <CAKmqyKONw4O7Wf+uV34vbAhzMRY7oOfNWHhYoAGxYEXsy+Ju=A@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Improve PMU support
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Thu, 03 Mar 2022 03:21:29 -0000

On Sat, Feb 19, 2022 at 10:26 AM Atish Patra <atishp@rivosinc.com> wrote:
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
> This series implements full PMU infrastructure to support
> PMU in virt machine. This will allow us to add any PMU events in future.
>
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
> Here is an output of perf stat/report while running hackbench with OpenSB=
I & Linux
> kernel patches applied [3].
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
> [3] https://github.com/atishp04/linux/tree/riscv_pmu_v6
> [4] https://github.com/atishp04/qemu/tree/riscv_pmu_v5
>
> Atish Patra (12):
> target/riscv: Fix PMU CSR predicate function
> target/riscv: Implement PMU CSR predicate function for S-mode
> target/riscv: pmu: Rename the counters extension to pmu

I have applied the first 3 patches

Alistair

> target/riscv: pmu: Make number of counters configurable
> target/riscv: Implement mcountinhibit CSR
> target/riscv: Add support for hpmcounters/hpmevents
> target/riscv: Support mcycle/minstret write operation
> target/riscv: Add sscofpmf extension support
> target/riscv: Simplify counter predicate function
> target/riscv: Add few cache related PMU events
> hw/riscv: virt: Add PMU DT node to the device tree
> target/riscv: Update the privilege field for sscofpmf CSRs
>
> hw/riscv/virt.c           |  28 ++
> target/riscv/cpu.c        |  15 +-
> target/riscv/cpu.h        |  49 ++-
> target/riscv/cpu_bits.h   |  59 +++
> target/riscv/cpu_helper.c |  26 ++
> target/riscv/csr.c        | 862 ++++++++++++++++++++++++++++----------
> target/riscv/machine.c    |  25 ++
> target/riscv/meson.build  |   1 +
> target/riscv/pmu.c        | 431 +++++++++++++++++++
> target/riscv/pmu.h        |  37 ++
> 10 files changed, 1303 insertions(+), 230 deletions(-)
> create mode 100644 target/riscv/pmu.c
> create mode 100644 target/riscv/pmu.h
>
> --
> 2.30.2
>
>

