Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD66E7542D
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 07:15:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnZcD-0007UA-TL; Tue, 03 Oct 2023 03:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnZcC-0007T5-37
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 03:14:44 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnZcA-0001hO-HR
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 03:14:43 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so645879e87.3
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1696317281; x=1696922081; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzSpuvNiyZjxVcPUpl33+RuyiyS/VcvR51U6nTfUSj4=;
 b=fblKUTDB5YpegakYh0HVAD0RJiJ02oI6c9xluu00jjzRsPjN8DaeOgGBMKVzryPjZR
 uulj1MGsNUeTepu9Yh6FzsR9MdDsMzr5FDM3xtYjtb91fZCKzIm3H459/WiuF0QpHFar
 7qnuVE6smIzK0dlEFUloI1gnuoADFz9i+mt+wmGcjJibNlWubHm7g2AHKDx9ku3C9r+p
 uyNbuEZ/tC7MCCb0Af/NTsFeM+bnMFTTfFsba/4tInAS1NfMjPo9t7oZjTNMKPVBfPYY
 uusV/oYdmIB49yt+Kz4cQm/i7BZR7Lq8F6yv1W1yQc6uu0Mat5BE6X2ttkNi4G8JYMdl
 qACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696317281; x=1696922081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzSpuvNiyZjxVcPUpl33+RuyiyS/VcvR51U6nTfUSj4=;
 b=L1E0MMXW1dXeVzSUs03IDi/w9r+LOXHXacIlff7e33x4C+8BUG6Dy0lkZQJ99XuVDL
 egI/+6+Tdv+h1DiCIrR+3pc5X0UTAVTPWu+Pk3FTOK31tvtDPRsj7VdbyEj7akjyCPSD
 UBbFIFQb69sRYduJwWiAoieyc+jYDFBMmJJb715gGaeu8XuMoB0Tiy7AVODlThOCsAN3
 B4EMU76rCpZqbf9HTdu8V0ot+rx7xtE8Ou/rse0ESLJSGH9HDGfDhFQflWlYm+8j4XM7
 esaL98QozCfvNSDD0gvCFT4XnAbtgxKgx/RkNBcMrAcWQ5CbzNhWSm02ro5znLVoUjEB
 28hw==
X-Gm-Message-State: AOJu0YzQCCzgOKalvaWed1wcRijb5zg2XBaDD0ZK1ACzQks4ZabkJZP5
 xLj+jFh/9fpIPrtyQ9/nOG01Jsb+yZCCkE0FfN8=
X-Google-Smtp-Source: AGHT+IGGiEx/8kNQrOTdmjbkNj8W3cMX/ZhMjrPGrDJHRZmPHMPbmC+psRBF1qDN8a/HKbsr2zsxow==
X-Received: by 2002:a05:6512:4819:b0:505:6ede:20b0 with SMTP id
 eo25-20020a056512481900b005056ede20b0mr8536401lfb.58.1696317280896; 
 Tue, 03 Oct 2023 00:14:40 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b003179d5aee67sm832196wrq.94.2023.10.03.00.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 00:14:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 5/5] gdbstub: replace exit calls with proper shutdown for
 softmmu
Date: Tue,  3 Oct 2023 09:14:27 +0200
Message-Id: <20231003071427.188697-6-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231003071427.188697-1-chigot@adacore.com>
References: <20231003071427.188697-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=chigot@adacore.com; helo=mail-lf1-x131.google.com
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

This replaces the exit calls by shutdown requests, ensuring a proper
cleanup of Qemu. Features like net/vhost-vdpa.c are expecting
qemu_cleanup to be called to remove their last residuals.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub/gdbstub.c          | 5 +++--
 gdbstub/softmmu.c          | 6 ++++++
 gdbstub/user.c             | 6 ++++++
 include/gdbstub/syscalls.h | 9 +++++++++
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 349d348c7b..1cb6d65306 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1327,7 +1327,7 @@ static void handle_v_kill(GArray *params, void *user_ctx)
     gdb_put_packet("OK");
     error_report("QEMU: Terminated via GDBstub");
     gdb_exit(0);
-    exit(0);
+    gdb_qemu_exit(0);
 }
 
 static const GdbCmdParseEntry gdb_v_commands_table[] = {
@@ -1846,7 +1846,8 @@ static int gdb_handle_packet(const char *line_buf)
         /* Kill the target */
         error_report("QEMU: Terminated via GDBstub");
         gdb_exit(0);
-        exit(0);
+        gdb_qemu_exit(0);
+        break;
     case 'D':
         {
             static const GdbCmdParseEntry detach_cmd_desc = {
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 9f0b8b5497..a5d6e04c79 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -435,6 +435,12 @@ void gdb_exit(int code)
     qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
 }
 
+void gdb_qemu_exit(int code)
+{
+    qemu_system_shutdown_request_with_code(SHUTDOWN_CAUSE_GUEST_SHUTDOWN,
+                                           code);
+}
+
 /*
  * Memory access
  */
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 7ab6e5d975..dbe1d9b887 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -113,6 +113,12 @@ void gdb_exit(int code)
         gdb_put_packet(buf);
         gdbserver_state.allow_stop_reply = false;
     }
+
+}
+
+void gdb_qemu_exit(int code)
+{
+    exit(code);
 }
 
 int gdb_handlesig(CPUState *cpu, int sig)
diff --git a/include/gdbstub/syscalls.h b/include/gdbstub/syscalls.h
index 243eaf8ce4..54ff7245a1 100644
--- a/include/gdbstub/syscalls.h
+++ b/include/gdbstub/syscalls.h
@@ -110,4 +110,13 @@ int use_gdb_syscalls(void);
  */
 void gdb_exit(int code);
 
+/**
+ * gdb_qemu_exit: ask qemu to exit
+ * @code: exit code reported
+ *
+ * This requests qemu to exit. This function is allowed to return as
+ * the exit request might be processed asynchronously by qemu backend.
+ */
+void gdb_qemu_exit(int code);
+
 #endif /* _SYSCALLS_H_ */
-- 
2.25.1


