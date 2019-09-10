Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvk-0007S3-LL
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvf-0007KY-9N
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xve-0006O3-7n
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:43 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33141)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xve-0006Nd-2P
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id u16so23487424wrr.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=SNUwgSqPs8KK5z86gRWObQ6qeL9sTS6I7byaj7lBBbw=;
 b=sBQZkQ/IKPiKt0pb7O7IvmSpPJLGe8eoIN1T9m/ksY484u/GfNlYjOO22VeqzZv8tL
 rDv/OEKx0FJYE+bp3P13bQOIWeVljYA7TSc+/zmWTqnt6Y1mrGilyyYJ2er/E+FqXJIm
 jFYq/SRXFGDtEocZnZIPCzeHM34O5Mi4VyxHSj2v1i3xTlXiE6nHnSz3mqAcLUUmVs3z
 Fu53GwzYRIawmwG+xrNdZC527n16vB73/F6vRi/fttNdKGE52x7x63b0sKRBsvmD6wfr
 bDlaS+I6ujHA0JKEr+eEzvqi6Jm8NjNi5UrV2KfCRda/d6G+3sUWViLNQcdfYMfjM3Hn
 xVnw==
X-Gm-Message-State: APjAAAXgDTzYrAbpEHBXMz70k/xnfi2H4bMAC2qCBjuHVGEOT0d+554u
 7Yd7u68tnt2OUxSQ9XUbq4migVdJtk28wQ==
X-Google-Smtp-Source: APXvYqyug4DsvLjCGQCA4v242m57ZTZQgKJMvUj3h1+wJpWKw3/bBWqv30C2A3EapRwI/w7bSlxsNg==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr28157912wrq.238.1568190280448; 
 Wed, 11 Sep 2019 01:24:40 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id r28sm28106127wrr.94.2019.09.11.01.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:40 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:30 -0700
Message-Id: <20190910190513.21160-5-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: [Qemu-riscv] [PULL 04/47] target/riscv/pmp: Restrict priviledged
 PMP to system-mode emulation
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:45 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The RISC-V Physical Memory Protection is restricted to privileged
modes. Restrict its compilation to QEMU system builds.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/Makefile.objs | 3 ++-
 target/riscv/pmp.c         | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index b1c79bc1d1..b754e4bf32 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -1,4 +1,5 @@
-obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o gdbstub.o pmp.o
+obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o gdbstub.o
+obj-$(CONFIG_SOFTMMU) += pmp.o
 
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 958c7502a0..d836288cb4 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -28,8 +28,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 
-#ifndef CONFIG_USER_ONLY
-
 #define RISCV_DEBUG_PMP 0
 #define PMP_DEBUG(fmt, ...)                                                    \
     do {                                                                       \
@@ -382,5 +380,3 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
         return 0;
     }
 }
-
-#endif
-- 
2.21.0


