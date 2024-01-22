Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3549EC47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRwth-0006XY-Sa; Mon, 22 Jan 2024 11:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwth-0006X5-2f
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:41 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtf-0005Kr-Be
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:40 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-290483f8c7bso2485108a91.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 08:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705939898; x=1706544698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lv48qBmYyxAB73lkKJKjEAgQbN3yEFZfSfzEzKLA/Ic=;
 b=Rh4n1A7LVAUs2C5gKYGKKQIFQltwPfQyEMdLcuBwgHkNyilP/Q+YmsEtjV6kGRXPlX
 /aWliqtWG5Y//I3GjoyJ2ahySGrfMlwCMYqT5N44FujQll9Of+geQ6iK/zS9eD5HkrDi
 oNmHoTzu2clbiSjaqb8U7OVfq18PlYTQYISPLg3K3/qwfE3/4wmg8Lu4AtEoVucDwAk3
 Oce5L/L07QfmpqJhQyNwzYf9dsJTuZQ7XE4l/gbrFuX4irAkqpijALxR05RCO9MhTzoq
 42eQRnB/D4FSA2uRdlH4xLTOF+dP9PBZqo5/ZL5zlnpmoTt6t8yvDMpX5xu4PLOantx1
 s1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705939898; x=1706544698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lv48qBmYyxAB73lkKJKjEAgQbN3yEFZfSfzEzKLA/Ic=;
 b=xN5yRVyhtxYwbEMm4Tw0L4rzC7IpPetFupWCjs1uS9FbQoVAGYInSO/WY/raFO4DnO
 abgDuHhSTMDRy+KkSZUfEthuF65ixnwlWM7MkLGV3LeTqr8lmDS6A6D9M5Sctra5vmDU
 aUQGrk/elJLnwQGrI0H/yO/fxmvpQNSKNd8sldiXYGwTg+7srmcL5RA6kbhV6IjNSBPF
 Up7tnoEBoykKIbD9E4NCwc7haeIvYzCB3WSzsWAMiLrkTFtwUQLVtR39ziCkI47h1NUA
 W85JTI9AQxIoFHkQMbFus81pB+8MmtwKlduBbz4FMmbJEXg2oKIDs7dCC5eG0hS3yT7k
 uSBw==
X-Gm-Message-State: AOJu0Yz51sYo8ZIhwmixXaQ/f7tsCSz7OGt3yp0kf/pQe+lB0Kda5ZkY
 NvGmEG01tOyoTQKXmxrjs3QZUlcCcDiwZehOxcbkE7vplow3qezsafew2bDcBcA=
X-Google-Smtp-Source: AGHT+IHTJ/ltiicqlwenbii+Ma+9AbZpWdVx67nGerkwBWbrF8qNWHPAfsPwd+t09mkahd1/e/SKqA==
X-Received: by 2002:a17:90b:3110:b0:290:9311:9d12 with SMTP id
 gc16-20020a17090b311000b0029093119d12mr985827pjb.56.1705939897938; 
 Mon, 22 Jan 2024 08:11:37 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 db3-20020a17090ad64300b0028e245501e7sm9866446pjb.4.2024.01.22.08.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:11:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 07/13] target/riscv/vector_helper.c: use 'vlenb'
Date: Mon, 22 Jan 2024 13:11:01 -0300
Message-ID: <20240122161107.26737-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122161107.26737-1-dbarboza@ventanamicro.com>
References: <20240122161107.26737-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Use 'cpu->cfg.vlenb' instead of 'cpu->cfg.vlen >> 3'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c1c3a4d1ea..cb944229b0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -558,7 +558,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 {
     uint32_t i, k, off, pos;
     uint32_t nf = vext_nf(desc);
-    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
+    uint32_t vlenb = riscv_cpu_cfg(env)->vlenb;
     uint32_t max_elems = vlenb >> log2_esz;
 
     k = env->vstart / max_elems;
@@ -929,7 +929,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vl = env->vl;                                    \
     uint32_t vm = vext_vm(desc);                              \
-    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb << 3;    \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
     uint32_t i;                                               \
                                                               \
@@ -967,7 +967,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
 {                                                               \
     uint32_t vl = env->vl;                                      \
     uint32_t vm = vext_vm(desc);                                \
-    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;            \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb << 3;      \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);                \
     uint32_t i;                                                 \
                                                                 \
@@ -1171,7 +1171,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb << 3;    \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
     uint32_t vma = vext_vma(desc);                            \
     uint32_t i;                                               \
@@ -1236,7 +1236,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;                \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb << 3;          \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
     uint32_t vma = vext_vma(desc);                                  \
     uint32_t i;                                                     \
@@ -3971,7 +3971,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb << 3;    \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
     uint32_t vma = vext_vma(desc);                            \
     uint32_t i;                                               \
@@ -4011,7 +4011,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;                \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb << 3;          \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
     uint32_t vma = vext_vma(desc);                                  \
     uint32_t i;                                                     \
@@ -4528,7 +4528,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vl = env->vl;                                \
-    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;      \
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb << 3;\
     uint32_t vta_all_1s = vext_vta_all_1s(desc);          \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4615,7 +4615,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
 {
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
-    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;
+    uint32_t total_elems = riscv_cpu_cfg(env)->vlenb << 3;
     uint32_t vta_all_1s = vext_vta_all_1s(desc);
     uint32_t vma = vext_vma(desc);
     int i;
-- 
2.43.0


