Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2617EC369AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 08:18:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4bRQ-0004mN-4a; Tue, 15 Apr 2025 04:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bQx-0001zn-1M
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:14:20 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bQn-00023Y-W1
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:14:12 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-af5cdf4a2f8so3882252a12.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Apr 2025 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744704835; x=1745309635; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wmWgl0GHsRaxiJyu5Hk62jxV2+HXDxpJgBZBEMvOZO8=;
 b=iXLYWzA6792SY49MRyEfTec2A3kfaXFNsS6d2Hu5rzlB+gqS7uurrtV86ufDOhH3Js
 QB9ErESFWZqCx/uICqRJLh9wewtmoBgMI/eZkagFsdxBnsjDjU6tGUK99OmDJeKgt4xS
 +QQbYx4/BR1PSYEri5CWXoz+Wk4AbV4bwzLaaKhemPHmvxNovfIhQIwdaBBXkAiO31nZ
 3Ge/h6OMX8ZIs3SmrKg3FnlRIKAAVaEKI4QjFPhMMJSE6OZUYEwpsUyKLFScbt6vaLOE
 5tlevSL8baVTDNgg+vEwHiq2k5Z9tiKKarHOD3LZol4Nv/xmxvhbfYslLKCUXgL5rdox
 fqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744704835; x=1745309635;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wmWgl0GHsRaxiJyu5Hk62jxV2+HXDxpJgBZBEMvOZO8=;
 b=f8TPOmUTQ7Scv/XzGxWbdJBMuIlbMgeLqVv697i8mGXFO9lKAdWcSeercYTzwyid08
 m54zf4rxv9zJrvSpkJ/ABe95Occ+JDql8oAieeAHmLjBMFYp47PDgeKWRwcM40o432eF
 TBpVbj+IZEosxcAtQT4bTWBTRjrJcEJ9oC6fTkEzxf9zjTjgrkALUvfKIU0xeCNMDA3Q
 mEJlCmMI5DQkEW7ACHwQSY3V2OSLRQLvMB3H92urgZUCcfAAPj8T9kwFOMfucEV1WOEP
 tsCsO2gzjvM/Q7r+FFbMOSXZEFxwHg7OCpfiE5eZM4Oa3RRKb7V5+MlJgXcAe3Q5ptSk
 lqMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnrqVZtN2f86Z4jVdLE3UQda1rFjBSZ0/3EVhAGNOdiZF+LijvbQrNlrwvJ/5I6ZMYGYHs8YQw+eor@nongnu.org
X-Gm-Message-State: AOJu0YxEmLESjvDUjWbNHGkaAYgDjACFbbkLAG6+EiUVlO3irspZU0mE
 QZKw2Ftb68ATdLBVo59Cur5xxvFayyL2ADEw+QfdvGqbJKwqv6/7aKPy+gUWYQ0=
X-Gm-Gg: ASbGnct3P8we2ERTqZ2xGoqQojphLGnGUQ/SCWWLNNqRudCY9nJGVvhyek7rjyuuyt2
 xK3OOkPKCHKI9bb97dOzCcyGIJEYu+N6d5M3tBVfW/UIs6zfz6mT+kye69tTjoOZwMAu3GXP4YJ
 qSWY1C2kP6VCGwWdB2WCS4RNrrDrpXzfFE9oFQTJ8al+grYtp9P1CDKRJOvzis+x66+uffYYyb4
 HWIWlOzFOhW6X8ErzF/bwu0yrCykrjTL6QxV4a/jOwXNhWGyPu4LYhRLakVAPLakXHoa/NKW4LG
 wul9zKKLxgZpdj1t2UdEah2mNZRN8+9N46siEAbPFtxJjCBqPpsBzaq1429C1XU=
X-Google-Smtp-Source: AGHT+IHSpqT4tx13aUU5XeEODDNE5dFjkjHSEONowjSmSoGirw4UK9mUPEpqy1GqDoWIotSmwM7oHA==
X-Received: by 2002:a17:90b:5407:b0:2fe:99cf:f579 with SMTP id
 98e67ed59e1d1-3082366038bmr22498415a91.4.1744704835012; 
 Tue, 15 Apr 2025 01:13:55 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c95cd1sm111082335ad.150.2025.04.15.01.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:13:54 -0700 (PDT)
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
Subject: [PATCH 12/17] hw/misc: riscv_worldguard: Add API to enable WG
 extension of CPU
Date: Tue, 15 Apr 2025 16:12:26 +0800
Message-Id: <20250415081231.21186-13-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250415081231.21186-1-jim.shu@sifive.com>
References: <20250415081231.21186-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=jim.shu@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

riscv_worldguard_apply_cpu() could enable WG CPU extension and set WG
callback to CPUs. It is used by machine code after realizing global WG
device.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/misc/riscv_worldguard.c         | 87 ++++++++++++++++++++++++++++++
 include/hw/misc/riscv_worldguard.h |  1 +
 2 files changed, 88 insertions(+)

diff --git a/hw/misc/riscv_worldguard.c b/hw/misc/riscv_worldguard.c
index b02bd28d02..1a910f4cf3 100644
--- a/hw/misc/riscv_worldguard.c
+++ b/hw/misc/riscv_worldguard.c
@@ -92,6 +92,93 @@ uint32_t mem_attrs_to_wid(MemTxAttrs attrs)
     }
 }
 
+static void riscv_cpu_wg_reset(CPURISCVState *env)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    uint32_t mlwid, slwid, mwiddeleg;
+    uint32_t trustedwid;
+
+    if (!riscv_cpu_cfg(env)->ext_smwg) {
+        return;
+    }
+
+    if (worldguard_config == NULL) {
+        /*
+         * Note: This reset is dummy now and WG CSRs will be reset again
+         * after worldguard_config is realized.
+         */
+        return;
+    }
+
+    trustedwid = worldguard_config->trustedwid;
+    if (trustedwid == NO_TRUSTEDWID) {
+        trustedwid = worldguard_config->nworlds - 1;
+    }
+
+    /* Reset mlwid, slwid, mwiddeleg CSRs */
+    if (worldguard_config->hw_bypass) {
+        /* HW bypass mode */
+        mlwid = trustedwid;
+    } else {
+        mlwid = 0;
+    }
+    slwid = 0;
+    mwiddeleg = 0;
+
+    env->mlwid = mlwid;
+    if (riscv_cpu_cfg(env)->ext_sswg) {
+        env->slwid = slwid;
+        env->mwiddeleg = mwiddeleg;
+    }
+
+    /* Check mwid, mwidlist config */
+    if (worldguard_config != NULL) {
+        uint32_t valid_widlist = MAKE_64BIT_MASK(0, worldguard_config->nworlds);
+
+        /* CPU use default mwid / mwidlist config if not set */
+        if (cpu->cfg.mwidlist == UINT32_MAX) {
+            /* mwidlist contains all WIDs */
+            cpu->cfg.mwidlist = valid_widlist;
+        }
+        if (cpu->cfg.mwid == UINT32_MAX) {
+            cpu->cfg.mwid = trustedwid;
+        }
+
+        /* Check if mwid/mwidlist HW config is valid in NWorld. */
+        g_assert((cpu->cfg.mwidlist & ~valid_widlist) == 0);
+        g_assert(cpu->cfg.mwid < worldguard_config->nworlds);
+    }
+}
+
+/*
+ * riscv_worldguard_apply_cpu - Enable WG extension of CPU
+ *
+ * Note: This API should be used after global WG device is created
+ * (riscv_worldguard_realize()).
+ */
+void riscv_worldguard_apply_cpu(uint32_t hartid)
+{
+    /* WG global config should exist */
+    g_assert(worldguard_config);
+
+    CPUState *cpu = qemu_get_cpu(hartid);
+    RISCVCPU *rcpu = RISCV_CPU(cpu);
+    CPURISCVState *env = cpu ? cpu_env(cpu) : NULL;
+
+    rcpu->cfg.ext_smwg = true;
+    if (riscv_has_ext(env, RVS) && riscv_has_ext(env, RVU)) {
+        rcpu->cfg.ext_sswg = true;
+    }
+
+    /* Set machine specific WorldGuard callback */
+    env->wg_reset = riscv_cpu_wg_reset;
+    env->wid_to_mem_attrs = wid_to_mem_attrs;
+
+    /* Reset WG CSRs in CPU */
+    env->wg_reset(env);
+}
+
 bool could_access_wgblocks(MemTxAttrs attrs, const char *wgblock)
 {
     uint32_t wid = mem_attrs_to_wid(attrs);
diff --git a/include/hw/misc/riscv_worldguard.h b/include/hw/misc/riscv_worldguard.h
index 8a533a0517..211a72e438 100644
--- a/include/hw/misc/riscv_worldguard.h
+++ b/include/hw/misc/riscv_worldguard.h
@@ -48,6 +48,7 @@ extern struct RISCVWorldGuardState *worldguard_config;
 
 DeviceState *riscv_worldguard_create(uint32_t nworlds, uint32_t trustedwid,
                                      bool hw_bypass, bool tz_compat);
+void riscv_worldguard_apply_cpu(uint32_t hartid);
 
 uint32_t mem_attrs_to_wid(MemTxAttrs attrs);
 bool could_access_wgblocks(MemTxAttrs attrs, const char *wgblock);
-- 
2.17.1


