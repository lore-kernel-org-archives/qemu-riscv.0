Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nouNO-0004T9-E1
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 18:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNM-0004SO-N6
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:09 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNI-0006aA-N7
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 18:00:06 -0400
Received: by mail-pg1-x532.google.com with SMTP id 202so2914700pgc.9
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94lHMb0SMUV/d3HDhgbWVkMvpr3odVJ5B57hrgu0tRQ=;
 b=JbCwixfe+H4+ZwWUd9LLzeelvpiLX7vsd6ha4dr0l3gtuzy21oFuqVSkKX5te98U06
 pnhpdw7HQz3gv+DHBPrMxcLRZ60St/11kKlLDJC6+iRskcRNPaNEtD8I3cxvDefQci2r
 iUV4v6hM4zn3o2ozt7CPJ0kP3XvzujwgjHfVg/hbwvBJtIwQ+QjAlN2LPxnN9x8afIBO
 XzijS73Cc5Asv/Y25rdeiwfGbUjqQLwlwm5I90Jf+SRVmpxol8Igubkp7aOvxW8WtMes
 7WUYCFaQgT2QPweRb5nrVxKVCOHbvPcYUmpGyzndOYAaVbQLfVvLiPlqEdkhdqALhFUz
 fsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94lHMb0SMUV/d3HDhgbWVkMvpr3odVJ5B57hrgu0tRQ=;
 b=iaN8Hkk4IqKhnZ1VNvNbekW+QYne7VFtfI4UmFdUX485inRycQyNwedhYq3PPUJa3d
 42Ji82IU3tQaOWNA90Vzx3pVvlWLbHt8cl+WOoGVZ5q7gAfKz92lq3b7tP/ymZKU9PJD
 Van36e66E3XsoW7KcGn/8IZYoaCxlND0cT4mJI+oWF0Yv75L9quDIOSfnslhYnCzRgzD
 RO1ZDpGFmXsSFz6H5F5VoxByXNziuMkj2oofDerrqP6lb/jTDuCcBa+h77Dmb8DlwvT+
 KvHJMsAOicSeSk94OXfJ/ICxWKvXLtLNJFPCuO932Ni2nSB8e5mPt4ndGmhvz7y691RF
 z7ZQ==
X-Gm-Message-State: AOAM532/M8ZwWaWB/5uYTxs4VFLK8Q/pBcOf1jVrnlrSBey4zBrtCfSq
 fW3YHnPi/94Fb6/FhOgCoCtaaQ==
X-Google-Smtp-Source: ABdhPJzyBnGMP9PX2cBFzygv2mNgslBCn9n2H4Iyd9f2cm+ouYYkHO1c8kOpYmxgSR4bp9+96nRLXA==
X-Received: by 2002:a63:5917:0:b0:39c:c450:3143 with SMTP id
 n23-20020a635917000000b0039cc4503143mr22306736pgb.531.1652306402696; 
 Wed, 11 May 2022 15:00:02 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a62e417000000b0050dc762816asm2261303pfh.68.2022.05.11.15.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:00:02 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v8 00/12] Improve PMU support
Date: Wed, 11 May 2022 14:59:44 -0700
Message-Id: <20220511215956.2351243-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Wed, 11 May 2022 22:00:09 -0000

The latest version of the SBI specification includes a Performance Monitoring
Unit(PMU) extension[1] which allows the supervisor to start/stop/configure
various PMU events. The Sscofpmf ('Ss' for Privileged arch and Supervisor-level
extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
extension[2] allows the perf like tool to handle overflow interrupts and
filtering support.

This series implements full PMU infrastructure to support
PMU in virt machine. This will allow us to add any PMU events in future.

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
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v8

Atish Patra (12):
target/riscv: Fix PMU CSR predicate function
target/riscv: Implement PMU CSR predicate function for S-mode
target/riscv: pmu: Rename the counters extension to pmu
target/riscv: pmu: Make number of counters configurable
target/riscv: Implement mcountinhibit CSR
target/riscv: Add support for hpmcounters/hpmevents
target/riscv: Support mcycle/minstret write operation
target/riscv: Add sscofpmf extension support
target/riscv: Simplify counter predicate function
target/riscv: Add few cache related PMU events
hw/riscv: virt: Add PMU DT node to the device tree
target/riscv: Update the privilege field for sscofpmf CSRs

hw/riscv/virt.c           |  28 ++
target/riscv/cpu.c        |  14 +-
target/riscv/cpu.h        |  56 ++-
target/riscv/cpu_bits.h   |  59 +++
target/riscv/cpu_helper.c |  25 ++
target/riscv/csr.c        | 903 ++++++++++++++++++++++++++++----------
target/riscv/machine.c    |  25 ++
target/riscv/meson.build  |   3 +-
target/riscv/pmu.c        | 432 ++++++++++++++++++
target/riscv/pmu.h        |  36 ++
10 files changed, 1346 insertions(+), 235 deletions(-)
create mode 100644 target/riscv/pmu.c
create mode 100644 target/riscv/pmu.h

--
2.25.1


