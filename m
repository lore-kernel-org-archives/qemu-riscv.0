Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIAoa-0007br-3w
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 10:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIAoX-0007Sc-VY; Mon, 23 Aug 2021 10:20:37 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIAoW-0003HF-4C; Mon, 23 Aug 2021 10:20:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d17so10211408plr.12;
 Mon, 23 Aug 2021 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ggCfymzLYMC+amAfxrR2+TolBGW7f52SX4zTVW4/JcY=;
 b=j6xdwYSGYiOIlvlZpTRsXOPQLtkGoyib6HeQtyzMHh7bIasr0393bjLgQX+geIdeIW
 zBhsmBTjT95FozMCNRRLJ27sAvEOqEfMcu/wDfL/O8cTDCQ+EOgMO4rkzPrXqgSA8moW
 cV10Ej6YXk1x5Q1BR/dOAgRNRo01O1U1uGI5PouZrzcBU3O4lXOz+1Bbx5n9gir8IJ2b
 VlGlEgxTw6EojLSQfpOp1R9uYB9VF48KtEI9A3NQ5yiPgZdEiPauzT7PE6cx5f8keOjF
 nFBEQ9b+m6JP0mz3jjeIpm0NioXm0M0KiPM+2+UEzgGbN1FnPpW/f/++LlPgfkRwOWAq
 vsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ggCfymzLYMC+amAfxrR2+TolBGW7f52SX4zTVW4/JcY=;
 b=lT1z1ItvvTqrELpG5NeKDzITkBFc7h4ZUYLGHVnGrPSrtscGiNimCcE9WCt+HkXJEn
 veXRFtDvlD4vs6R6B/NI6WD+jcgFG8mAxp84t8bqOcU1DUD56RACekMPBKYHEVvcyI1q
 3m4AgecE4N0X0/prvIhV4odL2q3/AzKveAHVRKt/GLBNvWCZov84+SNCjMJ3bLW59KVx
 8bsHnO9Mm7lmh6QuSFuzAZi5AfLtXKnPJcgqYVBXQ8HY+0eGZqLdpBaFfvNWSmZGPZO+
 dR+MA5CllS00BOyKyv+IFjr48EFVQgK9Pv+Cs+PwP/gGzY73OiJzgSMGmTaulz8XHf+0
 oA7A==
X-Gm-Message-State: AOAM531dt6iTMLCcuhA7QeqTlYEwlGYx+uk1PCdYW3/6CbxeB1xPxtdd
 Js1GqRU2mpUlzqkzQjJRNmI=
X-Google-Smtp-Source: ABdhPJwaKrCbvAnJLvM2QLSibM/8zqOO4VdGgNvgucOMhB6ZJ7f6UVHyQ7uPlRiwJWesgixMI/Idsw==
X-Received: by 2002:a17:90a:9318:: with SMTP id
 p24mr19881423pjo.138.1629728433965; 
 Mon, 23 Aug 2021 07:20:33 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id ev12sm4700796pjb.57.2021.08.23.07.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 07:20:33 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 2/3] arm: gdbstub: add support for switchable endianness
Date: Mon, 23 Aug 2021 22:20:03 +0800
Message-Id: <20210823142004.17935-3-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=changbin.du@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 23 Aug 2021 14:20:38 -0000

Apply new gdbstub interfaces we added previously to support both little
and big endian guest debugging for ARM. And enable the
TARGET_SWICHABLE_ENDIANNESS option.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 configs/targets/aarch64-softmmu.mak | 1 +
 configs/targets/arm-softmmu.mak     | 1 +
 target/arm/gdbstub.c                | 2 +-
 target/arm/gdbstub64.c              | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/targets/aarch64-softmmu.mak b/configs/targets/aarch64-softmmu.mak
index 7703127674..14e7f166a7 100644
--- a/configs/targets/aarch64-softmmu.mak
+++ b/configs/targets/aarch64-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_NEED_FDT=y
+TARGET_SWICHABLE_ENDIANNESS=y
diff --git a/configs/targets/arm-softmmu.mak b/configs/targets/arm-softmmu.mak
index 84a98f4818..5f40e858f9 100644
--- a/configs/targets/arm-softmmu.mak
+++ b/configs/targets/arm-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_NEED_FDT=y
+TARGET_SWICHABLE_ENDIANNESS=y
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 826601b341..188e82d938 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -74,7 +74,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     CPUARMState *env = &cpu->env;
     uint32_t tmp;
 
-    tmp = ldl_p(mem_buf);
+    tmp = gdb_read_reg32(mem_buf);
 
     /* Mask out low bit of PC to workaround gdb bugs.  This will probably
        cause problems if we ever implement the Jazelle DBX extensions.  */
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 251539ef79..5358ad31b4 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -47,7 +47,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     CPUARMState *env = &cpu->env;
     uint64_t tmp;
 
-    tmp = ldq_p(mem_buf);
+    tmp = gdb_read_reg64(mem_buf);
 
     if (n < 31) {
         /* Core integer register.  */
-- 
2.32.0


