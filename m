Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4vCQ-0000U9-Ke
	for mharc-qemu-riscv@gnu.org; Thu, 20 Feb 2020 18:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=31236d5d8=alistair.francis@wdc.com>)
 id 1j4vCO-0000Q3-0n
 for qemu-riscv@nongnu.org; Thu, 20 Feb 2020 18:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=31236d5d8=alistair.francis@wdc.com>)
 id 1j4vCN-0000jG-1c
 for qemu-riscv@nongnu.org; Thu, 20 Feb 2020 18:25:39 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25475)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=31236d5d8=alistair.francis@wdc.com>)
 id 1j4vCJ-0000cC-5W; Thu, 20 Feb 2020 18:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1582241135; x=1613777135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CTtvlFVlfUk+6Z7t8xLZa0mdHFDbLmlhar9dnkiWWyo=;
 b=Uv2I5HG3DbUfERGIT79wLZXfJQ0o+UmDmpt/CEpfW2Gm5av2Ds+8Y1OX
 10Hkh/iKza0OPSeKh0X8xlv3ej55b9bzjJ5uYTh8c1aRFt2eYwC5SbD6g
 FaPlhl+yrGRQhvibrIeOTBvYqukdHXskqzzONp8+//n3dtDQfS3Pgm9sx
 /7CGSfyPPZCJuPwZaFZFVU0kOZtuFJm4D1TQ7a1zkmQ2akCYY1I6qT7L4
 j6whJxBwjjg8LfNSL0puCRAZ62IDmVB/maVxuluAsCYSM42nd9w+bvOG2
 Fr4PG5kE6n9Zossje/5PKUcPufAqIwddlKnhbrJuwl8LV8gXPg9CK6f5f w==;
IronPort-SDR: Zduc/7A2KKTOh0Of3hJo7LzNCUx48OpNF1r9nppGYa9uyXgEsMOKLirF+2ZSU13skUzqf4d0Ub
 l5/fCy2gqRftOVNjBmDi/4od6mAmXM/YY2+wCGFLg65BF+onFOj2y54Wm/TvwcbWCXdHU4wPLY
 O55ERoha8+QL5VqeQ8zoxV7D6DhkfHANf0GWXIu3jmDqH+0gagNGtvAXCfkp7nUZnVSky04h6W
 LWSRcgJCgikvxbI2+aAtkPP8mJgmQR8zD9B+OISER7pmv30AXUFBmoTj+8Xs7bBMN+tCx+iZMF
 Mok=
X-IronPort-AV: E=Sophos;i="5.70,466,1574092800"; d="scan'208";a="238445365"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2020 07:25:30 +0800
IronPort-SDR: qibtHccDZiXDtgnSVsGiq+MiKKfznY730rf/e2lI5ESlJ0lrbMWC4I2Xrp8BGxO9rs8V+jk2sN
 tSirnBW+2GBIyqFSCwre/hmHliPiCTKxkUsvSWloPxWfLaukW+yv2JgcxGyEUMlu2upQrLmuEK
 lpwiaK5GnPWVhJlNUGtZz4wX1YwqlFRs8CsWD/YNd3ayaZJpB8cHAwopwqv6ZuhYpdl9j5Oo4A
 2QmRwsI9/mGEq0ypTpa+wrZ4GN8h1PvadHPkloEXV1CmuPi5wo72vCWrlWVcwGxgvuacARcvhH
 COWtfudBZ/FS/g5w/moNv05c
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 15:18:04 -0800
IronPort-SDR: 9B69YXSp/tlTC0jV3JItcdl7/5dg8MWtm2gBtqZAE0dv4v3hKzvbKbUx+tkERKokIGbiYDvTCF
 ku88MZOFf8Hzn4Yrlsbd9m/WMx+Yf8xyuPI0Bt+pwjOQosNu33yHQ6EhHc2gLjEuXuzxHfsswA
 r+DLMhs7q/muVeUC7gUtD5RB38kLd7lJkIv27W6AQqaBrWfwlbWm6QawZAXNkwOQQZe4AYnGBM
 F7xYWKLj3wTbZLRr+V4qpGpmrsdAHTqML/xfsLs9NOCFEhrvyl0uwThMedubESJlu5CGJlZQ8E
 q70=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Feb 2020 15:25:30 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, alistair23@gmail.com,
 laurent@vivier.eu
Subject: [PATCH v1 0/2]  linux-user: generate syscall_nr.sh for RISC-V
Date: Thu, 20 Feb 2020 15:18:28 -0800
Message-Id: <cover.1582240656.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.141.245
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
X-List-Received-Date: Thu, 20 Feb 2020 23:25:41 -0000

This series updates the RISC-V syscall_nr.sh based on the 5.5 kernel.
There are two parts to this. One is just adding the new syscalls, the
other part is updating the RV32 syscalls to match the fact that RV32 is
a 64-bit time_t architectures (y2038) safe.

we need to make some changes to syscall.c to avoid warnings/errors
during compliling with the new syscall.

I did some RV32 user space testing after applying these patches. I ran the
glibc testsuite in userspace and I don't see any regressions.

Alistair Francis (2):
  linux-user: Protect more syscalls
  linux-user/riscv: Update the syscall_nr's to the 5.5 kernel

 linux-user/riscv/syscall_nr.h | 160 +++++++++++++++++++++++++++++++++-
 linux-user/strace.c           |   2 +
 linux-user/syscall.c          |  18 ++++
 3 files changed, 178 insertions(+), 2 deletions(-)

-- 
2.25.0


