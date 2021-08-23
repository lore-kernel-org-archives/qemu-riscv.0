Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIAok-0008BL-Ih
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 10:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIAoh-00082f-Ol; Mon, 23 Aug 2021 10:20:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIAog-0003Np-06; Mon, 23 Aug 2021 10:20:47 -0400
Received: by mail-pl1-x62a.google.com with SMTP id e15so10235217plh.8;
 Mon, 23 Aug 2021 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5D9FApNhc2a0k19sWbEd/XosOX9mhbOuJ6xDPXb9jWw=;
 b=lMG/pYLEidi204zCE4WRaDperRI81Mg1LBLXvDPEGLTL41B7oFSVn4V9DTPABZ0m+w
 sOL6fdeV9riAfh/UPaTRA25rlFngsK1rG9SqjFlV1EbaGxgxhisDuvZYIjhy8FsucX7M
 7mLji7W4Oomnl/X71yvY+8I415IOBZlaYBQFJN7dvIlLNwN9nykEUVJLdLA04NxhACG+
 896x/lgULqk4NuD6KnHAIVkOVhA7IBn6ayKORvp2rq4N1C7ckdPouFzPzOWUjVzs7mKQ
 Mui+MWj7VVl4iM2VvRhUrgrt/VrKo4fbxg5e2R/1gZkNThcC9Ton6drvAZJuwYxTUbn+
 6caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5D9FApNhc2a0k19sWbEd/XosOX9mhbOuJ6xDPXb9jWw=;
 b=eYczQqlaDW9qV8zj+JwuJIT8q/jLEm05fGo/w0eLSallC1Ej9hqoD1Yr+hNj/HEElR
 p7nGawgldTAxCJCBVhhZezB0bj7txZbgiKBLXD6iCdC+OQiXoNH8j1BFvGMjlm+c3Pn1
 b7EZGpB0hEhWwT7w5oCuzzTcS8g46fllXbWk58y51qrITbMvUXtHHDucXgVpXkgJ6pB8
 O/r7Iql35ANkACN07cAIUGYk1JlfL0icU2I4CK4PVgU7wPZy6VUiSu/W30K/BDqyhoSi
 TdmucCx/tr/mVmOoUr9JH9Ax/Li/Ypa3Y1WlKdC9B2Pq0SN3CHoWGGRHiQjzvTfuTvV0
 DHZQ==
X-Gm-Message-State: AOAM533apvrFXQwK0uPxQR0E3TKU5TAt8FfP83FTSrrfjafgTTWi5VPz
 g7f/Xq5VHxQ4Xb4RuTFTK24=
X-Google-Smtp-Source: ABdhPJzbFKefHARHcAaF0HEexqzooh290ZY7h8icByME05bNJ1eV+1520ISNycvqWorUBues6tCBRA==
X-Received: by 2002:a17:902:d504:b029:12d:65dd:6034 with SMTP id
 b4-20020a170902d504b029012d65dd6034mr28677433plg.85.1629728443251; 
 Mon, 23 Aug 2021 07:20:43 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id ev12sm4700796pjb.57.2021.08.23.07.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 07:20:42 -0700 (PDT)
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
Subject: [PATCH 3/3] riscv: gdbstub: add support for switchable endianness
Date: Mon, 23 Aug 2021 22:20:04 +0800
Message-Id: <20210823142004.17935-4-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=changbin.du@gmail.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 14:20:48 -0000

Apply new gdbstub interfaces we added previously to support both little
and big endian guest debugging for RISC-V. And enable the
TARGET_SWICHABLE_ENDIANNESS option.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 configs/targets/riscv32-softmmu.mak |  1 +
 configs/targets/riscv64-softmmu.mak |  1 +
 target/riscv/gdbstub.c              | 12 ++++++------
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/configs/targets/riscv32-softmmu.mak b/configs/targets/riscv32-softmmu.mak
index d8b71cddcd..7f02e67c72 100644
--- a/configs/targets/riscv32-softmmu.mak
+++ b/configs/targets/riscv32-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=riscv
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
 TARGET_NEED_FDT=y
+TARGET_SWICHABLE_ENDIANNESS=y
diff --git a/configs/targets/riscv64-softmmu.mak b/configs/targets/riscv64-softmmu.mak
index 7c0e7eeb42..c3e812495c 100644
--- a/configs/targets/riscv64-softmmu.mak
+++ b/configs/targets/riscv64-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=riscv
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
 TARGET_NEED_FDT=y
+TARGET_SWICHABLE_ENDIANNESS=y
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a7a9c0b1fe..d639cea859 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -42,10 +42,10 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         /* discard writes to x0 */
         return sizeof(target_ulong);
     } else if (n < 32) {
-        env->gpr[n] = ldtul_p(mem_buf);
+        env->gpr[n] = gdb_read_regl(mem_buf);
         return sizeof(target_ulong);
     } else if (n == 32) {
-        env->pc = ldtul_p(mem_buf);
+        env->pc = gdb_read_regl(mem_buf);
         return sizeof(target_ulong);
     }
     return 0;
@@ -81,11 +81,11 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
 static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
     if (n < 32) {
-        env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
+        env->fpr[n] = gdb_read_reg64(mem_buf); /* always 64-bit */
         return sizeof(uint64_t);
     /* there is hole between ft11 and fflags in fpu.xml */
     } else if (n < 36 && n > 32) {
-        target_ulong val = ldtul_p(mem_buf);
+        target_ulong val = gdb_read_regl(mem_buf);
         int result;
         /*
          * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
@@ -118,7 +118,7 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
     if (n < CSR_TABLE_SIZE) {
-        target_ulong val = ldtul_p(mem_buf);
+        target_ulong val = gdb_read_regl(mem_buf);
         int result;
 
         result = riscv_csrrw_debug(env, n, NULL, val, -1);
@@ -145,7 +145,7 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
 {
     if (n == 0) {
 #ifndef CONFIG_USER_ONLY
-        cs->priv = ldtul_p(mem_buf) & 0x3;
+        cs->priv = gdb_read_regl(mem_buf) & 0x3;
         if (cs->priv == PRV_H) {
             cs->priv = PRV_S;
         }
-- 
2.32.0


