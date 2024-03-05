Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9550C54798
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 12:17:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhTer-00060w-9e; Tue, 05 Mar 2024 07:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhTdT-00023d-LH
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 07:11:08 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhTcr-0001Wi-AC
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 07:11:06 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5131c0691feso7112340e87.1
 for <qemu-riscv@nongnu.org>; Tue, 05 Mar 2024 04:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709640623; x=1710245423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=si4aR9NfjrmIkwaCSp8Q5XtDAxgYAPx/w5B7UtqWjho=;
 b=DjAAfgbkXid8Jvq6ps+FrrYz/20f0pvH+z/1MU9sm2QKSYxp/aj83sYZPpHkcGj9zB
 jwp3PilAYwnV4fvio7ZQ49VyPPriPuOLzsPINkXrhg63/IzIzeXlEK65rF3OIZhy4IJ/
 wGa0kkCk5NWYfKbGVXX4Et0s8NEL022922HTkGXO45B4KL0nMcbf9rlqMDAhaWjacaJ+
 X75Ydri2WX42KY52i30S6GmokH2pVpHTgaZ3l9LnoAMJNX3wDzEF2kn/+COD7XubdjDD
 Zng3Au8eeJIWyplOAJ/EJZnlkxLGs2y1GPKJHBMowfEG1QuuYhH6sxhE36HO4RPZUXN6
 oZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709640623; x=1710245423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=si4aR9NfjrmIkwaCSp8Q5XtDAxgYAPx/w5B7UtqWjho=;
 b=hSziQJI5b39QgQwYUu3h/pm3RGrYH2C8Rk+0uaXBQ/yrv7Bv41Cr2S7jhZ+InV47cA
 uFZ0NMFeMPJP0VQzfwu44aEB4f/7HE5+uRLGLbK83ZTdQNmJGxrFwIFXyFzTSQlEFLzx
 UFlBAoX1dUAp3T+1B9DvjO0GYRrxyW/c4eWlFP5BUrH+wrhYH2qvoMpoEpVZ23I44NNQ
 I0rQAC4EIqsU4r9BXqGF8+Yv6JL+UlxeMfMCJcILf68vyIjUIQ8d80mYTfQsSoiJFwbf
 rqqGTmG7Y4HM+u/mW1IHmA2N3pMNLazXfyv/7M/zZgN0k+kpimtaQzwOqegd5v82Zczq
 ncwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViSmt04HXaehmNuyFzkglwSmU9IRJqWhuU4Ko9ttaha2ThgVDQ2YE+l4F/Hyz7asvodyA0Z+/Wef3+Vz7JjAUwG9TSsyw=
X-Gm-Message-State: AOJu0YzwF7JuD+bNiEecENchOZzkDbuPRCfpFxFXXdcDw0cAcpvqzuVM
 DXZtVsxkaOYERdUEI1xAYaNc/cWw3tLGqZ2Y6v12uUKmbGEgSkbyo6eImvn9bq0=
X-Google-Smtp-Source: AGHT+IGGF4YSwijsmfFzPsi+Kumnb9yXuKRux5ssF5J9Y8pyMD69wuVgpPZpBxiLmtDbzc66aVpc1A==
X-Received: by 2002:a05:6512:78:b0:512:a966:eb5 with SMTP id
 i24-20020a056512007800b00512a9660eb5mr1030745lfo.21.1709640622984; 
 Tue, 05 Mar 2024 04:10:22 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bu16-20020a056000079000b0033dc3f3d689sm14939377wrb.93.2024.03.05.04.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:10:19 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9BEBA5F9F3;
 Tue,  5 Mar 2024 12:10:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Brad Smith <brad@comstyle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Warner Losh <imp@bsdimp.com>, qemu-riscv@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 23/29] contrib/plugins/howvec: migrate to new per_vcpu API
Date: Tue,  5 Mar 2024 12:09:59 +0000
Message-Id: <20240305121005.3528075-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240304130036.124418-11-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/howvec.c | 53 ++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 644a7856bb2..2d10c87e0fb 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -43,13 +43,13 @@ typedef struct {
     uint32_t mask;
     uint32_t pattern;
     CountType what;
-    uint64_t count;
+    qemu_plugin_u64 count;
 } InsnClassExecCount;
 
 typedef struct {
     char *insn;
     uint32_t opcode;
-    uint64_t count;
+    qemu_plugin_u64 count;
     InsnClassExecCount *class;
 } InsnExecCount;
 
@@ -159,7 +159,9 @@ static gint cmp_exec_count(gconstpointer a, gconstpointer b)
 {
     InsnExecCount *ea = (InsnExecCount *) a;
     InsnExecCount *eb = (InsnExecCount *) b;
-    return ea->count > eb->count ? -1 : 1;
+    uint64_t count_a = qemu_plugin_u64_sum(ea->count);
+    uint64_t count_b = qemu_plugin_u64_sum(eb->count);
+    return count_a > count_b ? -1 : 1;
 }
 
 static void free_record(gpointer data)
@@ -167,12 +169,14 @@ static void free_record(gpointer data)
     InsnExecCount *rec = (InsnExecCount *) data;
     g_free(rec->insn);
     g_free(rec);
+    qemu_plugin_scoreboard_free(rec->count.score);
 }
 
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
     g_autoptr(GString) report = g_string_new("Instruction Classes:\n");
     int i;
+    uint64_t total_count;
     GList *counts;
     InsnClassExecCount *class = NULL;
 
@@ -180,11 +184,12 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         class = &class_table[i];
         switch (class->what) {
         case COUNT_CLASS:
-            if (class->count || verbose) {
+            total_count = qemu_plugin_u64_sum(class->count);
+            if (total_count || verbose) {
                 g_string_append_printf(report,
                                        "Class: %-24s\t(%" PRId64 " hits)\n",
                                        class->class,
-                                       class->count);
+                                       total_count);
             }
             break;
         case COUNT_INDIVIDUAL:
@@ -212,7 +217,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                    "Instr: %-24s\t(%" PRId64 " hits)"
                                    "\t(op=0x%08x/%s)\n",
                                    rec->insn,
-                                   rec->count,
+                                   qemu_plugin_u64_sum(rec->count),
                                    rec->opcode,
                                    rec->class ?
                                    rec->class->class : "un-categorised");
@@ -221,6 +226,12 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     }
 
     g_hash_table_destroy(insns);
+    for (i = 0; i < ARRAY_SIZE(class_tables); i++) {
+        for (int j = 0; j < class_tables[i].table_sz; ++j) {
+            qemu_plugin_scoreboard_free(class_tables[i].table[j].count.score);
+        }
+    }
+
 
     qemu_plugin_outs(report->str);
 }
@@ -232,11 +243,12 @@ static void plugin_init(void)
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
-    uint64_t *count = (uint64_t *) udata;
-    (*count)++;
+    struct qemu_plugin_scoreboard *score = udata;
+    qemu_plugin_u64_add(qemu_plugin_scoreboard_u64(score), cpu_index, 1);
 }
 
-static uint64_t *find_counter(struct qemu_plugin_insn *insn)
+static struct qemu_plugin_scoreboard *find_counter(
+    struct qemu_plugin_insn *insn)
 {
     int i;
     uint64_t *cnt = NULL;
@@ -265,7 +277,7 @@ static uint64_t *find_counter(struct qemu_plugin_insn *insn)
     case COUNT_NONE:
         return NULL;
     case COUNT_CLASS:
-        return &class->count;
+        return class->count.score;
     case COUNT_INDIVIDUAL:
     {
         InsnExecCount *icount;
@@ -279,13 +291,16 @@ static uint64_t *find_counter(struct qemu_plugin_insn *insn)
             icount->opcode = opcode;
             icount->insn = qemu_plugin_insn_disas(insn);
             icount->class = class;
+            struct qemu_plugin_scoreboard *score =
+                qemu_plugin_scoreboard_new(sizeof(uint64_t));
+            icount->count = qemu_plugin_scoreboard_u64(score);
 
             g_hash_table_insert(insns, GUINT_TO_POINTER(opcode),
                                 (gpointer) icount);
         }
         g_mutex_unlock(&lock);
 
-        return &icount->count;
+        return icount->count.score;
     }
     default:
         g_assert_not_reached();
@@ -300,14 +315,14 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
     size_t i;
 
     for (i = 0; i < n; i++) {
-        uint64_t *cnt;
         struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
-        cnt = find_counter(insn);
+        struct qemu_plugin_scoreboard *cnt = find_counter(insn);
 
         if (cnt) {
             if (do_inline) {
-                qemu_plugin_register_vcpu_insn_exec_inline(
-                    insn, QEMU_PLUGIN_INLINE_ADD_U64, cnt, 1);
+                qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+                    insn, QEMU_PLUGIN_INLINE_ADD_U64,
+                    qemu_plugin_scoreboard_u64(cnt), 1);
             } else {
                 qemu_plugin_register_vcpu_insn_exec_cb(
                     insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS, cnt);
@@ -322,6 +337,14 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 {
     int i;
 
+    for (i = 0; i < ARRAY_SIZE(class_tables); i++) {
+        for (int j = 0; j < class_tables[i].table_sz; ++j) {
+            struct qemu_plugin_scoreboard *score =
+                qemu_plugin_scoreboard_new(sizeof(uint64_t));
+            class_tables[i].table[j].count = qemu_plugin_scoreboard_u64(score);
+        }
+    }
+
     /* Select a class table appropriate to the guest architecture */
     for (i = 0; i < ARRAY_SIZE(class_tables); i++) {
         ClassSelector *entry = &class_tables[i];
-- 
2.39.2


