Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGarC-0002lF-Dg
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 02:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarB-0002jv-IB
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 02:49:21 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGar9-0003Cj-8E
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 02:49:21 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so1240270pjf.2
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MpimQ6+09mUVE4WvHhBVGuIpQQ7ydg8M7uYBdweOsYc=;
 b=pijkmxZy8s8zrRZbkSPyFG7CCSyEX18mlsWIRjdMM1wjeSHFuZHWppaTBkTl04Fqcn
 lz/+90qfMOoW9yUIDAQ4q6lWzPH0QX5mkiZKJlgGo/Z3xdUuc+P0LQYRaAcuzdgB+dE6
 zo7Qor8v3yiuNkks5/MFh3Uxty+mlXi5CLqag1puFmsn/CaCgYwJ/kkyMObwwttnibuG
 Dr0wVQRMAhBV5W2qZblZtRERzHfpjWlcRwA0shyVT82s9DXk4GrJdOOJC311IkX+MQj5
 xyx92i/Q+BQups05xsu8nLVuKk34pUenf/SEUZ+fWLdF1U6hCvuN8btiySWEFVuMQlFP
 k0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MpimQ6+09mUVE4WvHhBVGuIpQQ7ydg8M7uYBdweOsYc=;
 b=vWEDYM/opIexHafpXQNEGJKkusZitzhbxHC7GGNLft835JPjtj2sSbunHVZJTfoBex
 AoVK+Wa51OWNZ0iHAaObod077hpvX6mRGmuyyek6VzLGUOTcqz6JIXPZ/kck1x1VAAAs
 h5n2F+0BQ+gidpQn1mflf675W/mkerPrM6zkK6UCBrbDhecLmjJ95yat+9N06UwUs4JU
 GflBfqSBz97SMXA5NyKFJgC3rVYXRVxT7OUYOVtuco1fEFmhp2OizMGYoUjRJ+EgBjWT
 VWYSnYOykTBVZEw5+8vMP6FuSAjwacbFEmBEAXiONEj6esEPq+EGBSlyuflFKxRv+YeV
 Bgvg==
X-Gm-Message-State: AJIora/UzRonr/14NAUWIZHArAeOTDiKR1Rz1FGG1zCicakwfdoHM1jP
 YJzFw9ocOcmTdziNZExQ5fX8lA==
X-Google-Smtp-Source: AGRyM1vYkSBow1RzYOU4ZmafMZpVQv+5T7/WEvo0d8ZG08Rbw/qjkAxos+I6VoAMCGTbFofw+P6xkQ==
X-Received: by 2002:a17:902:ced1:b0:16d:6b7c:2f2f with SMTP id
 d17-20020a170902ced100b0016d6b7c2f2fmr14123782plg.107.1658904557425; 
 Tue, 26 Jul 2022 23:49:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a170902ab9000b0016d2d2c7df1sm12764851plr.188.2022.07.26.23.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:49:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v11 0/6] Improve PMU support
Date: Tue, 26 Jul 2022 23:49:07 -0700
Message-Id: <20220727064913.1041427-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Wed, 27 Jul 2022 06:49:22 -0000

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
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v11

Atish Patra (6):
target/riscv: Add sscofpmf extension support
target/riscv: Simplify counter predicate function
target/riscv: Add few cache related PMU events
hw/riscv: virt: Add PMU DT node to the device tree
target/riscv: Update the privilege field for sscofpmf CSRs
target/riscv: Remove additional priv version check for mcountinhibit

hw/riscv/virt.c           |  28 +++
target/riscv/cpu.c        |  12 ++
target/riscv/cpu.h        |  25 +++
target/riscv/cpu_bits.h   |  55 +++++
target/riscv/cpu_helper.c |  25 +++
target/riscv/csr.c        | 314 ++++++++++++++++++-----------
target/riscv/machine.c    |   1 +
target/riscv/pmu.c        | 414 +++++++++++++++++++++++++++++++++++++-
target/riscv/pmu.h        |   8 +
9 files changed, 763 insertions(+), 119 deletions(-)

--
2.25.1


