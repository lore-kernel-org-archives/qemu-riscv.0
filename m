Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbVU-0007qn-Cg
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbVM-0007ee-Oa
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:53:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbV0-00049I-O2
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:53:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p26so4374684wmc.4
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yZplVwk5y7jjRL3DqnzbL5VWfL6vttjPtvPuvL0LbM=;
 b=cy66sKvCUrn1KSGGBVivaf5xNFUoVUI9fDy8ze5nQAFT+IfieEY6Xh2RoHF1xGOL2N
 1yPr40zwBJjxWDVzuKMTiih+rdpnNJtY/TwDnppeFFEyylvfG/sEyxx5NeqTRx3Juw+D
 ITvwS9MJ0HysvbvreVwzMROQeAjQGwu7Nf+sIvmEy0G+l+0JtGfZFtGWHsFFcIjRCj5E
 q4ICHBcxuI5GXh7ZWLGMZnWyCWHNhzr8FLNrvEhXQwLbMRhxVk1nIkT4icOzDC78CSkS
 RUfo5BR/XNZQ505IJcTrBwakdB68uhhrIic9ijz4R8M0bEYUDVpkbpV09z3aAZzQA/XA
 /EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6yZplVwk5y7jjRL3DqnzbL5VWfL6vttjPtvPuvL0LbM=;
 b=wrSyhbVAwVPmDxLVBpZ9z+LR4ePLJlhI7DBiJfgadkhvR2xBPyuCt7Own8Ais19PPP
 mOCJgFOux9y8WlZpobj9NGbyKtbke+OABKZqr8BMNUzedBx+9qQODV2Q/o+3nKGUxAQU
 CKAA1a0/79h5ArHz8tnn7tLNyuehFYzY5ODQallouoau9PhT3sAqKUwxFblXy+633kCo
 jxtTsZfsW5Mf8Xk61ULEPm18tP64rEvqIjEb+Be1eXxhpXMCnHtClgMqbLjgv/npXjlp
 uBmi+OlfIfCntJQDCcZA4t+Ajw14QsZoGP3ozxOoA/Ru56gCKXfyNiFSLNi6CTHlqI7Q
 KdHA==
X-Gm-Message-State: AO0yUKVbPuY1ivNJGkUcfSQkvhkCyp6xSjwFMWLX8R/+vc6LkSPBBTY8
 GDLF4wSnEyKfZgqdfGaYGxJvPw==
X-Google-Smtp-Source: AK7set/sDNmL/xf6MrdMOrmC0c5p1RfMwzxqteg7BWUetSU6PhBqNMJ1HBxn1FtKB4orLqnPRvnc2w==
X-Received: by 2002:a05:600c:1f06:b0:3df:9858:c03c with SMTP id
 bd6-20020a05600c1f0600b003df9858c03cmr5322893wmb.17.1677019955757; 
 Tue, 21 Feb 2023 14:52:35 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b003dc1d668866sm6474680wmb.10.2023.02.21.14.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F3E81FFC3;
 Tue, 21 Feb 2023 22:52:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 13/24] gdbstub: specialise handle_query_attached
Date: Tue, 21 Feb 2023 22:52:16 +0000
Message-Id: <20230221225227.3735319-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 22:53:01 -0000

In both user and softmmu cases we are just replying with a constant.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - remove allusions to possible linker optimisations
---
 gdbstub/internals.h |  4 +++-
 gdbstub/gdbstub.c   | 15 ++-------------
 gdbstub/softmmu.c   |  5 +++++
 gdbstub/user.c      |  5 +++++
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 3912d0de38..3875c6877e 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -152,7 +152,7 @@ int gdb_continue_partial(char *newstates);
 void gdb_put_buffer(const uint8_t *buf, int len);
 
 /*
- * Command handlers - either softmmu or user only
+ * Command handlers - either specialised or softmmu or user only
  */
 void gdb_init_gdbserver_state(void);
 
@@ -181,6 +181,8 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
 void gdb_handle_query_offsets(GArray *params, void *user_ctx); /* user */
 void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 
+void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 76c24b7cb6..0d90685c72 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -46,12 +46,6 @@
 
 #include "internals.h"
 
-#ifdef CONFIG_USER_ONLY
-#define GDB_ATTACHED "0"
-#else
-#define GDB_ATTACHED "1"
-#endif
-
 #ifndef CONFIG_USER_ONLY
 static int phy_memory_mode;
 #endif
@@ -1672,11 +1666,6 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
                       gdbserver_state.str_buf->len, true);
 }
 
-static void handle_query_attached(GArray *params, void *user_ctx)
-{
-    gdb_put_packet(GDB_ATTACHED);
-}
-
 static void handle_query_qemu_supported(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "sstepbits;sstep");
@@ -1786,12 +1775,12 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
     },
 #endif
     {
-        .handler = handle_query_attached,
+        .handler = gdb_handle_query_attached,
         .cmd = "Attached:",
         .cmd_startswith = 1
     },
     {
-        .handler = handle_query_attached,
+        .handler = gdb_handle_query_attached,
         .cmd = "Attached",
     },
     {
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 0232e62ea4..ade0cc366c 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -439,6 +439,11 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
  * Execution state helpers
  */
 
+void gdb_handle_query_attached(GArray *params, void *user_ctx)
+{
+    gdb_put_packet("1");
+}
+
 void gdb_continue(void)
 {
     if (!runstate_needs_reset()) {
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 33a0701cea..90dfe49f27 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -340,6 +340,11 @@ void gdbserver_fork(CPUState *cpu)
  * Execution state helpers
  */
 
+void gdb_handle_query_attached(GArray *params, void *user_ctx)
+{
+    gdb_put_packet("0");
+}
+
 void gdb_continue(void)
 {
     gdbserver_user_state.running_state = 1;
-- 
2.39.1


