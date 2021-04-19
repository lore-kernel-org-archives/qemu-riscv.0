Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNEQ-0003fl-Jz
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNEP-0003dO-CR; Mon, 19 Apr 2021 02:18:01 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:51967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNEN-0005iI-JT; Mon, 19 Apr 2021 02:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618813079; x=1650349079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X32Jz9b6DgriBA4iY1sJRtque35/x8I2uhDBULiF2bQ=;
 b=M/pMZVCbsrvkhVpTzAeRPtcxglIdA4vUvx9q5rcO9GaL+7rYbbn0vJA0
 b+4HWLtdU2fPsYYPt80uKRwsNCgBsQcv+gkFGHamnHkznp6ZpblL4GJj+
 7M9ft0By90yBWLYTCCzSYAo4uIvcp6ERLjUrI/iE2hijkMteAnsp5s8tM
 xqe9zZ0CR9XVNHebvCbjqr3rmndaz0Pixkjiw00KqDy2GqXgDBTZyMhYP
 O5LI/8Igh8bB8T81JnO9u1ljvl7rec9FOWspKQgr2vqeaySUpeuQQJ9QB
 Oj0aLBo2v+tsX0+j5LMY3tmAT5ZhcG/h2HEDSkbkiWTCv25zg/YUE/NSe A==;
IronPort-SDR: wSG6f0FednopVF74DyJ47jleCEBQBfdF3E7qL1/Ne19PZxWfK3IBM/y86d7Ix2renvpE3HIhxD
 7k78U959l3ltVJeNNzVtlNcFqNu9UeeEAWnNNiBPKJCmfv0CpJRDkwwWWl9m+kLY3w/9RsnN0e
 ZucGb86cei6/MFdVcZefhhl69PQN8WZ0UJisDX2AM57D3tMje0bwggJ+77pirUeX59NXjGmo3b
 DXWJFQ0CliR56p3mPSdJz2W1ACNzVq7e5je9N2MsU1ZlDHQ65ctT+bL0KE5XnWOGOuHmNYog8M
 cGI=
X-IronPort-AV: E=Sophos;i="5.82,233,1613404800"; d="scan'208";a="169947849"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2021 14:17:57 +0800
IronPort-SDR: 2Mp45XV2J2WWdOtmQTJAOSP4/nc/sQQSIUE6SVfFzNTYZfQ+ExPa+TA7kPv7rUT4mo0nCFTnQn
 gPlOXszv9U3ZX+MmRpft4/9jOQiJfj0QDDJXD47QzJLPzx7HrpKfTb7hXgRp5v3FgtnZocJsxn
 CrdoQfsZ9LaofwNnFOS2nzCq+xs4f9fRezKsjb+6rfm9FwHRevqCuxXmpaCY4110Inu8MZIN7E
 D30K7K+Cud3j0emCgo2YvDJkLnpLPjxq8ZSXvaNz+fsabDrhlYLGmzyj6+Gsw3KAhE89IjNMHh
 rFitGLJd9a/2/Zkv8Arzxz3U
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:57:05 -0700
IronPort-SDR: 2dLAWcHGmHX2M8cc3PdndiidIkrRCKERREulwCHpTkZLiLALvyFARiUF2nI9S+PU0YobrukURH
 t7BsrUGz3q6WWhYtXHsLtww5F1Og4Qa7cLWYWbddiTqJzV5J+oSNw1ui296WCvPLjS6TOLpCJa
 sD/gBFFbGXi2iM7t3C/wylhQu2hOn0kd3tmZc8CYeDmpsZx5k1a4PkbB6OceoiU91ozud3mMck
 jDg25sWDjGjpQxkmtlZJQtLLdr6Ezxtr8QYUL1sFLYA5Yj9RXdh/nRKUobN7QXKjKj5soBp/TX
 3ew=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.166.23])
 by uls-op-cesaip01.wdc.com with ESMTP; 18 Apr 2021 23:17:47 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 7/8] target/riscv/pmp: Remove outdated comment
Date: Mon, 19 Apr 2021 16:17:35 +1000
Message-Id: <10387eec21d2f17c499a78fdba85280cab4dd27f.1618812899.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618812899.git.alistair.francis@wdc.com>
References: <cover.1618812899.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=736d87ece=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Mon, 19 Apr 2021 06:18:01 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/pmp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e1f5776316..78203291de 100644
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
2.31.1


