Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B44C001DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:11:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQSfR-0004lF-JX; Mon, 31 Jul 2023 09:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOXW-0002fe-QP
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:46:07 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOXV-00050v-2p
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:46:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686f25d045cso2728068b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793164; x=1691397964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cCfolvh7idEXgF4TdLd2iHCvw9onhY6ET+lKLovyso=;
 b=SP9NjlmknQRt8bmqOt4+KZgBltXZrqoplF5HNUbp1ftNii9+BBx8WsYRJcjGeLNn/1
 FbK6CKC2czHwrzuCR76MTeafDEXOtKGxNUoAsCoESgBIyXZrfyJrdx14Ch3OJWVNcnts
 E6q3oLO/PxBU8PmWiVc7y8YwUD7Kx3dSKy4TuSFTfCK1GRnOvh2cPhavYSXfyyv3YOUe
 9XO/ckQ734cPkVbhf64rYBMQJmkIUKltmnEuLdXZNVCCv/BWhD9WA8HypmNm5k9xwBq4
 EAjUDI/BjMnd6XDFf5MV04HP2l8vQMsq84YDD0vl3CbvSLyuFqck6QMElaa3AGOT19n/
 8ESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690793164; x=1691397964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2cCfolvh7idEXgF4TdLd2iHCvw9onhY6ET+lKLovyso=;
 b=hUzpRHsOBLsbHORJAC92R6ChFyu68G66M+zNroPo+1ogEWD9ou0tG/sAJy/PUZwxed
 +rHvP+Ktcgg5GNohS/ilUq4Z1CjVp2XbPWo4IMPG37SJQ9HonXvhMoncpOpGBJWVotfi
 9wTr53NS9BMRRvOVIu8BSjfQqQ9sYqLbHCsFxwNeXiGE5JpSmbZqV9MNy4gUf7XKj3Bs
 7XNQcu5/jzy2wvSFPFBLJHT5yhISMrfPeJ1r45mUOT4XSjlEGOFlh0/Hwb1smVMrDTjF
 klv68wjQtE9JVcHWViNDULAuEC5zsbevWHDaXj0GbV+3SyuIzP39eyUivE9p1zm1ay1C
 U1YQ==
X-Gm-Message-State: ABy/qLZiCUDZD2+bU0VHRc0SHS7QUICBLvhfPSIUvXiTCMtZfKz/qPzq
 r8UN9wQv//fjCxRrCHcyT7WsfA==
X-Google-Smtp-Source: APBJJlFMxBusi1wYx3a81pCvpSrp8aDs7saPi8oPhnUOMgwU6xu9h9csse0tazK95hVbdV7IY51PDg==
X-Received: by 2002:a05:6a20:4299:b0:133:2fb2:917d with SMTP id
 o25-20020a056a20429900b001332fb2917dmr10174620pzj.5.1690793163948; 
 Mon, 31 Jul 2023 01:46:03 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 01:46:03 -0700 (PDT)
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
Subject: [RFC PATCH 12/24] gdbstub: Simplify XML lookup
Date: Mon, 31 Jul 2023 17:43:39 +0900
Message-ID: <20230731084354.115015-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x435.google.com
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

Now we know all instances of GDBFeature that is used in CPU so we can
traverse them to find XML. This removes the need for a CPU-specific
lookup function for dynamic XMLs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 182efe7e0f..e5bb2c89ba 100644
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
 
@@ -364,15 +363,12 @@ static const char *get_feature_xml(const char *p, const char **newp,
         len++;
     *newp = p + len;
 
-    name = NULL;
     if (strncmp(p, "target.xml", len) == 0) {
         char *buf = process->target_xml;
         const size_t buf_sz = sizeof(process->target_xml);
 
         /* Generate the XML description for this CPU.  */
         if (!buf[0]) {
-            GDBRegisterState *r;
-
             pstrcat(buf, buf_sz,
                     "<?xml version=\"1.0\"?>"
                     "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
@@ -389,28 +385,22 @@ static const char *get_feature_xml(const char *p, const char **newp,
             pstrcat(buf, buf_sz, "\"/>");
             for (r = cpu->gdb_regs; r; r = r->next) {
                 pstrcat(buf, buf_sz, "<xi:include href=\"");
-                pstrcat(buf, buf_sz, r->feature->xml);
+                pstrcat(buf, buf_sz, r->feature->xmlname);
                 pstrcat(buf, buf_sz, "\"/>");
             }
             pstrcat(buf, buf_sz, "</target>");
         }
         return buf;
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
-        name = gdb_features[i].xmlname;
-        if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
-            break;
+    for (r = cpu->gdb_regs; r; r = r->next) {
+        if (strncmp(p, r->feature->xmlname, len) == 0) {
+            return r->feature->xml;
+        }
     }
-    return name ? gdb_features[i].xml : NULL;
+    return NULL;
 }
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
-- 
2.41.0


