Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJGG-0002Uy-Fj
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJGE-0002QU-GH; Fri, 02 Apr 2021 08:50:50 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:33135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJGB-0005gX-Ci; Fri, 02 Apr 2021 08:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367865; x=1648903865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YCFwsLkhn73qXcaqDziKc5FX9Jy5pjFqa42LuCKRq+U=;
 b=WdKw+3u+69QHZF4lJGCAjNR7myBUrNnW3Ny01h0RbFC4ai5Nta1kQ9ir
 gdjeXA1b0Vkgs8GFL9HeKIcuXYDwkTHKjgU/fudPlLE566gBq5JmFikv4
 SJVxHxmrXiAxtyBfU5aA+B0F0W9beJKVx61Q6750agF7b6FLpGgpqpQfZ
 EO0E0TFPb9xvVJEIfbbjy9LpdulBubtno31WGA7UZGxfb51Rq3E6RjB/s
 xR8/evxkbrmzyTzQ0ES1OvFgnuchi5tFDvbF4t3wUdneVkLOlwMa/xhV0
 P+niVvzlIlNP4Uyd8m+SgK+3pegPw8q00JmIz6btkhXYEMQuZtOnfRDQ2 A==;
IronPort-SDR: WQ872OStzTdG9NgFnBjpN93BXvKhz99bZzfIkk9nTcu0dtF0c7pesNUNowjuAN52MdCrr+cP3m
 qQDzQNyjVkuDyFEdvIMwuLZYs6PHc0+MfLwzwi/NYe+wx8b51CvLipnwXxH9x8iCh+s4Kvpva/
 M0c5cXeCHHwOLW2KPgwXkSNdjarPnmAjuqvqGNlFDtYtCw7WFXjPPWyJhEzmcCscCMhhwNNqzA
 C1GbtVhWP/iNzj5hj0PC7cc228/eOKB3mMFamRZt1e+Lxa6SUKJUDehGpMEp3mZaeTvOTBA8sW
 5vw=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="268041786"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:50:36 +0800
IronPort-SDR: Hbe1T1dvJekxqElyckPLDUO2NLwqDAjZMMne/8LFuCHu8R+GmiLPYBKmvK32Tn8NCOoCoeXWMV
 8ByTalAdA62K8XjpIbFLL27p3gwrTTYscBLPSsyU8SITiihx2Vx6shKlJEN3Vkt6eQCv5AU7dx
 LsSw4eXfFAiAH3zgi5FvPT+v8Q8FzEcyW6+MwYNUQ39RBctiFvZxGGVbq+8btpfJfM/r1HINiL
 mbcujXw/DRqBnuUKUsNVafX7dQU+WdASOJxUn4ntjk7sSbqXXocbAOmKK3LF4kpzAz4RiLJwjB
 nCprriK1CkMMprIJRPxLoY/m
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:31:58 -0700
IronPort-SDR: XmqPnCjvVyetddd5SJeKqCslIbJ5dbbkQqr3vGkcCxQw+OvNkd5Wd6FtNaZujFd8OQ3Kpb48pq
 VtNPzps9rY3guhyvlAsVHJgOGRl08WzksaGdgm6VaRTsO6wW/0c/b2emKZlJhW1a8JIT9ZEP6/
 hMD8fej1kHnBRzhGAli4gpKu2bAhzo9+5VHbbOnLaKwO8ZT8X+RwiZkbN1wETKpMRXT9TLqHyz
 +XPzDXGQ2URIPDn2n97/JjEKUeJhyNgRYypJd1Jb+Q3Sy0zfUs4rkP458JtyTKsOF7ON/tWs/q
 2Xk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 05:50:17 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com,
 camiyoru@gmail.com
Subject: [PATCH v1 7/8] target/riscv/pmp: Remove outdated comment
Date: Fri,  2 Apr 2021 08:48:22 -0400
Message-Id: <59a0c0d7237109dee9dea28023f953d2ae3523b8.1617367533.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617367533.git.alistair.francis@wdc.com>
References: <cover.1617367533.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Apr 2021 12:50:51 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 3794c808e8..07e4c407ab 100644
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


