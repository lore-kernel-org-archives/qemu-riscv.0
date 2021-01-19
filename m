Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1vgc-0002or-Cp
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 13:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=646a5f148=alistair.francis@wdc.com>)
 id 1l1vga-0002iN-01; Tue, 19 Jan 2021 13:25:00 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:8318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=646a5f148=alistair.francis@wdc.com>)
 id 1l1vgW-0008M6-OT; Tue, 19 Jan 2021 13:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611080696; x=1642616696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jyyeFgotAtHBsttKtybkfyF9CLt9zaVHlJoGJAIS1C0=;
 b=l9Ux65av6v2VAw3hxhkEEdnwdM58F2BDelnHlegY1UDfShz0IN4/tTMF
 Ged5CfJfdGztgtHjfKFQEbtJpEf5PuKYhx7s6qzZzTI3Z66jUhfT9fLCd
 tctR+8G5BVzw13JUEZq/wd+MNuarE6Rz1EtTyZFUjlP4849ibkozJvMji
 yt97UzWI79SJ7e43jeGb9R/Mt6AI37T/br5UByl7OC15qpc3vYWFGJW2O
 ug/UNNcN+gBsUSnUBhfb96/B4jIcYvK5ouFfgoA2OjieTAwXFGOt4Se69
 nGZYn+brwvciqqFJg99pZWJZxS5HIXHqX0lAjPBli90RKM7VJ0kND32s9 A==;
IronPort-SDR: 5Be6bZ9Q52HZ2ukV6puQZ1ng7Cr3d9aEcccpRrngn/y0wRHfkFcRtctnEWyAD3mEotP6OF0tea
 DdE/1Pm1fr56h/XWNXTIN6LzJ4HnIzVV3fDLWyndLnwpUdUfszHXarjJW5A3+6XAtXEcpqNpg/
 iIrRdmJ8R9Xor+7KD/A9czKGvSmZcoWjWuYgn5trdDGu81epPCzUgmXLdvlyyiWor5zSJ54Ubd
 E939ojZhMg3/9oWxWLKyRe/v9tg1PW5E7EQGukGOlrUGqFpAd+Fr3R3zkIOWX3RtFyCRIAIdcQ
 ypY=
X-IronPort-AV: E=Sophos;i="5.79,359,1602518400"; d="scan'208";a="157820559"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2021 02:24:52 +0800
IronPort-SDR: 9wIGnva2gLqmPcXydRK8BME+tVKgCcDO1+qumfo55tjdDGTHkPgbboKGqEBM1A9OunSq18IM/I
 AEdaLwF+VIA84jfa3tjQcRluAPYu36b2KWHfBmyKTucS5KBszCO3fuWCVvH0WTaz4KZCfG4FOG
 vB4tnkg6ZRCh1PlVEbk9TZ7V++I5i51H6bc9OHd+LsuB8Jr0jgufbpmo20T4ALWyb/b549JMbv
 NoS6iP0lbNcLBZFjMpB/v6sd1QsNlLCnjZQ5Q+mDrA+F2Xeh1P7NRz9rzs+PcVnxgPev0kvmsq
 KPr9TVmNfiDsFQjkNr2W6oqC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 10:09:29 -0800
IronPort-SDR: Rv3rNxIFwjRhI51kN5ZK0KRGA8U4FTK0MQKcStcS3ZbZ5/uyiAaPKW+BbrALgWGEY9vv3DOeLA
 qoDNL2EzPiJ915F4ccgTn68I8Jydxm7V+bQcisdBgNyg8Aw6k8t05ahlplPJ40nid5VxAL/d66
 Cghxe5K7NXskf+j3pa1UMDqncOXBBrx2ixK5OieUA+oOcF8+8VF6EBxdhgpIXUT1DkA/7kvBqM
 /5hlU4dQueeH7VezbQOPCM280cv63sVMSVOW9Yzww6iEwYhwRsvThMbbVlX6+8lwpFpTZ5j6tj
 hdg=
WDCIronportException: Internal
Received: from usa002350.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.244])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Jan 2021 10:24:53 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	dilfridge@gentoo.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/1] linux-user/signal: Decode waitid si_code
Date: Tue, 19 Jan 2021 10:24:52 -0800
Message-Id: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=646a5f148=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Tue, 19 Jan 2021 18:25:00 -0000

When mapping the host waitid status to the target status we previously
just used decoding information in the status value. This doesn't follow
what the waitid documentation describes, which instead suggests using
the si_code value for the decoding. This results in the incorrect values
seen when calling waitid. This is especially apparent on RV32 where all
wait calls use waitid (see the bug case).

This patch just passes the waitid status directly back to the guest.

Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Set tinfo->_sifields._sigchld._status directly from status

 linux-user/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 73de934c65..7eecec46c4 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -349,8 +349,7 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
         case TARGET_SIGCHLD:
             tinfo->_sifields._sigchld._pid = info->si_pid;
             tinfo->_sifields._sigchld._uid = info->si_uid;
-            tinfo->_sifields._sigchld._status
-                = host_to_target_waitstatus(info->si_status);
+            tinfo->_sifields._sigchld._status = info->si_status;
             tinfo->_sifields._sigchld._utime = info->si_utime;
             tinfo->_sifields._sigchld._stime = info->si_stime;
             si_type = QEMU_SI_CHLD;
-- 
2.29.2


