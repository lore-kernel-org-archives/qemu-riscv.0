Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOQdi-0007VJ-On
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 16:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdS-0007MJ-On; Thu, 09 Sep 2021 16:27:02 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdM-0000PU-Oe; Thu, 09 Sep 2021 16:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631219216; x=1662755216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FYwKZ6uMIvZ226+L7NIXh8vGibinwAtUHWtvNFYY9Ig=;
 b=mB/xbvijz5l9xzbWu17QJOTzpGHC22Usq3wihVdnAI/GmTcm5pSmAOzf
 gwONBTj0Kdfl1q+uxO5NxtgYBAij6MgUv5S9DnrvRtt8dZXASlamPyfzh
 jQxO8vjvZ8ia4YmlYrK6007qmGQbBcDyKRxWp02Ya8/csbj0CiOuPLdCs
 85YrozANZK2RnWgE4LIIc3y+65ozeLq02YmfNkj3XHSJClcZqT2INO4FU
 hIH0urkwUp6bTEZMLWThoYB8updKlw4OdEpbZYbJq//OUVW+M4xs68HkG
 uSlYp/UVwzkyf7VGOKp7q/jnNzgw9MXILtQs0G+DgptBj6EELMMF4Ewdl Q==;
X-IronPort-AV: E=Sophos;i="5.85,281,1624291200"; d="scan'208";a="178710288"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 04:26:51 +0800
IronPort-SDR: JQZzl5wNaS8F5gskSTSgTsZnn7r4lX2yzRnxu/TvV8iAVVXubr3yE/CbJt5Fw8ajCg7L+5NctW
 3a4kKQn/8luktkNIRUfWvCak1jwCViJGVneRmkjGUUefVBghVe3Q8g788TxAJ5wGG/JjL34xJm
 N3WOCYlu1pbN2xXi419jHPJ1pUFDi3RYHJQZeQJ2hRV9hoRcZJy1wQnXH43whL2RoS7+gzqNYO
 Hz+JSuII5Ev0NxwKg2mKZOMLMTHSyzMXEdGXyEpD2hArTnZaw9PhwWjdJZzzmoAr3jO4pmbNiV
 gJDKWyN3q69qBYv6GDV4OBc7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:03:25 -0700
IronPort-SDR: VctsQcThZuZET4/ob2O/ze7I2JYoM+C2zrGoEdT7Vff/ZFTH+1eTandi/AJCoUvA/heW972AEK
 n6cPRj37f9N1GKl1M7MmdHtF3Sj+SHjs02ZQiRWzBUVK+RhVUms//WbExHu+kWjySFqfWqCloH
 XSQrRBHJMTlSaUaHWg2x+Q4DY7nhjaWlRk+h5vzu+eH/ZldwmocrVORn5GxHBL25m2m+f9/avE
 OKKME5xMELWPxbMXQQ76PjtcpAUJYW5kge8ryaQvI1vAkW3AmRra7oqMrH1VzF8co7bTxRzkLd
 vmU=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Sep 2021 13:26:51 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ RFC v2 0/9] Improve PMU support
Date: Thu,  9 Sep 2021 13:26:30 -0700
Message-Id: <20210909202639.1230170-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=87996f883=atish.patra@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Thu, 09 Sep 2021 20:27:07 -0000

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

[root@fedora-riscv riscv]# perf stat -e r8000000000000005 -e r8000000000000007
-e r8000000000000006 -e r0000000000020002 -e r0000000000020004 -e branch-misses
-e cache-misses -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses
-e cycles -e instructions ./hackbench -pipe 15 process
Running with 15*40 (== 600) tasks.
Time: 6.578

 Performance counter stats for './hackbench -pipe 15 process':

             6,491      r8000000000000005      (52.59%) --> SBI_PMU_FW_SET_TIMER
            20,433      r8000000000000007      (60.74%) --> SBI_PMU_FW_IPI_RECVD
            21,271      r8000000000000006      (68.71%) --> SBI_PMU_FW_IPI_SENT
                 0      r0000000000020002      (76.55%)
     <not counted>      r0000000000020004      (0.00%)
     <not counted>      branch-misses          (0.00%)
     <not counted>      cache-misses           (0.00%)
        57,537,853      dTLB-load-misses       (9.49%)
         2,821,147      dTLB-store-misses      (18.64%)
        52,928,130      iTLB-load-misses       (27.53%)
    89,521,791,110      cycles                 (36.08%)
    90,678,132,464      instructions #    1.01  insn per cycle (44.44%)

       6.975908032 seconds time elapsed

       3.130950000 seconds user
      24.353310000 seconds sys

The patches can also be found in the github[4].

Perf record:
============

[root@fedora-riscv riscv]# perf record -e cycles -e instructions -e \
dTLB-load-misses -e dTLB-store-misses -c 1000 ./hackbench -pipe 15 process 15
Running with 15*40 (== 600) tasks.
Time: 1.238
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.106 MB perf.data (1020 samples) ]

[root@fedora-riscv riscv]# perf report  
Available samples                                                               
372 cycles                                                                     ◆
372 instructions                                                               ▒
262 dTLB-load-misses                                                           ▒
14 dTLB-store-misses        

Changes from v1->v2:
1. Dropped the ACks from v1 as signficant changes happened after v1.
2. sscofpmf support.
3. A generic counter management framework.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit
[3] https://github.com/atishp04/opensbi/tree/pmu_sscofpmf 
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v3
[4] https://github.com/atishp04/qemu/tree/riscv_pmu_v2

Atish Patra (9):
target/riscv: Fix PMU CSR predicate function
target/riscv: pmu: Rename the counters extension to pmu
target/riscv: pmu: Make number of counters configurable
target/riscv: Implement mcountinhibit CSR
target/riscv: Add support for hpmcounters/hpmevents
target/riscv: Support mcycle/minstret write operation
target/riscv: Add sscofpmf extension support
target/riscv: Add few cache related PMU events
hw/riscv: virt: Add PMU DT node to the device tree

hw/riscv/virt.c           |  25 +-
target/riscv/cpu.c        |  14 +-
target/riscv/cpu.h        |  51 ++-
target/riscv/cpu_bits.h   |  59 +++
target/riscv/cpu_helper.c |  26 ++
target/riscv/csr.c        | 827 +++++++++++++++++++++++++++++---------
target/riscv/machine.c    |  30 +-
target/riscv/meson.build  |   1 +
target/riscv/pmu.c        | 426 ++++++++++++++++++++
target/riscv/pmu.h        |  37 ++
10 files changed, 1310 insertions(+), 186 deletions(-)
create mode 100644 target/riscv/pmu.c
create mode 100644 target/riscv/pmu.h

--
2.31.1


