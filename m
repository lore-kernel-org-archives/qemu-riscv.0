Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oO5vC-0003zX-7L
	for mharc-qemu-riscv@gnu.org; Tue, 16 Aug 2022 19:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5vB-0003wc-Dz
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 19:24:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5v7-0008NN-R5
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 19:24:28 -0400
Received: by mail-pj1-x1031.google.com with SMTP id g18so2063006pju.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Aug 2022 16:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1AvZuEZOSdcBXrmcyRv20cD4d0btIw3ZPm7FgTrxhy4=;
 b=1V+NiW/MpLHNJWl9kv8ST4zLaKsDeqvE/Yw6lYb0hoDfHlrNt4w+8EPdoew+RNSxsA
 6n7aEvkcE43nXqgIeZKCWHyiH1A8IKT3SAw2svHW0SYoMBBZjvaKLPlnWqNfmZla2swO
 pooq/QjO1KSRl/pZ/2mwE0HlEufuUFc0bXu/zHePRl4MQtap0pWmzacwXc7tX5U122u7
 lLMLxFF7Y0V67fj9AxeqR9ajxkY4FXRSA2Sl/uGZLr1zZqKFlQSI/sarFhhfxvAqhI76
 A36X9wH8J2JOaCYeroDviaXAmGs0OIG+/1XZ6vFdz3/SZREm0Qy43qQT+0bCtG/nHu7Z
 ag3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1AvZuEZOSdcBXrmcyRv20cD4d0btIw3ZPm7FgTrxhy4=;
 b=Mn9w+WFO92SawM0CaGJuO8vUccQVUhoFkpUpNXR0W4+UU+mrcD5JLOo0vWEUoEP4EA
 2fXqAOWXKZl05d6ZIxQB2LiWTfxwvMImn17cVBRoNsQbewM+j4i71+nO4maNM73eMtxH
 eAL/IyDKOXaryJvXqjB/p3A52aT0JABh9LkcRTFXffmSumSBzQWlYfAKlYeduRLlOEEC
 L+7PUH3cff3Qn1e66qJ4XNX36DLic5D3uylbrn/If+9loK8XXkWKoyxxoPTHZV59pezz
 Edd6YcBd2zt5hwxJVCyTRbNthvxxy0e9KWEQ2VDxaRXgF+YRtdKoaa6O+EF2T601hvIi
 Ju1g==
X-Gm-Message-State: ACgBeo1p1DQ26iKf3OfQpG4eOj6BNp9m4+2yQaOYpFjjq2MLpse/3+zy
 L5LKxChWELoLhRUfNnMA0MT+tjmH/50Tpj6Z7A8qaA==
X-Google-Smtp-Source: AA6agR7RQJ2WPlm3HYwRed1R7mJdmScIntutMtz6OQGoIXI6HGuhcSPSCDNgdSiv1eI++aN7RHXF/njgUCmQRfNRBjI=
X-Received: by 2002:a17:90b:1c8e:b0:1f7:5250:7b44 with SMTP id
 oo14-20020a17090b1c8e00b001f752507b44mr923849pjb.212.1660692264386; Tue, 16
 Aug 2022 16:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220802233307.2106839-1-atishp@rivosinc.com>
 <CAOnJCULUCvLrofjeCP5ROBn+Nt77=ay0sFOWpLAUh-hwNP+DTw@mail.gmail.com>
 <CAKmqyKOp_39-giP8K=pqrgh781X9GP37ZBwDEMyKGP-a+_Q22g@mail.gmail.com>
In-Reply-To: <CAKmqyKOp_39-giP8K=pqrgh781X9GP37ZBwDEMyKGP-a+_Q22g@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 16 Aug 2022 16:24:13 -0700
Message-ID: <CAHBxVyEzT_k=WbDP-9fd-A=-Ubs0qaSCobgL9H2Dg=8Nu+hQFg@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Improve PMU support
To: Alistair Francis <alistair23@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000080174f05e6640cfb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 16 Aug 2022 23:24:29 -0000

--00000000000080174f05e6640cfb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2022 at 5:02 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Aug 12, 2022 at 12:05 PM Atish Patra <atishp@atishpatra.org>
> wrote:
> >
> > On Tue, Aug 2, 2022 at 4:33 PM Atish Patra <atishp@rivosinc.com> wrote:
> > >
> > > The latest version of the SBI specification includes a Performance
> Monitoring
> > > Unit(PMU) extension[1] which allows the supervisor to
> start/stop/configure
> > > various PMU events. The Sscofpmf ('Ss' for Privileged arch and
> Supervisor-level
> > > extensions, and 'cofpmf' for Count OverFlow and Privilege Mode
> Filtering)
> > > extension[2] allows the perf like tool to handle overflow interrupts
> and
> > > filtering support.
> > >
> > > This series implements remaining PMU infrastructure to support
> > > PMU in virt machine. The first seven patches from the original series
> > > have been merged already.
> > >
> > > This will allow us to add any PMU events in future.
> > > Currently, this series enables the following omu events.
> > > 1. cycle count
> > > 2. instruction count
> > > 3. DTLB load/store miss
> > > 4. ITLB prefetch miss
> > >
> > > The first two are computed using host ticks while last three are
> counted during
> > > cpu_tlb_fill. We can do both sampling and count from guest userspace.
> > > This series has been tested on both RV64 and RV32. Both Linux[3] and
> Opensbi[4]
> > > patches are required to get the perf working.
> > >
> > > Here is an output of perf stat/report while running hackbench with
> latest
> > > OpenSBI & Linux kernel.
> > >
> > > Perf stat:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [root@fedora-riscv ~]# perf stat -e cycles -e instructions -e
> dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses \
> > > > perf bench sched messaging -g 1 -l 10
> > > # Running 'sched/messaging' benchmark:
> > > # 20 sender and receiver processes per group
> > > # 1 groups =3D=3D 40 processes run
> > >
> > >      Total time: 0.265 [sec]
> > >
> > >  Performance counter stats for 'perf bench sched messaging -g 1 -l 10=
':
> > >
> > >      4,167,825,362      cycles
> > >      4,166,609,256      instructions              #    1.00  insn per
> cycle
> > >          3,092,026      dTLB-load-misses
> > >            258,280      dTLB-store-misses
> > >          2,068,966      iTLB-load-misses
> > >
> > >        0.585791767 seconds time elapsed
> > >
> > >        0.373802000 seconds user
> > >        1.042359000 seconds sys
> > >
> > > Perf record:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [root@fedora-riscv ~]# perf record -e cycles -e instructions \
> > > > -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -c
> 10000 \
> > > > perf bench sched messaging -g 1 -l 10
> > > # Running 'sched/messaging' benchmark:
> > > # 20 sender and receiver processes per group
> > > # 1 groups =3D=3D 40 processes run
> > >
> > >      Total time: 1.397 [sec]
> > > [ perf record: Woken up 10 times to write data ]
> > > Check IO/CPU overload!
> > > [ perf record: Captured and wrote 8.211 MB perf.data (214486 samples)=
 ]
> > >
> > > [root@fedora-riscv riscv]# perf report
> > > Available samples
> > > 107K cycles
>         =E2=97=86
> > > 107K instructions
>         =E2=96=92
> > > 250 dTLB-load-misses
>          =E2=96=92
> > > 13 dTLB-store-misses
>          =E2=96=92
> > > 172 iTLB-load-misses
> > > ..
> > >
> > > Changes from v11->v12:
> > > 1. Rebased on top of the apply-next.
> > > 2. Aligned the write function & .min_priv to the previous line.
> > > 3. Fixed the FDT generations for multi-socket scenario.
> > > 4. Dropped interrupt property from the DT.
> > > 5. Generate illegal instruction fault instead of virtual instruction
> fault
> > >    for VS/VU access while mcounteren is not set.
> > >
> > > Changes from v10->v11:
> > > 1. Rebased on top of the master where first 7 patches were already
> merged.
> > > 2. Removed unnecessary additional check in ctr predicate function.
> > > 3. Removed unnecessary priv version checks in mcountinhibit read/writ=
e.
> > > 4. Added Heiko's reviewed-by/tested-by tags.
> > >
> > > Changes from v8->v9:
> > > 1. Added the write_done flags to the vmstate.
> > > 2. Fixed the hpmcounter read access from M-mode.
> > >
> > > Changes from v7->v8:
> > > 1. Removeding ordering constraints for mhpmcounter & mhpmevent.
> > >
> > > Changes from v6->v7:
> > > 1. Fixed all the compilation errors for the usermode.
> > >
> > > Changes from v5->v6:
> > > 1. Fixed compilation issue with PATCH 1.
> > > 2. Addressed other comments.
> > >
> > > Changes from v4->v5:
> > > 1. Rebased on top of the -next with following patches.
> > >    - isa extension
> > >    - priv 1.12 spec
> > > 2. Addressed all the comments on v4
> > > 3. Removed additional isa-ext DT node in favor of riscv,isa string
> update
> > >
> > > Changes from v3->v4:
> > > 1. Removed the dummy events from pmu DT node.
> > > 2. Fixed pmu_avail_counters mask generation.
> > > 3. Added a patch to simplify the predicate function for counters.
> > >
> > > Changes from v2->v3:
> > > 1. Addressed all the comments on PATCH1-4.
> > > 2. Split patch1 into two separate patches.
> > > 3. Added explicit comments to explain the event types in DT node.
> > > 4. Rebased on latest Qemu.
> > >
> > > Changes from v1->v2:
> > > 1. Dropped the ACks from v1 as signficant changes happened after v1.
> > > 2. sscofpmf support.
> > > 3. A generic counter management framework.
> > >
> > > [1]
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
> > > [2]
> https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit
> > > [3] https://github.com/atishp04/qemu/tree/riscv_pmu_v12
> > >
> > > Atish Patra (6):
> > > target/riscv: Add sscofpmf extension support
> > > target/riscv: Simplify counter predicate function
> > > target/riscv: Add few cache related PMU events
> > > hw/riscv: virt: Add PMU DT node to the device tree
> > > target/riscv: Update the privilege field for sscofpmf CSRs
> > > target/riscv: Remove additional priv version check for mcountinhibit
> > >
> > > hw/riscv/virt.c           |  16 ++
> > > target/riscv/cpu.c        |  12 ++
> > > target/riscv/cpu.h        |  25 +++
> > > target/riscv/cpu_bits.h   |  55 +++++
> > > target/riscv/cpu_helper.c |  25 +++
> > > target/riscv/csr.c        | 312 +++++++++++++++++-----------
> > > target/riscv/machine.c    |   1 +
> > > target/riscv/pmu.c        | 414 +++++++++++++++++++++++++++++++++++++=
-
> > > target/riscv/pmu.h        |   8 +
> > > 9 files changed, 749 insertions(+), 119 deletions(-)
> > >
> > > --
> > > 2.25.1
> > >
> > >
> >
> > Any other comments on this series ?
>
> Sooo....
>
> The series looks good, the patches are all reviewed, but do you mind
> rebasing this on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next ? Sorry
> about the hassle
>
>
Thanks for the review. Rebased and sent v13.


> Alistair
>
> >
> >
> > --
> > Regards,
> > Atish
> >
>

--00000000000080174f05e6640cfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 14, 2022 at 5:02 PM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Fri, Aug 12, 2022 at 12:05 PM Atish Patra &lt;<a href=3D"mailto:atishp@=
atishpatra.org" target=3D"_blank">atishp@atishpatra.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Aug 2, 2022 at 4:33 PM Atish Patra &lt;<a href=3D"mailto:atish=
p@rivosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The latest version of the SBI specification includes a Performanc=
e Monitoring<br>
&gt; &gt; Unit(PMU) extension[1] which allows the supervisor to start/stop/=
configure<br>
&gt; &gt; various PMU events. The Sscofpmf (&#39;Ss&#39; for Privileged arc=
h and Supervisor-level<br>
&gt; &gt; extensions, and &#39;cofpmf&#39; for Count OverFlow and Privilege=
 Mode Filtering)<br>
&gt; &gt; extension[2] allows the perf like tool to handle overflow interru=
pts and<br>
&gt; &gt; filtering support.<br>
&gt; &gt;<br>
&gt; &gt; This series implements remaining PMU infrastructure to support<br=
>
&gt; &gt; PMU in virt machine. The first seven patches from the original se=
ries<br>
&gt; &gt; have been merged already.<br>
&gt; &gt;<br>
&gt; &gt; This will allow us to add any PMU events in future.<br>
&gt; &gt; Currently, this series enables the following omu events.<br>
&gt; &gt; 1. cycle count<br>
&gt; &gt; 2. instruction count<br>
&gt; &gt; 3. DTLB load/store miss<br>
&gt; &gt; 4. ITLB prefetch miss<br>
&gt; &gt;<br>
&gt; &gt; The first two are computed using host ticks while last three are =
counted during<br>
&gt; &gt; cpu_tlb_fill. We can do both sampling and count from guest usersp=
ace.<br>
&gt; &gt; This series has been tested on both RV64 and RV32. Both Linux[3] =
and Opensbi[4]<br>
&gt; &gt; patches are required to get the perf working.<br>
&gt; &gt;<br>
&gt; &gt; Here is an output of perf stat/report while running hackbench wit=
h latest<br>
&gt; &gt; OpenSBI &amp; Linux kernel.<br>
&gt; &gt;<br>
&gt; &gt; Perf stat:<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; [root@fedora-riscv ~]# perf stat -e cycles -e instructions -e dTL=
B-load-misses -e dTLB-store-misses -e iTLB-load-misses \<br>
&gt; &gt; &gt; perf bench sched messaging -g 1 -l 10<br>
&gt; &gt; # Running &#39;sched/messaging&#39; benchmark:<br>
&gt; &gt; # 20 sender and receiver processes per group<br>
&gt; &gt; # 1 groups =3D=3D 40 processes run<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Total time: 0.265 [sec]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Performance counter stats for &#39;perf bench sched messagi=
ng -g 1 -l 10&#39;:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 4,167,825,362=C2=A0 =C2=A0 =C2=A0 cycles<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 4,166,609,256=C2=A0 =C2=A0 =C2=A0 instruction=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 1.00=C2=A0=
 insn per cycle<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3,092,026=C2=A0 =C2=A0 =C2=A0 d=
TLB-load-misses<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 258,280=C2=A0 =C2=A0 =C2=
=A0 dTLB-store-misses<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2,068,966=C2=A0 =C2=A0 =C2=A0 i=
TLB-load-misses<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0.585791767 seconds time elapsed<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 0.373802000 seconds user<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 1.042359000 seconds sys<br>
&gt; &gt;<br>
&gt; &gt; Perf record:<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; [root@fedora-riscv ~]# perf record -e cycles -e instructions \<br=
>
&gt; &gt; &gt; -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses=
 -c 10000 \<br>
&gt; &gt; &gt; perf bench sched messaging -g 1 -l 10<br>
&gt; &gt; # Running &#39;sched/messaging&#39; benchmark:<br>
&gt; &gt; # 20 sender and receiver processes per group<br>
&gt; &gt; # 1 groups =3D=3D 40 processes run<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Total time: 1.397 [sec]<br>
&gt; &gt; [ perf record: Woken up 10 times to write data ]<br>
&gt; &gt; Check IO/CPU overload!<br>
&gt; &gt; [ perf record: Captured and wrote 8.211 MB perf.data (214486 samp=
les) ]<br>
&gt; &gt;<br>
&gt; &gt; [root@fedora-riscv riscv]# perf report<br>
&gt; &gt; Available samples<br>
&gt; &gt; 107K cycles=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=97=86<br>
&gt; &gt; 107K instructions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =E2=96=92<br>
&gt; &gt; 250 dTLB-load-misses=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=E2=96=92<br>
&gt; &gt; 13 dTLB-store-misses=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=E2=96=92<br>
&gt; &gt; 172 iTLB-load-misses<br>
&gt; &gt; ..<br>
&gt; &gt;<br>
&gt; &gt; Changes from v11-&gt;v12:<br>
&gt; &gt; 1. Rebased on top of the apply-next.<br>
&gt; &gt; 2. Aligned the write function &amp; .min_priv to the previous lin=
e.<br>
&gt; &gt; 3. Fixed the FDT generations for multi-socket scenario.<br>
&gt; &gt; 4. Dropped interrupt property from the DT.<br>
&gt; &gt; 5. Generate illegal instruction fault instead of virtual instruct=
ion fault<br>
&gt; &gt;=C2=A0 =C2=A0 for VS/VU access while mcounteren is not set.<br>
&gt; &gt;<br>
&gt; &gt; Changes from v10-&gt;v11:<br>
&gt; &gt; 1. Rebased on top of the master where first 7 patches were alread=
y merged.<br>
&gt; &gt; 2. Removed unnecessary additional check in ctr predicate function=
.<br>
&gt; &gt; 3. Removed unnecessary priv version checks in mcountinhibit read/=
write.<br>
&gt; &gt; 4. Added Heiko&#39;s reviewed-by/tested-by tags.<br>
&gt; &gt;<br>
&gt; &gt; Changes from v8-&gt;v9:<br>
&gt; &gt; 1. Added the write_done flags to the vmstate.<br>
&gt; &gt; 2. Fixed the hpmcounter read access from M-mode.<br>
&gt; &gt;<br>
&gt; &gt; Changes from v7-&gt;v8:<br>
&gt; &gt; 1. Removeding ordering constraints for mhpmcounter &amp; mhpmeven=
t.<br>
&gt; &gt;<br>
&gt; &gt; Changes from v6-&gt;v7:<br>
&gt; &gt; 1. Fixed all the compilation errors for the usermode.<br>
&gt; &gt;<br>
&gt; &gt; Changes from v5-&gt;v6:<br>
&gt; &gt; 1. Fixed compilation issue with PATCH 1.<br>
&gt; &gt; 2. Addressed other comments.<br>
&gt; &gt;<br>
&gt; &gt; Changes from v4-&gt;v5:<br>
&gt; &gt; 1. Rebased on top of the -next with following patches.<br>
&gt; &gt;=C2=A0 =C2=A0 - isa extension<br>
&gt; &gt;=C2=A0 =C2=A0 - priv 1.12 spec<br>
&gt; &gt; 2. Addressed all the comments on v4<br>
&gt; &gt; 3. Removed additional isa-ext DT node in favor of riscv,isa strin=
g update<br>
&gt; &gt;<br>
&gt; &gt; Changes from v3-&gt;v4:<br>
&gt; &gt; 1. Removed the dummy events from pmu DT node.<br>
&gt; &gt; 2. Fixed pmu_avail_counters mask generation.<br>
&gt; &gt; 3. Added a patch to simplify the predicate function for counters.=
<br>
&gt; &gt;<br>
&gt; &gt; Changes from v2-&gt;v3:<br>
&gt; &gt; 1. Addressed all the comments on PATCH1-4.<br>
&gt; &gt; 2. Split patch1 into two separate patches.<br>
&gt; &gt; 3. Added explicit comments to explain the event types in DT node.=
<br>
&gt; &gt; 4. Rebased on latest Qemu.<br>
&gt; &gt;<br>
&gt; &gt; Changes from v1-&gt;v2:<br>
&gt; &gt; 1. Dropped the ACks from v1 as signficant changes happened after =
v1.<br>
&gt; &gt; 2. sscofpmf support.<br>
&gt; &gt; 3. A generic counter management framework.<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://github.com/riscv-non-isa/riscv-sbi-doc/blo=
b/master/riscv-sbi.adoc" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc</a><br>
&gt; &gt; [2] <a href=3D"https://drive.google.com/file/d/171j4jFjIkKdj5LWcE=
xphq4xG_2sihbfd/edit" rel=3D"noreferrer" target=3D"_blank">https://drive.go=
ogle.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit</a><br>
&gt; &gt; [3] <a href=3D"https://github.com/atishp04/qemu/tree/riscv_pmu_v1=
2" rel=3D"noreferrer" target=3D"_blank">https://github.com/atishp04/qemu/tr=
ee/riscv_pmu_v12</a><br>
&gt; &gt;<br>
&gt; &gt; Atish Patra (6):<br>
&gt; &gt; target/riscv: Add sscofpmf extension support<br>
&gt; &gt; target/riscv: Simplify counter predicate function<br>
&gt; &gt; target/riscv: Add few cache related PMU events<br>
&gt; &gt; hw/riscv: virt: Add PMU DT node to the device tree<br>
&gt; &gt; target/riscv: Update the privilege field for sscofpmf CSRs<br>
&gt; &gt; target/riscv: Remove additional priv version check for mcountinhi=
bit<br>
&gt; &gt;<br>
&gt; &gt; hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
6 ++<br>
&gt; &gt; target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++<br>
&gt; &gt; target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +++<br>
&gt; &gt; target/riscv/cpu_bits.h=C2=A0 =C2=A0|=C2=A0 55 +++++<br>
&gt; &gt; target/riscv/cpu_helper.c |=C2=A0 25 +++<br>
&gt; &gt; target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 312 +++++++++++++=
++++-----------<br>
&gt; &gt; target/riscv/machine.c=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt; target/riscv/pmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 414 +++++++++++++=
++++++++++++++++++++++++-<br>
&gt; &gt; target/riscv/pmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<b=
r>
&gt; &gt; 9 files changed, 749 insertions(+), 119 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; Any other comments on this series ?<br>
<br>
Sooo....<br>
<br>
The series looks good, the patches are all reviewed, but do you mind<br>
rebasing this on<br>
<a href=3D"https://github.com/alistair23/qemu/tree/riscv-to-apply.next" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/alistair23/qemu/tree/r=
iscv-to-apply.next</a> ? Sorry<br>
about the hassle<br>
<br></blockquote><div><br></div><div>Thanks for the review. Rebased and sen=
t v13.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Alistair<br>
<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Regards,<br>
&gt; Atish<br>
&gt;<br>
</blockquote></div></div>

--00000000000080174f05e6640cfb--

