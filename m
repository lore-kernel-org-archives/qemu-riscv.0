Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521E9CD610B
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:47:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptPO-00047O-BG; Mon, 09 Oct 2023 12:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptOj-00036w-6B
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptOY-0003Vb-1D
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so4716945f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869972; x=1697474772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AXsIaPlw697csDZKVxpgSKxnEOgDlwUYCcbw2vSXSnQ=;
 b=xkdCj8Uqt9yM9Aacw+1muk2ltnN41WTP4IrjswDWZe/SeLZisqGbV1PO5kyiCD1pxB
 bDES4OgaXLYEV6EtTccdVFvF/veE7lH/JE4/pWr/XK2YRBK7w1c3/lZr4OhpXe4mPDiD
 2KpxwaKKg8MH4F6ahyQRU0MOCUYaQ0gkylIfrKnSNIYXGsd0C6qqiAvzsdwMwunrry0O
 eXSzhhXSn6MmKujl+LeZhUJ1QWd59pU2GPsOFIkq2ylVcRZkAVn/SK9XEx1QkrIV7fSf
 c9ijlBPdluiMFl7qsy3pBYyoGYBSOxiIgO+QMx56VN18GsgzZQNTLZXsZMiTe4q+d+y+
 12+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869972; x=1697474772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AXsIaPlw697csDZKVxpgSKxnEOgDlwUYCcbw2vSXSnQ=;
 b=Hu4y3Fig87Qda2iSZXurRmg7n6XTeya+zNxs3lddHkZBjkS2OpxdRWu6nNZR2KmDbr
 TxxCWVwObbsx0TsdC3Zyvq27cI2fHyeFTTv3Xp8CIyq9hWSgr1Yvr3JZKqOqwu3amHxQ
 HulQJFORDIPUOTU40EQbXjKEctGgw8xJpiUlYqUAa3GhhuUkEaDLybMxfNE1aUrmJzQo
 TQqdSTYPRfGDX7PXC1ULoB68bFlaB0OL3eBFEbs8kp3zjczmDwEuRqtR4Tq53XEFeSjs
 UdEupkZCUNEHlpMjbx1/BZ2CcJv2O+7kfJMeN+xgYElm71Q4lGnK2TzuSEGmtXcpnerE
 Vytw==
X-Gm-Message-State: AOJu0YwZtc2x+2WW/UYVQrdc+L8OUgT9kOQzWsIQY/7hxdtlLogycKpN
 c5Zplr7VIrLAlOX+L3vjpxnPcg==
X-Google-Smtp-Source: AGHT+IFVAlSAXPJ4iA6QXsv8ovWSjbBxh55y7Wr5lmBTEnh476/JO49iZS/guKgxTrZx9wMzzjNRqA==
X-Received: by 2002:adf:e8ca:0:b0:324:7a6b:d504 with SMTP id
 k10-20020adfe8ca000000b003247a6bd504mr16038626wrn.4.1696869972395; 
 Mon, 09 Oct 2023 09:46:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a056000118700b003143c9beeaesm10086534wrx.44.2023.10.09.09.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:46:11 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61B151FFCB;
 Mon,  9 Oct 2023 17:41:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 19/25] gdbstub: Replace gdb_regs with an array
Date: Mon,  9 Oct 2023 17:40:58 +0100
Message-Id: <20231009164104.369749-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

An array is a more appropriate data structure than a list for gdb_regs
since it is initialized only with append operation and read-only after
initialization.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230912224107.29669-13-akihiko.odaki@daynix.com>
[AJB: fixed a checkpatch violation]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h |  2 +-
 gdbstub/gdbstub.c     | 35 +++++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 7b8347ed5a..3968369554 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -502,7 +502,7 @@ struct CPUState {
 
     CPUJumpCache *tb_jmp_cache;
 
-    struct GDBRegisterState *gdb_regs;
+    GArray *gdb_regs;
     int gdb_num_regs;
     int gdb_num_g_regs;
     QTAILQ_ENTRY(CPUState) node;
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 62608a5389..b1532118d1 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -51,7 +51,6 @@ typedef struct GDBRegisterState {
     gdb_get_reg_cb get_reg;
     gdb_set_reg_cb set_reg;
     const char *xml;
-    struct GDBRegisterState *next;
 } GDBRegisterState;
 
 GDBState gdbserver_state;
@@ -386,7 +385,8 @@ static const char *get_feature_xml(const char *p, const char **newp,
                 xml,
                 g_markup_printf_escaped("<xi:include href=\"%s\"/>",
                                         cc->gdb_core_xml_file));
-            for (r = cpu->gdb_regs; r; r = r->next) {
+            for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+                r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
                 g_ptr_array_add(
                     xml,
                     g_markup_printf_escaped("<xi:include href=\"%s\"/>",
@@ -430,7 +430,8 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
         return cc->gdb_read_register(cpu, buf, reg);
     }
 
-    for (r = cpu->gdb_regs; r; r = r->next) {
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
         if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
             return r->get_reg(env, buf, reg - r->base_reg);
         }
@@ -448,7 +449,8 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
         return cc->gdb_write_register(cpu, mem_buf, reg);
     }
 
-    for (r = cpu->gdb_regs; r; r = r->next) {
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
         if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
             return r->set_reg(env, mem_buf, reg - r->base_reg);
         }
@@ -461,17 +463,23 @@ void gdb_register_coprocessor(CPUState *cpu,
                               int num_regs, const char *xml, int g_pos)
 {
     GDBRegisterState *s;
-    GDBRegisterState **p;
-
-    p = &cpu->gdb_regs;
-    while (*p) {
-        /* Check for duplicates.  */
-        if (strcmp((*p)->xml, xml) == 0)
-            return;
-        p = &(*p)->next;
+    guint i;
+
+    if (cpu->gdb_regs) {
+        for (i = 0; i < cpu->gdb_regs->len; i++) {
+            /* Check for duplicates.  */
+            s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+            if (strcmp(s->xml, xml) == 0) {
+                return;
+            }
+        }
+    } else {
+        cpu->gdb_regs = g_array_new(false, false, sizeof(GDBRegisterState));
+        i = 0;
     }
 
-    s = g_new0(GDBRegisterState, 1);
+    g_array_set_size(cpu->gdb_regs, i + 1);
+    s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
     s->base_reg = cpu->gdb_num_regs;
     s->num_regs = num_regs;
     s->get_reg = get_reg;
@@ -480,7 +488,6 @@ void gdb_register_coprocessor(CPUState *cpu,
 
     /* Add to end of list.  */
     cpu->gdb_num_regs += num_regs;
-    *p = s;
     if (g_pos) {
         if (g_pos != s->base_reg) {
             error_report("Error: Bad gdb register numbering for '%s', "
-- 
2.39.2


