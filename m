Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaqC-0006ci-SK
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq7-0006Mp-Ik
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq5-0008Ef-T5
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiaq5-0007fw-IC
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so1451672ljc.11
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=MsITP9g02yPdJ/4apRI29XJbL0BqwsUIcjd2jJ0cnTY=;
 b=CXr8pK/uGxA73JW/9zWq0+qTtOK7VuIHN2JlGZX8beZJmcDpZC275+Cz5Po+Up9T1b
 cNys7oUzyxgfDQClaLEYSTBUEWBRJDKy/XarAlQ2Rhz++2K/Hfay1OU/4PlInfo4XfGj
 UkeNPyCNhWoxqAcO7vvQ7ttJmQvrocMfVSwjts6bC1I3Nv4VwPFSQMaPL5FlKj36ROLM
 8ZWRXYGqvvk93RpxcGYf7kP3cw8nThRhfHSCPzsHEoIJy7W6xOWEoRBj/Ufvr52pq1tj
 Wn8gR86LiGnaIpLAYzHNBym0Qoop0hjHgUR0MnMKeBdLW/HWryyqJQKFv+UA3TngsBPL
 sUsA==
X-Gm-Message-State: APjAAAU+NNNY4qPlDEEyiL+0RMwGWT5PejVy+ugb/hr7zMXH/n248PF8
 jDAwD5LMbCMkt77WOuKsArD/VA==
X-Google-Smtp-Source: APXvYqysXN4JqoAYFHcdKMzeakQpqVOLUR1If3mT9DOpJFXxm9Rx0lT8cqSdY1C7kFN0IwQPzMxxcQ==
X-Received: by 2002:a2e:981:: with SMTP id 123mr20701388ljj.66.1562143312127; 
 Wed, 03 Jul 2019 01:41:52 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id r17sm343514ljb.77.2019.07.03.01.41.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:51 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:40 -0700
Message-Id: <20190703084048.6980-25-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Jim Wilson <jimw@sifive.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.193
Subject: [Qemu-riscv] [PULL 24/32] RISC-V: Update syscall list for 32-bit
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
X-List-Received-Date: Wed, 03 Jul 2019 08:42:11 -0000

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


