Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZiFy-0004zQ-OM
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 20:01:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFx-0004wm-6H
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:41 -0400
Received: from [2607:f8b0:4864:20::1030] (port=43853
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFv-0005SZ-0t
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 c15-20020a17090a8d0f00b001c9c81d9648so1876819pjo.2
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 17:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PmuxUUNDh3/15/jUQqBe/K7OJARtjcWT/Xldt/ba9b4=;
 b=2ZPM6NBvASKPPt3/hJG4sDyMnqK7vAMyg3COUhzwIyHtvmAeiUr7xVzHhGwDjoKUnC
 CzTZo0NBSYXcms++OxX7fai9cbHKLFqvVrtWFQMu2vFeQOCUC5Woc0dd5HzO2OGCPKLt
 GUEZMEt7i0/dGDp+SrqDYs9UWt14L0NPjMyKNg7Iuw2mw920Yv96wurFYUGTeAxi50gz
 DiZd9bb5xlEHx1Ks3ccKOE7/6yX0w+vqWbWA3ScwfaJ9Zofw9yRMwmjpVn12DIVjj4px
 RDrBSk57DyIGC0pJckYgr22qKzMLpT80U450v25HySDIocutC0ndLiIeHwdEe5ydhuJf
 U8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PmuxUUNDh3/15/jUQqBe/K7OJARtjcWT/Xldt/ba9b4=;
 b=nZ2VqQo6p3xaYPP1k8WPmOpatHHmpzgXjhroWLebdpLRmn/hINciTuihSF/cgIFw6i
 UOdhOL2h64SuuVegFTbjp3mU09t9QknMTxvx0gjbirkFlx7hM5ag4g5E/xtKF+7IaBgh
 a4EV/dv4Gdm/Lde82c9gENbk0secNtxjpycK85zQ2RWRxDrDazEkw6BvPb4hOmjGbSv5
 5ZbKl4uCPjY3p2UuO4iJQ18qEeL/0nC94x+bkAHpijRWwF2qGkrC8G+z2bo9SBZa9UNA
 YQGkf82GiLqPEhF/+7wHbyhpP7SwakXypBPByBIDcmAq7QHl1rJrDORCsy79wccUDpHG
 IAPA==
X-Gm-Message-State: AOAM531kkGR/aSGka1tVTv/XQavM+iuEP/vfitzLjW+UqrFsnq4wBZ3I
 g4+GDMCGO56AV52ujqG7BIfelf7/Fstpmg==
X-Google-Smtp-Source: ABdhPJz6z9KkA8UVtoBWXi6KPrPXofiXabDoAYb5DfFzCtVVfANbqiJmijyYYC3BMx5B4TkI7SHvEA==
X-Received: by 2002:a17:90a:d0c5:b0:1c9:ec78:18e5 with SMTP id
 y5-20020a17090ad0c500b001c9ec7818e5mr2651956pjw.53.1648684896871; 
 Wed, 30 Mar 2022 17:01:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v7 00/12] Improve PMU support
Date: Wed, 30 Mar 2022 17:01:14 -0700
Message-Id: <20220331000127.2107823-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 31 Mar 2022 00:01:41 -0000

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

Here is an output of perf stat/report while running hackbench with OpenSBI & Linux
kernel patches applied [3]. The kernel patches are available in upstream as well.

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
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v6
[4] https://github.com/atishp04/qemu/tree/riscv_pmu_v7

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
target/riscv/cpu.h        |  49 ++-
target/riscv/cpu_bits.h   |  59 +++
target/riscv/cpu_helper.c |  25 ++
target/riscv/csr.c        | 879 ++++++++++++++++++++++++++++----------
target/riscv/machine.c    |  25 ++
target/riscv/meson.build  |   3 +-
target/riscv/pmu.c        | 432 +++++++++++++++++++
target/riscv/pmu.h        |  36 ++
10 files changed, 1315 insertions(+), 235 deletions(-)
create mode 100644 target/riscv/pmu.c
create mode 100644 target/riscv/pmu.h

--
2.25.1


