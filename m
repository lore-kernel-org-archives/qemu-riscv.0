Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391C4C04E69
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:01:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHvr-0004WD-DS; Wed, 16 Aug 2023 10:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHvo-00041o-B8
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:55:32 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHvk-0002Ht-SI
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:55:32 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6887ccba675so603023b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197727; x=1692802527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FeKiYP9xrSKexWAO9b8A0nNhOs6FhnCu3ht5OqePfRY=;
 b=QOSq8rSMJwCw4yT4RfS9VQKbsGnKKehRFFaAay8FJlNj+QmUEgOYx51+RRipyd2e+e
 QhrJ1+xX1tm7EFsLJ2GT/iY48GrfpaRQqt1cieHhxtHUut497ZSmhmoRw605pv+Mlx6W
 /Y7w6CSKdWxoRwhRiO9E5EyX5jxFhRgqRDsJmlbbRPz9+KNv1JHQN+YBcMN20yemn348
 sbkgLmE5nQuaDC/TEmywgnUJbaIsGTUoUlQAIXw5x81t0RAJUu6tA1Q1404pu8chbMZP
 if1Vrfb0majla/SBGZFm782mFxEUJANdiXfnSpbG9kpo1/idiPdscn4D1lDi7NeeZbTN
 Lgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692197727; x=1692802527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FeKiYP9xrSKexWAO9b8A0nNhOs6FhnCu3ht5OqePfRY=;
 b=VCsOHuqYIPtILf9xVkfIWJira7+9Yg5CB/TehweSZgqjprakjlBEm5DSx0tzzm9xLp
 QGAHdfXM/GK+hCnXESCtA6Ql4NUGxxGFqfwuEOKlhHSxpH5a0QEY/W6F6tReRdo2fOu8
 4OV0bdwRI4pfIgLkTk+fWDGpoN3nLzottzWa2iwt7M82jozcR4zuilWaaiDMutmoBMgj
 eKKz0jFSFAy/TZfI78UEBTdoDka8jj7G7190RyMN5uLCjVsGjVDEXPTIUwvugRpY9eOU
 bR8pLGHQr7nSJ+4z6CVg27xBUGWXmqU927tSzYRLy7K9YJBbbmglGV9PlRWAdHKd7tWc
 mRoQ==
X-Gm-Message-State: AOJu0YwNjYfc4rZqJ6VhZETkJ+njP78EMDFjzHy1dBov0kTfhBv6QLc2
 kxsX3fHjWjGE5tgZ6QGGv78i+g==
X-Google-Smtp-Source: AGHT+IFJPQo0CowNAlPgDFOH/Tnco/aRBZ747oI79WYdwq3oVrGEE5tawYIyCoDbuI9xrw7iAk4seA==
X-Received: by 2002:a05:6300:8082:b0:12f:1f1f:b506 with SMTP id
 ap2-20020a056300808200b0012f1f1fb506mr1843860pzc.21.1692197727672; 
 Wed, 16 Aug 2023 07:55:27 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:55:27 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 20/25] gdbstub: Expose functions to read registers
Date: Wed, 16 Aug 2023 23:51:41 +0900
Message-ID: <20230816145155.21049-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

gdb_foreach_feature() enumerates features that are useful to identify
registers. gdb_read_register() actually reads registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h |  6 ++++++
 gdbstub/gdbstub.c      | 38 ++++++++++++++++++++++++++++++--------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 5cba2933d2..151e9e81c6 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -59,6 +59,12 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
+void gdb_foreach_feature(CPUState *cpu,
+                         void (* callback)(void *, const GDBFeature *, int),
+                         void *opaque);
+
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg, bool has_xml);
+
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 5974af7c8f..e395a58db4 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -483,14 +483,32 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname)
     abort();
 }
 
-static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
+void gdb_foreach_feature(CPUState *cpu,
+                         void (* callback)(void *, const GDBFeature *, int),
+                         void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    GDBRegisterState *r;
+
+    if (!cc->gdb_core_feature) {
+        return;
+    }
+
+    callback(opaque, cc->gdb_core_feature, 0);
+
+    for (r = cpu->gdb_regs; r; r = r->next) {
+        callback(opaque, r->feature, r->base_reg);
+    }
+}
+
+int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg, bool has_xml)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUArchState *env = cpu->env_ptr;
     GDBRegisterState *r;
 
     if (reg < cc->gdb_num_core_regs) {
-        return cc->gdb_read_register(cpu, buf, reg, gdb_has_xml);
+        return cc->gdb_read_register(cpu, buf, reg, has_xml);
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
@@ -501,14 +519,15 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     return 0;
 }
 
-static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
+static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg,
+                              bool has_xml)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUArchState *env = cpu->env_ptr;
     GDBRegisterState *r;
 
     if (reg < cc->gdb_num_core_regs) {
-        return cc->gdb_write_register(cpu, mem_buf, reg, gdb_has_xml);
+        return cc->gdb_write_register(cpu, mem_buf, reg, has_xml);
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
@@ -1134,7 +1153,7 @@ static void handle_set_reg(GArray *params, void *user_ctx)
     reg_size = strlen(get_param(params, 1)->data) / 2;
     gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
     gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf->data,
-                       get_param(params, 0)->val_ull);
+                       get_param(params, 0)->val_ull, gdb_has_xml);
     gdb_put_packet("OK");
 }
 
@@ -1154,7 +1173,8 @@ static void handle_get_reg(GArray *params, void *user_ctx)
 
     reg_size = gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 get_param(params, 0)->val_ull);
+                                 get_param(params, 0)->val_ull,
+                                 gdb_has_xml);
     if (!reg_size) {
         gdb_put_packet("E14");
         return;
@@ -1241,7 +1261,8 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
     for (reg_id = 0;
          reg_id < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          reg_id++) {
-        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, reg_id);
+        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, reg_id,
+                                      gdb_has_xml);
         len -= reg_size;
         registers += reg_size;
     }
@@ -1259,7 +1280,8 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
     for (reg_id = 0; reg_id < gdbserver_state.g_cpu->gdb_num_g_regs; reg_id++) {
         len += gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 reg_id);
+                                 reg_id,
+                                 gdb_has_xml);
     }
     g_assert(len == gdbserver_state.mem_buf->len);
 
-- 
2.41.0


