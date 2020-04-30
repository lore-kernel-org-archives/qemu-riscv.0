Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jU3YB-0005V1-UC
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 03:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Y3-0005Bq-2H
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Xw-0001ex-TS
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:23:54 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:34278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jU3W6-0006WG-Kj; Thu, 30 Apr 2020 03:21:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08792099|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_regular_dialog|0.1343-0.00143465-0.864266;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16384; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.HQfovas_1588231302; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HQfovas_1588231302) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 30 Apr 2020 15:21:43 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, alistair23@gmail.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 0/8] RISCV risu porting 
Date: Thu, 30 Apr 2020 15:21:31 +0800
Message-Id: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 03:21:44
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Thu, 30 Apr 2020 07:24:01 -0000

When I test RISCV vector extension, many folks advice risu. Here is a
very simple port only support RV64I, RV64F, RV64M.

It's some difficult when I try to support RV32, because it's very
similiar to RV64, so I can't make two .risu files like arm.risu and
aarch64.risu.

Any idea are welcomed.

LIU Zhiwei (8):
  riscv: Add RV64I instructions description
  riscv: Generate payload scripts
  riscv: Define riscv struct reginfo
  riscv: Implement payload load interfaces
  riscv: Add standard test case
  riscv: Add configure script
  riscv: Add RV64M instructions description
  riscv: Add RV64F instructions description

 configure              |   4 +-
 riscv64.risu           | 262 +++++++++++++++++++++
 risu_reginfo_riscv64.c | 134 +++++++++++
 risu_reginfo_riscv64.h |  29 +++
 risu_riscv64.c         |  47 ++++
 risugen_riscv.pm       | 501 +++++++++++++++++++++++++++++++++++++++++
 test_riscv64.s         |  85 +++++++
 7 files changed, 1061 insertions(+), 1 deletion(-)
 create mode 100644 riscv64.risu
 create mode 100644 risu_reginfo_riscv64.c
 create mode 100644 risu_reginfo_riscv64.h
 create mode 100644 risu_riscv64.c
 create mode 100644 risugen_riscv.pm
 create mode 100644 test_riscv64.s

-- 
2.23.0


