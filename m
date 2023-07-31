Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22293C001DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:11:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQSfO-0004j8-Vl; Mon, 31 Jul 2023 09:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOYJ-0004wK-4S
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:46:56 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOYE-000593-Ey
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 04:46:54 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-563e21a6011so3195825a12.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793209; x=1691398009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i68gTXndm5g2JBfGSVbcpcLCWh9EafQ06rBdOr/hNg8=;
 b=nC6x/hrDw7RM2hyF01kPWOTN+B1vxbMARwlG2R+cm3uzFEtTGTvvv0hAHUbOiWJSm1
 +oZD6x/27ed4ARu5S8X8QI6AXv590W8WESkEvqBL+kNvnQFwNBc2v6geEX4g89mtkatO
 aaT/WoMCebIPOX05W7SrSC2Y0YD+Xw8sBSjHpHLp90kU9kQijGZFI7zp67qHR+CP093V
 8lfb7qbBkqRvL1/gLBZSv5PjkhCH8PO4SyULmD7E+8SvDp9CgFCcZyhfmC8Kl+7+fRnQ
 8cwgClpr3Cqdfn0sJZEndReB0DNsCIOPZwA9VRaa9X7UET6eGJ8jG3/tqiW+I0eRG5ZV
 mIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690793209; x=1691398009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i68gTXndm5g2JBfGSVbcpcLCWh9EafQ06rBdOr/hNg8=;
 b=b/wpzJp58XZrfFp4mjhYgs9qaxYyQ3RCWOrxRg9ZVf0uDP03M1BTfZPvgbKDczvIHu
 S/ZpbgjAm8xVGfIuQME+IHHNbJ3eunscCYGBdHdCNv3c4drPI6oUlMEV1V4kS6l9Uc4N
 j2Go1TkMVHZnZrfu1prR2GWU8iJz/94Eun4LLLCwfCVjjQlPI+iTAzHN/M6Pmqpd3zm+
 86fY3dcRn+P4zHFPJ9+a6/1elp5KOYmNc53a+Z1/gqz46Znfk6ERIVgOWm8MNYMPf2JO
 5SZnClFDb9Sf20SNh6upI1iOomit2azfp8xmvo+GE9vFcm/2CQ0zgOtweNmoEuwogggQ
 inSg==
X-Gm-Message-State: ABy/qLYxYeguqRsaPTH9TxV8a7o8w2OPluXVS0ZeUUZHo+DIsII+IZ9c
 cfg+zfXk9AFUjucXFgUD0n/xmg==
X-Google-Smtp-Source: APBJJlGZcLds9//79Mo+76iCBHc3jp3+Z0ypqGuVU/Ww43E+kmyH9WV6RDVLVGfmft7WqgMHYa9iyg==
X-Received: by 2002:a05:6a20:5510:b0:11d:8a8f:655d with SMTP id
 ko16-20020a056a20551000b0011d8a8f655dmr9020629pzb.4.1690793208923; 
 Mon, 31 Jul 2023 01:46:48 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 01:46:48 -0700 (PDT)
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
Subject: [RFC PATCH 17/24] target/riscv: Fill new members of GDBFeature
Date: Mon, 31 Jul 2023 17:43:44 +0900
Message-ID: <20230731084354.115015-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x534.google.com
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
 target/riscv/gdbstub.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 224c69ea99..b3d4d4de3e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -217,6 +217,7 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     GString *s = g_string_new(NULL);
+    const char **regs = g_new(const char *, CSR_TABLE_SIZE);
     riscv_csr_predicate_fn predicate;
     int bitsize = 16 << env->misa_mxl_max;
     int i;
@@ -240,11 +241,10 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
         }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            if (csr_ops[i].name) {
-                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
-            } else {
-                g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
-            }
+            regs[i] =
+                csr_ops[i].name ?
+                    csr_ops[i].name : g_strdup_printf("csr%03x", i);
+            g_string_append_printf(s, "<reg name=\"%s\"", regs[i]);
             g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
             g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
         }
@@ -252,6 +252,8 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 
     g_string_append_printf(s, "</feature>");
 
+    cpu->dyn_csr_feature.name = "org.gnu.gdb.riscv.csr";
+    cpu->dyn_csr_feature.regs = regs;
     cpu->dyn_csr_feature.num_regs = CSR_TABLE_SIZE;
     cpu->dyn_csr_feature.xmlname = "riscv-csr.xml";
     cpu->dyn_csr_feature.xml = g_string_free(s, false);
@@ -268,10 +270,12 @@ static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
     RISCVCPU *cpu = RISCV_CPU(cs);
     GString *s = g_string_new(NULL);
     g_autoptr(GString) ts = g_string_new("");
+    const char **regs;
     int reg_width = cpu->cfg.vlen;
     int i;
 
     cpu->dyn_vreg_feature.num_regs = 32;
+    regs = g_new(const char *, cpu->dyn_vreg_feature.num_regs);
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
@@ -297,15 +301,18 @@ static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 
     /* Define vector registers */
     for (i = 0; i < cpu->dyn_vreg_feature.num_regs; i++) {
+        regs[i] = g_strdup_printf("v%d", i);
         g_string_append_printf(s,
-                               "<reg name=\"v%d\" bitsize=\"%d\""
+                               "<reg name=\"%s\" bitsize=\"%d\""
                                " regnum=\"%d\" group=\"vector\""
                                " type=\"riscv_vector\"/>",
-                               i, reg_width, base_reg++);
+                               regs[i], reg_width, base_reg++);
     }
 
     g_string_append_printf(s, "</feature>");
 
+    cpu->dyn_vreg_feature.name = "org.gnu.gdb.riscv.vector";
+    cpu->dyn_vreg_feature.regs = regs;
     cpu->dyn_vreg_feature.xmlname = "riscv-vector.xml";
     cpu->dyn_vreg_feature.xml = g_string_free(s, false);
     return &cpu->dyn_vreg_feature;
-- 
2.41.0


