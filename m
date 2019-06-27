Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWI5-0003jE-1K
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHd-0003Fm-MM
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHa-0000EK-GZ
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHY-0007AA-EN
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:53 -0400
Received: by mail-pg1-f194.google.com with SMTP id c70so1047900pga.8
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=MsITP9g02yPdJ/4apRI29XJbL0BqwsUIcjd2jJ0cnTY=;
 b=SAjFhTy8Gp1k0PmQm/TGP1Byu0mwHOJABr0HfC7NyPaLJ5t3p53xXJNF4iUAAfQCB2
 dD+wRlulqGr8X2drtOPrh2Sy89UZaX7szY3e7ozLGXyeWE1yh3Q1uAcVz2F1PpoLi8wI
 017MBygXoUr7gpP5VMqob5fZsmJdLa4Or6wfntrFnLFgbdXX9T+526pP3OuQKJW94A4g
 +/W3WV/ESo/x6PE+442KZ1v6TOzC3G3nwSIqWffWbydG0lr4l4VJZbdFxq7zQuJI/EPD
 25v40j0CcG/ILR8JQ4pZ+R1Ng4XFMuPcr0sXurv96XdVYWE13CbfaRQORf8qrEJMgPV1
 ENew==
X-Gm-Message-State: APjAAAWFac3GmJaEhdq/kLM2jvkxwWzLrmFbJq+8TjpQ3gnoSEEJJLhp
 rBrXxTqMaDE3a3jIMAtRsGYmBRt84t3CLA==
X-Google-Smtp-Source: APXvYqwP3X0J8lWjIMxxmjd7unuQEoMoZbWww3FjeBzFoPZmdGngKnGlZcGK9un87W8Y8mo+4XkOCQ==
X-Received: by 2002:a17:90a:b011:: with SMTP id
 x17mr6764327pjq.113.1561649060874; 
 Thu, 27 Jun 2019 08:24:20 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id q10sm2309063pgg.35.2019.06.27.08.24.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:20 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:20:01 -0700
Message-Id: <20190627152011.18686-25-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Jim Wilson <jimw@sifive.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
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
X-List-Received-Date: Thu, 27 Jun 2019 15:26:00 -0000

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


