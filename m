Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jU3YC-0005Va-44
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 03:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Y3-0005Br-EH
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Xw-0001f3-Vl
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:23:55 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jU3W6-0006Wb-OX; Thu, 30 Apr 2020 03:21:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1275953|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0499706-0.00109699-0.948932; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03299; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.HQfovas_1588231302; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HQfovas_1588231302) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 30 Apr 2020 15:21:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, alistair23@gmail.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 6/8] riscv: Add configure script
Date: Thu, 30 Apr 2020 15:21:37 +0800
Message-Id: <20200430072139.4602-7-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 30 Apr 2020 07:24:02 -0000

For RV64 risu, make CFLAGS="-march=rv64g"

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index ca2d7db..5c9e967 100755
--- a/configure
+++ b/configure
@@ -58,6 +58,8 @@ guess_arch() {
         ARCH="m68k"
     elif check_define __powerpc64__ ; then
         ARCH="ppc64"
+    elif check_define __riscv ; then
+        ARCH="riscv64"
     else
         echo "This cpu is not supported by risu. Try -h. " >&2
         exit 1
@@ -139,7 +141,7 @@ Some influential environment variables:
                prefixed with the given string.
 
   ARCH         force target architecture instead of trying to detect it.
-               Valid values=[arm|aarch64|ppc64|ppc64le|m68k]
+               Valid values=[arm|aarch64|ppc64|ppc64le|m68k|riscv64]
 
   CC           C compiler command
   CFLAGS       C compiler flags
-- 
2.23.0


