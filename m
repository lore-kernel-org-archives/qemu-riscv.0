Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5EAC369AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 08:14:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4bQK-0008Nk-EL; Tue, 15 Apr 2025 04:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bQ9-0007t6-MI
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:13:29 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bQ5-0001y5-CN
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:13:28 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-227cf12df27so42209305ad.0
 for <qemu-riscv@nongnu.org>; Tue, 15 Apr 2025 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744704801; x=1745309601; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nwKYDLJebV8nfrFMI0a6Dc+oBkaaAbOXeXeNO1BXXr4=;
 b=JLFltkhrN/ZsMZAP+2fct5SQo6/h6eG/dOSbiKC0k/hey58bP3mllUD5Id92UcfzhR
 iWQfI1Fu72ufn24UrEOm0CTqnoURqIpE8VtzVmsA4HmY7Bt+maRZBZwsaB1Sq9UVW3jd
 E8yZoy3sXppWNmdY4jiWTgx65akZGzW8gdDGM3RNC6NFWS+A9jXS6sPJEPhv6BhJ4lwU
 MfuWAESXioIxvQZR+ujkQvMXGOqI3kNOMFyVromrGndjnf/R+V2AJxcv/bMew3TnjnCC
 r13ARc4IQ9qml5zjB36lwZ1/Fd8YQZXld2+lQrY4bcc3lUm92uJ9D/qvqlRGfzZkn3ei
 8NDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744704801; x=1745309601;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwKYDLJebV8nfrFMI0a6Dc+oBkaaAbOXeXeNO1BXXr4=;
 b=cu5mqMZSbN4nQCfXlf5oeQSRQwhDaD0nVgyvJrkRgNxLAC7UMh0XwX/f/b/BK6WEmU
 p0yoIelA4zSPKt/z/jqT2+UCvqVTUqSLVZCel4POdo4RYmoVavHT9UCoCXiKlL0a8oNp
 fOG69/qH/Sm3V7d5w/+Socvbo+Xm1A2p/BvPFmjYbq/gDhxl4erSk37qN62U+1USl4cr
 TfbJX2e3oCVCzo7LkbPiQHSZgJwFJqgQEWz1kkDVlIGTBaSRKNMsKoeW1os10hPsTwId
 IMpkBkooPJ+36ZZ/0ZRBiU+tm7QkHRSqw9jr/xZHG5ZXxAZ9Oi1c1JWM9/tbHelsROKw
 s8xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw/ifFdEZwiBiCZa6Ka2rVHmGxq1/yNfVV/RZIRK85ckvPnYhTAqaPrR6lVNBplveNh+oyZCj4UmXo@nongnu.org
X-Gm-Message-State: AOJu0YwkpJDYr2yWtJvuNzkRe90APqQgrxJn+Mw5z91r4OKBMWXdF5oJ
 LVQsJh/psf1u1WVp5PnRC17ul6mQsM8cYrLqj/0q7RV+PuZwh+Fn2sP87ypiv94=
X-Gm-Gg: ASbGncvjwGesEp9pvNiWsbh0Q9CNQThJABnW4QScfl4ptubSa9Oct6ncZAcWyXkwOnk
 r8v0I7gPRi64Q1adEvHDqglKt1joAvPsCg15LHVIGSxxPhICIHRUEM5YPzmhdhP9uDO+1M00S94
 x2R+QiCQaWyx6zhlWaTWZ56ltY3OABTPZZLmGgWnN+8J+/xu603W63hsilrkhelaAE1hmzO+lqP
 vOLGfedt9EPD/5ym4H/BM8jeSvteWxM8x+q17fErT4BKh1kZNeT911rdcFIJopxygFFwBuTuzbC
 /Moc96KW1Uhimcrpw4twc6y21JQPk3ro5r03KXND5vrHsjY82FFrard0nPM2NAI=
X-Google-Smtp-Source: AGHT+IHhrvH9XlXhAvlkmB4dmg5rWUKj4tV7WNnPYMhXKUjnS7+SRsMCzgnSdbDAMF3pjBVcH54UxA==
X-Received: by 2002:a17:902:d490:b0:226:3392:3704 with SMTP id
 d9443c01a7336-22c24984d71mr35601285ad.12.1744704801308; 
 Tue, 15 Apr 2025 01:13:21 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c95cd1sm111082335ad.150.2025.04.15.01.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:13:20 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 06/17] target/riscv: Add hard-coded CPU state of WG extension
Date: Tue, 15 Apr 2025 16:12:20 +0800
Message-Id: <20250415081231.21186-7-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250415081231.21186-1-jim.shu@sifive.com>
References: <20250415081231.21186-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add hard-coded state of WG extension. 'mwid' is the M-mode WID of CPU.
'mwidlist' is the list of allowed WID value of 'mlwid' CSR.

These CPU states can be set by CPU option, or can be set by machine code
via newly added APIs. If we want different WG configs of CPUs, we should
set it by machine code.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_cfg.h    |  2 ++
 target/riscv/cpu_helper.c | 18 ++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 51e49e03de..ac50928b57 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -613,6 +613,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
                                    void *rmw_fn_arg);
 
 RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
+void riscv_cpu_set_wg_mwid(CPURISCVState *env, uint32_t mwid);
+void riscv_cpu_set_wg_mwidlist(CPURISCVState *env, uint32_t mwidlist);
 #endif /* !CONFIG_USER_ONLY */
 
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv, bool virt_en);
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index a5b045aa2f..86b6240989 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -196,6 +196,8 @@ struct RISCVCPUConfig {
     bool pmp;
     bool debug;
     bool misa_w;
+    uint32_t mwid;
+    uint32_t mwidlist;
 
     bool short_isa_string;
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f4c4b69a3c..2c3a0d903b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -231,6 +231,24 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     *pflags = flags;
 }
 
+#ifndef CONFIG_USER_ONLY
+void riscv_cpu_set_wg_mwid(CPURISCVState *env, uint32_t mwid)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    cpu->cfg.mwid = mwid;
+}
+
+void riscv_cpu_set_wg_mwidlist(CPURISCVState *env, uint32_t mwidlist)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    cpu->cfg.mwidlist = mwidlist;
+}
+#endif /* CONFIG_USER_ONLY */
+
 RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
 {
 #ifndef CONFIG_USER_ONLY
-- 
2.17.1


