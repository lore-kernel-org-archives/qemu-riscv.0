Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A70CA5FC4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:06:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xChWv-0004MY-9d; Fri, 02 Oct 2026 13:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChSI-0006Cy-Ir
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:54:03 -0400
Received: from mail-dy2-x19.google.com ([2607:f8b0:4864:36::19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChSF-0007qD-Jk
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:53:58 -0400
Received: by mail-dy2-x19.google.com with SMTP id
 5a478bee46e88-33e46a156f4so4908140eec.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963634; x=1791568434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=be9pR789RqOevAubKubuImhGiaujKFqfN5I1ORufONw=;
 b=b+8iTlAwP7weAATpLPOjkzTGqqkEGlIxc9bRbBZa/0x8WuTFOFPSHwhTpctVF1ZY9e
 yPoTpukEIV8Ktpnwr25+lN+SwjNhTRB+nl3bkrNC7vM9SwshKADY+l0sOrlo4Sq50upg
 GG+i5+ooqTXTP1m3v7T7+wTcLkXLJvDyeoNgGexBwWQMOwEX0fbt+XoLXzVjcMCbMnK3
 kJXz7j62+dzUVob93wCBRyeUcrKoyZ/j2PbzLjTYEYkpy7XdQraTWbfTx3YmBUCINlqs
 RdAlRipVR8SPS+c9OWLou+PKQJsquBSDmZH+BkT0sXkc/eJXl8UCKb5J+18cyIim1K6C
 nTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963634; x=1791568434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=be9pR789RqOevAubKubuImhGiaujKFqfN5I1ORufONw=;
 b=fxzeDNLCePIwM9ZYrCZdqixgqck9mMkcGdpJLj9H1nDkPQ2S3H84eV9Eyurirx8zrR
 w5fyVsRcQPKBAKob4zdxzROG7VvMZCMhBPbqjJpC7Z1BzjhZ9dn13g3Bgel9BH30eO8f
 63K2ILKz9mBNYm2nmwrrlmZ6XkAKB9AMHYiCLI+v7//mns+y6OWtjACci1wpbB5LyIAG
 VMNcD+8IpnsciS0zc1AsLRfsdM7nqlnn/FQYpw/jccfaK8N3QIQzfz2/c2WgB/IO+jKr
 HGORQSMYQmIKIojrNx9An7s4uEUfchBxlEh8bXHQoXzX5ITznTp/R4S4kp4pb6eWuYwC
 fopg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRXV9l8Ie2SRqDkWQWC9ijjUcAkW6Pxzo7oHaQO5ZLULDS02nRXGx8rkoq1cuF515HFL33owfnLbl1@nongnu.org
X-Gm-Message-State: AFq9FYKpZknEDA67GbFi7r9C0YWsxL0yhJsJUBt2vK3dtq0Vit6qp658
 7EUsPvCfckPi1L9wTqq7yvo21pMazGtZyC+fdFacDK/VKPMvGR13zSDB
X-Gm-Gg: AYBFou0/8Gk5EFNi25YpaUAFgJqkduP6GdJTmoeQeoTY/VqQ+eSsfz1gjHiDS6wXapN
 3YSVjWXWsme3D65vltxhZwX3uzuwYI91HxbUjCpuQdQgRrtQEmEGtbtYvBLPIfbAbqG0I20iHLs
 ixZsBTTNoW/yaum7CIEX57GEpLL6kmX7KyB8c3i0DOJYuu7wWsndSYNxrZBliahb2m6Dge1f/jK
 lNkqobNtrbaH6mX7x4iQilIotZXjotQggOYqrL5rXf/2l/ZWixOkTT//szH5DRAFo0pgc4sJndq
 mJjuoI4zvbcSJtVzz5Qtqjkme+409q+a8BXTp3TfGVoJa6LTgKU468Wkasjz4znE15WihkAjIYj
 L/AgwlKkAACfxIAoh1iqvkysqGOKX+2CrBMs/AcYwVW14UII3I5N10wgc3mAZ7VwyGrL+NX6v2H
 EkDE3A1tzd0JT4oxOE1NOtNBBggc0NnIKFXTye/yCYd5ab1BcSzOTgWmQy8jYHji974SZsqqrbE
 ogGTbjvFVeUSMm4xFFYyNGBFnCOlnI=
X-Received: by 2002:a05:7301:1526:b0:34e:f8bb:4e23 with SMTP id
 5a478bee46e88-34f150b0142mr3668009eec.19.1790963634017; 
 Fri, 02 Oct 2026 10:53:54 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:53:53 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 24/27] target/mips: call do_raise_exception directly
Date: Sat,  3 Oct 2026 01:50:32 +0800
Message-ID: <20261002175037.1747-25-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::19;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x19.google.com
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

Use do_raise_exception() directly for reserved-instruction traps in the
FPU helpers, passing GETPC() to restore guest state. Keep helper_wait() on
the zero-PC path, where the guest PC was already updated.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/mips/tcg/exception.c  | 7 +------
 target/mips/tcg/fpu_helper.c | 6 +++---
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 630b8b809fa..514880ccba8 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -60,11 +60,6 @@ void helper_raise_exception_debug(CPUMIPSState *env)
     do_raise_exception(env, EXCP_DEBUG, 0);
 }
 
-static void raise_exception(CPUMIPSState *env, uint32_t exception)
-{
-    do_raise_exception(env, exception, 0);
-}
-
 void helper_wait(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -75,7 +70,7 @@ void helper_wait(CPUMIPSState *env)
      * Last instruction in the block, PC was updated before
      * - no need to recover PC and icount.
      */
-    raise_exception(env, EXCP_HLT);
+    do_raise_exception(env, EXCP_HLT, 0);
 }
 
 void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
diff --git a/target/mips/tcg/fpu_helper.c b/target/mips/tcg/fpu_helper.c
index 36af9808025..ce68cda1e43 100644
--- a/target/mips/tcg/fpu_helper.c
+++ b/target/mips/tcg/fpu_helper.c
@@ -61,7 +61,7 @@ target_ulong helper_cfc1(CPUMIPSState *env, uint32_t reg)
             if (env->CP0_Config5 & (1 << CP0C5_UFE)) {
                 arg1 = (env->CP0_Config5 >> CP0C5_FRE) & 1;
             } else {
-                helper_raise_exception(env, EXCP_RI);
+                do_raise_exception(env, EXCP_RI, GETPC());
             }
         }
         break;
@@ -120,7 +120,7 @@ void helper_ctc1(CPUMIPSState *env, target_ulong arg1, uint32_t fs, uint32_t rt)
             env->CP0_Config5 &= ~(1 << CP0C5_FRE);
             compute_hflags(env);
         } else {
-            helper_raise_exception(env, EXCP_RI);
+            do_raise_exception(env, EXCP_RI, GETPC());
         }
         break;
     case 6:
@@ -132,7 +132,7 @@ void helper_ctc1(CPUMIPSState *env, target_ulong arg1, uint32_t fs, uint32_t rt)
             env->CP0_Config5 |= (1 << CP0C5_FRE);
             compute_hflags(env);
         } else {
-            helper_raise_exception(env, EXCP_RI);
+            do_raise_exception(env, EXCP_RI, GETPC());
         }
         break;
     case 25:
-- 
2.52.0.windows.1


