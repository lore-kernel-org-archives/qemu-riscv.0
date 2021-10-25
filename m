Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65C-0002bb-LZ
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf659-0002Ou-UR; Mon, 25 Oct 2021 15:56:31 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf656-0005S8-GL; Mon, 25 Oct 2021 15:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191788; x=1666727788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B1jnmU90YFUZ4lkwBbs3WQbYpNQ8AvKpzI7aLY6zbxg=;
 b=e0aAqjb1pKR+39saTlXWNjncuYVoZUgIe6F7rcwOORWyryRMi+jLIASV
 W+TMwxozzJVvT1J300T6lQkSocmiDH5fg6rWHZqm7d85ylHSYL3HN0oX8
 3uzvjje2vgY/3g0zh2nprwVSvGVPWsv9KNzYA4lz5Gm2oYKOr5mXRV9y1
 wCxUe2/ltxy3s27ZyIgzxZd8la4Akl2UK0EB+wL8D4CrwgFvLBdFs0pCn
 v4oj6F6TL4Y0+ML7bMNOFV4O04Q0DCjB4tgm56hI8bNERn8au01FgQQIl
 hg/UDRHEkJ2/8DTKS4mdkcsJ+3fiNg01uaOMsJRB6DAMedqwwwWE6KbOJ w==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287682999"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:23 +0800
IronPort-SDR: 6kJSP4IjC9ilGyfUQnVOFKX8JUINZLgMhyOFLBQibDrXI0f8LqeZ3YlLpbYC3Ev4MN6nlg3Do3
 84XtE7DJ0PfpCJjEmDkaTOugfJ8uuNFo9NsswTCFzQ9sqUQ+ZcWOUtcAV3uoTb4zsIpY/ntVcf
 pn/g7U071WnHScfx08MJ8vesrNECvLC3gkcXWMdw4eFar7p4Fci1lUSaFjDSAf/6mQlagFHO6D
 uGl8Im2FGY35UA1C/g/xUrycIlraO9dQXNen69jzim6oZLqvCHxUca8yu2KnVoqKJIcCuly4FA
 FCQxGRfQOotaUBVEs65TICIl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:54 -0700
IronPort-SDR: WhBz/9Jd7grjdwsXirPq6M4YMyCWNXOdCGq68INhajPzC6rCnpIxNhTgW9ngBFkObUqezKMZHS
 E6xY9pruIyb7y3ANHJsVjpWxTPuSuImODrx+Tvob6eG7ut7TArdFAUYdUSX25b7V1Yhy41MMZN
 oJUsDeOKFYLwU7ysSAEvSclw7DQRPjqIsONs9kd3Fn/rrvUJ5K/Xwoddd0dCm/aO3yBOaJE9GL
 OtqOBIZgXViTbcXQgfV5SMufoODrVjBDfuHpZLtTtNeK3BXpME9xotX+llw+RImK5CkX1VMEOx
 iWs=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:24 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 00/10] Improve PMU support
Date: Mon, 25 Oct 2021 12:55:51 -0700
Message-Id: <20211025195601.245631-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=925953cd0=atish.patra@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Oct 2021 19:56:32 -0000

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
[root@fedora-riscv riscv]# perf stat -e r8000000000000005 -e r8000000000000007 \
-e r8000000000000006 -e r0000000000020002 -e r0000000000020004 -e branch-misses \
-e cache-misses -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses \
-e cycles -e instructions perf bench sched messaging -g 15 -l 10 \
Running with 15*40 (== 600) tasks.
Time: 6.578

 Performance counter stats for './hackbench -pipe 15 process':

             1,794      r8000000000000005      (52.59%) --> SBI_PMU_FW_SET_TIMER
             2,859      r8000000000000007      (60.74%) --> SBI_PMU_FW_IPI_RECVD
             4,205      r8000000000000006      (68.71%) --> SBI_PMU_FW_IPI_SENT
                 0      r0000000000020002      (81.69%)
     <not counted>      r0000000000020004      (0.00%)
     <not counted>      branch-misses          (0.00%)
     <not counted>      cache-misses           (0.00%)
         7,878,328      dTLB-load-misses       (15.60%)
           680,270      dTLB-store-misses      (28.45%)
         8,287,931      iTLB-load-misses       (39.24%)
    20,008,506,675      cycles                 (48.60%)
    21,484,427,932      instructions   # 1.07  insn per cycle (56.60%)

       1.681344735 seconds time elapsed

       0.614460000 seconds user
       8.313254000 seconds sys


Perf record:
============
[root@fedora-riscv riscv]# perf record -e cycles -e instructions \
-e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -c 10000 \
perf bench sched messaging -g 15 -l 10
# Running 'sched/messaging' benchmark:
# 20 sender and receiver processes per group
# 15 groups == 600 processes run

     Total time: 1.261 [sec]
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.101 MB perf.data (845 samples) ]

[root@fedora-riscv riscv]# perf report
Available samples                                                               
407 cycles                                                                     _
407 instructions                                                               _
18 dTLB-load-misses                                                            _
2 dTLB-store-misses                                                            _
11 iTLB-load-misses                                                            _
..

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
[3] https://github.com/atishp04/opensbi/tree/pmu_sscofpmf_v2 
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v4
[4] https://github.com/atishp04/qemu/tree/riscv_pmu_v3

Atish Patra (10):
target/riscv: Fix PMU CSR predicate function
target/riscv: Implement PMU CSR predicate function for
target/riscv: pmu: Rename the counters extension to pmu
target/riscv: pmu: Make number of counters configurable
target/riscv: Implement mcountinhibit CSR
target/riscv: Add support for hpmcounters/hpmevents
target/riscv: Support mcycle/minstret write operation
target/riscv: Add sscofpmf extension support
target/riscv: Add few cache related PMU events
hw/riscv: virt: Add PMU DT node to the device tree

hw/riscv/virt.c           |  36 ++
target/riscv/cpu.c        |  14 +-
target/riscv/cpu.h        |  51 ++-
target/riscv/cpu_bits.h   |  59 +++
target/riscv/cpu_helper.c |  26 ++
target/riscv/csr.c        | 827 +++++++++++++++++++++++++++++---------
target/riscv/machine.c    |  30 +-
target/riscv/meson.build  |   1 +
target/riscv/pmp.c        |   1 +
target/riscv/pmu.c        | 434 ++++++++++++++++++++
target/riscv/pmu.h        |  37 ++
11 files changed, 1332 insertions(+), 184 deletions(-)
create mode 100644 target/riscv/pmu.c
create mode 100644 target/riscv/pmu.h

--
2.31.1


