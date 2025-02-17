Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D39BC021A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:19:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjwKc-0002Ji-Cz; Mon, 17 Feb 2025 03:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwKa-0002JE-CN
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:18:21 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwKY-00012G-LA
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:18:20 -0500
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7c09a30e14dso142784085a.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 00:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1739780296; x=1740385096; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WSMPQ783pz0wo6KPO/CsW7bAJCl7WJZGQCgE4WKR3Zk=;
 b=i5xHQ8pEF/UEUxr2ZSmtXyP5LNFzh+mdTsQC7P8LLG8VW+t/vWl7UTgPK7UlatpSB/
 T1GyKZm5OvN0tR8DCOVVkEwOj4x9tbEX/+wXN69qLXa8BURouweN2n1it1jgCYT3mjpB
 KNJNTSpS38630mwolTR78plpGgjPdPLEVwViv9I86JS6z92aNUNfJDZlz7a3uWm/JgpT
 TFd5aPXvfjd0MwJAuyayTTOllxgW3Nn1AJSX/y8R+5q4BGgkHQDShqSL5OA+B1tITJ8P
 0N49JyYW5RB2AvyO3Xv8P4YM/pBc4kceaqfAeOpLueo1qQ9Uve3Z8mfMYxI/A4ismFaO
 5fAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739780296; x=1740385096;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WSMPQ783pz0wo6KPO/CsW7bAJCl7WJZGQCgE4WKR3Zk=;
 b=IMe9Px6T04LlvNXIuAwPUJSMzkwWfBZrb4q01HNt5+Mz1l2T9KszL3JFC+up6fN7E9
 SbyGQRNeHFmNBi3jcO774PVrD5bMMvLswCfuyxCd4qx3tYkImTMkUK8+OA0ZRhKru9uR
 Iiglh+e3mLKYyQ9zc9ITDsKhqk9sR27rzt45XzG/hoAvHv8Gw8kBj7f1ChcMvBYw0mrb
 MAnfbJ8a9VPZBdzI3R64JQc8NpGjIdV8KA/cyA3vGpjtk2f+0hJJDxUtwJZgGQxkwIAo
 6Q8aAdt3qrRUhRDmnXd0L9LXrxyYDlsIIuqRfLjrg0QuiuNhbYdjzhu05TLrRpatYDCX
 BIOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAQnW8kh8Oxh2EhjmgorKIRhdnZ4VknwLGo/oiNBerMnhhr/f1TvWfuWVoCEW29ULmgF9KzTHBLubC@nongnu.org
X-Gm-Message-State: AOJu0YzARXQx25ho+GZniUyokRP6bOp/rChkqm/38OklBFigmGEOdT/P
 qQZhDDs59Nau/rvTfjN5THfX7+z3W6Ie0tMu7VOrnHwYb/pEmkA0KsmFnZ362QQ=
X-Gm-Gg: ASbGncs8vfBiRBDgdTuIXrvytEfVNj/5kYgAlKzb7USrghwVsCZSim21XDErO8Ujn4V
 /+TUh3LcFC4hvcn2eW5hDY8TDUTg5CibbR3v6hmN+p1j+mop6sqvAZ8+Gm0W/0Umr8D83IlAjN4
 e8QEl396wVe7xlX1a8AnWEMoIrZEWdj4rb7xGWdWwfVS7Gjrm0QjMwmBx2c0ixM0d95rvZJabqA
 g/kTz39JaXrbCxJ+Mr+rNYIam/K6BUyeemkpTnrn1FQrwh//m82TrO1lDfzpCNUTqkIRqsHwrQN
 d/xerzbvLaMwrn+CoN8jkEh6/sAFk/09rH22jC0DFcsEaQ==
X-Google-Smtp-Source: AGHT+IHM6UE0Sdy5iJb7kr/1XKQMxNFWhtrYASUGG9yY/wUN/Pk1itW9CuXbu/pvDa8RKrYve4H4qA==
X-Received: by 2002:a05:620a:439e:b0:7c0:6045:b8ad with SMTP id
 af79cd13be357-7c08a9c890amr1131653485a.15.1739780296016; 
 Mon, 17 Feb 2025 00:18:16 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d9f38absm49673346d6.88.2025.02.17.00.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:18:15 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/8] target/riscv/kvm: rewrite kvm_riscv_handle_csr
Date: Mon, 17 Feb 2025 16:17:25 +0800
Message-Id: <20250217081730.9000-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250217081730.9000-1-yongxuan.wang@sifive.com>
References: <20250217081730.9000-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-qk1-x72c.google.com
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

Rewrite the kvm_riscv_handle_csr() to support additional CSR emulation
in user space with KVM acceleration. This update reuses the TCG CSR
emulation function to simplify the implementation and reduce the
redundant work. Also it introduces two hook functions for certain CSRs.
Before emulation, the related VS mode context of the CSR can be loaded
from host in context_load() hook. After the CSR handling, the modified
VS context is written back in context_put() hook.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 target/riscv/cpu.h         |  2 --
 target/riscv/csr.c         | 18 +++-------
 target/riscv/kvm/kvm-cpu.c | 68 ++++++++++++++++++++++++++++++++------
 3 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 133d1852ee1e..e30c4aa0e778 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -926,8 +926,6 @@ static inline const char *riscv_get_csr_name(int csr_no)
 }
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
-target_ulong riscv_new_csr_seed(target_ulong new_value,
-                                target_ulong write_mask);
 
 uint8_t satp_mode_max_from_map(uint32_t map);
 const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a62c50f057f4..df724575a5a0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -5241,8 +5241,10 @@ static int write_mnstatus(CPURISCVState *env, int csrno, target_ulong val)
 #endif
 
 /* Crypto Extension */
-target_ulong riscv_new_csr_seed(target_ulong new_value,
-                                target_ulong write_mask)
+static RISCVException rmw_seed(CPURISCVState *env, int csrno,
+                               target_ulong *ret_value,
+                               target_ulong new_value,
+                               target_ulong write_mask)
 {
     uint16_t random_v;
     Error *random_e = NULL;
@@ -5266,18 +5268,6 @@ target_ulong riscv_new_csr_seed(target_ulong new_value,
         rval = random_v | SEED_OPST_ES16;
     }
 
-    return rval;
-}
-
-static RISCVException rmw_seed(CPURISCVState *env, int csrno,
-                               target_ulong *ret_value,
-                               target_ulong new_value,
-                               target_ulong write_mask)
-{
-    target_ulong rval;
-
-    rval = riscv_new_csr_seed(new_value, write_mask);
-
     if (ret_value) {
         *ret_value = rval;
     }
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 79e80cdf7406..bcd28a355a66 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1623,26 +1623,72 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
     return ret;
 }
 
+/* User-space CSR emulation */
+struct kvm_riscv_emu_csr_data {
+    target_ulong csr_num;
+    int (*context_load)(CPUState *cs);
+    int (*context_put)(CPUState *cs);
+};
+
+struct kvm_riscv_emu_csr_data kvm_riscv_emu_csr_data[] = {
+    { CSR_SEED, NULL, NULL },
+};
+
 static int kvm_riscv_handle_csr(CPUState *cs, struct kvm_run *run)
 {
+    CPURISCVState *env = cpu_env(cs);
     target_ulong csr_num = run->riscv_csr.csr_num;
     target_ulong new_value = run->riscv_csr.new_value;
     target_ulong write_mask = run->riscv_csr.write_mask;
-    int ret = 0;
+    struct kvm_riscv_emu_csr_data *emu_csr_data = NULL;
+    target_ulong ret_value;
+    RISCVException ret_excp;
+    int i, ret;
 
-    switch (csr_num) {
-    case CSR_SEED:
-        run->riscv_csr.ret_value = riscv_new_csr_seed(new_value, write_mask);
-        break;
-    default:
+    for (i = 0; i < ARRAY_SIZE(kvm_riscv_emu_csr_data); i++) {
+        if (csr_num == kvm_riscv_emu_csr_data[i].csr_num) {
+            emu_csr_data = &kvm_riscv_emu_csr_data[i];
+
+            break;
+        }
+    }
+
+    if (!emu_csr_data) {
         qemu_log_mask(LOG_UNIMP,
-                      "%s: un-handled CSR EXIT for CSR %lx\n",
-                      __func__, csr_num);
-        ret = -1;
-        break;
+                      "%s: un-handled CSR EXIT for CSR %s\n",
+                      __func__, riscv_get_csr_name(csr_num));
+
+        return -1;
     }
 
-    return ret;
+    if (emu_csr_data->context_load) {
+        ret = emu_csr_data->context_load(cs);
+        if (ret) {
+            goto handle_failed;
+        }
+    }
+
+    ret_excp = riscv_csrrw(env, csr_num, &ret_value, new_value, write_mask);
+    if (ret_excp != RISCV_EXCP_NONE) {
+        goto handle_failed;
+    }
+    run->riscv_csr.ret_value = ret_value;
+
+    if (emu_csr_data->context_put) {
+        ret = emu_csr_data->context_put(cs);
+        if (ret) {
+            goto handle_failed;
+        }
+    }
+
+    return 0;
+
+handle_failed:
+    qemu_log_mask(LOG_UNIMP,
+                  "%s: failed to handle CSR EXIT for CSR %s\n",
+                  __func__, riscv_get_csr_name(csr_num));
+
+    return -1;
 }
 
 static bool kvm_riscv_handle_debug(CPUState *cs)
-- 
2.17.1


