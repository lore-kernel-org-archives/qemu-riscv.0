Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B9FC001DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:11:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQSfN-0004i5-L1; Mon, 31 Jul 2023 09:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOYA-0004lF-HK
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:46:48 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOY5-00057T-4h
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:46:43 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686f19b6dd2so2660885b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793200; x=1691398000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
 b=0yconEKzvH6iMivH8TVS1PccUnN5hRxSWAfLCX0uRxT+jSYfIZrLGyRyMTsQ4B85WS
 iS/9TevFK1qxkLJav5HBR2cEW8s+yWBV0YaGKX6ByHkJKkzkqqg82Xe0iI3W2zrMBtia
 mwlJNTjQaR2uxyfwehuN4MfKMHqrSyfXNEEs28yqHXWM1s4Ba3hT7gwat66rShm6JyOK
 djpkupwmEmKVjwONvvs4OCZqB5bVsjJgXDGimRSJNBi2WMe2VIp9KNHrZKL7RErO1SUT
 zbsxZmX5VJ5/fjirEmGNUelThco4t5IOIfXuVymxwsoGPWoKSTdAh6h6YiUXZrJJ3buF
 +M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690793200; x=1691398000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANoP9Fpb4WsMF0Xvgw/Yso2QUviba5iZTbYCAi6ODvM=;
 b=i8x/vYWAkglXwZTKvakqgxKrE5+T+SG9zGd0J4/lWS/Cx5E19GKsw4SP2l/cLG6L4c
 /QVZzUjsWnQ05NfnxZvQt4+GIWUEdXuMsgYilaUzhWOlrGB21XS63YaPxjXA68IhT5y5
 rWxKxSedrqB+EXWOEdTg9zu0BD/gkInks5UqGk1yMQm1j4bBTAoOfm1YyctrjSr1Ib/L
 yNyC5ne75kp0T50VEbU4+Wl/maga0ouwAFQvs4qhxPeds2rfoZvKGykYDmqDHUNAwnq6
 xspb/8m8oMBsPpwvx0P/U0IoybZbFJaaN/r0XBe5ccV+H4Z79CWui9jUV09mxaVrYqQS
 aysQ==
X-Gm-Message-State: ABy/qLb5hl1Y1/ckjPsmOsmnz6QmTH9orw6CQVtG7I6WYPp549hY5NuJ
 QAc0e4tF1jJmXY6GB+OjQmCo9A==
X-Google-Smtp-Source: APBJJlGqgcWI52kGX5FDVyWHcYVegjUSKTSw98VXjn25LmP/9ZYyTct+mU1oS+j1/xeQwY1xDgZMFQ==
X-Received: by 2002:a05:6a00:1785:b0:679:bc89:e45 with SMTP id
 s5-20020a056a00178500b00679bc890e45mr10732242pfg.6.1690793199926; 
 Mon, 31 Jul 2023 01:46:39 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 01:46:39 -0700 (PDT)
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
 qemu-s390x@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 16/24] target/ppc: Fill new members of GDBFeature
Date: Mon, 31 Jul 2023 17:43:43 +0900
Message-ID: <20230731084354.115015-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:10:28 -0400
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


