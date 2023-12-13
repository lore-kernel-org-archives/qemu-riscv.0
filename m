Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1659C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 06:43:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDIwf-00084v-JF; Wed, 13 Dec 2023 01:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rDIwd-00082r-PK
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 01:42:11 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rDIwY-0005Ln-LF
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 01:42:08 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5e1a2253045so19480137b3.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 22:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449726; x=1703054526;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OAupFqc1JBzPkUxJAR+qiP/3aZYcWF4MicDMF8EiQdU=;
 b=zijNywKKVdyDwolS5b3pfIGIDmsDzYB9fP3MU/c9cAuRnTCT4CCuHgeKQqwUPRkuP9
 uyC3llzffZbsTG8jJdhO2N/hpD6KN6x19k84o1nIxbzX0oPY4YRSfN61d4UAjhiaAkEz
 Z/zbGW/yEr07xaj3W8DZRgwyEVorLrovTLnnG1K8Byb17HOVJ7h/47ai9Tx4Spouy745
 QKjjTLa2iuCs/24evMlQF2cu60ChYV7fpRwzAo4hV+QivInPla9nArV0Hd7oF3F6C/Vo
 gkS/wlQ/ztie+BXIWq/sInpSiylOTtA1BwlfCu+s8cDyw4JctS01rj3AopL+ev0So2Vp
 qZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702449726; x=1703054526;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAupFqc1JBzPkUxJAR+qiP/3aZYcWF4MicDMF8EiQdU=;
 b=ETPfy/VFWAmgB+5vzvyc2RUl1qFlxTlmA+Cxn5LtrAh+jNqv9H2QhfRR7K34wV+tmF
 JWSRwX5B0SCJGUl4DNgD0ZpvF1e3LISp+/xW+lE4MKM7OFi+pFgSeVWPA+N/bGyCgNca
 gI3vNTydb1GahCXGcDZ3VMMBw2PMhAFRSJ7O6sSOOOprTL/IVj3Eep0bGCz/Nt7FDsxW
 IDaVTWNBABE4fpl0ktp74H75j/bW6MZjJq/ewn2g2IzbuTM2p+a5fCSJr/+8K2rliBjF
 i1Rx556R65QZgsnKU5H9ojDiEyoF5ZMDMYSau0x3r8d5AAmHm7xNhN3sq142Xmy7pyOO
 a6Gg==
X-Gm-Message-State: AOJu0Yz0kd0A6tUMI6CZUuP2ZDIUVeVyN2dTQg25FmEznQKTO+NhGpz0
 XyecOI8gI+uF1EcsaQ7jiUNGEA==
X-Google-Smtp-Source: AGHT+IESOLNQJniqWJf1VGq3fudMOlCr1Vuv7DttmgTkagjY5mkXu8fPIIWNTeun9E/fBkSKtKAowg==
X-Received: by 2002:a81:8487:0:b0:5e2:6005:4d4 with SMTP id
 u129-20020a818487000000b005e2600504d4mr1251523ywf.8.1702449725699; 
 Tue, 12 Dec 2023 22:42:05 -0800 (PST)
Received: from localhost ([157.82.205.15]) by smtp.gmail.com with UTF8SMTPSA id
 k9-20020a170902c40900b001bc676df6a9sm9716213plk.132.2023.12.12.22.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 22:42:05 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:04 +0900
Subject: [PATCH v17 05/14] gdbstub: Use GDBFeature for GDBRegisterState
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231213-gdb-v17-5-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
Received-SPF: none client-ip=2607:f8b0:4864:20::112e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Simplify GDBRegisterState by replacing num_regs and xml members with
one member that points to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 068180c83c76..a80729436b66 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -47,10 +47,9 @@
 
 typedef struct GDBRegisterState {
     int base_reg;
-    int num_regs;
     gdb_get_reg_cb get_reg;
     gdb_set_reg_cb set_reg;
-    const char *xml;
+    const GDBFeature *feature;
 } GDBRegisterState;
 
 GDBState gdbserver_state;
@@ -391,7 +390,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
                     g_ptr_array_add(
                         xml,
                         g_markup_printf_escaped("<xi:include href=\"%s\"/>",
-                                                r->xml));
+                                                r->feature->xmlname));
                 }
             }
             g_ptr_array_add(xml, g_strdup("</target>"));
@@ -513,7 +512,7 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     if (cpu->gdb_regs) {
         for (guint i = 0; i < cpu->gdb_regs->len; i++) {
             r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+            if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
                 return r->get_reg(env, buf, reg - r->base_reg);
             }
         }
@@ -534,7 +533,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     if (cpu->gdb_regs) {
         for (guint i = 0; i < cpu->gdb_regs->len; i++) {
             r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+            if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
                 return r->set_reg(env, mem_buf, reg - r->base_reg);
             }
         }
@@ -553,7 +552,7 @@ void gdb_register_coprocessor(CPUState *cpu,
         for (i = 0; i < cpu->gdb_regs->len; i++) {
             /* Check for duplicates.  */
             s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (strcmp(s->xml, feature->xmlname) == 0) {
+            if (s->feature == feature) {
                 return;
             }
         }
@@ -565,10 +564,9 @@ void gdb_register_coprocessor(CPUState *cpu,
     g_array_set_size(cpu->gdb_regs, i + 1);
     s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
     s->base_reg = cpu->gdb_num_regs;
-    s->num_regs = feature->num_regs;
     s->get_reg = get_reg;
     s->set_reg = set_reg;
-    s->xml = feature->xml;
+    s->feature = feature;
 
     /* Add to end of list.  */
     cpu->gdb_num_regs += feature->num_regs;

-- 
2.43.0


