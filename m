Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJ1O3-0003Be-8S
	for mharc-qemu-riscv@gnu.org; Tue, 02 Aug 2022 19:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O2-0003BN-E3
 for qemu-riscv@nongnu.org; Tue, 02 Aug 2022 19:33:18 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O0-0007lF-93
 for qemu-riscv@nongnu.org; Tue, 02 Aug 2022 19:33:18 -0400
Received: by mail-pf1-x42d.google.com with SMTP id h28so8609549pfq.11
 for <qemu-riscv@nongnu.org>; Tue, 02 Aug 2022 16:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pfKdcqGeXOhXadJ0c2KQSQmlF1lo1iHEfkyF+29WK3o=;
 b=HXnamVBNfrLPsTAkdJtkpCD8QdvFGCXwNdn0zag67HtVEJkZOSiC5JrzIpPB5pT6Em
 Nm0pKSz9TLdJX9ADsnxRZtECrB8wJ+pvSH82f6az1W76ZH0r2BPJVODVDKImydUOoklh
 IPhUm7s+uOALjHM4jrKqd3WumAB//EXAHHePWbOGx09H9F59mrF+W12svEIQ1BEAASJd
 o+OUSjPxIhb2rCtCO+/72hxkZFm+h+sY2GInQes824jOk+seHt1d5B1IN7Tj27lVOjNR
 BNTHNIOTZ1kMW9/L4yYlWx2oFhL7p+HedziRiSGE0igLL5mz11yRqCIFrmS8DqQiAxKm
 Ue4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pfKdcqGeXOhXadJ0c2KQSQmlF1lo1iHEfkyF+29WK3o=;
 b=2jxHhBkRpURVISpBFzB+OasUpqka/aCzCsXulbjuFqRurW4fPF47o9Uvjhnm4nWxzg
 j6ob8Jf6r3IwvJednmr3CabEG31IqmAP3AZVjPfnBJxwZGUvRyqDsq7s2r9drwEua6ID
 rvuGz13Fb378jPx74UjEZs+p8+8/4bSSnbHY5ZJ3UFLhb6I0mU0pnqEBYcVp8wWMxvAj
 MEcqs+XOGBxuJ4ed8jqQrUoeJsQ5nk30ZlG09aE32zRokZLbq0c3GY49bxULIaIz/YaZ
 ad0+QjQh7A3kLVj324kcon23QQ87XvL9cm2DKMRXwpFosyDCr6/0mQl4ROVOOMZXlZR2
 T2CQ==
X-Gm-Message-State: ACgBeo3OtaWpZriQhzwXU4BVDafJEgxpntin0Exnqyw4k91J3i6+7KHF
 8BVCegZad4kjfngvYJdx++ygtA==
X-Google-Smtp-Source: AA6agR6HSc6HwVGyZEP7NtBeKYvCgTqmqcjx+nPGCMIB5LDBCpbRYF3qumwTRGfvyvLKnZ24unZlcQ==
X-Received: by 2002:aa7:9a05:0:b0:52d:5257:129 with SMTP id
 w5-20020aa79a05000000b0052d52570129mr13441980pfj.4.1659483194486; 
 Tue, 02 Aug 2022 16:33:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170902a50a00b001636d95fe59sm250543plq.172.2022.08.02.16.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 16:33:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v12 0/6] Improve PMU support
Date: Tue,  2 Aug 2022 16:33:01 -0700
Message-Id: <20220802233307.2106839-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Tue, 02 Aug 2022 23:33:18 -0000

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
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v12

Atish Patra (6):
target/riscv: Add sscofpmf extension support
target/riscv: Simplify counter predicate function
target/riscv: Add few cache related PMU events
hw/riscv: virt: Add PMU DT node to the device tree
target/riscv: Update the privilege field for sscofpmf CSRs
target/riscv: Remove additional priv version check for mcountinhibit

hw/riscv/virt.c           |  16 ++
target/riscv/cpu.c        |  12 ++
target/riscv/cpu.h        |  25 +++
target/riscv/cpu_bits.h   |  55 +++++
target/riscv/cpu_helper.c |  25 +++
target/riscv/csr.c        | 312 +++++++++++++++++-----------
target/riscv/machine.c    |   1 +
target/riscv/pmu.c        | 414 +++++++++++++++++++++++++++++++++++++-
target/riscv/pmu.h        |   8 +
9 files changed, 749 insertions(+), 119 deletions(-)

--
2.25.1


