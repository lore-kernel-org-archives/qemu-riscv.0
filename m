Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbrv-0006K6-B6
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrr-0006EO-2t
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrp-0006NL-Kp
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:42 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:43583)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbrp-0006M1-Be
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:41 -0400
Received: by mail-pf1-f172.google.com with SMTP id a2so182933pfo.10
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=SNUwgSqPs8KK5z86gRWObQ6qeL9sTS6I7byaj7lBBbw=;
 b=Bsqq5US4NFeuljKaSR9ZUVawuUSTJcR4780DGaPnWTKSZqjjd0sW56cz7VqS9zOWhb
 y52rXwnR+iISUsAJLQNMphaQKj0JzJ/hJBSA7tWtaH3vKQmrYcShnFDzOyKH+kciyVMm
 n8RTn3DaN1WJSpxWIE+A57Y6Miq45iGQPRDa5B0TIFkRzyVr96p1BLO0yAIA4ww1gtxB
 Uv2T9LiuDPC7RqhunMQp3AwXS09hAySGGnxoiow/jY7HHvojQEgCg+oWMGqHO2stvDb5
 dW8iuJOEgBhOeNOrgdiOGbS1Z256mzM6+0YU/KdR2dFFZSE55nuERi11N8PlreZfV0mg
 AiYA==
X-Gm-Message-State: APjAAAV1eIRm8YMhaKsuoaqim67R7vk4zpvDXwqfA5aQSvQtprFnHQXi
 0RJX5eBQTqJGhI3XzyMLkbsnKyNInfA=
X-Google-Smtp-Source: APXvYqxiJBS9ABCsJI0OqNV0XPbWPEhuswgjlf2gqX/u8sGDHXqQdv78OgKw3cMP3OU+UGH1089wHw==
X-Received: by 2002:a17:90a:a589:: with SMTP id
 b9mr4325898pjq.51.1568820459949; 
 Wed, 18 Sep 2019 08:27:39 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k15sm5838597pgt.66.2019.09.18.08.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:39 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:55:56 -0700
Message-Id: <20190918145640.17349-5-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
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
X-Received-From: 209.85.210.172
Subject: [Qemu-riscv] [PULL 04/48] target/riscv/pmp: Restrict priviledged
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
X-List-Received-Date: Wed, 18 Sep 2019 15:27:46 -0000

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


