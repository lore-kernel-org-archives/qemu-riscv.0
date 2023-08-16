Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1ACC001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 14:54:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHus-0001ne-Ut; Wed, 16 Aug 2023 10:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHur-0001k0-Kq
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:54:33 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHup-0001p9-8q
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:54:33 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68876bbecb6so1087300b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197670; x=1692802470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LoU2pS/znq+kjt+yrgvrxMpANXrwQzKAPttvmhpfpts=;
 b=p7h56q3CN2y8bvdvqL0phOohINho2V/FibzQb1lltju1EiT2zLmC1HQ9pizZMKV3+7
 i2aFlBgr4o6wwf6zp1FuC9yndANOhYBWTu6/+iMev76NiZqPnbKvDhOIqDD6c9DRdWVW
 sW84MGflqovhFBaAEc2BMD7NJbj1UpXGPidJR6pLK9FKNZ0PvkakGuPRyR0262PWz4lV
 w4v02iB1E4qWovAAB0ETkgcAnYDQi+sejEqU9FKNRUSZUZDhJkuooxxC66MLA84y8+bt
 PLVTLcc/kUEYy2IKX8YzINp0TKWSYCr+JFtjYXMno2+2+XOD2tJhmEAGZXzbjTIEcYO8
 5b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692197670; x=1692802470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoU2pS/znq+kjt+yrgvrxMpANXrwQzKAPttvmhpfpts=;
 b=AAIOPN0RgmYLm51Hf3TeXIC6zWQA3h2CFWSjgyHCiNxlIte0dcIZHV4Opsjk0JIzD/
 V5jI6p+jaKFFrlk8Ne23r9t+kMdAxnzlOoUpHMyur8qf7cjqdSGPk7dBasBVXDbb68P5
 Ix/HYSs3wWHZhnIx4waj84ZWc9XdI3ND2KtqOpEQneyuSTdiq6BO/GryrB7JChEzpHcD
 70O185pcFx0dfvVEkbC7TCyyEMVtQDx0FME4sRs1AbPkhllN+kGskiPBv9+5o3iCSHDG
 sc9oVxqtVu0rSyEYFIcc81eXP0jZJnkGoRNRzekqFXDytKTqm4D+nTiIFmojsKYmQ8oW
 b3ZQ==
X-Gm-Message-State: AOJu0Yz2CZO5NoEdEJQp4CODQKx0FCPnTpR/166LT5yeWouzYhnk5oPA
 hB28sVDEZdHDbgMs5YQONG+mPg==
X-Google-Smtp-Source: AGHT+IFv0NlGFErZfdbOhCNMu5daHrtilRFSc7CzUk7SLsVwSyRnmZ/wL9gOiGBfSe0fbHUPZ2Zljw==
X-Received: by 2002:a05:6a00:ad2:b0:668:711a:7d93 with SMTP id
 c18-20020a056a000ad200b00668711a7d93mr2147423pfl.19.1692197670102; 
 Wed, 16 Aug 2023 07:54:30 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:54:29 -0700 (PDT)
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
Subject: [PATCH v4 14/25] gdbstub: Dynamically allocate target.xml buffer
Date: Wed, 16 Aug 2023 23:51:35 +0900
Message-ID: <20230816145155.21049-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

There is no guarantee that target.xml fits in 1024 bytes, and the fixed
buffer length requires tedious buffer overflow check. Dynamically
allocate the target.xml buffer to resolve these problems.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/internals.h |  2 +-
 gdbstub/gdbstub.c   | 44 ++++++++++++++++++++++++--------------------
 gdbstub/softmmu.c   |  2 +-
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index f2b46cce41..4876ebd74f 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -33,7 +33,7 @@ typedef struct GDBProcess {
     uint32_t pid;
     bool attached;
 
-    char target_xml[1024];
+    char *target_xml;
 } GDBProcess;
 
 enum RSState {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index c2ce970c98..452b5bf0ef 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -366,33 +366,37 @@ static const char *get_feature_xml(const char *p, const char **newp,
 
     name = NULL;
     if (strncmp(p, "target.xml", len) == 0) {
-        char *buf = process->target_xml;
-        const size_t buf_sz = sizeof(process->target_xml);
-
         /* Generate the XML description for this CPU.  */
-        if (!buf[0]) {
+        if (!process->target_xml) {
+            g_autoptr(GPtrArray) a = g_ptr_array_new_with_free_func(g_free);
             GDBRegisterState *r;
 
-            pstrcat(buf, buf_sz,
-                    "<?xml version=\"1.0\"?>"
-                    "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
-                    "<target>");
+            g_ptr_array_add(
+                a,
+                g_strdup("<?xml version=\"1.0\"?>"
+                         "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
+                         "<target>"));
             if (cc->gdb_arch_name) {
-                pstrcat(buf, buf_sz, "<architecture>");
-                pstrcat(buf, buf_sz, cc->gdb_arch_name(cpu));
-                pstrcat(buf, buf_sz, "</architecture>");
+                g_ptr_array_add(
+                    a,
+                    g_markup_printf_escaped("<architecture>%s</architecture>",
+                                            cc->gdb_arch_name(cpu)));
             }
-            pstrcat(buf, buf_sz, "<xi:include href=\"");
-            pstrcat(buf, buf_sz, cc->gdb_core_feature->xmlname);
-            pstrcat(buf, buf_sz, "\"/>");
+            g_ptr_array_add(
+                a,
+                g_markup_printf_escaped("<xi:include href=\"%s\"/>",
+                                        cc->gdb_core_feature->xmlname));
             for (r = cpu->gdb_regs; r; r = r->next) {
-                pstrcat(buf, buf_sz, "<xi:include href=\"");
-                pstrcat(buf, buf_sz, r->feature->xmlname);
-                pstrcat(buf, buf_sz, "\"/>");
+                g_ptr_array_add(
+                    a,
+                    g_markup_printf_escaped("<xi:include href=\"%s\"/>",
+                                            r->feature->xmlname));
             }
-            pstrcat(buf, buf_sz, "</target>");
+            g_ptr_array_add(a, g_strdup("</target>"));
+            g_ptr_array_add(a, NULL);
+            process->target_xml = g_strjoinv(NULL, (void *)a->pdata);
         }
-        return buf;
+        return process->target_xml;
     }
     if (cc->gdb_get_dynamic_xml) {
         char *xmlname = g_strndup(p, len);
@@ -2270,6 +2274,6 @@ void gdb_create_default_process(GDBState *s)
     process = &s->processes[s->process_num - 1];
     process->pid = pid;
     process->attached = false;
-    process->target_xml[0] = '\0';
+    process->target_xml = NULL;
 }
 
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index f509b7285d..5282324764 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -293,7 +293,7 @@ static int find_cpu_clusters(Object *child, void *opaque)
         assert(cluster->cluster_id != UINT32_MAX);
         process->pid = cluster->cluster_id + 1;
         process->attached = false;
-        process->target_xml[0] = '\0';
+        process->target_xml = NULL;
 
         return 0;
     }
-- 
2.41.0


