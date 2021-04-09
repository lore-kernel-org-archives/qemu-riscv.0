Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUqAT-0001d7-Tq
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUqAQ-0001aB-6v; Fri, 09 Apr 2021 08:23:18 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:13152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUqAN-0001GV-Sw; Fri, 09 Apr 2021 08:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970995; x=1649506995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mZ+wqac0dNQBf14VBAdxbL798fGUkArSIFgASuf6VRY=;
 b=QsRXRpg9uvrx1sfaBXp+nC3GGZVFIC/irnx45NSdO/WPZuT3CC/bCKhS
 7+DOdwDyw5DBaBUqPoZ98TJ9g/lCkOfrajLh+HEULwphP9K/BUigYOiSv
 QZH2oTUArLBVrJvLuYxFzNBvfGGiczjkfGe8gnAWJbU1vparNxxrUl0LD
 yhQtqKQFHFZuz/BxSz+yyU2/ubfJkAj0wi8X0J6sWWnc2t2wO8v0Z7fBL
 AV0DwIZxdZAWsgX3hBIXiQ9zs0GAA3Qff1ZIAVTmxqBnL2yyE4r9ngtPJ
 3ZvcE0RlqQnVDzS4Fn3Wp1FKqX56rCXzUHUEsObJuJy6+I0ODrb1wSjzZ A==;
IronPort-SDR: AMRX4yXgy/22qlDx7sQH4lsPVbTE15ofGkRpCV+jD4cADaE8T4YFRTl1mVEPI29kBmNJlF7kSL
 QF/QhNViOrEpHHX/gTW1s5At/CGOylaaAzVsbyiIBTOUTMtHqKou1PYuBNT7E0V1f+snDq9N+E
 MMyMPWJd6YqFGIuuC8TsNfkrgFKR4Cj2qGnDoi0ze2Sc+JdDo+hxqHyAHoumGZkw3gCoNvXZuU
 vW1W5FQngrAv3vFTNTJNn9JNY2zxdOi7uQmbB4AuJz1tmUgezknR8RoF0AWoUw63pt8RBtxItX
 R7M=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="163998942"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:22:59 +0800
IronPort-SDR: /E/2LP7rkzjKXIB+k3ofKT0W4W9JoQG4LujzpFt4LWXD3H8TUNFzJItq2wz0DRiC9h8riFW2AW
 gXbaOTelZYoy6fAdGwuqGhewKJ07BodLisEj1QJsEkqBfaewQVf4/y112UXi3t9nd3EW4FlsOA
 U+CRJgjGxDWkOWAuZds0v78UmOK/6TWbHINbL18lgkudQfY8JGKAvndXQjgf6xbczH9hAAQXEv
 +v+GnTGepgam1qNYVWfpO8W4eBDOqDr1G1ARcWYE9VFxWUNwyeKDU9CaABZ1zczEUtoC2bHSCy
 gsPif5ERD90c5gM3cxvr7J0C
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:04:01 -0700
IronPort-SDR: qdIF7ZdSftHVHgHb+WRFWCfdTly7rKN5G8mTp57GYIZxCWseAn5YowaLMJvnFLkixVL6aFj7xR
 50EigBcntOygt7gAaD63RkRHrXXRA2UdLbZqyWQKmqFK7h4SADromAZP2FShqXNseZPLSbyWxq
 B7ooVMRKWmxqtebmUkZwRhhOFPQAjWR+pnHL0vbYE9SRVZSWcobjJBfhLWYhkV/Iz0wGd6aMaK
 EbtzBvHK/GnBOfA+Yg1vAr6i+eLtFfibYLmtoP4cFAembTT1E6qulsLsY/roXmqGVapUM6ao6f
 BRE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Apr 2021 05:22:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 7/8] target/riscv/pmp: Remove outdated comment
Date: Fri,  9 Apr 2021 08:20:49 -0400
Message-Id: <cf394a15cebea5be5875c6908775af907bceb143.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617970729.git.alistair.francis@wdc.com>
References: <cover.1617970729.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 09 Apr 2021 12:23:18 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/pmp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index cd44d81eba..326d793f55 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -19,10 +19,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * PMP (Physical Memory Protection) is as-of-yet unused and needs testing.
- */
-
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-- 
2.31.0


