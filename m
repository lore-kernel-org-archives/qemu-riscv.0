Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLw3a-0002vA-QL
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 19:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3Y-0002sz-Gd
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 19:23:40 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3X-0003oz-3G
 for qemu-riscv@nongnu.org; Thu, 02 Sep 2021 19:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630625017; x=1662161017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TKnDXizvn5HFDuuHbVm5pnXgbXGdVDpL5jU4YTVQ2ZA=;
 b=louYk641Nsj2p6Oq57pIX0LjEWbPpjkuJdoEBUAlDy+YWD10XVsGHuDo
 +iz7oFZrR1EOU9g/YcSGvZCQl+SfJhy8r28irsEULWerVCRcXstcpFzw7
 /t7AeTGDdSMHBqn7uTUD3n5F1G5MnXFc9I0k7ztsX3muFjkf638TLBFKh
 SFB514Z97rR5/RvSrr6I/zYoAKlbj9tcgIztcnbvCsuwv8XqZGuj2qmhS
 hNZvolW0Nt719fURE3CUI/xKPScWUQFu/ZE0Jmj6IB3xe9JFgF0gKENDV
 HhUJu6TthuHpDIes5ZnQwWs67FzsyjsElLT7WX5jebQrTVr7vMvjj8JTp A==;
X-IronPort-AV: E=Sophos;i="5.85,263,1624291200"; d="scan'208";a="183874835"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 07:23:32 +0800
IronPort-SDR: U3KbAoMWXvUtMY/WvCpGj9T87KcjCtPh2gfahXjo/3+8HeObvMbTB48duOkVA3+Elk7GNmnycL
 KoDE8i+/iDYD5FbsEItCmQgc02BERUUtlBpbk5NampSpU3IAiiRkQkIh8lulA+v1Hzzf1vMVKf
 bFz43bCEbtVwjLPIHvHKbEsYXIg6vmQtKmMX2gBK+6aC41agQcM9hP5sPHTOqVc7t/i/kuAzsq
 JyhGQ8ybGJt/eFRtY1xLdjUEpGxpI7lawvGLF7InT2NoQfCc8MMTkV089Jt2Q1JlBTic44JhFH
 gjs/EFt/qKrQWOTuR+dRfhMl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:00:19 -0700
IronPort-SDR: kwoN2HdFwf+5Sg4U44Dv+S6m9KG2d12tLHrqlQ+JnwJWZRMDUja6kCDX4mnKRfjaiInZrMy+CQ
 vfzsIW8qLzgbEHSJQXgwEnF5GjlEZwKi/q8oztkO6ZZQCJeb7BtAiVKXn2Ypo97lnZvXwIOxV2
 sZZsfzgvqOVVcB2/2zlZpl8Bxo6BUraRBr+s27EWi8Mix1LmyhtqCj30yI+4ADj8p7B11RXLC9
 zqpuHz6X3RQoypAsm6LQHhnJF5ozShMq8LRsW1u7YP2lq6rdq/uuCzR7oFNyS+5B37jCokMvXG
 MPI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:23:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0xnK3MLGz1RvlZ
 for <qemu-riscv@nongnu.org>; Thu,  2 Sep 2021 16:23:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1630625013;
 x=1633217014; bh=TKnDXizvn5HFDuuHbVm5pnXgbXGdVDpL5jU4YTVQ2ZA=; b=
 G+naS5W+oF6l+xVUF39GOQBGvfKmMupE6cSYNpkQaIg2C2y9k+CtYeFvOteQi7a+
 jRrd5Jt7Zjio15Y/1BIyAbsuZBS5SF4o01276iMY4Nq/Lsy4TNwVe0CrPT6Zpibu
 uqcgMlZ+M7QIOKjQqdofNrzD4JFPRkjNuohj+Gl8WmZZ4JOnJHjVtSXjYNgmYLZf
 bcdzbp45CMLUBvZMKZ4B6Vkl0YnS2G7HEAImfbzFRuALdJVP6XWUe/TAHNgql/Jg
 eRb/vxiAlY8ceTBjQW2lQnUVyiyvhkgIh7LnCpt6g6nn111X33kJonsEJqi6j9lZ
 SdzIJQ5ppWW2H/NnGEWPyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id xr5T4t8pyqoB for <qemu-riscv@nongnu.org>;
 Thu,  2 Sep 2021 16:23:33 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.17])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0xnD5ybJz1RvlP;
 Thu,  2 Sep 2021 16:23:28 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 0/2]  RISC-V: Populate mtval and stval
Date: Fri,  3 Sep 2021 09:23:22 +1000
Message-Id: <cover.1630624983.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 23:23:40 -0000

From: Alistair Francis <alistair.francis@wdc.com>


Populate mtval and stval when taking an illegal instruction exception if
the features are set for the CPU.



Alistair Francis (2):
  target/riscv: Implement the stval/mtval illegal instruction
  target/riscv: Set mtval and stval support

 target/riscv/cpu.h        |  6 +++++-
 target/riscv/cpu.c        |  6 +++++-
 target/riscv/cpu_helper.c |  9 +++++++++
 target/riscv/translate.c  | 33 +++++++++++++++++++--------------
 4 files changed, 38 insertions(+), 16 deletions(-)

--=20
2.31.1


