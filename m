Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA3ACED611
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 23:10:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1syfny-0006qh-0Z; Wed, 09 Oct 2024 19:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1syfnr-0006ng-N2
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2024 19:09:11 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1syfnp-0000i6-2n
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2024 19:09:10 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2e06acff261so258500a91.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Oct 2024 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728515348; x=1729120148;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IvdoegZ6AwTbZGebnJ5OefWg6Yz9UTpv5gPPyIUdjh8=;
 b=yyP//fRLyMwqT5iI6wSu1M6Wo5Eb9QdfE3kGs6cotu9i5hlNmPVInHO9s7vj+bTfZe
 YoEfDul5cq/HXOlkWWjZ7AoICcXcBKFNtrSb0XMiEGMblNokZjgxWdatxUX/YlGOyAZM
 DlbYIn+OP1r1NmKB+hPJb2TgFgX7sXp91B6RhR5/BgbLgrR+WUZr8YvaJGzDh8lkgYNh
 TAEtVwXrMcvCRrdW3wURdfLrw4E60n5abWZatF2ydLeFJ9QFBh6ND23HgJKsjSTQb0Ws
 TAutGAhTSG899gfJTFHDXewaCpO7FdOm5K8laKqmY8YxKHxc+ymNDRiZwRZQUXqFP8Md
 +AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728515348; x=1729120148;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IvdoegZ6AwTbZGebnJ5OefWg6Yz9UTpv5gPPyIUdjh8=;
 b=O3otehvojTt9OjHHBOIQg0Y2LK2zKUXWXQ+GVXeBdpeDQpNTz1u1T8J/eq8wx5ENRh
 h+Cz2SjqmSQfAkmWqVv4C9ZcVZHZDzXt8KFlhQhOfgTa6VqqVSZYM2PnKcEZIDjZopuJ
 XLy7xTVGBCcxjTCA0CjSDbNZtSObjj0q/XudxFmHNj15gTGaupx/jB6qiD3AkFIpsxgg
 +mV7bfYCsjt8jiGTmS8s3cV0DzdHrwYPfqH4Xmqx4ApmPYvqWADtZ9y0ZWd11xU27ERi
 73qll9SH9rMoxnRlrdYrDrxb5OCZ+w75Iqxl2aLAYmCyCYASGwXxu6HcBiCFDPARpLdC
 GSug==
X-Gm-Message-State: AOJu0YyYs/rx0ZDaNhP+p91q90t/Iz7jAhbN885qOnQdkpOUGBTWPg7X
 PCrVJonNOmSdz1DglORxkctn3Oo5Sax8JERmJgCquQQ6pb21p022pOuWuGRI4ZQ=
X-Google-Smtp-Source: AGHT+IFM5dewSyuLQZRh1cyyivbPcufR3D+JNCo8h9++Lc+MovvRsJbrf9BvhDZqgNzAXH/9tr/zEg==
X-Received: by 2002:a17:90b:4f85:b0:2c9:5a85:f8dd with SMTP id
 98e67ed59e1d1-2e2a236bbd1mr4795438a91.18.1728515347812; 
 Wed, 09 Oct 2024 16:09:07 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2a55f9855sm2271902a91.2.2024.10.09.16.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 16:09:07 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 09 Oct 2024 16:09:02 -0700
Subject: [PATCH RFC 04/10] target/riscv: Use uint64 instead of uint as key
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-pmu_event_machine-v1-4-dcbd7a60e3ba@rivosinc.com>
References: <20241009-pmu_event_machine-v1-0-dcbd7a60e3ba@rivosinc.com>
In-Reply-To: <20241009-pmu_event_machine-v1-0-dcbd7a60e3ba@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: alexei.filippov@syntacore.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The event ID can be a upto 56 bit value when sscofpmf is implemented.
Change the event to counter hashtable to store the keys as 64 bit value
instead of uint.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/pmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 21377518f4e0..2531d4f1a9c1 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -265,14 +265,14 @@ static void riscv_pmu_cycle_update_priv(CPURISCVState *env,
     counter_arr[env->priv] += delta;
 }
 
-static bool riscv_pmu_htable_lookup(RISCVCPU *cpu, uint32_t key,
+static bool riscv_pmu_htable_lookup(RISCVCPU *cpu, uint64_t key,
                                     uint32_t *value)
 {
     GHashTable *table = cpu->pmu_event_ctr_map;
     gpointer val_ptr;
 
     pthread_rwlock_rdlock(&cpu->pmu_map_lock);
-    gpointer val_ptr = g_hash_table_lookup(table, GUINT_TO_POINTER(key));
+    val_ptr = g_hash_table_lookup(table, &key);
     if (!val_ptr) {
         pthread_rwlock_unlock(&cpu->pmu_map_lock);
         return false;
@@ -378,9 +378,10 @@ static int64_t pmu_icount_ticks_to_ns(int64_t value)
 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx)
 {
-    uint32_t event_idx;
+    uint64_t event_idx;
     RISCVCPU *cpu = env_archcpu(env);
     uint32_t mapped_ctr_idx;
+    gint64 *eid_ptr;
 
     if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_map) {
         return -1;
@@ -415,8 +416,10 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
         /* We don't support any raw events right now */
         return -1;
     }
+    eid_ptr = g_new(gint64, 1);
+    *eid_ptr = event_idx;
     pthread_rwlock_wrlock(&cpu->pmu_map_lock);
-    g_hash_table_insert(cpu->pmu_event_ctr_map, GUINT_TO_POINTER(event_idx),
+    g_hash_table_insert(cpu->pmu_event_ctr_map, eid_ptr,
                         GUINT_TO_POINTER(ctr_idx));
     pthread_rwlock_unlock(&cpu->pmu_map_lock);
 
@@ -597,7 +600,8 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    cpu->pmu_event_ctr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
+    cpu->pmu_event_ctr_map = g_hash_table_new_full(g_int64_hash, g_int64_equal,
+                                                   g_free, NULL);
     if (!cpu->pmu_event_ctr_map) {
         error_setg(errp, "Unable to allocate PMU event hash table");
         return;

-- 
2.34.1


