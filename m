Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTLU-0007eG-Tu
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTLE-0007Bs-UQ
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:45 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKy-0006wA-5x
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:44 -0500
Received: by mail-wm1-x336.google.com with SMTP id ay40so28484943wmb.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQSx+09nLzhSfINVlmlSsVlVWwh5VHah16/HRlU/6+s=;
 b=mZjwh923HJ3Yck8Q1EvJXmtWKTzqbJNYrjHfnFnQgw9sUdysbvZMXi+Jo3vsfJLF7R
 5OL65eclnzT1hQYPVtegKq+w3bsygwnUbMDtKAZf2AMk/ScYaTzUu271+SLTBSnAi0RW
 6+R/caZ/IPuwLU1czAc0pL4hMvofLWGepJb0h0I+tQJa2rwxUUpE4TEZ/79Fah0uV29R
 y2GnHwKXZI8cPfZ8x6PPY1Hj+wOLfhhPtW5Tz6VQ1XFieON92rZgnKhkL6ULEMnvpE5I
 xGsctN1NyXpUSikAiipV8dcbLH4aCtQgZtNBJLAdylF8eaZ+ul0SxF900uvARj5D+cD4
 +j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQSx+09nLzhSfINVlmlSsVlVWwh5VHah16/HRlU/6+s=;
 b=Xyz+i7BfO5o7tdJZvYcpybtoEGQuL4zf71gjXcQSSUR5ZmExfhIZ2HFGJT+0fDneYW
 PkgNQk1VPwOwL6tAKMR/YUjULGET1SngY3q3HhljzMqJPkprS/z39pili7aXkOi5mFPQ
 Qa2pKyKlqeaxHKV5bNL1mMQAw9PmwTFnFJUHr5jRyl8LA9iq2qrpa37tIzwtlSVqji5z
 rzVRplByLTH8AeCrAMKO7PxuN9hGgGcMtU41JYCcjCseZqn9nxFrhuv/5cJDuFUt4pio
 Oy/wW/3c29o2pSSdx25suho33jp7muhqPrAa1AE2Uiqv2K4/9tOoSH3BKrRJiQ8tS9yR
 7x2A==
X-Gm-Message-State: AFqh2kqgjgy4xB1TAi9wjEcC/h7JKvoIyvB9Zfx2U1NiTe5hQj5xO5kX
 Zb8H5nfJ1eyyf5kfFAl+oYfYMA==
X-Google-Smtp-Source: AMrXdXvQv1Cv5k2QqFBfEk47dZKvh2yvrlkXXuA2NzBk+EuZIIqZxX/4/4mGnegLCnQHXBAs82CvzQ==
X-Received: by 2002:a05:600c:4a9b:b0:3d1:dc6f:b1a4 with SMTP id
 b27-20020a05600c4a9b00b003d1dc6fb1a4mr45015263wmp.5.1672937007331; 
 Thu, 05 Jan 2023 08:43:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm3993488wmq.18.2023.01.05.08.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F2B81FFC5;
 Thu,  5 Jan 2023 16:43:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 13/21] gdbstub: specialise handle_query_attached
Date: Thu,  5 Jan 2023 16:43:12 +0000
Message-Id: <20230105164320.2164095-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 16:43:47 -0000

In both user and softmmu cases we are just replying with a constant.
If the linker is paying attention it may even be able to sort optimise
the call.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h |  4 +++-
 gdbstub/gdbstub.c   | 15 ++-------------
 gdbstub/softmmu.c   |  5 +++++
 gdbstub/user.c      |  5 +++++
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 8d260e2481..646d2c4e82 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -150,7 +150,7 @@ int gdb_continue_partial(char *newstates);
 void gdb_put_buffer(const uint8_t *buf, int len);
 
 /*
- * Command handlers - either softmmu or user only
+ * Command handlers - either specialised or softmmu or user only
  */
 void gdb_init_gdbserver_state(void);
 
@@ -179,6 +179,8 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
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
index 534370081d..19fcb3be7d 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -442,6 +442,11 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
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
index fa19ec5263..a668b16952 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -343,6 +343,11 @@ void gdbserver_fork(CPUState *cpu)
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
2.34.1


