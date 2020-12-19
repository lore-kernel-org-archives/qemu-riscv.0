Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kqghP-0006x6-E6
	for mharc-qemu-riscv@gnu.org; Sat, 19 Dec 2020 13:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=615c5f467=alistair.francis@wdc.com>)
 id 1kqghN-0006wg-D3; Sat, 19 Dec 2020 13:11:21 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:33735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=615c5f467=alistair.francis@wdc.com>)
 id 1kqghJ-0007mC-Rp; Sat, 19 Dec 2020 13:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608402581; x=1639938581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jlabsrObSKLOQZjqeZVqWT3Q4FEuPxFNktmB4r6GAfo=;
 b=B8pvzpLUNINwAYVxJHpGw4IStdYA1MlT5wqF8MVvBKol/DJo7VRRmeAN
 aMXLw3FD+Dv7Z4XJhMWU+KWAvXmh1qsVpHmNOCiy14z/bL5aA54HuPwBj
 IGXRyEsPMnA+P71ylFk09sHJKhrP8lC1p9lh3S4zbV4fQ6H4Fy8XMyuDu
 1wiEQIpYEWfpLTvGTIltHh8atRdp9TbU2p3WrZvIHTaiX7BBYMVXCny1F
 UjwUq04ed+kmq4EV3OfQo6to01VX+5WXY+D0jc1JOP6DFwP9DTQ0pSAIz
 pA460sC9diEgVcIgh60Fb6mNMQMGzBj7eh+okJ7Pczo53h1DtL8rUfbet g==;
IronPort-SDR: FFKE3UoRwercJE8JUNheOWhsREp8+PSI9NGIJ7vTErQAMrDa/4qO0RKNNyNGQVyNdQVWFlb0rN
 lf10YjUkT1+9wwPcP8yg59IDFJdtXtR4p4H7sN3uz6Hawl2gLDa5odQUXUBXnBsjWKo1KasSMS
 oFu6MQmlC02Rc+0YD74+YjAqHKuO8D+il2ZeIB3fWnaL+S/COVKRoSqtTgJtkDoEWSMB7oRh/z
 uJC/m9iBLROfT5CNDgujjIhIGL1VDvT422uHedfWuyPmgP0iN7YL7RPGQqjOy9b/OzI2UZb6oJ
 G2E=
X-IronPort-AV: E=Sophos;i="5.78,433,1599494400"; d="scan'208";a="259365998"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2020 02:29:36 +0800
IronPort-SDR: 5xiXQiTjonYSdd01hX7mC3UmL28zvSHmY3r5wtRG/ZyQqLFbFW1YcbQ7gRndklxtrZeeViL80z
 Z+8LfxNihfBDDAAPsKYk5qZuMRE/riBBxtmREnl7eTXFb1blK5/SK1nNEafA9NxDSXmTTUbHBI
 elhN078ey5qzfvZZjNAzIFvFKGnJCT4l6xgR5IwJBdEJtGfnz+Mw9F9zgM29aUSZUp3135BeX8
 pNs5Go1bnUa+dywiY4X/hoLbIJaoxMF/EYRBuTtZdN2TiVzSuB0KnRRyiBWSTfqRlLJ7M+9yVa
 VI5ecq1UGpjxK/kT8KnovxYx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2020 09:54:45 -0800
IronPort-SDR: 04+CJ7MZW/vnu1pQRBqfJJnQZOOlOjhczDguItXOKLa4TAyQh5ECszUXPiL321i1bU/DrBZQ5/
 2RQs77JuEUDfG+KPhhieZLbvZgdW6KUHvYcVhQQAAhzIHw1QKu8mhJazdc3Y2BM/uZ1avaUFBq
 JOnb20i3ftQTxLWYFpvoNrXYV01O3rw+uK26FrpBZ3BC/gqLYLAyhHwqS/nKYb2lSjjo2JP9kR
 s++MdXJs3JLc1mXwBqTMfmeKeo+R4UPYIylZQ+oy5TFpU2ZiX5Vy4KHaXPvuVsvKA7z7iAFcAB
 GEw=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.76])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Dec 2020 10:11:15 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] linux-user/signal: Decode waitid si_code
Date: Sat, 19 Dec 2020 10:11:13 -0800
Message-Id: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=615c5f467=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Sat, 19 Dec 2020 18:11:22 -0000

When mapping the host waitid status to the target status we previously
just used decoding information in the status value. This doesn't follow
what the waitid documentation describes, which instead suggests using
the si_code value for the decoding. This results in the incorrect values
seen when calling waitid. This is especially apparent on RV32 where all
wait calls use waitid (see the bug case).

This patch uses the si_code value to map the waitid status.

Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-user/signal.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 73de934c65..b6c9326521 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -305,6 +305,7 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
     int sig = host_to_target_signal(info->si_signo);
     int si_code = info->si_code;
     int si_type;
+    int status = info->si_status;
     tinfo->si_signo = sig;
     tinfo->si_errno = 0;
     tinfo->si_code = info->si_code;
@@ -349,8 +350,29 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
         case TARGET_SIGCHLD:
             tinfo->_sifields._sigchld._pid = info->si_pid;
             tinfo->_sifields._sigchld._uid = info->si_uid;
-            tinfo->_sifields._sigchld._status
-                = host_to_target_waitstatus(info->si_status);
+
+            /*
+             * Map host to target signal numbers for the waitid family of
+             * syscalls. This is similar to the functionality in
+             * host_to_target_waitstatus() except we use the si_code to
+             * determine the operation.
+             */
+            switch (info->si_code) {
+            case CLD_KILLED:
+            case CLD_DUMPED:
+                tinfo->_sifields._sigchld._status =
+                    host_to_target_signal(WTERMSIG(status)) |
+                                          (status & ~0x7f);
+                break;
+            case CLD_STOPPED:
+                tinfo->_sifields._sigchld._status =
+                (host_to_target_signal(WSTOPSIG(status)) << 8) |
+                    (status & 0xff);
+                break;
+            default:
+                tinfo->_sifields._sigchld._status = status;
+            }
+
             tinfo->_sifields._sigchld._utime = info->si_utime;
             tinfo->_sifields._sigchld._stime = info->si_stime;
             si_type = QEMU_SI_CHLD;
-- 
2.29.2


