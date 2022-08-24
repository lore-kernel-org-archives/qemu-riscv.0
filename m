Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQyhI-00005o-Fl
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 18:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQyh0-0008PK-6X
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 18:17:49 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQygy-0006Zg-3w
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 18:17:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id c24so16207320pgg.11
 for <qemu-riscv@nongnu.org>; Wed, 24 Aug 2022 15:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=C076FbGp0+j6emr9kZMwTSBsAR7P3Iy+waPrAKJ+FI0=;
 b=w0ogb1IvX0FoOtcgGPR/H7NjeTdpDv3i5+un57/8jk/ibzSA5+QpDV2cBVqs3rl/v8
 gDu8eNZhQd1GTedhvVzCs9Ofo95TEmkULRtAL7dIbTjT4FpLN1gpvEmi+IRYXPwKKKAk
 e6pNLM/m2fVBGKS8o2DQTW4eX9uqtWVBT0ocfmlbdNYmMihgzxxpIHMlwudtQNp/2v/T
 2G9q0wc3PfOazliYwVFyRHYiYEsCv9EyY1+kyDRxR5BdwxvDzBkpzF4sbJF75EZXaL3Z
 U+6CUPYfS/OtaLazvz0nyI8vcZMHaHAes92yM+5mIOQL9LsyuD3ijMSFpqFVx6CkrA8G
 L/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=C076FbGp0+j6emr9kZMwTSBsAR7P3Iy+waPrAKJ+FI0=;
 b=8KVGAqh0g80iYTMoxINN/WCTL9FcmgiUPPkQ0K5kylDh2L5YyBJHuS8BjsgeiLkinB
 J3+DZzXfGKO3T0mx/77EBsRJNCwhXk6I3PgO34JOpNasR3e9hu0KiwBIZaGNmS+9jSHU
 G4fmW5zDp3VO9z8+UQ6i6zz4BXZGuhWDEEeSVkgbxJQYXYjee1EMi+a9PCZ3QcLORzo+
 eqAZwZqN38oJemdYQ0qGpel4g8OJGyT26s5jT87wGNNLIpKCzz2ouhW7GAlMDTFoymZy
 00pZ8GjlRrjZu1B91PGSm8fHi+hGHu28xoRIHvQgvKT11N1bEZtfv0kPkOm3AAdHdQFb
 n/5w==
X-Gm-Message-State: ACgBeo3/pTcBToW0GiarC3VzYKX+y5C4a+6obHKRsa+SyY2a6zeamNL6
 YA+97+kq7pBu+RhT1HR+vUn+rA==
X-Google-Smtp-Source: AA6agR7MPIcWjziHbqi7HFZxZ+lw2rcXuCTCWIOiYJPxhGBI7Jj+NtQO5yPam87CMe3NOUFPk2bV+g==
X-Received: by 2002:a63:224a:0:b0:41e:1d36:5063 with SMTP id
 t10-20020a63224a000000b0041e1d365063mr760405pgm.568.1661379461890; 
 Wed, 24 Aug 2022 15:17:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902f71200b0016909be39e5sm4243031plo.177.2022.08.24.15.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 15:17:41 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v14 0/5] Improve PMU support
Date: Wed, 24 Aug 2022 15:16:56 -0700
Message-Id: <20220824221701.41932-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 24 Aug 2022 22:17:59 -0000

The latest version of the SBI specification includes a Performance Monitoring
Unit(PMU) extension[1] which allows the supervisor to start/stop/configure
various PMU events. The Sscofpmf ('Ss' for Privileged arch and Supervisor-level
extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
extension[2] allows the perf like tool to handle overflow interrupts and
filtering support.

This series implements remaining PMU infrastructure to support
PMU in virt machine. The first seven patches from the original series
have been merged already.

This will allow us to add any PMU events in future.
Currently, this series enables the following omu events.
1. cycle count
2. instruction count
3. DTLB load/store miss
4. ITLB prefetch miss

The first two are computed using host ticks while last three are counted during
cpu_tlb_fill. We can do both sampling and count from guest userspace.
This series has been tested on both RV64 and RV32. Both Linux[3] and Opensbi[4]
patches are required to get the perf working.

Here is an output of perf stat/report while running hackbench with latest
OpenSBI & Linux kernel.

Perf stat:
==========
[root@fedora-riscv ~]# perf stat -e cycles -e instructions -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses \
> perf bench sched messaging -g 1 -l 10
# Running 'sched/messaging' benchmark:
# 20 sender and receiver processes per group
# 1 groups == 40 processes run

     Total time: 0.265 [sec]

 Performance counter stats for 'perf bench sched messaging -g 1 -l 10':

     4,167,825,362      cycles                                                      
     4,166,609,256      instructions              #    1.00  insn per cycle         
         3,092,026      dTLB-load-misses                                            
           258,280      dTLB-store-misses                                           
         2,068,966      iTLB-load-misses                                            

       0.585791767 seconds time elapsed

       0.373802000 seconds user
       1.042359000 seconds sys

Perf record:
============
[root@fedora-riscv ~]# perf record -e cycles -e instructions \
> -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -c 10000 \
> perf bench sched messaging -g 1 -l 10
# Running 'sched/messaging' benchmark:
# 20 sender and receiver processes per group
# 1 groups == 40 processes run

     Total time: 1.397 [sec]
[ perf record: Woken up 10 times to write data ]
Check IO/CPU overload!
[ perf record: Captured and wrote 8.211 MB perf.data (214486 samples) ]

[root@fedora-riscv riscv]# perf report
Available samples                                                               
107K cycles                                                                    ◆
107K instructions                                                              ▒
250 dTLB-load-misses                                                           ▒
13 dTLB-store-misses                                                           ▒
172 iTLB-load-misses      
..

Changes from v13->v14:
1. Added sanity check for the hashtable in pmu.c

Changes from v12->v13:
1. Rebased on top of the apply-next.
2. Addressed comments about space & comment block.

Changes from v11->v12:
1. Rebased on top of the apply-next.
2. Aligned the write function & .min_priv to the previous line.
3. Fixed the FDT generations for multi-socket scenario.
4. Dropped interrupt property from the DT.
5. Generate illegal instruction fault instead of virtual instruction fault
   for VS/VU access while mcounteren is not set.

Changes from v10->v11:
1. Rebased on top of the master where first 7 patches were already merged.
2. Removed unnecessary additional check in ctr predicate function.
3. Removed unnecessary priv version checks in mcountinhibit read/write. 
4. Added Heiko's reviewed-by/tested-by tags.

Changes from v8->v9:
1. Added the write_done flags to the vmstate.
2. Fixed the hpmcounter read access from M-mode.

Changes from v7->v8:
1. Removeding ordering constraints for mhpmcounter & mhpmevent.

Changes from v6->v7:
1. Fixed all the compilation errors for the usermode.

Changes from v5->v6:
1. Fixed compilation issue with PATCH 1.
2. Addressed other comments.

Changes from v4->v5:
1. Rebased on top of the -next with following patches.
   - isa extension
   - priv 1.12 spec
2. Addressed all the comments on v4
3. Removed additional isa-ext DT node in favor of riscv,isa string update

Changes from v3->v4:
1. Removed the dummy events from pmu DT node.
2. Fixed pmu_avail_counters mask generation.
3. Added a patch to simplify the predicate function for counters. 

Changes from v2->v3:
1. Addressed all the comments on PATCH1-4.
2. Split patch1 into two separate patches.
3. Added explicit comments to explain the event types in DT node.
4. Rebased on latest Qemu.

Changes from v1->v2:
1. Dropped the ACks from v1 as signficant changes happened after v1.
2. sscofpmf support.
3. A generic counter management framework.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v14

Atish Patra (5):
target/riscv: Add sscofpmf extension support
target/riscv: Simplify counter predicate function
target/riscv: Add few cache related PMU events
hw/riscv: virt: Add PMU DT node to the device tree
target/riscv: Update the privilege field for sscofpmf CSRs

hw/riscv/virt.c           |  16 ++
target/riscv/cpu.c        |  12 ++
target/riscv/cpu.h        |  25 +++
target/riscv/cpu_bits.h   |  55 +++++
target/riscv/cpu_helper.c |  25 +++
target/riscv/csr.c        | 304 +++++++++++++++++----------
target/riscv/machine.c    |   1 +
target/riscv/pmu.c        | 425 +++++++++++++++++++++++++++++++++++++-
target/riscv/pmu.h        |   8 +
9 files changed, 760 insertions(+), 111 deletions(-)

--
2.25.1


