Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348AAC98332
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 11:11:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAQHH-00089g-SZ; Sat, 26 Sep 2026 07:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQH7-000869-Pn
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:09:03 -0400
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQH6-0002lu-6Q
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:09:01 -0400
Received: by mail-dl1-x122a.google.com with SMTP id
 a92af1059eb24-13fc403e373so2581630c88.1
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420939; x=1791025739; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1CUhNh304lcgPNFCLApzOZeyUtI9fc3e65ZqaUMABa0=;
 b=Sdnruxwl2nLRjM2Cwig/STDBWBw79NriPWhgi6vouFdxgebPJ7A08aLEHg+yLXnMrO
 /seKGUrNA6JY/XxQP6LnB6fdVuFB/cpleU/FRUiT151L2aw+xsfaulfoHMANYL4YnJkM
 0YP6oEnuC2TApTFexxoKNSwhIwHNaXhmOo7kevrAewfpCikDMxaMHAT4QQtXljW5YID+
 TImDhs4kLiQaY+nE5EPGWc8mmtTvpTBZSXm9YvEwXfX+Tkl/9nGq6H9HagkZXgLAqh0e
 /R2I5EYohDVfD/zOfM23bDAedC1YsN2bEkDItnH8GzTRUE3oT9n2hJa0VktTEyohS4Yn
 BM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420939; x=1791025739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1CUhNh304lcgPNFCLApzOZeyUtI9fc3e65ZqaUMABa0=;
 b=Qt7aKilMxKwm6KG2/M2fUqmUr2kzyqRZgisiDnwcbry37lBqrharJKGdBMlVFoMsuu
 YkE9MOBx31+J0dmx7smuSWTMB1OFMot7X4iepbX96h7hZ2Y/v+QacjpAYcmGyhWdqhfT
 HnMng4tE7iaH/BNePAYbZ3GrbbRG/yaFdTDjDnHOtSZs77/KixLtMx/haOoYJ7OvNFH5
 O+1rZK2adL9IWA6/BRJZK3Giqxod818jc+V9wS58Ne8/QE0hrbeVFRVs4ZEZRmuasKRw
 kai+CUEDlNnJ7IkFBeH/jQ2fbeu6uYSpRcO4cvLqozfdp/jeF+AkN012b53E2+5xpH0k
 EEIA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw53LnWZIBDUIXTfeiSjE9mM5Web4VppDqRjitTytEPO+4D3AWV1pGS7a3XoHZqDQYjle8zxC70pxC2@nongnu.org
X-Gm-Message-State: AFuF++lmVUuSa6R//NkWkHg7TmneyKVxkWHsfomLQEE+R9L+S0pwesEs
 Y8rHS+nKlTFi/BvqijyUaSjVGdxVqUaNZrm1WeNINnQCDLpcJYgCBwyZ
X-Gm-Gg: AYBFou2uKobctmBxx11z09IIxTqAHD9Hz6Oy5qJa0/Y5JkSWp4E0Oba912xPIrb66vp
 LGGjSBPB4W2h7BW+Q66qn5v+WVehFzBZ5MopPSORkGp2vchO/piLJUtNPfUjURx0P/ZUGvVed/+
 D9pxCAWVjVJGY8rTzyboHo0m6VHSE2o/YZ4RKGddqby32oUMDzmxuCF0joD2BBsaxEX+6kXfc7Y
 aTSIFvAbGA9tIxcmrja458N8fJSVlIsnN236w40o8ljPxekpftMYNu6Xlj1y1uhqm77mff+i07o
 odFrIgLkUin3V0ste0FxqWQ22j1AS1pEIE1tvkeiGNUMx/ZFXHNaopbE48BMtIbbW0c/8qDG0F/
 Qjpqq7Phqpz58l5PhhrMhpSwAUgeCa+5tcz+NOYDNsC4KEAvfZQJ6sQjRmYAe2TdUDhMvB+qXaY
 ueki8x/Frna49Remm0n4pfNkCPyex67pOsG77n+oHLJxvyHIEoln6X1sa6A96KBdMGz2r9sXaHD
 MMhsLZe/MUyabnYMmWbNISayDoJ7cLS
X-Received: by 2002:a05:7022:5f19:b0:143:7330:7fac with SMTP id
 a92af1059eb24-146d02a9d17mr2117168c88.14.1790420938499; 
 Sat, 26 Sep 2026 04:08:58 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:08:57 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 5/9] target/mips: rename helper_wait to helper_mips_wait
Date: Sat, 26 Sep 2026 19:08:13 +0800
Message-ID: <20260926110818.1912-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926110818.1912-1-luoyonggang@gmail.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122a;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

helper_wait is a global C symbol. Prefix it so one binary can keep
that short name free for another target.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/mips/helper.h        | 2 +-
 target/mips/tcg/exception.c | 2 +-
 target/mips/tcg/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 779b87101db..f2091c78e26 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -250,7 +250,7 @@ DEF_HELPER_1(rdhwr_xnp, tl, env)
 DEF_HELPER_1(rdhwr_chord, tl, env)
 DEF_HELPER_1(rdhwr_cvmcount, tl, env)
 DEF_HELPER_2(pmon, void, env, int)
-DEF_HELPER_1(wait, void, env)
+DEF_HELPER_1(mips_wait, void, env)
 
 #ifdef TARGET_MIPS64
 DEF_HELPER_FLAGS_2(lcsr_cpucfg, TCG_CALL_NO_RWG_SE, tl, env, tl)
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 630b8b809fa..95fc922aa68 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -65,7 +65,7 @@ static void raise_exception(CPUMIPSState *env, uint32_t exception)
     do_raise_exception(env, exception, 0);
 }
 
-void helper_wait(CPUMIPSState *env)
+void helper_mips_wait(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index e3467d15251..40ff71ffd00 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -8683,7 +8683,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         ctx->base.pc_next += 4;
         save_cpu_state(ctx, 1);
         ctx->base.pc_next -= 4;
-        gen_helper_wait(tcg_env);
+        gen_helper_mips_wait(tcg_env);
         ctx->base.is_jmp = DISAS_NORETURN;
         break;
     default:
-- 
2.52.0.windows.1


