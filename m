Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nLDZw-00087u-07
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 19:26:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZu-00086i-Ce
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:22 -0500
Received: from [2607:f8b0:4864:20::c35] (port=34350
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZ9-0006xG-HB
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:21 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso5577960ooi.1
 for <qemu-riscv@nongnu.org>; Fri, 18 Feb 2022 16:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sf2Xjq+9/3VFOKUPTGVHznGa2i+YL7o3C0U80IcBPwI=;
 b=5Ws1sTQEB5gNyIhqmUbp28b5DVgzEmkh1aLfEWBc/6EEBfJM1Q0QbffoRBwmIJRNz8
 emhw7gg+2WJXRXeF/A0b2JII44qNdmXzaiC2lmK0Wsu5gB4EF6pmFi8KwxeXUlzlOXrn
 sNPuBLjx1Il5Rb6n7GmPWgr4995hWKqaBUb9XT6AjfYHqEC+u2mmJtYxFXSK/ruoO/hx
 fr5vcAEYC/wJpoN0ffKoUSI7EwlUn7qxawcnfpDNlEsV+e5jcHLlnKfEuAjm3dHCKavg
 xLJLy18e1P/ktZE0F6/aoD4zIFX1+Jfz+mQvLdGH88L+eWhiTQVN5XeIw283v0uEs9Dj
 99+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sf2Xjq+9/3VFOKUPTGVHznGa2i+YL7o3C0U80IcBPwI=;
 b=vwaXe2I2i3dAwroBuUadQZ3e/ucF/fR/qfHSmOPwNgNO+0lcGxVkkwOqyNKfj0FCFj
 9EVEWAPMfYaJ2DyBwlKhcnRkt1KwDzFxjRuQ2m4MxtduX+72l42Cr7c36cKoOJLDs41f
 6BjJm0NOyRlHjK5mdKrG4pRe1fwT+jydBzour/trQEK7BhXDAHAsh1Sq+17z455uDKyf
 4VE3z6ypqm9XUshTkR/ls58fGLUYBfyHGD22pV9cmww1J+BhmP8YKK0caoUyz2FRfB79
 q4OsQ4xwvvlOs9tzoKv6rxfATpdSTK37QL1R4ip3BZCNTKtqoJUCj/7PWtZJEmMMBd3M
 IZgA==
X-Gm-Message-State: AOAM532K7Be+goiGZEtRJw6SSNc/tumhBePJByhz/r61wGDUKmrqKzBW
 M2rUK3g0oY99Lb2lom6YKuQJtA==
X-Google-Smtp-Source: ABdhPJyiw0oZpTGpCdQGcpHtNksPCj6Q8xg26qQ4kkVmYYqkbWZpTyZ7fWmPF1Z+Ng3i2wC+mtB5Mw==
X-Received: by 2002:a05:6870:6712:b0:d2:84c3:294f with SMTP id
 gb18-20020a056870671200b000d284c3294fmr3614845oab.145.1645230333568; 
 Fri, 18 Feb 2022 16:25:33 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:33 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 00/12] Improve PMU support
Date: Fri, 18 Feb 2022 16:25:06 -0800
Message-Id: <20220219002518.1936806-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc35.google.com
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
X-List-Received-Date: Sat, 19 Feb 2022 00:26:22 -0000

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
target/riscv/cpu.c        |  15 +-
target/riscv/cpu.h        |  49 ++-
target/riscv/cpu_bits.h   |  59 +++
target/riscv/cpu_helper.c |  26 ++
target/riscv/csr.c        | 862 ++++++++++++++++++++++++++++----------
target/riscv/machine.c    |  25 ++
target/riscv/meson.build  |   1 +
target/riscv/pmu.c        | 431 +++++++++++++++++++
target/riscv/pmu.h        |  37 ++
10 files changed, 1303 insertions(+), 230 deletions(-)
create mode 100644 target/riscv/pmu.c
create mode 100644 target/riscv/pmu.h

--
2.30.2


