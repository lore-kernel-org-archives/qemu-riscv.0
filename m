Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNL4C-0006db-5Y
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 15:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL49-0006bt-AK; Fri, 19 Mar 2021 15:45:49 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL45-0004Mq-Ix; Fri, 19 Mar 2021 15:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616183145; x=1647719145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i+Dsgx/WLVyi17CE4pKMs2RS//EVXRuuul0h7ZRX8nU=;
 b=EJQl6jZXUP8Q5nuyOUfz4IkNsSsBMlHt8bHegWyG6K0YC0+EFKgBrUud
 KDL1QHPggtNcBZWxtXeoyXqKEwej+8DhVPAe7VMsDVIqKAxDNYeGnmDml
 /jGxrM3Q76q5d1KgZNIkVfT2RyLL+wCDa8spHTeExHGKBCcIP8MekkujV
 Tm/hkToJtLFA1mAtG7s84of45OqxRs6h9rgYSxb1Kj1KCSwdiEoJmNChu
 37GpjcAmUp6fnI6YE01AxX5BKC3N0//A5WprPuP86isMWQruaerOwS8M3
 vkvQEOryN8v2FKJ5cpbdnUH4dXqAIEp+Up9XDGEYyUnfZppPHzCacSzcB g==;
IronPort-SDR: qR9gDnOxf6QwGCYC/4GG6XATUtQewrOP/r9hIlvMp3zuqU10urLK09bTJ5mbF9J1Cvog7nd5Hh
 mVRgfQ2nKbomEdMaEbrO8YkRVVWJIpLtK2SaUZ9UbyJfeeHFZva6N0g513YuJTDHu7IC3+7CfI
 YcrtMyF4DzYXBUEjgZk31SeuGabfDRI28lJYrza0wDTSbTyZHEd2aqr1VdFOUFsKND9X2A8MqM
 c/Q55Lhs3JdX7DT9xc7IYHkZvt9DuSQ9mDzZdMiR37F9Xg58dNQUmXOGS5K7MbobsSg+VN0xfx
 dXw=
X-IronPort-AV: E=Sophos;i="5.81,262,1610380800"; d="scan'208";a="273319146"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 03:45:41 +0800
IronPort-SDR: FO8IKWey91XpwLhdYdab+9l7SIZg0B91RdD9N3kY2hCBODqwZMw7xhls5E2GB6LuvyhBR9drFK
 wdvV2s0x+Nvkr71TwPAKbY6dYLYcjc4h/pjeL/vscc2slGMg6nrHlZTxGupnEwPZVdJPseal9C
 ZdKm2a0Yhv+txAHRsXNHZ7cm7so0qQvLhFeqwuziM3h/M28eNb0/7LnmwmCYKbgXGnp4dFTUCl
 OaCXmiwhtnYwrRYsICZALR6Zk08NTRJERoTGWVKwGER3qLTTZ+96b/jwO79v692r0DZ2hsrX+d
 kpL8sL+V0hBQ5H4SnRtmQjYo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 12:27:54 -0700
IronPort-SDR: 6on8ehsngoZjpp8IeO9LxlHt3bt8gDX7s9cgrckaq06KSrRXRRIslR0Tj03ZV/TWjGp9mFk1xE
 WDc165dDIX52nfq670Og8ySkXaXKEEhn9dd3BewB4W5gLN2sGiufkvU2cLu1nPmONaUU4gzf1M
 qCMs66isLO7zAUW97kpUMyNGOm/sjmja41K54T6HHRj9WuUBbIauE7Ig/b1LL9YHh6b124MS65
 XngMcnhYlknNEaCwvfIOpBeHBgEkwkaoGuNlWumI8U0M4SAeepgZGX6hkY4Rl/OOdP+J57DUP1
 IKU=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Mar 2021 12:45:42 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, anup.patel@wdc.com
Subject: [ RFC 0/6] Improve PMU support
Date: Fri, 19 Mar 2021 12:45:28 -0700
Message-Id: <20210319194534.2082397-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=705762e65=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 19 Mar 2021 19:45:49 -0000

The latest version of the SBI specification includes a Performance Monitoring
Unit(PMU) extension[1] which allows the supervisor to start/stop/configure
various PMU events. This series implements basic infrastructure to support
PMU in virt machine. Qemu can support only cycle and instruction counters.
Thus, this series adds only those two events. However, it enables all
the counters and adds all the necessary checks required before accessing
a counter. This will allow us to add any other PMU events in future.

First patch in this series is just a cleanup while PATCH 2-5 adds support
for all the PMU CSR. PATCH 6 adds a DT node as per DT bindings defined in
OpenSBI[2]. PATCH 7 is just a debug patch and is not supposed to be merged.

Here is an output of perf stat while running hackbench with OpenSBI & Linux
kernel patches applied [3].

[root@fedora-riscv riscv]# perf stat -e r8000000000000007 -e r8000000000000006 \
-e r0000000000000002 -e r0000000000000004 -e branch-misses -e cache-misses \
-e cycles -e instructions ./hackbench -pipe 15 process 15

Running with 15*40 (== 600) tasks.
Time: 1.548

 Performance counter stats for './hackbench -pipe 15 process 15':

             7,103      r8000000000000007     (62.56%) --> SBI_PMU_FW_IPI_RECVD
             7,767      r8000000000000006     (12.19%) --> SBI_PMU_FW_IPI_SENT
                 0      r0000000000000002     (24.79%) --> a custom raw event described in DT
     <not counted>      r0000000000000004     (0.00%)  --> non-supported raw event described in DT
                 0      branch-misses         (12.65%) 
                 0      cache-misses          (25.36%)
    27,978,868,702      cycles                (38.12%)
    27,849,527,556      instructions          # 1.00  insn per cycle  (50.46%)

       2.431195184 seconds time elapsed

       1.553153000 seconds user
      13.615924000 seconds sys

The patches can also be found in the github[4].

[1] https://lists.riscv.org/g/tech-unixplatformspec/message/598
[2] https://github.com/atishp04/opensbi/tree/riscv_pmu_v1 
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v1 
[4] https://github.com/atishp04/qemu/tree/riscv_pmu_v1 

Atish Patra (6):
target/riscv: Remove privilege v1.9 specific CSR related code
target/riscv: Implement mcountinhibit CSR
target/riscv: Support mcycle/minstret write operation
target/riscv: Add support for hpmcounters/hpmevents
hw/riscv: virt: Add PMU device tree node to support SBI PMU extension
hw/riscv: virt: DEBUG PATCH to test PMU

hw/riscv/virt.c           |  52 +++-
target/riscv/cpu.c        |   2 +-
target/riscv/cpu.h        |  21 +-
target/riscv/cpu_bits.h   |  27 +-
target/riscv/cpu_helper.c |  12 +-
target/riscv/csr.c        | 601 ++++++++++++++++++++++++++------------
target/riscv/machine.c    |  12 +-
target/riscv/translate.c  |   4 +-
8 files changed, 499 insertions(+), 232 deletions(-)

--
2.25.1


