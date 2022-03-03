Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPvHZ-0003Ta-0D
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 18:54:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHY-0003TD-DH
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:54:52 -0500
Received: from [2607:f8b0:4864:20::f36] (port=33396
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHT-0003Z8-QL
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 18:54:49 -0500
Received: by mail-qv1-xf36.google.com with SMTP id f4so5060345qvd.0
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 15:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENvwCXC6L8iwQARgkChRNB1e9C3ZSLg2FrUYahEGMpI=;
 b=hwRG5S/M8Q+vXnePY4ba7XQmnNxPtMptt6pmHyEmtbRPANj3MyGHj/rHv3GaNsdHLI
 x4hlV0+pwO+iVkAf0lmlCcsbv5SqFH8jFej/OtELcz7Tb/4694lwyPMc3k9VERtVgNot
 pISLA4vj08Tka02pG+gX/2DSX4GoSVXuDh3mp+cRrp0lSRmzve8y/tz255/YoBWtx+EZ
 0j2E3SH8tHzKWilj4F99D34IKXYdYBIDyXDxbOQ6HQJT+LOfaV51zFctTg46eCSzu2UU
 AYJ3TJnQkGYKHhMBTXaD8I8h+Z9ynNgXxAG7Fc/DBvvYT93WALrKEiNVwkGKGh0+LArZ
 wuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENvwCXC6L8iwQARgkChRNB1e9C3ZSLg2FrUYahEGMpI=;
 b=xFKxGyRkZHELXizsGTrKRIS0gVKHWyx1wf76DAMQs36POboRHIuSZsbDiMWQMBL6LC
 BG1RpyXEumVaGH7NGAs2vnISbFm01tvPb9BgyMjNSzXrwJ1oFDRmJs5421hY14983MnV
 sjG5aEr6ACpID4AjFJgujL811bpGGmns29IiXxmyfAQFLIody1GtJRHM5TTiXCFwxBy3
 63m2RhvpTS8h9DEwKb7QxGUcd/AQtamskd2neymEaB5MFJ17To/7evPZAnjoxOQpcSh7
 dleuzaLGcRj5cj/EbztelHEg67dQBkxmuGilpD1jEGuEmPqIxsBI0ddoUgYj1k61DnVn
 9uoA==
X-Gm-Message-State: AOAM531zVj08YByJXYIETB8L2WUKxSKdYPdmV24mfk+Xo82YgnDizld4
 IL/BRhaT7Q12kRqaVissMFtOtQ==
X-Google-Smtp-Source: ABdhPJwc59ZAR38FG8ocx8M+f/TppFFrB3GZ/m1U16WBjpYJ0MW+KvU5ydF+qKj8Wh+v/UYmSegGlA==
X-Received: by 2002:ad4:5347:0:b0:42c:4711:5eb5 with SMTP id
 v7-20020ad45347000000b0042c47115eb5mr26010529qvs.101.1646351686392; 
 Thu, 03 Mar 2022 15:54:46 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:54:45 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 00/12] Improve PMU support
Date: Thu,  3 Mar 2022 15:54:28 -0800
Message-Id: <20220303235440.638790-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=atishp@rivosinc.com; helo=mail-qv1-xf36.google.com
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
X-List-Received-Date: Thu, 03 Mar 2022 23:54:52 -0000

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
kernel patches applied [3].

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
[4] https://github.com/atishp04/qemu/tree/riscv_pmu_v5

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
target/riscv/cpu.c        |  12 +-
target/riscv/cpu.h        |  49 ++-
target/riscv/cpu_bits.h   |  59 +++
target/riscv/cpu_helper.c |  26 ++
target/riscv/csr.c        | 862 ++++++++++++++++++++++++++++----------
target/riscv/machine.c    |  25 ++
target/riscv/meson.build  |   1 +
target/riscv/pmu.c        | 431 +++++++++++++++++++
target/riscv/pmu.h        |  36 ++
10 files changed, 1299 insertions(+), 230 deletions(-)
create mode 100644 target/riscv/pmu.c
create mode 100644 target/riscv/pmu.h

--
2.30.2


