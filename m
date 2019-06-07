Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZMt6-00056X-4H
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jun 2019 17:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48159)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMsl-0004xC-HO
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 17:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMsi-0002MR-Ta
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 17:58:42 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:2748)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMsP-00026x-GZ; Fri, 07 Jun 2019 17:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1559944701; x=1591480701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gGFuqft3Gy+jQsmp9J8ov+i4/Ieho2R14R8oFQ3Co8Y=;
 b=ddDjH/KTwiZJfWqtotw33DW7xbb9i5ZEXXzzVagI0tdeqMOpyO83vUpX
 oe+A38xvWN4LZulZ/dU9tVaIjdk9E7BzG3pefZVJuhXxbPDFejbVFBu1z
 adN/414AoEEyo0tr55gr5jlmUaQwuBsp8lr9Ql1dFOOVFf5s3eFyYdE5q
 3/oVLs3i5eRKJbh9eKhtrpCSDDM9EG4C0fpLFA0S2GKLu76l/Pim3BMHh
 fGszX/VZr97r8h3XkxlYCZDiRGPD9RIUKHx9eD5bepC/VU/xWlbZ7WzYC
 XNQP07cZ0PHHXFTizBYiV4ugN6uWjMfttx7bUjZqRFthLUK6itU99Se8K g==;
X-IronPort-AV: E=Sophos;i="5.63,564,1557158400"; d="scan'208";a="111342563"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2019 05:58:14 +0800
IronPort-SDR: 9MeOQndkkDRPWhpT/SKaS95N91QMbRn2T6dibyjN2jmuG4QY6rgI6UwHYIpMXXpzQIeIeAkzcG
 BVO7A1CY5ANUVVEvhCdSUaocElz8BevcSKPiMx1X7MIQNx/cBmJdgWJRjQvrJHscuuTcEd+H7m
 BWhjohZwAOIBQv8XB0IVBtDSf4X+plDNvMeTGACGE8k8Dp8jDt4GHbcMSvb7ZFRi2ghIvuViyb
 MtrFs75acXvHgLjjbAyblcMMZs5hvVeWYzdhs1Xy39alRqHldHWf79+IHCgNiQ+rHuTUcLpzCc
 2yxdT22Sw7JcNDXvxqMi/jfh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Jun 2019 14:33:06 -0700
IronPort-SDR: TC2oH1R41BcXu/z6Xv0gyN5CebPw5jbzEnMAT3zAujhtga0FEL40VFawciUiDpxZql3+CYjs/G
 CWrU1K0vfmGV792ShbdCacb5Mmjfrr4akNHl3VLyd+Q8QpVsnyrDO0yzgal9D7RahsqX/R6v+6
 +8o3OSk4GYeOiyYqy83vi00b9RUGIy2TlWQtJQpvB30QYqWb01xhfFp5T+gWLjD0WTTbNv8NyG
 zMJjU+TPKWdPVf4w0sKaRqN6ZkgOCj/UNA/83MmppSFrmcYp8Om45ADzxA0bdtCRSVqvBGD//M
 /p4=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Jun 2019 14:58:13 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri,  7 Jun 2019 14:56:04 -0700
Message-Id: <d24b49911b8bc15f734111a8a5ce108b92dd14fe.1559944445.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559944445.git.alistair.francis@wdc.com>
References: <cover.1559944445.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 14/27] target/riscv: Generate illegal
 instruction on WFI when V=1
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
X-List-Received-Date: Fri, 07 Jun 2019 21:58:46 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 644d0fb35f..e08bb8dd5a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -130,9 +130,10 @@ void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = CPU(riscv_env_get_cpu(env));
 
-    if (env->priv == PRV_S &&
+    if ((env->priv == PRV_S &&
         env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(env->mstatus, MSTATUS_TW)) {
+        get_field(env->mstatus, MSTATUS_TW)) ||
+        riscv_cpu_virt_enabled(env)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
         cs->halted = 1;
-- 
2.21.0


