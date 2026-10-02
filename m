Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC55BCA5FC4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:58:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xChTd-00089A-L0; Fri, 02 Oct 2026 13:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChR2-0004nL-Kd
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:52:43 -0400
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChQz-0007Ws-A4
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:52:40 -0400
Received: by mail-dy2-x0d.google.com with SMTP id
 5a478bee46e88-344447f9c3dso4777127eec.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 10:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963550; x=1791568350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0iShXIlUk1iYtKpGTlb7boAt3L1gqjusG6eXmIJcuWI=;
 b=RiRw696GjB+suufCoVti7ESMuewnZBicXAdofWOpxBVZVerqp+iTZHiMBAuglt+LnZ
 IsggYXJjnnZzwFsAXOmRej9uaJbIdePWJPjUoOeZ2jYw8JUufhzd3LjqNzbeez0GPgYy
 m3JDP0ru3ToJH7bifxnVIq01kD83ZP2FHX/AQ8Nw/dr5SuqUnhuVEHWDTNCZ2GWUWitR
 4eIyD4GVcJt/vLMRkrkf+UsW6ij/I3/hG+AZldHe56JzTrKKI9ExgXfUGtJvBVK4C6hp
 6Q5VftcAvJLrV3CkErAKMp3HyCED36L4JU8P8/kkh0TzrSowMYxVybsSO2onbRunZqAw
 h3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963550; x=1791568350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0iShXIlUk1iYtKpGTlb7boAt3L1gqjusG6eXmIJcuWI=;
 b=tWeDFH+6DDc+/nvLMfZCGT1+M2M0eEyQY3U2P9DgbuiBHMcQxt5kcrUBrdJe4avfp6
 kVvYMOitmu5H1Oni9BD4J3/GkCaLNuIsPWsBPekPNZ3BvunrCYF2VBa9OpGPPnsZ/ZuH
 D3HgSroow5ckJt6EM9E4ZnvF24Y2Z3XhB9JoybpyAdw606VsT65l5XJDiwxV4X/DKaBT
 ERROmzLfkdHJ7LVVmsH//CkFek4Ksu+LXVTUZlDMdKlgwufxdS8/hhdqGT47+OXJo2Ka
 CM+hxVpxTAIN136+aU2rgeEUthlvc2dcYsyj8hGoAeW/9NHD4WM7BcOtqLA2vCpPIyRl
 w5ww==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbnD9UTwP/oz95QOGvk34BKwj8Lkar314f9CgBBvN4cpJBgnG2EYqwnDBPd70dk2WNcb4M+m2HlYSj@nongnu.org
X-Gm-Message-State: AFuF++l4viLUfCjqLqMj5LhJtGcTpYFYj1qVWgQUzXBU5T4Z0sLrUayJ
 aDZHV/sLUNHrohSn8vlbNbODAV+w0KG+n2WZPNuy/oy/sx0raWpjw+K0
X-Gm-Gg: AYBFou2rXCvX/3p8Nbz0h5+IKV9gqiheHJ0Mjbm3mYZi8sqUveQo/9ly8MFk5JZnNTU
 shJ1w10fg2PG+uv5lGwuvF+Cbw5S3/oovjfK9rQdamJvmXJ3OzUtJ2kYpHnVmx1GBMVLmD91Bye
 HSAl0a8RhTcsHzUJgf8WNKLwI1WLpsEzazQp1U5IGFGqeXj9DG2T40ZrN4A2ryN/wgEQ0l9dhSI
 eNCeNLDPhBVetiwtYQEqQptnJCnCuMKQ4B3dNr30610+6GQZIccsRUhuuQ8Kb5HT9U6xYJ6mI3R
 nENr9JnN8nLX/AL6LIlo6tw6nhEhX2tlxNCQ7pV0+dd1xIrUGPZ3eGqhT1ve0TyyUTXj6fC8QIn
 b5FoBEqQkTKkvFbXYEgHWACDnSWOThpW8V4NC4HVWuCHUjXDL8udAIzUzL4SvfW21EgE4krW/KS
 84Jvcvvl0s53UHUlu/yXOGf/pRxX7MmcxZZMykTY68eVeICaeh6gGnEtPh/KgYec9i23KJZYHx/
 j4324J252jflR6757lZdCPGYNmQMJI=
X-Received: by 2002:a05:7301:348f:b0:34e:3ce1:39f8 with SMTP id
 5a478bee46e88-34f150c7a93mr3568812eec.18.1790963550140; 
 Fri, 02 Oct 2026 10:52:30 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:52:29 -0700 (PDT)
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
Subject: [PATCH v3 13/27] target/m68k: convert raises to raise_excp
Date: Sat,  3 Oct 2026 01:50:21 +0800
Message-ID: <20261002175037.1747-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0d.google.com
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

Translate pure exceptions through the shared raise_excp helper and use
cpu_raise_excp() for no-restore C paths. Keep the format2 exception helper
because it performs additional guest-state work.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/m68k/helper.c    | 12 ++----------
 target/m68k/helper.h    |  1 -
 target/m68k/op_helper.c | 19 -------------------
 target/m68k/translate.c |  2 +-
 4 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 5f91d206f59..22f6cde02d3 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -162,14 +162,6 @@ void HELPER(cf_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
     }
 }
 
-static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = tt;
-    cpu_loop_exit_restore(cs, raddr);
-}
-
 void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
 {
     switch (reg) {
@@ -291,7 +283,7 @@ void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
     }
 
     /* Invalid control registers will generate an exception. */
-    raise_exception_ra(env, EXCP_ILLEGAL, 0);
+    cpu_raise_excp(env_cpu(env), EXCP_ILLEGAL);
 }
 
 uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
@@ -394,7 +386,7 @@ uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
     }
 
     /* Invalid control registers will generate an exception. */
-    raise_exception_ra(env, EXCP_ILLEGAL, 0);
+    cpu_raise_excp(env_cpu(env), EXCP_ILLEGAL);
 
     return 0;
 }
diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 0bda8f8152d..a6ca811ebe2 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -111,7 +111,6 @@ DEF_HELPER_3(set_mac_extu, void, env, i32, i32)
 DEF_HELPER_2(flush_flags, void, env, i32)
 DEF_HELPER_2(set_ccr, void, env, i32)
 DEF_HELPER_FLAGS_1(get_ccr, TCG_CALL_NO_WG_SE, i32, env)
-DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 DEF_HELPER_FLAGS_3(bfffo_reg, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 38f7a689814..5f539f8fd75 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -539,25 +539,6 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #endif /* !CONFIG_USER_ONLY */
 
-G_NORETURN static void
-raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = tt;
-    cpu_loop_exit_restore(cs, raddr);
-}
-
-G_NORETURN static void raise_exception(CPUM68KState *env, int tt)
-{
-    raise_exception_ra(env, tt, 0);
-}
-
-void HELPER(raise_exception)(CPUM68KState *env, uint32_t tt)
-{
-    raise_exception(env, tt);
-}
-
 G_NORETURN static void
 raise_exception_format2(CPUM68KState *env, int tt, int ilen, uintptr_t raddr)
 {
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 138c89d3e53..b5ce0ee6ccd 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -252,7 +252,7 @@ static void gen_jmp(DisasContext *s, TCGv dest)
 
 static void gen_raise_exception(int nr)
 {
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(nr));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(nr));
 }
 
 static void gen_raise_exception_format2(DisasContext *s, int nr,
-- 
2.52.0.windows.1


