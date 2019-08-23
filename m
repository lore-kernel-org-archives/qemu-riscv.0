Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1JCR-0001DM-Ae
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 19:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JCM-00015p-FO
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:42:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JCL-0000Ib-1i
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:42:26 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:38470)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JCH-0000G3-3g; Fri, 23 Aug 2019 19:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566603742; x=1598139742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aYADlIrAhjcCUfDyHqGMeqnSX99ip+HPRC6LMPpqQ6k=;
 b=DbB7pHq6eqjWEcGB9deeCHgUVK2tAdkjcb321aT1G/f6ghXxc2vR9WEY
 sP2GmYCCOav8UeAlbRejpOPOJPNnwUPiGeF2p9i/9SOBSYQNZTJyQrz84
 ek61uAsvociYJObL9hJhIc02eurjR96aLnPgvxHC4pmkwMJycErS+1qkU
 2N1nDa9xX+yRPitS8CtUY3ueKme2RtXnmpP5Nti32O64C5bFh2L5bdPub
 8eQpVWIC+pI97rbsl13xeQUnSgqV7zASDWwgWq6lWxeEb4TMOg/LCP2Uj
 HieDodiLOf9boXmDAUnwDw6DuIKbc7LtceMNV4m9B3JKRB3fZ29reIvt4 g==;
IronPort-SDR: miX3t3jt2/YGJvuu7DAp4kWAja1COxdvjG+L/KtCK+yKMnK8+5gDCTwAd8y9Gt19n5S2yqSOzd
 0KLhDNDAKHBHOjeO08QlpekdVUgQENsPXwM9MrWYOfYoI5OWN6u7QqYOm4eEArHqXUX1J2R1po
 phTUhbxIZGhYPuJbmDNnChDDCSWmopmVTV/pyFR+UCr1Md/snLnsp7nqwUAaWj3CMI8F+nVz/2
 sV1iZE6YW52CybIp6xmwgtYM+SaxmGcBySyhqMPx1+gd1sgrr4YPs9UM4kqGj2V/AuhK00Wd0W
 WBc=
X-IronPort-AV: E=Sophos;i="5.64,422,1559491200"; d="scan'208";a="117486903"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2019 07:42:21 +0800
IronPort-SDR: teB/V5ePgE8ElJ1vApUV2YhdrM1IRLyHW0tpO0My5T1Xf4Q8nKucK3uXM+yfDWgPHXG2cbxf25
 sR2HZ0Avs/m2h+RXANi+lj0qR8rauW5UUaREurHEEZljLsbFinbRfltZIWCOgDK3cv6PMcnQZX
 O06mQPHRVeX7iBmZGiWZM3bqRe6E6fldrQIB5UKFsxdNbKcqqBkQ3GVsIbC0RRT889LaqzXFuz
 nnO4zWOCwExoYfJbWw9oKYy+6NDB4Ds6kmITpFnkAbJ9kOC3pHqA4Dvl1+hDOUCRm+Y4EPL9Oh
 aoUm93MsQP4wXMjLmlVO8l1w
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 16:39:37 -0700
IronPort-SDR: svtycSDFOK0kNS1Bf4YJlqoSRk7qRAX6gX5FIKE/yAob1cm8hLMGSTT7IGenmkqJg34Snl6S7K
 3nQNY/J8Ft3UL8QstqDSFLCroHmX/sjQk9sAT0lkk3w1NDAN+80Jgu/WFC5XXslh6nFb0XJi1n
 bGJKqq3q4mjHXisEDaaIKmbHxEUFJFuviuT7ULYWPf8Z8C+MnH0WqZ0/G/IQriGWIaoOwz7HZp
 sUb7Ehc6I7kYSEW/tY9DWLjqChLzawF2SiDPCtbMmNfYdJfrTIzJNrpQuiRsjhMZ6duWtoVgr9
 RPw=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Aug 2019 16:42:19 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com, alistair.francis@wdc.com, alistair23@gmail.com,
 Atish.Patra@wdc.com, Anup.Patel@wdc.com
Date: Fri, 23 Aug 2019 16:38:39 -0700
Message-Id: <4f1ff6ef5fb2baa3c461d16b5669d3bd829733a0.1566603412.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566603412.git.alistair.francis@wdc.com>
References: <cover.1566603412.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 19/28] target/riscv: Disable guest FP
 support based on virtual status
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
X-List-Received-Date: Fri, 23 Aug 2019 23:42:28 -0000

When the Hypervisor extension is in use we only enable floating point
support when both status and vsstatus have enabled floating point
support.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 17eec6217b..098873c83e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -90,6 +90,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
     if (*env->mstatus & MSTATUS_FS) {
+        if (riscv_cpu_virt_enabled(env) && !(env->vsstatus & MSTATUS_FS)) {
+            return false;
+        }
         return true;
     }
 
-- 
2.22.0


