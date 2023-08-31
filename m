Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF6CC83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:58:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhEV-0002KD-Pi; Thu, 31 Aug 2023 08:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhER-0002He-SJ
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:10 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEM-00056J-D3
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:07 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-401bbfc05fcso7377855e9.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486621; x=1694091421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uyAFkv08soXTPpT+cRfZCYJSEeJIQENRamQ8RwwrU9I=;
 b=rAysmBZdVavMJmO3SDObVitmXhOMr5spuDx5NdFePMcSfZ2ENKdde+1dxsEfnfrwNu
 xN0lR14Sol5DxBvGret5TKFwx/iDOFuux/TZpxUo8WeLH8J/kygBjx18KM6lz4GIsQlN
 uAIEpLVMBfo9JjiegY0zk36fZrgio5lfp6iGRkvMvveKsa8KfSG8yHI2+orKV3EbV7KD
 cG67KBlWVsYPcLLdEMt1lQfTl4QYQehLfj6m+cUBFIjJGXFUqksUZ9tzulmPK5Ric/9s
 C1ITa/o/Safxb36MUOSDs22jHwrPyW+NCEEkizW40PcZkNwLy3Q80yw/C8HAbn84SaiV
 1S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486621; x=1694091421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uyAFkv08soXTPpT+cRfZCYJSEeJIQENRamQ8RwwrU9I=;
 b=HHfbr2PYML1L0AtX58HUv7iJj4OF61HUV7MzcbDfwpcGnynPPATGFMJINyHUX6YY36
 r3cj6Go9k55PkuH0+OgP+YK1WJy3Vq2kGNJQWM1rsrM6kHtPZWunQkrBVx2zUgLQ/Nxx
 3i9lSa4dz6tFYk/jAipL8ThWQxcx2NdWY/yFitqL7eiYXRH8SJ2WYFhGf3aeg/ge5BJy
 Itkf2aDSlWhGbIfpHJjjOM4MtKCzQ084tYgy/qTot0vI4f4BHtFpIfaPJaJtkY2IK+vb
 p5AwqecGG+cRuvadEVRl3/YLEO+ZdlGAGyEttPfNynEkS2/aH+Z5jToyBdrtlTQQt9GX
 xMCQ==
X-Gm-Message-State: AOJu0YztH8Y3XKjqw2f0ck6KVw+wY+KgsMdLBa08lanRn9Pul9CrpSqI
 EZs+EVQtWDm2TEY91kCQxE1GqA==
X-Google-Smtp-Source: AGHT+IE/+TTWcuKg3pjqRq41MInDnsJmMNB+fa7jHy/J0ubfI+VvPd5H36wvl9FF4xhLY/Png/X4eg==
X-Received: by 2002:a5d:40cf:0:b0:314:1b4d:bb27 with SMTP id
 b15-20020a5d40cf000000b003141b4dbb27mr4035422wrq.64.1693486620800; 
 Thu, 31 Aug 2023 05:57:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b0030ada01ca78sm2172105wro.10.2023.08.31.05.56.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 02/41] accel/tcg: spelling fixes
Date: Thu, 31 Aug 2023 14:56:04 +0200
Message-ID: <20230831125646.67855-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Michael Tokarev <mjt@tls.msk.ru>

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20230823065335.1919380-18-mjt@tls.msk.ru>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20230823065335.1919380-19-mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 2 +-
 include/tcg/helper-info.h     | 2 +-
 include/tcg/tcg.h             | 4 ++--
 include/user/safe-syscall.h   | 2 +-
 accel/tcg/tb-maint.c          | 2 +-
 contrib/plugins/cache.c       | 2 +-
 contrib/plugins/lockstep.c    | 2 +-
 linux-user/flatload.c         | 2 +-
 linux-user/syscall.c          | 4 ++--
 semihosting/config.c          | 2 +-
 semihosting/syscalls.c        | 4 ++--
 softmmu/icount.c              | 2 +-
 softmmu/ioport.c              | 2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 3e8b1b737a..479713a36e 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -14,7 +14,7 @@
 
 struct TCGCPUOps {
     /**
-     * @initialize: Initalize TCG state
+     * @initialize: Initialize TCG state
      *
      * Called when the first CPU is realized.
      */
diff --git a/include/tcg/helper-info.h b/include/tcg/helper-info.h
index 4b6c9b43e8..7c27d6164a 100644
--- a/include/tcg/helper-info.h
+++ b/include/tcg/helper-info.h
@@ -1,5 +1,5 @@
 /*
- * TCG Helper Infomation Structure
+ * TCG Helper Information Structure
  *
  * Copyright (c) 2023 Linaro Ltd
  *
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 61d7c81b44..c9c6d770d0 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -879,7 +879,7 @@ enum {
     /* Instruction operands are 64-bits (otherwise 32-bits).  */
     TCG_OPF_64BIT        = 0x10,
     /* Instruction is optional and not implemented by the host, or insn
-       is generic and should not be implemened by the host.  */
+       is generic and should not be implemented by the host.  */
     TCG_OPF_NOT_PRESENT  = 0x20,
     /* Instruction operands are vectors.  */
     TCG_OPF_VECTOR       = 0x40,
@@ -1123,7 +1123,7 @@ static inline int tcg_can_emit_vec_op(TCGOpcode o, TCGType t, unsigned ve)
 /* Expand the tuple (opc, type, vece) on the given arguments.  */
 void tcg_expand_vec_op(TCGOpcode, TCGType, unsigned, TCGArg, ...);
 
-/* Replicate a constant C accoring to the log2 of the element size.  */
+/* Replicate a constant C according to the log2 of the element size.  */
 uint64_t dup_const(unsigned vece, uint64_t c);
 
 #define dup_const(VECE, C)                                         \
diff --git a/include/user/safe-syscall.h b/include/user/safe-syscall.h
index ddceef12e2..195cedac04 100644
--- a/include/user/safe-syscall.h
+++ b/include/user/safe-syscall.h
@@ -91,7 +91,7 @@
  *
  * The basic setup is that we make the host syscall via a known
  * section of host native assembly. If a signal occurs, our signal
- * handler checks the interrupted host PC against the addresse of that
+ * handler checks the interrupted host PC against the address of that
  * known section. If the PC is before or at the address of the syscall
  * instruction then we change the PC to point at a "return
  * -QEMU_ERESTARTSYS" code path instead, and then exit the signal handler
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index c406b2f7b7..32ae8af61c 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1,5 +1,5 @@
 /*
- * Translation Block Maintaince
+ * Translation Block Maintenance
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 5036213f1b..dea4a56c8d 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -350,7 +350,7 @@ static int in_cache(Cache *cache, uint64_t addr)
  * @cache: The cache under simulation
  * @addr: The address of the requested memory location
  *
- * Returns true if the requsted data is hit in the cache and false when missed.
+ * Returns true if the requested data is hit in the cache and false when missed.
  * The cache is updated on miss for the next access.
  */
 static bool access_cache(Cache *cache, uint64_t addr)
diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 3614c3564c..850f7b2941 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -108,7 +108,7 @@ static void report_divergance(ExecState *us, ExecState *them)
 
     /*
      * If we have diverged before did we get back on track or are we
-     * totally loosing it?
+     * totally losing it?
      */
     if (divergence_log) {
         DivergeState *last = (DivergeState *) divergence_log->data;
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 8f5e9f489b..4331a11bf0 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -780,7 +780,7 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
     /* Enforce final stack alignment of 16 bytes.  This is sufficient
        for all current targets, and excess alignment is harmless.  */
     stack_len = bprm->envc + bprm->argc + 2;
-    stack_len += flat_argvp_envp_on_stack() ? 2 : 0; /* arvg, argp */
+    stack_len += flat_argvp_envp_on_stack() ? 2 : 0; /* argv, argp */
     stack_len += 1; /* argc */
     stack_len *= sizeof(abi_ulong);
     sp -= (sp - stack_len) & 15;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9353268cc1..7ccd3affbe 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1809,7 +1809,7 @@ static inline abi_long target_to_host_cmsg(struct msghdr *msgh,
             uint32_t *dst = (uint32_t *)data;
 
             memcpy(dst, target_data, len);
-            /* fix endianess of first 32-bit word */
+            /* fix endianness of first 32-bit word */
             if (len >= sizeof(uint32_t)) {
                 *dst = tswap32(*dst);
             }
@@ -2920,7 +2920,7 @@ get_timeout:
                 unlock_user(results, optval_addr, 0);
                 return ret;
             }
-            /* swap host endianess to target endianess. */
+            /* swap host endianness to target endianness. */
             for (i = 0; i < (len / sizeof(uint32_t)); i++) {
                 results[i] = tswap32(results[i]);
             }
diff --git a/semihosting/config.c b/semihosting/config.c
index 89a1759687..8ca569735d 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -8,7 +8,7 @@
  * targets that support it. Architecture specific handling is handled
  * in target/HW/HW-semi.c
  *
- * Semihosting is sightly strange in that it is also supported by some
+ * Semihosting is slightly strange in that it is also supported by some
  * linux-user targets. However in that use case no configuration of
  * the outputs and command lines is supported.
  *
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 68899ebb1c..d27574a1e2 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -720,7 +720,7 @@ void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                           GuestFD *gf, target_ulong buf, target_ulong len)
 {
     /*
-     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
+     * Bound length for 64-bit guests on 32-bit hosts, not overflowing ssize_t.
      * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
      * idea to do this unconditionally.
      */
@@ -761,7 +761,7 @@ void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                            GuestFD *gf, target_ulong buf, target_ulong len)
 {
     /*
-     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
+     * Bound length for 64-bit guests on 32-bit hosts, not overflowing ssize_t.
      * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
      * idea to do this unconditionally.
      */
diff --git a/softmmu/icount.c b/softmmu/icount.c
index a5cef9c60a..144e24829c 100644
--- a/softmmu/icount.c
+++ b/softmmu/icount.c
@@ -325,7 +325,7 @@ void icount_start_warp_timer(void)
              * vCPU is sleeping and warp can't be started.
              * It is probably a race condition: notification sent
              * to vCPU was processed in advance and vCPU went to sleep.
-             * Therefore we have to wake it up for doing someting.
+             * Therefore we have to wake it up for doing something.
              */
             if (replay_has_event()) {
                 qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index b66e0a5a8e..1824aa808c 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -22,7 +22,7 @@
  * THE SOFTWARE.
  */
 /*
- * splitted out ioport related stuffs from vl.c.
+ * split out ioport related stuffs from vl.c.
  */
 
 #include "qemu/osdep.h"
-- 
2.41.0


