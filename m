Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43038C46CA2
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 13:53:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rEV5I-0001C9-Ho; Sat, 16 Dec 2023 08:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5E-00017U-VH; Sat, 16 Dec 2023 08:52:00 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5B-0001E4-U4; Sat, 16 Dec 2023 08:52:00 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc4029dc6eso18168031fa.1; 
 Sat, 16 Dec 2023 05:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702734716; x=1703339516; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oN1psNxcDgJFhm/E3XNz0g2xCbvEoEyEGFOivuneCyU=;
 b=An6C3Vd9uHz9L7MgsPVOguo4hulHqZQye1vkkqGhVNdw+SufcPogfOdygkrmLHL4qP
 jv4Liw/lOOqo5u/AJHG15tZY3VQH5YKNWZJkn6i6AyUUCHo3u9AnS3nRXeEnrcvmPYrG
 BjDy1Q1YSlZrOqPYS37fNowO5aDkgNS3ipnES1Sc+2HF8tKqWUsnTq3FnlVtViNlKdIM
 H22Kt8SJONdIZaok1hUhElpwDKmyL66PmzWJyrGmJQDFIh5Qtu5zhGMIkIH4hhw5nTBH
 MuSnyUzR7qm9K8KnnYM4j+7IYzqfW7UbryT+wF7iA15BEiVhhS0pSD396jwUIr3uQ0Y9
 yFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702734716; x=1703339516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oN1psNxcDgJFhm/E3XNz0g2xCbvEoEyEGFOivuneCyU=;
 b=C/37VWJx428xj0wRNWpw0yde4VKPllywZezj+Ql0pbRrWnkdrQ1APw5ZChh0vYdWTV
 01qjHUb+8ZdYzuEFCl3MiwIA+9DKjCCvaBN3/If+Ie0ZFgr11Om0F16NVCIsalAqpzCs
 e/+1wu3RTbhFndRj+XvE47x8NCB/99lafwAi/ze/MVCcULXVWbRgAgfWUn6ROdl9YGWX
 Ajs7vZoqEssaQF93vWQHja2j/hzIrwqp1fb6UVEo3gPztJarXnLv+QyeMyONDFUEvQdP
 KGu57j1BX589nLmIRlfjLmBcLnh/76HlLaCHW0NqcFEKvgU6sYtTkKR9gyxcXGQGqsay
 8mSg==
X-Gm-Message-State: AOJu0Ywm8LZCaGmqP+4QOj5zwg66wRTC7XJTSv4UHswkNeuNgWWkkxVD
 MjwT0cpZ2JXQPS4V0HTMVis=
X-Google-Smtp-Source: AGHT+IELfMM57A8wFw/eCznkK4zjdAM1LsIB7joZqhQ498V2gwdblEUN1D3ezcy2hQOAB4r/n4LURg==
X-Received: by 2002:a05:6512:690:b0:50b:f4fc:6b79 with SMTP id
 t16-20020a056512069000b0050bf4fc6b79mr7188742lfe.84.1702734715783; 
 Sat, 16 Dec 2023 05:51:55 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 vw12-20020a170907a70c00b00a1c904675cfsm11819595ejc.29.2023.12.16.05.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 05:51:55 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: zhiwei_liu@linux.alibaba.com, baturo.alexey@gmail.com,
 richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 4/6] target/riscv: Add functions to calculate current
 number of masked bits for pointer masking
Date: Sat, 16 Dec 2023 13:51:34 +0000
Message-Id: <20231216135136.1597456-5-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231216135136.1597456-1-me@deliversmonkey.space>
References: <20231216135136.1597456-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 49 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2099168950..9a8e5bc022 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -679,6 +679,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags);
 
+void riscv_cpu_update_mask(CPURISCVState *env);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 79cddbd930..8e2751fef4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -143,6 +143,55 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     *pflags = flags;
 }
 
+void riscv_cpu_update_mask(CPURISCVState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    int priv_mode = cpu_address_mode(env);
+    int pmm = 0;
+    int pmlen = 0;
+    int satp_mode = 0;
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        satp_mode = get_field(env->satp, SATP32_MODE);
+    } else {
+        satp_mode = get_field(env->satp, SATP64_MODE);
+    }
+    /* Get current PMM field */
+    switch (priv_mode) {
+    case PRV_M:
+        pmm = riscv_cpu_cfg(env)->ext_smmpm ?
+                  get_field(env->mseccfg, MSECCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    case PRV_S:
+        pmm = riscv_cpu_cfg(env)->ext_smnpm ?
+                  get_field(env->menvcfg, MENVCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    case PRV_U:
+        pmm = riscv_cpu_cfg(env)->ext_ssnpm ?
+                  get_field(env->senvcfg, SENVCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    /* Get pmlen from PMM field */
+    switch (pmm) {
+    case PMM_FIELD_DISABLED:
+        pmlen = 0;
+        break;
+    case PMM_FIELD_PMLEN7:
+        pmlen = 7;
+        break;
+    case PMM_FIELD_PMLEN16:
+        pmlen = 16;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    /* in bare mode address is not sign extended */
+    env->pm_signext = (satp_mode != VM_1_10_MBARE);
+    env->pm_pmlen = pmlen;
+#endif
+}
+
 #ifndef CONFIG_USER_ONLY
 
 /*
-- 
2.34.1


