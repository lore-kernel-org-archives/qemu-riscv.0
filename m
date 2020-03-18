Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEha8-0007TS-TR
	for mharc-qemu-riscv@gnu.org; Wed, 18 Mar 2020 18:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=339f800bd=alistair.francis@wdc.com>)
 id 1jEha5-0007N1-8o
 for qemu-riscv@nongnu.org; Wed, 18 Mar 2020 18:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=339f800bd=alistair.francis@wdc.com>)
 id 1jEha4-0003b3-1n
 for qemu-riscv@nongnu.org; Wed, 18 Mar 2020 18:54:33 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:54476)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=339f800bd=alistair.francis@wdc.com>)
 id 1jEha1-0003JK-Gz; Wed, 18 Mar 2020 18:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1584572069; x=1616108069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5LAi0O+mTaWDQDimiBocyA7wHcDy5fDRMj7L3Yuk5mg=;
 b=myHh++8TBIF7lLfXoa0FvgR8oHPCXeGQo09snHiF+lTvJgSywqtOQIVs
 jTXmOoeZufnah5BPMavqwVQBvrUnP9dx7cybDuaOeBdWkBCfN9S0PeE5T
 4Z6HOOpnJYth5npZ2fGNU8yfaPnUnA4lr0jKVM+PtZ8FDfv40x4Rnwq88
 5RAkU1zUzuL5otrLlGC+wOvM36qGymuNhmb0Ww/iGqlUZZYEDpiRCs5NA
 PJ1AhW1VrCj4Qjgp5v7lnVXWNLyBwl6SrMpq2Mnm6ohnmeTHNH47dHVfC
 aQe/DaR1XcoxefMUgCCmb0q0dr5A1sWnfEnwUGM2ZJneFmjbTh2OblFua Q==;
IronPort-SDR: hvyfrdSk8iHTM5OS7KnZ1btc/+04/tNUYIrZSHaqobw7kkUlZJKIjhW0wS/o5xJyYxLXHInLt8
 fVpSWHw8KliI9Jqr1pcPJ7P617vuZwaU2t/7a/Wla+iIf11wx57vf3wJNuZKjV4d9USN1eI7MM
 molRDIYZW8UxVwHUxM4HwXx4+s3naUZVnpHWNTswYN2w/PZsJmImMwVdf+bBHxrOpkmiqnTmIQ
 P3XKlhWbfwYqI02fxpCqmbh6hzhmhRym9aVHniaznD/GPyWg4pN41YJNIvqiAUgFNrR6JdEUsp
 +VI=
X-IronPort-AV: E=Sophos;i="5.70,569,1574092800"; d="scan'208";a="134342895"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Mar 2020 06:54:28 +0800
IronPort-SDR: UXmzTmKOa7nYI4rC4EQ+ehNaV7nBYPjbUTlLW44Ud3ks71FkdF7B0YyobGsDW6wI+cNW7H9cuM
 /2UVOVvXOrDvHu2l9553ZUwp4wN28vgbJhd49QiyxSLOKocmWiTC1/DiTKHdBeBMwSzjQB+r4p
 NOApb7XX9gL8Sm55wlTukZZ5yCoH9+7ucPZkiuiAXQgwEsr7T7VRY4vk9fCehKAsuZSQgBeri+
 szHFkJm7KXH/o7rxhjcN6yiOT2chiPAQlvNq1KMemg0njVysB+pei2pQsA2t7vlO+z4dJNNB8w
 3TiSYHd58avu032cmHd1eXBw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 15:46:17 -0700
IronPort-SDR: Dxd9JYzpDtCj32Z76IDpy2id3sVgp3RsV/xdirD6KR5dZhRR6WErqERCsPUNdKF7w2dUvk+UrT
 J03CwUuxCTHDDRwQDaQzblmHKy0aou3zwKx8IpPHHtqsGnKmsNoMgpdp450de96QijoW1tBACY
 cdvYD9fKyACg1JXQPmgrJMyYCBGSZm0m97quCyGalU2PX0eTQOynyHE30ZhGufhsaAnt3Drlmv
 5wOHEQJ0x/0PS0xd4lDKmi2C4dfPsNxPII3F0SeubuXergBMoc5XJBP63JMuZB+V/VlkuA2miS
 yMw=
WDCIronportException: Internal
Received: from usa005961.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.54.167])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Mar 2020 15:54:28 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	laurent@vivier.eu
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v9 2/4] linux-user/syscall: Add support for
 clock_gettime64/clock_settime64
Date: Wed, 18 Mar 2020 15:46:58 -0700
Message-Id: <56b8fd28a0faca77ee8adfc90e4eb2bc3750edf5.1584571250.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584571250.git.alistair.francis@wdc.com>
References: <cover.1584571250.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.45
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
X-List-Received-Date: Wed, 18 Mar 2020 22:54:34 -0000

Add support for the clock_gettime64/clock_settime64 syscalls.

If your host is 64-bit or is 32-bit with the *_time64 syscall then the
timespec will correctly be a 64-bit time_t. Otherwise the host will
return a 32-bit time_t which will be rounded to 64-bits. This will be
incorrect after y2038.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 909bec94a5..60fd775d9c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1229,6 +1229,22 @@ static inline abi_long target_to_host_timespec(struct timespec *host_ts,
 }
 #endif
 
+#if defined(TARGET_NR_clock_settime64)
+static inline abi_long target_to_host_timespec64(struct timespec *host_ts,
+                                                 abi_ulong target_addr)
+{
+    struct target__kernel_timespec *target_ts;
+
+    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1)) {
+        return -TARGET_EFAULT;
+    }
+    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
+    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
+    unlock_user_struct(target_ts, target_addr, 0);
+    return 0;
+}
+#endif
+
 static inline abi_long host_to_target_timespec(abi_ulong target_addr,
                                                struct timespec *host_ts)
 {
@@ -11458,6 +11474,18 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     }
 #endif
+#ifdef TARGET_NR_clock_settime64
+    case TARGET_NR_clock_settime64:
+    {
+        struct timespec ts;
+
+        ret = target_to_host_timespec64(&ts, arg2);
+        if (!is_error(ret)) {
+            ret = get_errno(clock_settime(arg1, &ts));
+        }
+        return ret;
+    }
+#endif
 #ifdef TARGET_NR_clock_gettime
     case TARGET_NR_clock_gettime:
     {
@@ -11469,6 +11497,17 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     }
 #endif
+#ifdef TARGET_NR_clock_gettime64
+    case TARGET_NR_clock_gettime64:
+    {
+        struct timespec ts;
+        ret = get_errno(clock_gettime(arg1, &ts));
+        if (!is_error(ret)) {
+            ret = host_to_target_timespec64(arg2, &ts);
+        }
+        return ret;
+    }
+#endif
 #ifdef TARGET_NR_clock_getres
     case TARGET_NR_clock_getres:
     {
-- 
2.25.1


