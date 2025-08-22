Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A372CA0EED
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:04:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTHL-00024N-D2; Fri, 22 Aug 2025 11:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGd-0001iq-VQ
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:24 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGT-0004zV-KT
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:23 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b49c78326f7so320882a12.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874868; x=1756479668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uf+KywRMYJZdnc5WkH+t5Y1kT4Zel1cp7zy1z3bbj/0=;
 b=kk0X8FVQzS5d0e5UWUvxGmRrhg1T8EUZ0Rd3JB35dwk61n3Xc0lela3a9HPDAOyDOi
 Ci+Vq7g8pvdoloN1DDkICbNhZ6vu3U9eZHpuyT5wGC+i0vZDaPoS3oAUcNaiKTiAZWhk
 VoEvO2DsW9uju2Ad/fCIdaXcEkyGD9R6iKs+zEuCfwEIUI+mZ8CJcCe5xQ8AKN5fSPuZ
 u+w6p3T63byXqmqIbC0uL3ZwjzMip+Qc65zWD7DrznoxT7ulkBoNS71FQYmErKRjl8al
 seCjjvWR4vUiiTJFpt4+Q5iRfY01R2rsbFVJxYHWTVQvVolJVQKdxLTkZ5ijb+ULW9dy
 OUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874868; x=1756479668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uf+KywRMYJZdnc5WkH+t5Y1kT4Zel1cp7zy1z3bbj/0=;
 b=lSc0IZARUUjT3EkkmpXlHHS1ZilY+uKO945KM/IuPE3dpwNwDSVQKhgN/roElozEcc
 VkKlbNGMmD4AmY7l6sLkuvOUZ1cO4up3GQEB0ALSchEKlflix2SdNs0FtpwYtULxB7r9
 2fBqAhXchsPdzdmlcoZ6rhnv/uw0XMCrNbYjtRhb7y7GWFKPjuNCKhjwyAeS/e0U6nor
 TqBSuCAjS9ChZ0sahs1wX2W7Sm9wy4fabrk7u9fxspqCV7YYhlF2yZA/LdUBvNi1i70j
 MRCs5lpTuihktAKwbZODkAZtTKB3mptIUcdA2JWovXFBcUn+Cnr8mPSc/apMtqrpMYRb
 tUwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1wHYjexB22aT+Y7fmiJtGimdaiUcSxdRiidHTO27/5lRx+1sZvJYhFOKxkAXxGeYoSJ7liSnee8y3@nongnu.org
X-Gm-Message-State: AOJu0Yw1Mo3p16aLN6AD81Zo7bGFM3mNA98Ou2ip2fP3uZQ2roK2Mrbt
 J1G5xB2E5GP/KC9hw3fbRicDqozvMbE+uz1ok68/mSNYatLuChJexCSejUignilY/ko=
X-Gm-Gg: ASbGnctaHJnF4HTU5EczEpaCLHGTuzEqRIfEkJLcD9T32B8+qMbXy/s16b4CJmYbfdC
 hO9+w4gV3NObjXsaiFlAyj0Gg/VA3Fr8D724jRNwXOvwkPM0DVZR9zjrAGtQag1GFSCDF7NzlLr
 fUrZjx7AqYnm84D7pY4sSb+0EnD6c3eTu1RPe7SESDXpNftTG+zSfOmUi2cnZpRRy4QdUVIXHCz
 n2NhRRXVo6PKmCAbBrQs0xpExDg6VfzDuoWhBmnUWt0FYiZqDMLD5PQ6wu2U2Jc71eTm4DeHVYF
 akTvngPGA8dvK+TNZ++Nk04nNV37ipvZAHu52ICjBgOq4UfoEYJ6ixFsPOlAiq3Of4JrUoIlkk6
 qWc6vaKJ5FDouzeEN+PCSCK5uDkxOcCydQNIWQLajbRo=
X-Google-Smtp-Source: AGHT+IH6mt2q3ZzdlpEHk3lFip8gHlSpq44UBC7IjkUPr+l3w5LfZekurc3LUmz+I69rdZWVPd4hyQ==
X-Received: by 2002:a17:902:ce02:b0:23f:f68b:fa1d with SMTP id
 d9443c01a7336-2462ef4fd9dmr45261035ad.39.1755874867591; 
 Fri, 22 Aug 2025 08:01:07 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:07 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 02/12] semihosting/syscalls: replace uint64_t with vaddr
 where appropriate
Date: Fri, 22 Aug 2025 08:00:48 -0700
Message-ID: <20250822150058.18692-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x533.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/syscalls.c | 78 +++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index f072d919193..20f155f869a 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -22,7 +22,7 @@
 /*
  * Validate or compute the length of the string (including terminator).
  */
-static int validate_strlen(CPUState *cs, uint64_t str, uint64_t tlen)
+static int validate_strlen(CPUState *cs, vaddr str, uint64_t tlen)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char c;
@@ -51,7 +51,7 @@ static int validate_strlen(CPUState *cs, uint64_t str, uint64_t tlen)
 }
 
 static int validate_lock_user_string(char **pstr, CPUState *cs,
-                                     uint64_t tstr, uint64_t tlen)
+                                     vaddr tstr, uint64_t tlen)
 {
     int ret = validate_strlen(cs, tstr, tlen);
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
@@ -71,7 +71,7 @@ static int validate_lock_user_string(char **pstr, CPUState *cs,
  * big-endian.  Until we do something with gdb, also produce the
  * same big-endian result from the host.
  */
-static int copy_stat_to_user(CPUState *cs, uint64_t addr,
+static int copy_stat_to_user(CPUState *cs, vaddr addr,
                              const struct stat *s)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
@@ -128,7 +128,7 @@ static void gdb_open_cb(CPUState *cs, uint64_t ret, int err)
 }
 
 static void gdb_open(CPUState *cs, gdb_syscall_complete_cb complete,
-                     uint64_t fname, uint64_t fname_len,
+                     vaddr fname, uint64_t fname_len,
                      int gdb_flags, int mode)
 {
     int len = validate_strlen(cs, fname, fname_len);
@@ -139,7 +139,7 @@ static void gdb_open(CPUState *cs, gdb_syscall_complete_cb complete,
 
     gdb_open_complete = complete;
     gdb_do_syscall(gdb_open_cb, "open,%s,%x,%x",
-                   (uint64_t)fname, (uint32_t)len,
+                   (vaddr)fname, (uint32_t)len,
                    (uint32_t)gdb_flags, (uint32_t)mode);
 }
 
@@ -150,17 +150,17 @@ static void gdb_close(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void gdb_read(CPUState *cs, gdb_syscall_complete_cb complete,
-                     GuestFD *gf, uint64_t buf, uint64_t len)
+                     GuestFD *gf, vaddr buf, uint64_t len)
 {
     gdb_do_syscall(complete, "read,%x,%lx,%lx",
-                   (uint32_t)gf->hostfd, (uint64_t)buf, (uint64_t)len);
+                   (uint32_t)gf->hostfd, (vaddr)buf, (uint64_t)len);
 }
 
 static void gdb_write(CPUState *cs, gdb_syscall_complete_cb complete,
-                      GuestFD *gf, uint64_t buf, uint64_t len)
+                      GuestFD *gf, vaddr buf, uint64_t len)
 {
     gdb_do_syscall(complete, "write,%x,%lx,%lx",
-                   (uint32_t)gf->hostfd, (uint64_t)buf, (uint64_t)len);
+                   (uint32_t)gf->hostfd, (vaddr)buf, (uint64_t)len);
 }
 
 static void gdb_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -177,15 +177,15 @@ static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-                      GuestFD *gf, uint64_t addr)
+                      GuestFD *gf, vaddr addr)
 {
     gdb_do_syscall(complete, "fstat,%x,%lx",
-                   (uint32_t)gf->hostfd, (uint64_t)addr);
+                   (uint32_t)gf->hostfd, (vaddr)addr);
 }
 
 static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
-                     uint64_t fname, uint64_t fname_len,
-                     uint64_t addr)
+                     vaddr fname, uint64_t fname_len,
+                     vaddr addr)
 {
     int len = validate_strlen(cs, fname, fname_len);
     if (len < 0) {
@@ -194,11 +194,11 @@ static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     gdb_do_syscall(complete, "stat,%s,%lx",
-                   (uint64_t)fname, (uint32_t)len, (uint64_t)addr);
+                   (vaddr)fname, (uint32_t)len, (vaddr)addr);
 }
 
 static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
-                       uint64_t fname, uint64_t fname_len)
+                       vaddr fname, uint64_t fname_len)
 {
     int len = validate_strlen(cs, fname, fname_len);
     if (len < 0) {
@@ -206,12 +206,12 @@ static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
 
-    gdb_do_syscall(complete, "unlink,%s", (uint64_t)fname, (uint32_t)len);
+    gdb_do_syscall(complete, "unlink,%s", (vaddr)fname, (uint32_t)len);
 }
 
 static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
-                       uint64_t oname, uint64_t oname_len,
-                       uint64_t nname, uint64_t nname_len)
+                       vaddr oname, uint64_t oname_len,
+                       vaddr nname, uint64_t nname_len)
 {
     int olen, nlen;
 
@@ -227,12 +227,12 @@ static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     gdb_do_syscall(complete, "rename,%s,%s",
-                   (uint64_t)oname, (uint32_t)olen,
-                   (uint64_t)nname, (uint32_t)nlen);
+                   (vaddr)oname, (uint32_t)olen,
+                   (vaddr)nname, (uint32_t)nlen);
 }
 
 static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
-                       uint64_t cmd, uint64_t cmd_len)
+                       vaddr cmd, uint64_t cmd_len)
 {
     int len = validate_strlen(cs, cmd, cmd_len);
     if (len < 0) {
@@ -240,14 +240,14 @@ static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
 
-    gdb_do_syscall(complete, "system,%s", (uint64_t)cmd, (uint32_t)len);
+    gdb_do_syscall(complete, "system,%s", (vaddr)cmd, (uint32_t)len);
 }
 
 static void gdb_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
-                             uint64_t tv_addr, uint64_t tz_addr)
+                             vaddr tv_addr, vaddr tz_addr)
 {
     gdb_do_syscall(complete, "gettimeofday,%lx,%lx",
-                   (uint64_t)tv_addr, (uint64_t)tz_addr);
+                   (vaddr)tv_addr, (vaddr)tz_addr);
 }
 
 /*
@@ -255,7 +255,7 @@ static void gdb_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
  */
 
 static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
-                      uint64_t fname, uint64_t fname_len,
+                      vaddr fname, uint64_t fname_len,
                       int gdb_flags, int mode)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
@@ -315,7 +315,7 @@ static void host_close(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
-                      GuestFD *gf, uint64_t buf, uint64_t len)
+                      GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     void *ptr = lock_user(VERIFY_WRITE, buf, len, 0);
@@ -336,7 +336,7 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
-                       GuestFD *gf, uint64_t buf, uint64_t len)
+                       GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     void *ptr = lock_user(VERIFY_READ, buf, len, 1);
@@ -394,7 +394,7 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-                       GuestFD *gf, uint64_t addr)
+                       GuestFD *gf, vaddr addr)
 {
     struct stat buf;
     int ret;
@@ -409,8 +409,8 @@ static void host_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
-                      uint64_t fname, uint64_t fname_len,
-                      uint64_t addr)
+                      vaddr fname, uint64_t fname_len,
+                      vaddr addr)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     struct stat buf;
@@ -439,7 +439,7 @@ static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
-                        uint64_t fname, uint64_t fname_len)
+                        vaddr fname, uint64_t fname_len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *p;
@@ -457,8 +457,8 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
-                        uint64_t oname, uint64_t oname_len,
-                        uint64_t nname, uint64_t nname_len)
+                        vaddr oname, uint64_t oname_len,
+                        vaddr nname, uint64_t nname_len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *ostr, *nstr;
@@ -483,7 +483,7 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
-                        uint64_t cmd, uint64_t cmd_len)
+                        vaddr cmd, uint64_t cmd_len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *p;
@@ -501,7 +501,7 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
-                              uint64_t tv_addr, uint64_t tz_addr)
+                              vaddr tv_addr, vaddr tz_addr)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     struct gdb_timeval *p;
@@ -546,7 +546,7 @@ static void host_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
  */
 
 static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
-                            GuestFD *gf, uint64_t buf, uint64_t len)
+                            GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     uint64_t rest = gf->staticfile.len - gf->staticfile.off;
@@ -604,7 +604,7 @@ static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
  */
 
 static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
-                         GuestFD *gf, uint64_t buf, uint64_t len)
+                         GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *ptr;
@@ -621,7 +621,7 @@ static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
-                          GuestFD *gf, uint64_t buf, uint64_t len)
+                          GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *ptr = lock_user(VERIFY_READ, buf, len, 1);
@@ -637,7 +637,7 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-                          GuestFD *gf, uint64_t addr)
+                          GuestFD *gf, vaddr addr)
 {
     static const struct stat tty_buf = {
         .st_mode = 020666,  /* S_IFCHR, ugo+rw */
-- 
2.47.2


