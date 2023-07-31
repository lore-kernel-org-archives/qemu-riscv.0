Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B817AC04FDF
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:11:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQSfY-0004pb-U3; Mon, 31 Jul 2023 09:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOXO-0002Ua-3o
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:45:59 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOXM-000500-0Y
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:45:57 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68706d67ed9so2352839b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 01:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793155; x=1691397955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4O5XiL9Naewl5HxRHqjpi1iQMXhF2obFyf/BgvZpyDA=;
 b=GJVPZppDfKmYORLuER6EZt8krtL9nEB6KbU1E0vrA9yICHD19t+Sl0r1zzPJH9J2dd
 IvhK5cXJEHQtPnyQC6qPSZ7RQv8TT8BJhLRTZaFIc0ARFhaEQWT0BpwsZyOb0L03CZbF
 dQNiTsLBdsR5VzDIHnh8ejRK8wmTJBDYBHhhtznkAcYXuvQXNdhTQTuH8IYgaZFL7I3M
 eVdl/XWPzz1nrVlid/X16UIXd3bGTVIEtEhXNXe+ztpVIN3YLpzDa4JiJjeLdSFwdaEA
 /114FyCkYzTcia7wH0uMMpsMaMBq5DfC2/pgKQB5snMORo+bxpHZOAbRuZTqDVMekoJN
 ewZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690793155; x=1691397955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4O5XiL9Naewl5HxRHqjpi1iQMXhF2obFyf/BgvZpyDA=;
 b=UvXwf6mDoLpMaJeZsns0Oowt9+q1REDqPPYxEXUAaEQvsi+62wXG4yzqCwYmjp7Ght
 oOe4HfJGq+tZy7FzDYRnmw8+fb81s9vpdKlpNT89kZ8cZAMoxJKZS3u0hpJo+0LM1PJo
 owO80RGeIACakfuPiZR4jrpsAtiYYvjjuhn2l5oAErPMXkVWeEHK61UMcNRk1nclhnL7
 P1gzzrG2mCSHF2CZwZy2Ukh0n+ueRCdUyLJKPMRKGrH3ZP3varQWCogSvIdA7dllVGBs
 ajQDbeJiP31a5Sl4hQSz+9CZdvuCbvu9OfROIHMoL34ZLZ9Lt1Ansr1NrNVTdPtsCA1G
 KzqA==
X-Gm-Message-State: ABy/qLYYvEedENuHHTCV8NI3BJ908LK0JEvUMhquUudD/uQlpBwawbfI
 7IYQq0zKMF8QVsVceLlgauHFtA==
X-Google-Smtp-Source: APBJJlFaXNhraOVLhdxG/o3w8DDHlzViclvmPWpZWDjTqqgWJd4IXLIrj7vVtLRc0eWTdaVZV4puaw==
X-Received: by 2002:a05:6a00:22d3:b0:687:1604:39d2 with SMTP id
 f19-20020a056a0022d300b00687160439d2mr10574023pfj.10.1690793154902; 
 Mon, 31 Jul 2023 01:45:54 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 01:45:54 -0700 (PDT)
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
Subject: [RFC PATCH 11/24] gdbstub: Use GDBFeature for GDBRegisterState
Date: Mon, 31 Jul 2023 17:43:38 +0900
Message-ID: <20230731084354.115015-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Simplify GDBRegisterState by replacing num_regs and xml members with
one member that points to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ab75f6686b..182efe7e0f 100644
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
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
@@ -390,7 +389,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
             pstrcat(buf, buf_sz, "\"/>");
             for (r = cpu->gdb_regs; r; r = r->next) {
                 pstrcat(buf, buf_sz, "<xi:include href=\"");
-                pstrcat(buf, buf_sz, r->xml);
+                pstrcat(buf, buf_sz, r->feature->xml);
                 pstrcat(buf, buf_sz, "\"/>");
             }
             pstrcat(buf, buf_sz, "</target>");
@@ -438,7 +437,7 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
             return r->get_reg(env, buf, reg - r->base_reg);
         }
     }
@@ -456,7 +455,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
             return r->set_reg(env, mem_buf, reg - r->base_reg);
         }
     }
@@ -479,17 +478,16 @@ void gdb_register_coprocessor(CPUState *cpu,
     p = &cpu->gdb_regs;
     while (*p) {
         /* Check for duplicates.  */
-        if (strcmp((*p)->xml, feature->xmlname) == 0)
+        if ((*p)->feature == feature)
             return;
         p = &(*p)->next;
     }
 
     s = g_new0(GDBRegisterState, 1);
     s->base_reg = cpu->gdb_num_regs;
-    s->num_regs = feature->num_regs;
     s->get_reg = get_reg;
     s->set_reg = set_reg;
-    s->xml = feature->xml;
+    s->feature = feature;
 
     /* Add to end of list.  */
     cpu->gdb_num_regs += feature->num_regs;
-- 
2.41.0


