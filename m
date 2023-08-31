Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB5DC83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:15:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhLW-0008Bg-1u; Thu, 31 Aug 2023 09:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHl-0006c0-8a
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHf-0006eM-5C
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401b393df02so7996115e9.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486824; x=1694091624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fujFUeasp++TV/A3YKYPJrj4eV9vCNVc0Wd8QFOx7Zc=;
 b=TPBo9FqSN77AGishxIoazYzIc3ghkeNMS+P3wjFpB17aqbHKmI1Qb1W2a+/lbEh1Gy
 C/k3CUeaFoKw4p/fSj2RjZSJVPelvvmqDMSn67rtXVQ9n3hTJKwJznRcxHs9aIxOQAB/
 JzLdCTb+97ex/evB5MXoYZl+lMEzzaYw/GMcE5Ux95P5sl/AQ1LiBQ59g5CMtLjvTEdP
 Z/h/yTQ3VXy1TXskEKUpqua8/gM925A/MR0YIAWNyJOyBA1OuaYXBUcqWziEQC9yK0yX
 AUHeZsQMy0lPe6g+Pg9Ya2+yvc2w0Wjl1HQh13zqfRS5ogLvt1X24GCdViB2C/A88lTa
 I+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486824; x=1694091624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fujFUeasp++TV/A3YKYPJrj4eV9vCNVc0Wd8QFOx7Zc=;
 b=M6bBUke/q581KoRS0b+L7snfOqVLq5F16I6lvdsKbN6PCjAsJLqv8cX4zWG7kFDzDG
 4o5ZBzAxGrniAB/5AXwM/Qn5af2NXfcaDI+Zfmt+00kih+rtwkgmKWC+rJTEGOsY0aEm
 lF76BQVzeA0gpf0bDwW9UkSAtP4QKaFoHF//iWfoBZfYD/qG6rB9uayMHeypTdWxOsG0
 O5N/KHyuqbaDJUChfT5WT33VT+fe/ThvGnsw4pjT3DZQVERz8M3Eqcoelm6zNxXNRYvi
 /RfSEZlt9886ev6llaBVbd3Auku12yEyZQnZddFwfSYrbtb0t9klRkb4eG4zt+YqwGas
 ld6Q==
X-Gm-Message-State: AOJu0YwmtVyRfvDziLc4YK3B7zZoaDJkvQE36ayFZfRtHBPvXBhlTQuS
 TKJ6gQm8C3Kjk9wNhjp/+CzPYQ==
X-Google-Smtp-Source: AGHT+IHouz6mxnkj/qBY8iZX5wlnQsqN2DjiX1pJWB1+PGoBAEHJd/3jcixt9c+2NwCUpUvkAuiuVQ==
X-Received: by 2002:a5d:46cb:0:b0:319:6afc:7a3c with SMTP id
 g11-20020a5d46cb000000b003196afc7a3cmr3807766wrs.10.1693486824263; 
 Thu, 31 Aug 2023 06:00:24 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 a2-20020adff7c2000000b003177074f830sm2165517wrq.59.2023.08.31.06.00.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 06:00:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 36/41] util: spelling fixes
Date: Thu, 31 Aug 2023 14:56:38 +0200
Message-ID: <20230831125646.67855-37-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20230823065335.1919380-3-mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/elf.h               | 4 ++--
 include/io/channel-socket.h | 4 ++--
 include/io/task.h           | 2 +-
 include/qemu/iova-tree.h    | 4 ++--
 include/qemu/yank.h         | 2 +-
 util/cpuinfo-aarch64.c      | 4 ++--
 util/cpuinfo-i386.c         | 4 ++--
 util/cpuinfo-ppc.c          | 2 +-
 util/main-loop.c            | 2 +-
 util/oslib-posix.c          | 2 +-
 util/qdist.c                | 2 +-
 util/qemu-sockets.c         | 2 +-
 util/rcu.c                  | 2 +-
 13 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/elf.h b/include/elf.h
index ec9755e73b..e7259ec366 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1125,9 +1125,9 @@ typedef struct {
 #define EFA_PARISC_1_1      0x0210 /* PA-RISC 1.1 big-endian.  */
 #define EFA_PARISC_2_0      0x0214 /* PA-RISC 2.0 big-endian.  */
 
-/* Additional section indeces.  */
+/* Additional section indices.  */
 
-#define SHN_PARISC_ANSI_COMMON  0xff00   /* Section for tenatively declared
+#define SHN_PARISC_ANSI_COMMON  0xff00   /* Section for tentatively declared
                                               symbols in ANSI C.  */
 #define SHN_PARISC_HUGE_COMMON  0xff01   /* Common blocks in huge model.  */
 
diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index 513c428fe4..ab15577d38 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -124,7 +124,7 @@ void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
  * qio_channel_socket_listen_sync:
  * @ioc: the socket channel object
  * @addr: the address to listen to
- * @num: the expected ammount of connections
+ * @num: the expected amount of connections
  * @errp: pointer to a NULL-initialized error object
  *
  * Attempt to listen to the address @addr. This method
@@ -141,7 +141,7 @@ int qio_channel_socket_listen_sync(QIOChannelSocket *ioc,
  * qio_channel_socket_listen_async:
  * @ioc: the socket channel object
  * @addr: the address to listen to
- * @num: the expected ammount of connections
+ * @num: the expected amount of connections
  * @callback: the function to invoke on completion
  * @opaque: user data to pass to @callback
  * @destroy: the function to free @opaque
diff --git a/include/io/task.h b/include/io/task.h
index beec4f5cfd..dc7d32ebd0 100644
--- a/include/io/task.h
+++ b/include/io/task.h
@@ -145,7 +145,7 @@ typedef void (*QIOTaskWorker)(QIOTask *task,
  * The QIOTask module can also be used to perform operations
  * in a background thread context, while still reporting the
  * results in the main event thread. This allows code which
- * cannot easily be rewritten to be asychronous (such as DNS
+ * cannot easily be rewritten to be asynchronous (such as DNS
  * lookups) to be easily run non-blocking. Reporting the
  * results in the main thread context means that the caller
  * typically does not need to be concerned about thread
diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index 8528e5c98f..2a10a7052e 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -15,7 +15,7 @@
  * Currently the iova tree will only allow to keep ranges
  * information, and no extra user data is allowed for each element.  A
  * benefit is that we can merge adjacent ranges internally within the
- * tree.  It can save a lot of memory when the ranges are splitted but
+ * tree.  It can save a lot of memory when the ranges are split but
  * mostly continuous.
  *
  * Note that current implementation does not provide any thread
@@ -128,7 +128,7 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
  * iova_tree_foreach:
  *
  * @tree: the iova tree to iterate on
- * @iterator: the interator for the mappings, return true to stop
+ * @iterator: the iterator for the mappings, return true to stop
  *
  * Iterate over the iova tree.
  *
diff --git a/include/qemu/yank.h b/include/qemu/yank.h
index 5375a1f195..1907150933 100644
--- a/include/qemu/yank.h
+++ b/include/qemu/yank.h
@@ -25,7 +25,7 @@ typedef void (YankFn)(void *opaque);
  * @instance: The instance.
  * @errp: Error object.
  *
- * Returns true on success or false if an error occured.
+ * Returns true on success or false if an error occurred.
  */
 bool yank_register_instance(const YankInstance *instance, Error **errp);
 
diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
index ababc39550..7d39f47e3b 100644
--- a/util/cpuinfo-aarch64.c
+++ b/util/cpuinfo-aarch64.c
@@ -1,6 +1,6 @@
 /*
  * SPDX-License-Identifier: GPL-2.0-or-later
- * Host specific cpu indentification for AArch64.
+ * Host specific cpu identification for AArch64.
  */
 
 #include "qemu/osdep.h"
@@ -33,7 +33,7 @@ static bool sysctl_for_bool(const char *name)
     /*
      * We might in the future ask for properties not present in older kernels,
      * but we're only asking about static properties, all of which should be
-     * 'int'.  So we shouln't see ENOMEM (val too small), or any of the other
+     * 'int'.  So we shouldn't see ENOMEM (val too small), or any of the other
      * more exotic errors.
      */
     assert(errno == ENOENT);
diff --git a/util/cpuinfo-i386.c b/util/cpuinfo-i386.c
index 3a7b7e0ad1..b2ed65bb10 100644
--- a/util/cpuinfo-i386.c
+++ b/util/cpuinfo-i386.c
@@ -1,6 +1,6 @@
 /*
  * SPDX-License-Identifier: GPL-2.0-or-later
- * Host specific cpu indentification for x86.
+ * Host specific cpu identification for x86.
  */
 
 #include "qemu/osdep.h"
@@ -74,7 +74,7 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
                  * of their memory operands to be 16-byte aligned.
                  *
                  * AMD has provided an even stronger guarantee that processors
-                 * with AVX provide 16-byte atomicity for all cachable,
+                 * with AVX provide 16-byte atomicity for all cacheable,
                  * naturally aligned single loads and stores, e.g. MOVDQU.
                  *
                  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
diff --git a/util/cpuinfo-ppc.c b/util/cpuinfo-ppc.c
index 7212afa45d..1ea3db0ac8 100644
--- a/util/cpuinfo-ppc.c
+++ b/util/cpuinfo-ppc.c
@@ -1,6 +1,6 @@
 /*
  * SPDX-License-Identifier: GPL-2.0-or-later
- * Host specific cpu indentification for ppc.
+ * Host specific cpu identification for ppc.
  */
 
 #include "qemu/osdep.h"
diff --git a/util/main-loop.c b/util/main-loop.c
index 014c795916..797b640c41 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -47,7 +47,7 @@
  */
 /*
  * Disable CFI checks.
- * We are going to call a signal hander directly. Such handler may or may not
+ * We are going to call a signal handler directly. Such handler may or may not
  * have been defined in our binary, so there's no guarantee that the pointer
  * used to set the handler is a cfi-valid pointer. Since the handlers are
  * stored in kernel memory, changing the handler to an attacker-defined
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 760390b31e..4d583da7ce 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -671,7 +671,7 @@ void qemu_free_stack(void *stack, size_t sz)
 
 /*
  * Disable CFI checks.
- * We are going to call a signal hander directly. Such handler may or may not
+ * We are going to call a signal handler directly. Such handler may or may not
  * have been defined in our binary, so there's no guarantee that the pointer
  * used to set the handler is a cfi-valid pointer. Since the handlers are
  * stored in kernel memory, changing the handler to an attacker-defined
diff --git a/util/qdist.c b/util/qdist.c
index 5f75e24c29..ef3566b03a 100644
--- a/util/qdist.c
+++ b/util/qdist.c
@@ -210,7 +210,7 @@ void qdist_bin__internal(struct qdist *to, const struct qdist *from, size_t n)
 
         /*
          * To avoid double-counting we capture [left, right) ranges, except for
-         * the righmost bin, which captures a [left, right] range.
+         * the rightmost bin, which captures a [left, right] range.
          */
         while (j < from->n && (from->entries[j].x < right || i == n - 1)) {
             struct qdist_entry *o = &from->entries[j];
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 892d33f5e6..83e84b1186 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -929,7 +929,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
 
     if (pathbuf != NULL) {
         /*
-         * This dummy fd usage silences the mktemp() unsecure warning.
+         * This dummy fd usage silences the mktemp() insecure warning.
          * Using mkstemp() doesn't make things more secure here
          * though.  bind() complains about existing files, so we have
          * to unlink first and thus re-open the race window.  The
diff --git a/util/rcu.c b/util/rcu.c
index 30a7e22026..e587bcc483 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -355,7 +355,7 @@ void drain_call_rcu(void)
      *
      * Note that since we have only one global queue of the RCU callbacks,
      * we also end up waiting for most of RCU callbacks that were registered
-     * on the other threads, but this is a side effect that shoudn't be
+     * on the other threads, but this is a side effect that shouldn't be
      * assumed.
      */
 
-- 
2.41.0


