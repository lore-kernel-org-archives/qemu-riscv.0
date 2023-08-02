Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B977BC001DE
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:49:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qR7Xf-0006MD-QL; Wed, 02 Aug 2023 04:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qR7Xd-0006DB-Fh
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 04:49:13 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qR7Xa-0007Vj-HU
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 04:49:13 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686ba29ccb1so478365b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Aug 2023 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966149; x=1691570949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
 b=32iKauRLm81dMdupNHGvMeT0jcPCTs2ygcH6qGMBFC/EttM1MJZitTxUaJtFLsCECS
 nDjDMQ9PhulSU3lH/qEOj+I7DcwiunIKOlu5ogkiUbJYpBRy5Vn1B8LIINuz5Wdt51+r
 N9f/c++u7xCtFn2Z8aOZASMRn1+LaEttNIb/CVT2lg3jSpmuKvYMDW6a55ILoh4JYXda
 tOxozn4pLEwGIk71uMj2x9YC3KuDsdOAOe92R5uwwMybzGZgQoz3BMIFzooYwPbTX+Qn
 0vAY8AazAOtizEqZsEfOlefKV8N+Ucs6taGYeOvY+Ue+A0R2oCo3/IOT4OHbAlso2A7u
 TUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690966149; x=1691570949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
 b=WxXbuZidsVZk+YaByftHORXIhP91wtfJUHYYneLhXw/o7EXedmaR+ornakN/+8hmwu
 R7wwVUzOXCfg1jZai6EJRYdodMlFfQsj6ZivsCOzOFNdHxlPO/JbJziYT2RcxrA9jvTt
 aDtMDf9FEzuGMX/9LDt7ePeueVw7In7E3H4I4fguW5BS5AGPiyeYIKgMsSgxB6N9aer1
 3B85yH0AEhWg1ZWVVxYm3djieNXomLEX1VIKqjJwPhcMHA4gU6yG4kAF2OeEDqLq5/xu
 ZAcTUrLKOyVUmdifGuwTWFkboxcGw1m3lIhsAOHpd3rJMJJ6pGzU5UOffWGatcBEC7PE
 d9Dw==
X-Gm-Message-State: ABy/qLYdDGjLP1nR7Cg0HFyBOzcYmV3v1lut8CBzfUS0oLN4bV7uSMsP
 TLS2rFpqVRIqAVj85/KRzbee8w==
X-Google-Smtp-Source: APBJJlHOTYRm37ZBlokXGWWoGIFh/LaeDtcj+HzwoToZ0gPsZdSfjpIdmRQWrLaDADrsY5eJUpsINA==
X-Received: by 2002:a05:6a00:1f0f:b0:67a:72d5:3365 with SMTP id
 be15-20020a056a001f0f00b0067a72d53365mr16066677pfb.6.1690966149354; 
 Wed, 02 Aug 2023 01:49:09 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 01:49:09 -0700 (PDT)
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
Subject: [PATCH v2 16/24] target/ppc: Fill new members of GDBFeature
Date: Wed,  2 Aug 2023 17:46:04 +0900
Message-ID: <20230802084614.23619-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These members will be used to help plugins to identify registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/ppc/gdbstub.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 19c4935260..ac4ed12371 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -323,7 +323,7 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
     GString *xml;
-    char *spr_name;
+    const char **regs;
     unsigned int num_regs = 0;
     int i;
 
@@ -350,6 +350,7 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
         return;
     }
 
+    regs = g_new(const char *, num_regs);
     xml = g_string_new("<?xml version=\"1.0\"?>");
     g_string_append(xml, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append(xml, "<feature name=\"org.qemu.power.spr\">");
@@ -361,9 +362,8 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
             continue;
         }
 
-        spr_name = g_ascii_strdown(spr->name, -1);
-        g_string_append_printf(xml, "<reg name=\"%s\"", spr_name);
-        g_free(spr_name);
+        regs[spr->gdb_id] = g_ascii_strdown(spr->name, -1);
+        g_string_append_printf(xml, "<reg name=\"%s\"", regs[spr->gdb_id]);
 
         g_string_append_printf(xml, " bitsize=\"%d\"", TARGET_LONG_BITS);
         g_string_append(xml, " group=\"spr\"/>");
@@ -371,6 +371,8 @@ void ppc_gdb_gen_spr_feature(PowerPCCPU *cpu)
 
     g_string_append(xml, "</feature>");
 
+    pcc->gdb_spr.name = "org.qemu.power.spr";
+    pcc->gdb_spr.regs = regs;
     pcc->gdb_spr.num_regs = num_regs;
     pcc->gdb_spr.xmlname = "power-spr.xml";
     pcc->gdb_spr.xml = g_string_free(xml, false);
-- 
2.41.0


