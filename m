Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZMs0-0004HM-OS
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jun 2019 17:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMrx-00049w-U1
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 17:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMrx-0001qf-0e
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 17:57:53 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMrt-0001Pu-U3; Fri, 07 Jun 2019 17:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1559944670; x=1591480670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sK0q+MVPB7AJF0oq2+VM2yifTS6lj+o5/8YC/GyV64Q=;
 b=kDFjGMYXLsGJX8d+c/Y9Beb5usIhTIZ7p4HZlOfa/D+7oK6a1Gvhyb9X
 9kwASuvdyGld6QzIivQHhay/rWUT29amXkj/FSsmzVmLfdOHSaEPz2gDh
 EuGxuLW5YLLzkGWum3MHU8V+mYIHBIWr4yNta/FJmo+p71/g54vTChffp
 rqmK20fv1W017YT21NgqA63OhvzT0cdpMv3JUvfji72YkvAW05mtL7wwS
 LfEQYDqjelXDOTavafi8Lugsn3v3k6fBbTmEPQb8vtRTKE3Bgkmg95nqy
 wgKSMlmWUF3+wU701Y88CLwHMKRGlsnfEsirellBO8Odohu5I19c5SN6M w==;
X-IronPort-AV: E=Sophos;i="5.63,564,1557158400"; d="scan'208";a="115014088"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2019 05:57:50 +0800
IronPort-SDR: oQN4IZQwFmZVXYCLAwSSxhVXjeThu+SfiIxDfCVykw6pXYOO1f62Imi+TXfwRfUlv06yWiJJil
 Y7i2oX+nwbiSoTw5/rEXv/Mhz5lljQLUY3bbAUDDFXX+Mr7DmXBq0AfThCLgnpbH0PbpAyT7cx
 kTZ7cLpvLkSCWGtaZJ0Jw/3aLf/mlFVMa6J92FygCAwkQ1xTinrhbY7eFT77Shko9ir4hA2vvd
 ixsdg7VmybU9OwdKkF01jsxc8sd7shsGWLdIv4ZuTEKZ7BLLZbhyJ5GgtfGS8rlEAVSAaYiv1J
 8rvObNpSFQ/GP+RjHcb/MLGc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 07 Jun 2019 14:35:05 -0700
IronPort-SDR: mTWJQoDU/9wDInAE5c+NZiIdxX/xLKuk5YsWO6urzNFelmJp6LKxRF3qO/bGUQBP5LZ7FVAhpI
 ci1N8DF71MXdQvc8rQ2P5eiX9j0QGYUN0EB70kk8X9bvCN5sMCdzledfAmL9Eay57b1TwkVBqB
 PUpEAD24Ux2HtgA9C1TaNi8Bg9c/hIFzLVW3X/fuSyI2H2OGNmcj8uogzyo8QLD1Ci1OnRJil5
 3Zv2BiA1zYeSVkjhNhrG+eKQWLoxwnXzOBB5DFVCY1WGuwtNYlyJf5Zhhf389bLGjzzzLvd36x
 lf0=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2019 14:57:49 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri,  7 Jun 2019 14:55:39 -0700
Message-Id: <5c6152b63afbfed683c21df4a16b6cecb46339e7.1559944445.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559944445.git.alistair.francis@wdc.com>
References: <cover.1559944445.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 07/27] target/riscv: Remove strict perm
 checking for CSR R/W
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
X-List-Received-Date: Fri, 07 Jun 2019 21:57:55 -0000

The privledge check based on the CSR address mask 0x300 doesn't work
when using Hypervisor extensions so remove the check

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f9e2910643..809c4c09a9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -776,9 +776,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
-    int csr_priv = get_field(csrno, 0x300);
     int read_only = get_field(csrno, 0xC00) == 3;
-    if ((write_mask && read_only) || (env->priv < csr_priv)) {
+    if (write_mask && read_only) {
         return -1;
     }
 #endif
-- 
2.21.0


