Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5020CA0FF6
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 11:27:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeDAJ-0004OV-Mm; Thu, 07 Sep 2023 07:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeDAA-0004Ih-S2
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeDA1-00064b-A7
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so826921f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1694086016; x=1694690816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fu41ZOpFY0zs51s8MJh4JeufHQBx0Nq8Vnk2TTW6oVM=;
 b=ZkY8u4wv0NdM/JrrgmPLhF7D8kA6FgyYvRMOS4YH0c8guMueWye5bfte+yOchQBPsz
 b9oqIBXFtmIbBs77co3hBWjX8W0XMxGcc42hNFSdUytsqW1lPLXrDe7wVMCYQFpkebK8
 DBY4mcbEo0oUtnV5mlAOM3sYtP3rmaFfYzygx4MUeQAFxtSIHeWZI0VAC7CmI3TT7G2T
 O3eWQnE9PRgUITi4rsukhgw08bPXthHYcx47ksm8Cafjzrp2NBigWMNNLA4PoAtKK1OQ
 9SuBoJIq+/CBgk+VAw7sdd6q735LgyRmGVYIN6baKD5H08GoxyC5xoCifvoke7Ksad09
 j2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694086016; x=1694690816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fu41ZOpFY0zs51s8MJh4JeufHQBx0Nq8Vnk2TTW6oVM=;
 b=IDqkNkhipBAXYSNAN3J4MtfvHxCdFsfgxT/8mWYX/EoXjrtt3XPx3qDWQO3okIVZXD
 om6ZuVY4bw+HJAudo3zUA9sIr1a8Ud9honXfnhWurDk1thQdPAhbs1j806bHhH2nvr6V
 icifVzW6BPVc06kMuJg4oFIPbTnkKZyyI8b3/Wg85PeEZBI4oKnGu/B9H612QcpJq9nh
 zPUJl+w6TVCSzCHSkeMsqgCchxGm7zftMFBIGs8GVfCuPqG1Du/WOWzq3j+4dhtVGnS1
 J1TbYWF8cuyn4O5sUHx1PGgvq+wEyN6Z+5iji3+FiBbrUZf5EivDazlS8oL8OpRWmVcY
 yQ4w==
X-Gm-Message-State: AOJu0YzuHuR6CmP81uN62i8iQjNjT6CZ0i+6+O+ybXct1tdujZ00l2Z5
 2B/ETBzlcJfEsAO0fW5mMAgmvs5nc4vvToDaxGM=
X-Google-Smtp-Source: AGHT+IEJqRXiB+k5LX7rlKRtwSCHUX4SNWWixyVPROKKppXlICbCoai53J7FiVh8rmQ/91WufF0uLA==
X-Received: by 2002:a5d:42d2:0:b0:318:e4c4:4981 with SMTP id
 t18-20020a5d42d2000000b00318e4c44981mr3923446wrr.20.1694086016044; 
 Thu, 07 Sep 2023 04:26:56 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:c2c3:52c5:8306:a161])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfe6c3000000b00317909f9985sm22998755wrm.113.2023.09.07.04.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 04:26:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v3 5/5] gdbstub: replace exit calls with proper shutdown for
 softmmu
Date: Thu,  7 Sep 2023 13:26:40 +0200
Message-Id: <20230907112640.292104-6-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907112640.292104-1-chigot@adacore.com>
References: <20230907112640.292104-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x433.google.com
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


