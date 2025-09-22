Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF84ACAC5A7
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:44:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d5m-0005jy-Ks; Mon, 22 Sep 2025 05:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d52-0005In-BU
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:43:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d4o-00020N-G9
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:43:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46cbdf513d7so9953075e9.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758534196; x=1759138996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xka3pneMH2qFxqRVxyDw79VsTx+gMXoNji+Y4GSMTqs=;
 b=tEyTOQfbIqxEBM68XpojlbCSsx5xe383/w1q5GxhNL1kmVFswctE1z/JUYMuuyl8HA
 PovVGMNtb9evrn4TVV2YvPsZPkjXQNvKVR9RaTlOGheaV87mWa+hY+dFpGgXI+jCpusV
 bZlb0YDqO7EL7ZvTXKc3fdYi+hDCzwkjUbI5uuBU/dt0SJ/Bvy8DJyTVdJY8nLd+t6iw
 /vTbmIAIXujUuN5bNKOkT8fgLilygFAkOUgBPs7dH7dy+t/KIWrt96MYTVOlayfRj2F0
 /RCWSDKLzUFHr6FCTVTwWQeoLfo4FMiyumcD4QB/IjxQ6uhXvfYrsl0K8UJmvO2WFABg
 SMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534196; x=1759138996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xka3pneMH2qFxqRVxyDw79VsTx+gMXoNji+Y4GSMTqs=;
 b=UVSthyKFtM6MzAcrLqQFsg/Xuld/bJuRvRNLP2pq2VO89MyB03e/NHulHTNx94YxmF
 oknMnyBZ/2j5/v/8bfcrV2D1zvXCjkDxbAo6PTiNcmBOUs1VtWHaqGfmrfMEL1kib4rx
 NDfisehrv4nhEPX8FsnC/xpsOmmW0EoI3ajUw/lC0TxKgoeYy75SUoublNCXdF3KH53c
 BcOUHULfFtWMLkX0Jcuvr6Qad5IdH/HmSdMYGnDuQKItTAISeuESIA9A3PEcy4PT5XBF
 hz7OMeVj3OLiJGfSdMgydnn4xNEIQ/1oq5FAwJZyICJM2Y/I52bQuq5o/CfbO9O795a/
 fgDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg53pBzhCevikyZ9bE/dlYPZpKiGj3TLw1iShgXrgXlNtriaBJ4fOr8e2SHdqha9a8/LP5VZvidfJf@nongnu.org
X-Gm-Message-State: AOJu0Yxi0QIQ4E20EBzNLQdALajepzqBJzi+wuUl6DsPcI8zKYz1FtSL
 u1qWI94ZjG8GQp/OBVLqDdyFnprNxzAJ8n9HO/+GZLPoaGG36Q/jFzJq+oTS6O+ZA7M=
X-Gm-Gg: ASbGncsX7WvHEQnDRCezwrCHIvwcpp0quoGMDMavrMvRcriblkZAMwf7fClORhL0kxL
 JmDnB7PbBqTBARUs1cLa7vsh5bLmcMlE19FZrG7gqfjAIUGHJID3i9QmL5E9zXIUpZ4S2PI760r
 PnD75KrmI48AkpreZCmvTeOEHQejWoYhQdbw982CgulJJX18mcjg2yKSYdCSSeCPYXrhnZpd33D
 P0LgOvuSYUJuoZetzSp40w5h2mU3S41gKZNbEQPdBXZ5Mowm8CHfgZjE9QEyRAwPyMyi08PZah4
 uXntmy2EGn4z45bU84N6zoNUv6VujoZJVyOX3TGbVYFo9sITXDqEYUYEy1K918AGjWkFUPyLq/E
 36W5CN1rYfqQ8Xcd/cSYexQ8=
X-Google-Smtp-Source: AGHT+IF9euK6P/jVSKmTMYqDnTu7Pa+8D/t3miko6mM1UHE+U/WgS/i4aGQZMAkNCSbkFIvJ9QqFQw==
X-Received: by 2002:a5d:5d0b:0:b0:400:c7c0:52af with SMTP id
 ffacd0b85a97d-400c7c052d6mr1177801f8f.1.1758534195638; 
 Mon, 22 Sep 2025 02:43:15 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464eadd7e11sm205573335e9.0.2025.09.22.02.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:43:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B93785FA5C;
 Mon, 22 Sep 2025 10:37:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 23/25] contrib/plugins/uftrace: implement x64 support
Date: Mon, 22 Sep 2025 10:37:08 +0100
Message-ID: <20250922093711.2768983-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

It's trivial to implement x64 support, as it's the same stack layout
as aarch64.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250902075042.223990-8-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/uftrace.c | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/contrib/plugins/uftrace.c b/contrib/plugins/uftrace.c
index 2386cc723bc..b7d6124d2f5 100644
--- a/contrib/plugins/uftrace.c
+++ b/contrib/plugins/uftrace.c
@@ -82,6 +82,21 @@ typedef struct {
     struct qemu_plugin_register *reg_scr_el3;
 } Aarch64Cpu;
 
+typedef enum {
+    X64_RING0,
+    X64_RING1,
+    X64_RING2,
+    X64_RING3,
+    X64_REAL_MODE,
+    X64_PRIVILEGE_LEVEL_MAX,
+} X64PrivilegeLevel;
+
+typedef struct {
+    struct qemu_plugin_register *reg_rbp;
+    struct qemu_plugin_register *reg_cs;
+    struct qemu_plugin_register *reg_cr0;
+} X64Cpu;
+
 typedef struct {
     uint64_t timestamp;
     uint64_t data;
@@ -570,6 +585,75 @@ static CpuOps aarch64_ops = {
     .does_insn_modify_frame_pointer = aarch64_does_insn_modify_frame_pointer,
 };
 
+static uint8_t x64_num_privilege_levels(void)
+{
+    return X64_PRIVILEGE_LEVEL_MAX;
+}
+
+static const char *x64_get_privilege_level_name(uint8_t pl)
+{
+    switch (pl) {
+    case X64_RING0: return "Ring0";
+    case X64_RING1: return "Ring1";
+    case X64_RING2: return "Ring2";
+    case X64_RING3: return "Ring3";
+    case X64_REAL_MODE: return "RealMode";
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint8_t x64_get_privilege_level(Cpu *cpu_)
+{
+    X64Cpu *cpu = cpu_->arch;
+    uint64_t cr0 = cpu_read_register64(cpu_, cpu->reg_cr0);
+    uint64_t protected_mode = (cr0 >> 0) & 0b1;
+    if (!protected_mode) {
+        return X64_REAL_MODE;
+    }
+    uint32_t cs = cpu_read_register32(cpu_, cpu->reg_cs);
+    uint32_t ring_level = (cs >> 0) & 0b11;
+    return ring_level;
+}
+
+static uint64_t x64_get_frame_pointer(Cpu *cpu_)
+{
+    X64Cpu *cpu = cpu_->arch;
+    return cpu_read_register64(cpu_, cpu->reg_rbp);
+}
+
+static void x64_init(Cpu *cpu_)
+{
+    X64Cpu *cpu = g_new0(X64Cpu, 1);
+    cpu_->arch = cpu;
+    cpu->reg_rbp = plugin_find_register("rbp");
+    g_assert(cpu->reg_rbp);
+    cpu->reg_cs = plugin_find_register("cs");
+    g_assert(cpu->reg_cs);
+    cpu->reg_cr0 = plugin_find_register("cr0");
+    g_assert(cpu->reg_cr0);
+}
+
+static void x64_end(Cpu *cpu)
+{
+    g_free(cpu->arch);
+}
+
+static bool x64_does_insn_modify_frame_pointer(const char *disas)
+{
+    return strstr(disas, "rbp");
+}
+
+static CpuOps x64_ops = {
+    .init = x64_init,
+    .end = x64_end,
+    .get_frame_pointer = x64_get_frame_pointer,
+    .get_privilege_level = x64_get_privilege_level,
+    .num_privilege_levels = x64_num_privilege_levels,
+    .get_privilege_level_name = x64_get_privilege_level_name,
+    .does_insn_modify_frame_pointer = x64_does_insn_modify_frame_pointer,
+};
+
 static void track_privilege_change(unsigned int cpu_index, void *udata)
 {
     Cpu *cpu = qemu_plugin_scoreboard_find(score, cpu_index);
@@ -777,6 +861,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     if (!strcmp(info->target_name, "aarch64")) {
         arch_ops = aarch64_ops;
+    } else if (!strcmp(info->target_name, "x86_64")) {
+        arch_ops = x64_ops;
     } else {
         fprintf(stderr, "plugin uftrace: %s target is not supported\n",
                 info->target_name);
-- 
2.47.3


