Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AD8C61DFD
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 02:17:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0rZo-0004mp-Vb; Sun, 30 Aug 2026 22:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZn-0004lT-2z
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0rZl-0007fG-Je
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 22:16:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38fdeaed181so4463229a91.1
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 19:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788142604; x=1788747404; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yj3X6s5HDsl64/BQ6b/GU1IeAoNk6/eV2nZC5+pnfqY=;
 b=LBqLsmtDgmaS9I+kD7reIK91ezWFX1TtLgQ1UK2APgNRDhUry7PTbX07/nUJb9KOdh
 FUb9/uJfXjWsNiCK9jOu9CNwT+miMcNmX0F+x6F3yQfdXeZXUxK4FXYhi07LeCsO8wwy
 BVUByJEskjXwmdmxwQAAU6Lbl4m6j6pLggp85yv6aQP4yfZD6nD+r7nM5XLZkWJqElY9
 +AOtOx64qE03s0Ca8c1QYfgQD9pfMSDm4ym/WIC346pDCI9N7Jt1ZtKpYxNH/QSmhwpf
 C+CrkSHoYNvHUKmL5xuqbU0vHwZBzy74dMAluea0dbDjeCf17fW5DKnYoP0aQq8u4USF
 srkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788142604; x=1788747404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yj3X6s5HDsl64/BQ6b/GU1IeAoNk6/eV2nZC5+pnfqY=;
 b=d+UwjEp2C6qAvD5o0AfjwNkG9M5hNQg0j9wj/yyqhn2z2dGY3XhjXldgCQmwlGTdvy
 uqmtqTa9onJvOqTzCrqBCegTodkS1965Uj7HjgANRxKCFbbtHaJ2ZqhnIRIx/I+u+jvZ
 Mgq3ccMoa03PMVZReq3/AItmLRIv+jbaaNvu3QhFjRtp5KrxvV6hvAPChAs9N3qFTNul
 lM7exOpiSSuYEo+Hjf2RRCv6KyOllufnijdoLcOY+cuLYcV7DsME+eyY7GNYNSdS/SuD
 G2lOvkhNArHg+VUsPLUOKGN1vrOFVliWsHf6qSgg1dWzq3zmHhVzwa6hNH+l2/zfSEcd
 sFyg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxi1JO4L0xU6NAbZM6A1op/UNXSaIBO+6k+Gni/9ycP9uv6T0ZDxtfvXtvowW1IehXzZPv32AZjjive@nongnu.org
X-Gm-Message-State: AFuF++lK+tW0qvPTKaWtc1YilbXhImJOtd00m18nprXFOMoo9PruGRQ4
 ZqJg70Oku1voojtMTrKgk8u9zEk72zypru8GC+suFY4oOkEfHxnI8Fbu
X-Gm-Gg: AYBFou0n9ImW8gwEHUZDXVYWhYtVJoKu8uja00eb+5MqBkI0KZ3CJjFFICnhW15o47I
 skpnleRcHAtL8HpwKg64UeXZUTTWvu6lKUiu+Dz5bQoLvCQM42hs7/lkLa0tnypKMPAqeG/24KD
 7h7FXANM/upRf8mwjU++tVSYZXehESvzGDc/spOo8v1c6yti7pf7xG+8nJIywfpG2pcThqQ9sW/
 DXDJz1rBBqvle3s5MGBjzjzQLJqjuGHvlPUyLDkcnRSMJlY+ed3hL5YDe38rnUOt/LWq/ttSlNY
 SAZiYGyBXPl3OJZLwD9x8P9D0d1KW6tD7qB9If4A7+IJfvrqwLO71GKpdj9bpo48rXurTuA6NWM
 yz9xPY4sV1TClVz26Z+vx7FoMtV5eplBhBzht1c4b5Yv44zb+fwJYJnuLvzZ3sg/2MrUTsyVfxl
 k/+zoxIl65xGMbN0uUCVN7K99MurRUgKprxbLwlVr6O1ODHJaskyKXzjQXwh5RL6hRRuYAeMB5d
 IJpHnemg+nzC3Fgaa23TOkyE4ReplNIJHQ2hobouTTvlWSAwO1RmHjXN8hJK/M7h9awSVep+kwl
 4wvSPKxUPbcgOCTSXL0y
X-Received: by 2002:a17:90b:3c8d:b0:398:e969:87ef with SMTP id
 98e67ed59e1d1-398e9698ae3mr4131221a91.24.1788142604336; 
 Sun, 30 Aug 2026 19:16:44 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b186807bsm20071240a91.12.2026.08.30.19.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 19:16:43 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Portia Stephens <portias@oss.tenstorrent.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] hw/riscv: Add property to hart to allow private
 memory
Date: Mon, 31 Aug 2026 11:44:55 +0930
Message-ID: <20260831021500.82565-15-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831021500.82565-1-joel@jms.id.au>
References: <20260831021500.82565-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Portia Stephens <portias@oss.tenstorrent.com>

There are platforms where CPUs have different mapping of system memory.
The global system memory does not allow for this. This adds an optional
property to assign a specific memory region to a hart. This allows for a
machine to alias the hart's memory to system memory while the hart only
views memory from its own memory region.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/riscv_hart.h | 2 ++
 hw/riscv/riscv_hart.c         | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 197fa1623115..c3cd05a2c877 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -42,6 +42,8 @@ struct RISCVHartArrayState {
     uint64_t *rnmi_irqvec;
     uint32_t num_rnmi_excpvec;
     uint64_t *rnmi_excpvec;
+    /* Optional private memory region for use instead of system memory */
+    MemoryRegion *memory;
     RISCVCPU *harts;
 };
 
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 747754be6158..32fd39737ff6 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -53,6 +53,8 @@ static const Property riscv_harts_props[] = {
     DEFINE_PROP_ARRAY("rnmi-exception-vector", RISCVHartArrayState,
                       num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64,
                       uint64_t),
+    DEFINE_PROP_LINK("memory", RISCVHartArrayState, memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
 };
 
 static void riscv_harts_cpu_reset(void *opaque)
@@ -117,6 +119,12 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
     object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
 
+    /* Use private memory instead of system_memory if provided */
+    if (s->memory) {
+        object_property_set_link(OBJECT(&s->harts[idx]), "memory",
+                                 OBJECT(s->memory), &error_abort);
+    }
+
     if (s->harts[idx].cfg.ext_smrnmi) {
         if (idx < s->num_rnmi_irqvec) {
             qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
-- 
2.47.3


