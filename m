Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ1f-0005LG-5i
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1X-0005KK-68; Fri, 02 Apr 2021 16:04:07 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:6345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1U-0003EZ-LR; Fri, 02 Apr 2021 16:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393844; x=1648929844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4pOLarYNC5b4CVIKibxf0S+h2HcJ0ERquVzbRSFSCGM=;
 b=W17X8TT8gh6O6y71Es9M5OiCNsyBeXbb59ntJulSZmldwni9hoO7rxty
 Sr/JZUVyMDpewAhHDd7M4zTTtVeChGbwWO6rhdamp3x1lTxeH/JXf/Obm
 jIe5ZAp1XjbYVvuF7i3xaYjEG1nRw6vKXSbHchk911dRha6wKoYVoYzo6
 9sL1kgonDs7W/j57VBW0x5sZc33s9bDHg3anhcLt/iQHyRtZy1ffNP1Ok
 xR0V98r6XIKky0VZBKW25TjSu4i5l2UCeg1XR9Lg6VfeXSDg/amXpQHpY
 tVLoAxc+RBKrQMgHT1sxjjF+gDSK77JeKv3BGb9mooKA7nTlI5q3BvDde A==;
IronPort-SDR: nLYrsi7c7nM94RGQCfIQF3of170z42aneeEPr7+W1OQZIVlBJ3IY2rXpw05kPbKKcz08xvMTZ6
 +gMgmjpXliqQknjYHo/zHm2cz8atFAzjmLIvi8MeLtk4lI75ObTRB17CuvV/6CEZKkmD/kOzfO
 zr9NuBRD79w0rWBZmGGwYfl1Ezqk4QeDfIZpsNgpvtCt3ISm3ZNzNtlCW1iKoGDkxKDdHoAwzV
 gv6BVRCr8X2f3eIGJYXVBHjQYsK9QD8oAkj26NHkLLCjl1OWU5ukDqCL2WZIsygkdlCrruddgt
 ZGY=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="163694212"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:04:02 +0800
IronPort-SDR: yTRbt051MeXN/eIgQyoNPK8j8I9uucvowxsP1EuzQHKWd7j33FCPf2b2qIUVK6p1wj3T1cyaB6
 TFJrbMh4zUzNtHevhx6LKEQXk1u4PQCLp3hWr0/+E2L6eaFgYX9d5KRqw8zzA31gQEJcmXL2Id
 /lIKo/BEHzHnMP4wordEhuo50sp9izCwfS0z3BMm5HCApDZZKYGRpu4jymTi3GnEi5434m1ibr
 l3o0K/zi66q6FIcclOKUMPC4iB0a1tkHtEc+/8B0VLl5lI79vD5L5pwUkqbC1gXRAIpNJGDd2y
 5pK438kouuo39FtQUgKHSsS1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:45:42 -0700
IronPort-SDR: 1sO+NMff0dwKF9kOAARUJEh9TloJISumSOYZ0JfVdKJmCiAsU0P/PaQo2sC0OtSMw/wNPTTPV4
 t8y+JYrxxF710nGTmQnOLhGQ8Ty/M8DDds9nk7L6bTj/kIn5RN2E9KfTWDHU2LvakWeL4Dphn8
 B/x6GCNwdgMEg9nRi/Ujk77If20idjBS8Bd47pzVoUoiVp7pILjJOM6r+tA7EbIXsmEMrRpVQQ
 qGwGQ6zL9fQbOsdM9sgbExHbM76Kz//iVRIrmDi86cZdVfSrfskUsr5ozsz0W/M+siSNvboyZJ
 kp8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 13:04:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 0/8]  RISC-V: Steps towards running 32-bit guests on
Date: Fri,  2 Apr 2021 16:02:06 -0400
Message-Id: <cover.1617393702.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 20:04:12 -0000

This is another step towards running 32-bit CPU code on the 64-bit
softmmu builds for RISC-V.

I have tested this and am able to run some 32-bit code, but eventually
hit some issue.  This series doesn't allow users to use 32-bit CPUs with
64-bit softmmu builds as it doesn't work yet. This series instead just
gets us a little closer to being able to and removes more hardcoded
macros so hopefully others also stop using them for new code.

Alistair Francis (8):
  target/riscv: Remove the hardcoded RVXLEN macro
  target/riscv: Remove the hardcoded SSTATUS_SD macro
  target/riscv: Remove the hardcoded HGATP_MODE macro
  target/riscv: Remove the hardcoded MSTATUS_SD macro
  target/riscv: Remove the hardcoded SATP_MODE macro
  target/riscv: Remove the unused HSTATUS_WPRI macro
  target/riscv: Remove an unused CASE_OP_32_64 macro
  target/riscv: Include RV32 instructions in RV64 build

 target/riscv/cpu.h            |  6 ----
 target/riscv/cpu_bits.h       | 44 ----------------------------
 target/riscv/insn16-32.decode | 24 ++++++++++++++++
 target/riscv/insn16-64.decode | 31 ++++++++++++++++++++
 target/riscv/cpu.c            |  6 +++-
 target/riscv/cpu_helper.c     | 51 +++++++++++++++++++++++++--------
 target/riscv/csr.c            | 54 +++++++++++++++++++++++++++--------
 target/riscv/monitor.c        | 22 ++++++++++----
 target/riscv/translate.c      | 43 ++++++++++++++++++++++------
 target/riscv/meson.build      |  7 +++--
 10 files changed, 197 insertions(+), 91 deletions(-)

-- 
2.31.0


