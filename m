Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgulA-0000R7-9v
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54932)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgul0-0008Vn-9d
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hguku-0000eJ-SC
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:52 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44356)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hguku-0000dN-Lk
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:48 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so3318438pfe.11
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=MsITP9g02yPdJ/4apRI29XJbL0BqwsUIcjd2jJ0cnTY=;
 b=TsNs5RW9Z7D5or3vFhbeVc9nsX8k8mnDqps7+FYJJK7NVcUDQ1IBc0kprZbasq/MIt
 xoUUS2U3uWGcbTXNpmhQS8OppVBovy6/sUref31q8kgcxPp9ytDRyUuTnaasZWJ8QS1M
 6/7AqJXYzjP1wn552+fGZplGRo1LbGshz2hTYFyVR37BX/d7N2kqtsfDTRJPSfoTnMUJ
 oMIGuwqwWVyaMa9OHEv0mZpGlKzQvvOEuBf0b1oKVyNFtP8p/uych/jamb+wKYQU6hrQ
 HTIwY+Or6MYGsaSx4iY5wJr9XWyxB/CGTmFT9IMoY/ZpNJgDrNoE5MuH2nEYCy9SW0Ia
 HToA==
X-Gm-Message-State: APjAAAVjeM11ALboxUbLj/vNA9Rl4GCmILqCjQpA94ZSbL4MtqoPC7gd
 ankZo7STH0isJitLosIq+1Ltsw==
X-Google-Smtp-Source: APXvYqzbjn9bLPbmNthwzW4TBr8YUWwQWZMeVeIhofrOb8Fu5eE13WjVK3PFkmuEeGwKnCXucK2M9A==
X-Received: by 2002:a63:52:: with SMTP id 79mr10213248pga.381.1561743227478;
 Fri, 28 Jun 2019 10:33:47 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y22sm6318573pfo.39.2019.06.28.10.33.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:46 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:17 -0700
Message-Id: <20190628173227.31925-25-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Jim Wilson <jimw@sifive.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: [Qemu-riscv] [PULL 24/34] RISC-V: Update syscall list for 32-bit
 support.
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:57 -0000

From: Jim Wilson <jimw@sifive.com>

32-bit RISC-V uses _llseek instead of lseek as syscall number 62.
Update syscall list from open-embedded build, primarily because
32-bit RISC-V requires statx support.

Tested with cross gcc testsuite runs for rv32 and rv64, with the
pending statx patch also applied.

Signed-off-by: Jim Wilson <jimw@sifive.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 linux-user/riscv/syscall_nr.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/linux-user/riscv/syscall_nr.h b/linux-user/riscv/syscall_nr.h
index dab6509e3ade..5c8728220994 100644
--- a/linux-user/riscv/syscall_nr.h
+++ b/linux-user/riscv/syscall_nr.h
@@ -72,7 +72,11 @@
 #define TARGET_NR_pipe2 59
 #define TARGET_NR_quotactl 60
 #define TARGET_NR_getdents64 61
+#ifdef TARGET_RISCV32
+#define TARGET_NR__llseek 62
+#else
 #define TARGET_NR_lseek 62
+#endif
 #define TARGET_NR_read 63
 #define TARGET_NR_write 64
 #define TARGET_NR_readv 65
@@ -286,7 +290,16 @@
 #define TARGET_NR_membarrier 283
 #define TARGET_NR_mlock2 284
 #define TARGET_NR_copy_file_range 285
+#define TARGET_NR_preadv2 286
+#define TARGET_NR_pwritev2 287
+#define TARGET_NR_pkey_mprotect 288
+#define TARGET_NR_pkey_alloc 289
+#define TARGET_NR_pkey_free 290
+#define TARGET_NR_statx 291
+#define TARGET_NR_io_pgetevents 292
+#define TARGET_NR_rseq 293
+#define TARGET_NR_kexec_file_load 294
 
-#define TARGET_NR_syscalls (TARGET_NR_copy_file_range + 1)
+#define TARGET_NR_syscalls (TARGET_NR_kexec_file_load + 1)
 
 #endif
-- 
2.21.0


