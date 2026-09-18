Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DE2C982D2
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:45:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7Mgt-0006na-Ox; Thu, 17 Sep 2026 20:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mgs-0006ma-Jn
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:42:58 -0400
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mgp-0001QX-BO
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:42:58 -0400
Received: by mail-pz2-x0f.google.com with SMTP id
 41be03b00d2f7-cc1cea4bfb6so37580a12.3
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692174; x=1790296974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aUaeGkon9+ggQZ5TaEe6QdPSzXHYkdUl5uC7WqY6h6I=;
 b=YfnMlKIBOzUL06uL6z+FGEO4YdWrhk9gKwGjoGuVG7aLvl9aJJLOA/54wQ+4VP67/+
 DISfS35wBp2gJwDM/3xCK9oXf8wm/r18J4sEWucb4SW7hrWGQ9p1/OTjlFJobHMTsH5k
 PpQ1RFZO81GtIz5Eu5qECx/M8iSRIGYLNwbUq7+FZYFbiScSJKxU6bbInEkBUoPcEiWm
 BNneAUlWOfWnFydNBS6M5ccU7Oo7Ba+3Wjg2uP7Wn3ktatWbozkM0jtgkgs6aeuFDdVA
 oDrNE24Wva8DgEb5QdrXsWjeBIP/UmMba70y9Eya+c8ketjs0kxYxjpUuYcMuAww6WIh
 4AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692174; x=1790296974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aUaeGkon9+ggQZ5TaEe6QdPSzXHYkdUl5uC7WqY6h6I=;
 b=UcJF4m13Pff0O1hExtBEEhQ+CtTn40YgCosWoGF7KSQY8XEz7ONV0sd+Ah60gFxNPz
 ep7JuqOipmHq74q3xg7hGvlgjQF3/soyb3GOEYx2qDunogwfaxdM5NcvpYK1Niif4JjC
 YtCQSG/SxvOcOVvLd/IFsAxfIWqyDw8ax5DLbEZg548hre6ITkg+fZJWkw1TaulrrAEC
 G2kRrNwgfzsdpugp1CE94iEedw7tHarUlXqVJofpyicNLM9ciCIPGoIw3cHKUixFSqUN
 Xh6q4iud9Jvdx7EdMlfMFUknhAuntTxvp6hlNaqzDIYNMgJBpsJiUhBrbmaPyv/atLW1
 ZG0A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqGo1S50F50hAgTvEU0+sWm9boeIkpRc4WzZ85tiyzwc622xhCMDzBZt5Pcg+JZU0Gb99nFEWBbyew@nongnu.org
X-Gm-Message-State: AFuF++kY7iZSzINqTqPhVSLe2sdjUrSMfiA85hk9TAXbkq4/7Cu+qmad
 mSJEXenSOgZ/mr7ljj3gH7WIXPsXq2eELUDcrrZ3k+Z7pMCYN3tpogxF
X-Gm-Gg: AYBFou0CMUfrsduutWGLJJ+Xu+yGkHzcG+QABpSuEY7TzbxQpVQIm2gB8ZnbXdImxiq
 d+qFUQ9R1sEOEh6sxgoKO7qg+br9FfbH9XNPKRTChbJdvJPLGY5ylG8VQLo+D1+JwBRa7qaiQxx
 iChuSB0v44PU33McEZlYURCGjtwWw3wXT17aCfJMOdZE+IFMPXVcpDhD7bIOPLIhghktWY/h+o2
 esmfOM7l2oo8lYlDa1Ln4jpt8FDraPPb2XjkRMDqatUGskAc1kgEKvtbAKbL1X+kkC4viKoe9X5
 MaJdJXCpJQL3WHXfGgBSQfCK3JYOgmYcpc88uweH1c2F6i6TjeJz0U3ldHnXshW5/PKWJjeOS6q
 yf4mhLkOYnzdBYUJ5l7sBEP/28/y4qJkWN6iUDTTiVvakthX5YwLOJX0AGkawqvEyaCz+CpRUbo
 +k1cPVlYDdT1/EV8ITQTke69CMIS+sccJXbJ4UX2VuwtrWKbTCusrKn7492QgiUFBFX6vbtYplK
 Nqv/QEdOgokB9OVgE9lfA1fiAtGoHyg
X-Received: by 2002:a05:6a20:7d8b:b0:3d3:b02a:61a5 with SMTP id
 adf61e73a8af0-3dd8c41a021mr1325778637.28.1789692173803; 
 Thu, 17 Sep 2026 17:42:53 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:42:53 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Nicholas Piggin <npiggin@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 02/21] helper-gen: move helper_info extern into gen_helper
Date: Fri, 18 Sep 2026 08:42:04 +0800
Message-ID: <20260918004225.827-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pz2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Declare helper_info inside each gen_helper_* body so a comment on
DEF_HELPER attaches to gen_helper_*, not helper_info_*. The extern
still refers to the global from helper-info.c.inc. Silence
-Wnested-externs around the HELPER_H expansion only.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/exec/helper-gen.h.inc | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/exec/helper-gen.h.inc b/include/exec/helper-gen.h.inc
index dabe138e205..1a4dc27d436 100644
--- a/include/exec/helper-gen.h.inc
+++ b/include/exec/helper-gen.h.inc
@@ -11,49 +11,49 @@
 #include "exec/helper-head.h.inc"
 
 #define DEF_HELPER_FLAGS_0(name, flags, ret)                            \
-extern TCGHelperInfo glue(helper_info_, name);                          \
 static inline void glue(gen_helper_, name)(dh_retvar_decl0(ret))        \
 {                                                                       \
+    extern TCGHelperInfo glue(helper_info_, name);                      \
     tcg_gen_call0(glue(helper_info_,name).func,                         \
                   &glue(helper_info_,name), dh_retvar(ret));            \
 }
 
 #define DEF_HELPER_FLAGS_1(name, flags, ret, t1)                        \
-extern TCGHelperInfo glue(helper_info_, name);                          \
 static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
     dh_arg_decl(t1, 1))                                                 \
 {                                                                       \
+    extern TCGHelperInfo glue(helper_info_, name);                      \
     tcg_gen_call1(glue(helper_info_,name).func,                         \
                   &glue(helper_info_,name), dh_retvar(ret),             \
                   dh_arg(t1, 1));                                       \
 }
 
 #define DEF_HELPER_FLAGS_2(name, flags, ret, t1, t2)                    \
-extern TCGHelperInfo glue(helper_info_, name);                          \
 static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
     dh_arg_decl(t1, 1), dh_arg_decl(t2, 2))                             \
 {                                                                       \
+    extern TCGHelperInfo glue(helper_info_, name);                      \
     tcg_gen_call2(glue(helper_info_,name).func,                         \
                   &glue(helper_info_,name), dh_retvar(ret),             \
                   dh_arg(t1, 1), dh_arg(t2, 2));                        \
 }
 
 #define DEF_HELPER_FLAGS_3(name, flags, ret, t1, t2, t3)                \
-extern TCGHelperInfo glue(helper_info_, name);                          \
 static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
     dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3))         \
 {                                                                       \
+    extern TCGHelperInfo glue(helper_info_, name);                      \
     tcg_gen_call3(glue(helper_info_,name).func,                         \
                   &glue(helper_info_,name), dh_retvar(ret),             \
                   dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3));         \
 }
 
 #define DEF_HELPER_FLAGS_4(name, flags, ret, t1, t2, t3, t4)            \
-extern TCGHelperInfo glue(helper_info_, name);                          \
 static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
     dh_arg_decl(t1, 1), dh_arg_decl(t2, 2),                             \
     dh_arg_decl(t3, 3), dh_arg_decl(t4, 4))                             \
 {                                                                       \
+    extern TCGHelperInfo glue(helper_info_, name);                      \
     tcg_gen_call4(glue(helper_info_,name).func,                         \
                   &glue(helper_info_,name), dh_retvar(ret),             \
                   dh_arg(t1, 1), dh_arg(t2, 2),                         \
@@ -61,11 +61,11 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
 }
 
 #define DEF_HELPER_FLAGS_5(name, flags, ret, t1, t2, t3, t4, t5)        \
-extern TCGHelperInfo glue(helper_info_, name);                          \
 static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
     dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
     dh_arg_decl(t4, 4), dh_arg_decl(t5, 5))                             \
 {                                                                       \
+    extern TCGHelperInfo glue(helper_info_, name);                      \
     tcg_gen_call5(glue(helper_info_,name).func,                         \
                   &glue(helper_info_,name), dh_retvar(ret),             \
                   dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
@@ -73,11 +73,11 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
 }
 
 #define DEF_HELPER_FLAGS_6(name, flags, ret, t1, t2, t3, t4, t5, t6)    \
-extern TCGHelperInfo glue(helper_info_, name);                          \
 static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
     dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
     dh_arg_decl(t4, 4), dh_arg_decl(t5, 5), dh_arg_decl(t6, 6))         \
 {                                                                       \
+    extern TCGHelperInfo glue(helper_info_, name);                      \
     tcg_gen_call6(glue(helper_info_,name).func,                         \
                   &glue(helper_info_,name), dh_retvar(ret),             \
                   dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
@@ -85,12 +85,12 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
 }
 
 #define DEF_HELPER_FLAGS_7(name, flags, ret, t1, t2, t3, t4, t5, t6, t7)\
-extern TCGHelperInfo glue(helper_info_, name);                          \
 static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
     dh_arg_decl(t1, 1), dh_arg_decl(t2, 2), dh_arg_decl(t3, 3),         \
     dh_arg_decl(t4, 4), dh_arg_decl(t5, 5), dh_arg_decl(t6, 6),         \
     dh_arg_decl(t7, 7))                                                 \
 {                                                                       \
+    extern TCGHelperInfo glue(helper_info_, name);                      \
     tcg_gen_call7(glue(helper_info_,name).func,                         \
                   &glue(helper_info_,name), dh_retvar(ret),             \
                   dh_arg(t1, 1), dh_arg(t2, 2), dh_arg(t3, 3),          \
@@ -98,7 +98,15 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
                   dh_arg(t7, 7));                                       \
 }
 
+/*
+ * helper_info_* is declared inside gen_helper_* so a comment on
+ * DEF_HELPER attaches to gen_helper_*, not helper_info_*. That is a
+ * nested extern; silence -Wnested-externs for this expansion only.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wnested-externs"
 #include HELPER_H
+#pragma GCC diagnostic pop
 
 #undef DEF_HELPER_FLAGS_0
 #undef DEF_HELPER_FLAGS_1
-- 
2.52.0.windows.1


