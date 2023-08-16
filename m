Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE02C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 13:43:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWGnI-00086t-3l; Wed, 16 Aug 2023 09:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGnE-0007TU-Ca
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:42:36 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGn9-0001df-C0
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:42:35 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bda9207132so51997165ad.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 06:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193349; x=1692798149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43Yk2hXc6r+OrDwdQwqhs9KvazgS/8QnDpHDJGpmDuU=;
 b=0ASrDq0r9JysnWjn9k1w4ooZZqYKSKcLGqqvkvzezH2N09UIG4iehrElXzPXHOnkQB
 S4cig/tcVryiytc5Z3HGOrRuVAjrrS3Ab39DN/xmqlpmpofznpHyeDSEX/wFRk4VReCn
 34/mqHbQ60UpZyH629jX0X6MzqPCZ5k8LbYlt2GnSfBac1scSM2ANxO8n4gtH1F11ygC
 61qESBXy6bmx+EMUjGqg6dW9GQ53miBycB0v9EvoOLQJKDbpLJZKmZdUx5RoxGWy0e/U
 skPiQT2ldMYz7BWAes1ON64aOc+UjRXh+/SIpT4V5qD1Sf1DH5yHlsLB3dhzkWhh9/we
 rWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692193349; x=1692798149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43Yk2hXc6r+OrDwdQwqhs9KvazgS/8QnDpHDJGpmDuU=;
 b=VzRxqExLOKS30lFkhrE1Z/f1BAnZ7H1wYRUuUGKxNmZRIgPaZTwg6Yjx1T8Q1UjZJh
 Ec8aeG2ur5CR/JzETG5Ud8L6ExQ6ZLrRs+X8SVV8jMLZoJLPIdqQt0Zn8z8MFYcQlwHe
 cUzlRRQbHnOms6nwwu32fIL84pAdoc68Ptr5WS+gXMvaAdZlsymf9D0Wmes149etF0A1
 AOu8pHA1/me2eYkHmgoeDc3o8DnZBOOklgBJ+72Yrd23nFPFeq/x9U3Cddufavc2MkeX
 1rGcoSr2EHEopHE5VqATukgqQjXgSFTWbaj5KzC2VJl2WIW8kS0n3jdVgIxWYbvW2zlo
 /jeQ==
X-Gm-Message-State: AOJu0YzpQD1IzoJKH9GRkgAoLKQ3lvPAkx6i3EYyuLVX2t7ig5zGR0Op
 JAjAvva1chty6B7RwTf8nSqz8g==
X-Google-Smtp-Source: AGHT+IE2yHozSLxxdi7bHea3fIA9c6K4gdSPYAbmb7Ge/3f7H0CfUdDz5XgUsWgHwnrb7J1kutikAQ==
X-Received: by 2002:a17:902:ef92:b0:1bb:c69b:6f6b with SMTP id
 iz18-20020a170902ef9200b001bbc69b6f6bmr1686515plb.6.1692193349728; 
 Wed, 16 Aug 2023 06:42:29 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 06:42:29 -0700 (PDT)
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
Subject: [PATCH v3 15/25] gdbstub: Simplify XML lookup
Date: Wed, 16 Aug 2023 22:39:25 +0900
Message-ID: <20230816133938.18310-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
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

Now we know all instances of GDBFeature that is used in CPU so we can
traverse them to find XML. This removes the need for a CPU-specific
lookup function for dynamic XMLs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 452b5bf0ef..ccb4ed9d4b 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -354,8 +354,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
                                    GDBProcess *process)
 {
     size_t len;
-    int i;
-    const char *name;
+    GDBRegisterState *r;
     CPUState *cpu = gdb_get_first_cpu_in_process(process);
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
@@ -364,7 +363,6 @@ static const char *get_feature_xml(const char *p, const char **newp,
         len++;
     *newp = p + len;
 
-    name = NULL;
     if (strncmp(p, "target.xml", len) == 0) {
         /* Generate the XML description for this CPU.  */
         if (!process->target_xml) {
@@ -398,21 +396,15 @@ static const char *get_feature_xml(const char *p, const char **newp,
         }
         return process->target_xml;
     }
-    if (cc->gdb_get_dynamic_xml) {
-        char *xmlname = g_strndup(p, len);
-        const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
-
-        g_free(xmlname);
-        if (xml) {
-            return xml;
-        }
+    if (strncmp(p, cc->gdb_core_feature->xmlname, len) == 0) {
+        return cc->gdb_core_feature->xml;
     }
-    for (i = 0; ; i++) {
-        name = gdb_static_features[i].xmlname;
-        if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
-            break;
+    for (r = cpu->gdb_regs; r; r = r->next) {
+        if (strncmp(p, r->feature->xmlname, len) == 0) {
+            return r->feature->xml;
+        }
     }
-    return name ? gdb_static_features[i].xml : NULL;
+    return NULL;
 }
 
 void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
-- 
2.41.0


