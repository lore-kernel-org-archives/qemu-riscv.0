Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaYl1-0000tL-9E
	for mharc-qemu-riscv@gnu.org; Tue, 20 Sep 2022 04:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oaYkK-0000oE-2b
 for qemu-riscv@nongnu.org; Tue, 20 Sep 2022 04:36:55 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oaYkH-0001l6-5u
 for qemu-riscv@nongnu.org; Tue, 20 Sep 2022 04:36:47 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s206so1862571pgs.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Sep 2022 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8xut7OO+tMUA59UTrF0V0vnVS5Og/Ucefg+dtagaSCk=;
 b=ekwZh7VT5xu1NGEcs7Sl9AvBiq2gVbTaAE73XhwT6S06Xnb0JNnNEyTMGy3niK2bWT
 hDNMng0lBRCEm6qpQ2r0rPQ6PbNsguH/5nY+dxSTo697rCeET/9JWv4PovJIB3ipvHfK
 Jgv3hwmKC6nH3L+I5RMXYbiON9MZMkwepCGb1cFgI/MhO3KSTKxW5qD+iBA7jyAIx7p0
 nUIcepaJrAIIlBdA4H4WQBHZgJ5PD9egjPbJFltNpvGoguxUWi0fjRAHwFz2bvs42cIb
 960QRzStRgIWNFy7qlgIrPw2clYH7SAldsOQMPRZiKSD5NEo5uEpqhBvS6o6fRDyiuMN
 /ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8xut7OO+tMUA59UTrF0V0vnVS5Og/Ucefg+dtagaSCk=;
 b=6Ib6LVFnAuMx9wZRTu/WZBbrlMsIhNXGZkAdJ4rAxS46tuIAPU2GoTr2qED39a/3UD
 8gWn/HI+trDorbamFnYY4uCxq5nd3on76ofySlX7brUMqBYwgaRboydVVi4HZ3OaQC71
 IqgaLCgPwga73NH8njsRnvEWCSPLDHeaRCm8L/dV38Ujyqa1frEx8SGqclMjnrALPk+H
 BbsBbPA7tRn5j1s1DhYDBDqKGGS7vxp/F7wBzdUxwJyIzymrz6BTgkk6Oxw12U9XLY7m
 BWsuE3iHPaQpsex3DjrmN88h+Wbles/uuVLYXUI80yffuBcNjrDu1HCLEYcZIXrjPfAI
 3JWg==
X-Gm-Message-State: ACrzQf2XSW9ZSTE9t/3j2hVfuSkvXqq2kSipxkiWxfMbyI+g1EFLqtHF
 9WnTAaKGrZU11Na8uTyqmptG7IDk3WwfxrRWAo4i7w==
X-Google-Smtp-Source: AMsMyM70cWYXzraaRriSURIEpWbYh4lSAtCHdAaEw/hh/LeKExPHtM5AaUevmY61170q9AkoQhFHFh0b7l3GFwXAfNQ=
X-Received: by 2002:a63:575a:0:b0:439:169f:4b5a with SMTP id
 h26-20020a63575a000000b00439169f4b5amr19984505pgm.595.1663662999139; Tue, 20
 Sep 2022 01:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <CAKmqyKN+M9HYLo0oQ3zD5hvGX5KCLEK5y0D9Roh3qfpsBFsNdw@mail.gmail.com>
In-Reply-To: <CAKmqyKN+M9HYLo0oQ3zD5hvGX5KCLEK5y0D9Roh3qfpsBFsNdw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 20 Sep 2022 01:36:28 -0700
Message-ID: <CAHBxVyFNyYoccndDgUD0djiXQO76uZMt00X9XJQEdE5r-4fxow@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Improve PMU support
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000017119c05e917bac3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 20 Sep 2022 08:37:10 -0000

--00000000000017119c05e917bac3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2022 at 3:08 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Aug 25, 2022 at 8:22 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > The latest version of the SBI specification includes a Performance
> Monitoring
> > Unit(PMU) extension[1] which allows the supervisor to
> start/stop/configure
> > various PMU events. The Sscofpmf ('Ss' for Privileged arch and
> Supervisor-level
> > extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filterin=
g)
> > extension[2] allows the perf like tool to handle overflow interrupts an=
d
> > filtering support.
> >
> > This series implements remaining PMU infrastructure to support
> > PMU in virt machine. The first seven patches from the original series
> > have been merged already.
> >
> > This will allow us to add any PMU events in future.
> > Currently, this series enables the following omu events.
> > 1. cycle count
> > 2. instruction count
> > 3. DTLB load/store miss
> > 4. ITLB prefetch miss
> >
> > The first two are computed using host ticks while last three are counte=
d
> during
> > cpu_tlb_fill. We can do both sampling and count from guest userspace.
> > This series has been tested on both RV64 and RV32. Both Linux[3] and
> Opensbi[4]
> > patches are required to get the perf working.
> >
> > Here is an output of perf stat/report while running hackbench with late=
st
> > OpenSBI & Linux kernel.
> >
> > Perf stat:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [root@fedora-riscv ~]# perf stat -e cycles -e instructions -e
> dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses \
> > > perf bench sched messaging -g 1 -l 10
> > # Running 'sched/messaging' benchmark:
> > # 20 sender and receiver processes per group
> > # 1 groups =3D=3D 40 processes run
> >
> >      Total time: 0.265 [sec]
> >
> >  Performance counter stats for 'perf bench sched messaging -g 1 -l 10':
> >
> >      4,167,825,362      cycles
> >      4,166,609,256      instructions              #    1.00  insn per
> cycle
> >          3,092,026      dTLB-load-misses
> >            258,280      dTLB-store-misses
> >          2,068,966      iTLB-load-misses
> >
> >        0.585791767 seconds time elapsed
> >
> >        0.373802000 seconds user
> >        1.042359000 seconds sys
> >
> > Perf record:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [root@fedora-riscv ~]# perf record -e cycles -e instructions \
> > > -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -c 10000=
 \
> > > perf bench sched messaging -g 1 -l 10
> > # Running 'sched/messaging' benchmark:
> > # 20 sender and receiver processes per group
> > # 1 groups =3D=3D 40 processes run
> >
> >      Total time: 1.397 [sec]
> > [ perf record: Woken up 10 times to write data ]
> > Check IO/CPU overload!
> > [ perf record: Captured and wrote 8.211 MB perf.data (214486 samples) ]
> >
> > [root@fedora-riscv riscv]# perf report
> > Available samples
> > 107K cycles
>       =E2=97=86
> > 107K instructions
>       =E2=96=92
> > 250 dTLB-load-misses
>        =E2=96=92
> > 13 dTLB-store-misses
>        =E2=96=92
> > 172 iTLB-load-misses
> > ..
> >
> > Changes from v13->v14:
> > 1. Added sanity check for the hashtable in pmu.c
> >
> > Changes from v12->v13:
> > 1. Rebased on top of the apply-next.
> > 2. Addressed comments about space & comment block.
> >
> > Changes from v11->v12:
> > 1. Rebased on top of the apply-next.
> > 2. Aligned the write function & .min_priv to the previous line.
> > 3. Fixed the FDT generations for multi-socket scenario.
> > 4. Dropped interrupt property from the DT.
> > 5. Generate illegal instruction fault instead of virtual instruction
> fault
> >    for VS/VU access while mcounteren is not set.
> >
> > Changes from v10->v11:
> > 1. Rebased on top of the master where first 7 patches were already
> merged.
> > 2. Removed unnecessary additional check in ctr predicate function.
> > 3. Removed unnecessary priv version checks in mcountinhibit read/write.
> > 4. Added Heiko's reviewed-by/tested-by tags.
> >
> > Changes from v8->v9:
> > 1. Added the write_done flags to the vmstate.
> > 2. Fixed the hpmcounter read access from M-mode.
> >
> > Changes from v7->v8:
> > 1. Removeding ordering constraints for mhpmcounter & mhpmevent.
> >
> > Changes from v6->v7:
> > 1. Fixed all the compilation errors for the usermode.
> >
> > Changes from v5->v6:
> > 1. Fixed compilation issue with PATCH 1.
> > 2. Addressed other comments.
> >
> > Changes from v4->v5:
> > 1. Rebased on top of the -next with following patches.
> >    - isa extension
> >    - priv 1.12 spec
> > 2. Addressed all the comments on v4
> > 3. Removed additional isa-ext DT node in favor of riscv,isa string upda=
te
> >
> > Changes from v3->v4:
> > 1. Removed the dummy events from pmu DT node.
> > 2. Fixed pmu_avail_counters mask generation.
> > 3. Added a patch to simplify the predicate function for counters.
> >
> > Changes from v2->v3:
> > 1. Addressed all the comments on PATCH1-4.
> > 2. Split patch1 into two separate patches.
> > 3. Added explicit comments to explain the event types in DT node.
> > 4. Rebased on latest Qemu.
> >
> > Changes from v1->v2:
> > 1. Dropped the ACks from v1 as signficant changes happened after v1.
> > 2. sscofpmf support.
> > 3. A generic counter management framework.
> >
> > [1]
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
> > [2]
> https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit
> > [3] https://github.com/atishp04/qemu/tree/riscv_pmu_v14
> >
> > Atish Patra (5):
> > target/riscv: Add sscofpmf extension support
> > target/riscv: Simplify counter predicate function
> > target/riscv: Add few cache related PMU events
> > hw/riscv: virt: Add PMU DT node to the device tree
> > target/riscv: Update the privilege field for sscofpmf CSRs
>
> Sorry, but this doesn't apply. Are you able to rebase it?
>
>
I am a bit confused. Your PULL request on Sep 7th already included this &
sstc series.
I can see the patches in upstream qemu as well.



> Alistair
>
> >
> > hw/riscv/virt.c           |  16 ++
> > target/riscv/cpu.c        |  12 ++
> > target/riscv/cpu.h        |  25 +++
> > target/riscv/cpu_bits.h   |  55 +++++
> > target/riscv/cpu_helper.c |  25 +++
> > target/riscv/csr.c        | 304 +++++++++++++++++----------
> > target/riscv/machine.c    |   1 +
> > target/riscv/pmu.c        | 425 +++++++++++++++++++++++++++++++++++++-
> > target/riscv/pmu.h        |   8 +
> > 9 files changed, 760 insertions(+), 111 deletions(-)
> >
> > --
> > 2.25.1
> >
> >
>

--00000000000017119c05e917bac3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 19, 2022 at 3:08 PM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, Aug 25, 2022 at 8:22 AM Atish Patra &lt;<a href=3D"mailto:atishp@r=
ivosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The latest version of the SBI specification includes a Performance Mon=
itoring<br>
&gt; Unit(PMU) extension[1] which allows the supervisor to start/stop/confi=
gure<br>
&gt; various PMU events. The Sscofpmf (&#39;Ss&#39; for Privileged arch and=
 Supervisor-level<br>
&gt; extensions, and &#39;cofpmf&#39; for Count OverFlow and Privilege Mode=
 Filtering)<br>
&gt; extension[2] allows the perf like tool to handle overflow interrupts a=
nd<br>
&gt; filtering support.<br>
&gt;<br>
&gt; This series implements remaining PMU infrastructure to support<br>
&gt; PMU in virt machine. The first seven patches from the original series<=
br>
&gt; have been merged already.<br>
&gt;<br>
&gt; This will allow us to add any PMU events in future.<br>
&gt; Currently, this series enables the following omu events.<br>
&gt; 1. cycle count<br>
&gt; 2. instruction count<br>
&gt; 3. DTLB load/store miss<br>
&gt; 4. ITLB prefetch miss<br>
&gt;<br>
&gt; The first two are computed using host ticks while last three are count=
ed during<br>
&gt; cpu_tlb_fill. We can do both sampling and count from guest userspace.<=
br>
&gt; This series has been tested on both RV64 and RV32. Both Linux[3] and O=
pensbi[4]<br>
&gt; patches are required to get the perf working.<br>
&gt;<br>
&gt; Here is an output of perf stat/report while running hackbench with lat=
est<br>
&gt; OpenSBI &amp; Linux kernel.<br>
&gt;<br>
&gt; Perf stat:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; [root@fedora-riscv ~]# perf stat -e cycles -e instructions -e dTLB-loa=
d-misses -e dTLB-store-misses -e iTLB-load-misses \<br>
&gt; &gt; perf bench sched messaging -g 1 -l 10<br>
&gt; # Running &#39;sched/messaging&#39; benchmark:<br>
&gt; # 20 sender and receiver processes per group<br>
&gt; # 1 groups =3D=3D 40 processes run<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Total time: 0.265 [sec]<br>
&gt;<br>
&gt;=C2=A0 Performance counter stats for &#39;perf bench sched messaging -g=
 1 -l 10&#39;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 4,167,825,362=C2=A0 =C2=A0 =C2=A0 cycles<br>
&gt;=C2=A0 =C2=A0 =C2=A0 4,166,609,256=C2=A0 =C2=A0 =C2=A0 instructions=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 1.00=C2=A0 ins=
n per cycle<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3,092,026=C2=A0 =C2=A0 =C2=A0 dTLB-l=
oad-misses<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 258,280=C2=A0 =C2=A0 =C2=A0 d=
TLB-store-misses<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2,068,966=C2=A0 =C2=A0 =C2=A0 iTLB-l=
oad-misses<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0.585791767 seconds time elapsed<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0.373802000 seconds user<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 1.042359000 seconds sys<br>
&gt;<br>
&gt; Perf record:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; [root@fedora-riscv ~]# perf record -e cycles -e instructions \<br>
&gt; &gt; -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -c 1=
0000 \<br>
&gt; &gt; perf bench sched messaging -g 1 -l 10<br>
&gt; # Running &#39;sched/messaging&#39; benchmark:<br>
&gt; # 20 sender and receiver processes per group<br>
&gt; # 1 groups =3D=3D 40 processes run<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Total time: 1.397 [sec]<br>
&gt; [ perf record: Woken up 10 times to write data ]<br>
&gt; Check IO/CPU overload!<br>
&gt; [ perf record: Captured and wrote 8.211 MB perf.data (214486 samples) =
]<br>
&gt;<br>
&gt; [root@fedora-riscv riscv]# perf report<br>
&gt; Available samples<br>
&gt; 107K cycles=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=97=86<br>
&gt; 107K instructions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =E2=96=92<br>
&gt; 250 dTLB-load-misses=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=E2=96=92<br>
&gt; 13 dTLB-store-misses=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=E2=96=92<br>
&gt; 172 iTLB-load-misses<br>
&gt; ..<br>
&gt;<br>
&gt; Changes from v13-&gt;v14:<br>
&gt; 1. Added sanity check for the hashtable in pmu.c<br>
&gt;<br>
&gt; Changes from v12-&gt;v13:<br>
&gt; 1. Rebased on top of the apply-next.<br>
&gt; 2. Addressed comments about space &amp; comment block.<br>
&gt;<br>
&gt; Changes from v11-&gt;v12:<br>
&gt; 1. Rebased on top of the apply-next.<br>
&gt; 2. Aligned the write function &amp; .min_priv to the previous line.<br=
>
&gt; 3. Fixed the FDT generations for multi-socket scenario.<br>
&gt; 4. Dropped interrupt property from the DT.<br>
&gt; 5. Generate illegal instruction fault instead of virtual instruction f=
ault<br>
&gt;=C2=A0 =C2=A0 for VS/VU access while mcounteren is not set.<br>
&gt;<br>
&gt; Changes from v10-&gt;v11:<br>
&gt; 1. Rebased on top of the master where first 7 patches were already mer=
ged.<br>
&gt; 2. Removed unnecessary additional check in ctr predicate function.<br>
&gt; 3. Removed unnecessary priv version checks in mcountinhibit read/write=
.<br>
&gt; 4. Added Heiko&#39;s reviewed-by/tested-by tags.<br>
&gt;<br>
&gt; Changes from v8-&gt;v9:<br>
&gt; 1. Added the write_done flags to the vmstate.<br>
&gt; 2. Fixed the hpmcounter read access from M-mode.<br>
&gt;<br>
&gt; Changes from v7-&gt;v8:<br>
&gt; 1. Removeding ordering constraints for mhpmcounter &amp; mhpmevent.<br=
>
&gt;<br>
&gt; Changes from v6-&gt;v7:<br>
&gt; 1. Fixed all the compilation errors for the usermode.<br>
&gt;<br>
&gt; Changes from v5-&gt;v6:<br>
&gt; 1. Fixed compilation issue with PATCH 1.<br>
&gt; 2. Addressed other comments.<br>
&gt;<br>
&gt; Changes from v4-&gt;v5:<br>
&gt; 1. Rebased on top of the -next with following patches.<br>
&gt;=C2=A0 =C2=A0 - isa extension<br>
&gt;=C2=A0 =C2=A0 - priv 1.12 spec<br>
&gt; 2. Addressed all the comments on v4<br>
&gt; 3. Removed additional isa-ext DT node in favor of riscv,isa string upd=
ate<br>
&gt;<br>
&gt; Changes from v3-&gt;v4:<br>
&gt; 1. Removed the dummy events from pmu DT node.<br>
&gt; 2. Fixed pmu_avail_counters mask generation.<br>
&gt; 3. Added a patch to simplify the predicate function for counters.<br>
&gt;<br>
&gt; Changes from v2-&gt;v3:<br>
&gt; 1. Addressed all the comments on PATCH1-4.<br>
&gt; 2. Split patch1 into two separate patches.<br>
&gt; 3. Added explicit comments to explain the event types in DT node.<br>
&gt; 4. Rebased on latest Qemu.<br>
&gt;<br>
&gt; Changes from v1-&gt;v2:<br>
&gt; 1. Dropped the ACks from v1 as signficant changes happened after v1.<b=
r>
&gt; 2. sscofpmf support.<br>
&gt; 3. A generic counter management framework.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/riscv-non-isa/riscv-sbi-doc/blob/mas=
ter/riscv-sbi.adoc" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc</a><br>
&gt; [2] <a href=3D"https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4=
xG_2sihbfd/edit" rel=3D"noreferrer" target=3D"_blank">https://drive.google.=
com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit</a><br>
&gt; [3] <a href=3D"https://github.com/atishp04/qemu/tree/riscv_pmu_v14" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/atishp04/qemu/tree/ri=
scv_pmu_v14</a><br>
&gt;<br>
&gt; Atish Patra (5):<br>
&gt; target/riscv: Add sscofpmf extension support<br>
&gt; target/riscv: Simplify counter predicate function<br>
&gt; target/riscv: Add few cache related PMU events<br>
&gt; hw/riscv: virt: Add PMU DT node to the device tree<br>
&gt; target/riscv: Update the privilege field for sscofpmf CSRs<br>
<br>
Sorry, but this doesn&#39;t apply. Are you able to rebase it?<br>
<br></blockquote><div><br></div><div>I am a bit confused. Your PULL request=
 on Sep 7th already included this &amp; sstc series.</div><div>I can see th=
e patches in upstream qemu as well.</div><div><br></div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Alistair<br>
<br>
&gt;<br>
&gt; hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ++<=
br>
&gt; target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++<br>
&gt; target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +++<br>
&gt; target/riscv/cpu_bits.h=C2=A0 =C2=A0|=C2=A0 55 +++++<br>
&gt; target/riscv/cpu_helper.c |=C2=A0 25 +++<br>
&gt; target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 304 +++++++++++++++++-=
---------<br>
&gt; target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; target/riscv/pmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 425 ++++++++++++++++++=
+++++++++++++++++++-<br>
&gt; target/riscv/pmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
&gt; 9 files changed, 760 insertions(+), 111 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--00000000000017119c05e917bac3--

