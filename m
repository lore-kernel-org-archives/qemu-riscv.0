Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0399C47258
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 21:03:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqWM-0004ef-TL; Tue, 16 Jan 2024 15:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWH-0004dv-JV
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:51 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWF-0007cQ-U8
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:49 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-28e75ee994cso865924a91.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438727; x=1706043527; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbwYjyXSBpPyinrAeXmIDHhORc0A5UKNrKSEWcx5rqU=;
 b=DuSo5AQdvraj+I66kcgivGXpUK9Km1uEeOuMwNTiNciFEItXGjg9Et9Y7kEgwLhdg7
 6hRg5/W6msIGB4DsKcXu9Pm3AaeoIc1R8bidEhBBD0XTsuDRmPsXn3C9FWpE2tQey5Zr
 WZkMomD8bLd3+Namfxcw+wK6SsGiMso3h4oqUKdnr4hQLS/PYvXUAGDs4ez1IP08NeVw
 o34tWZrt4oapJ0IJcWYnz6PqfVjByDhKq2jLgxMS7TdW/PzyW56TenP38Q0rhX5Zcmez
 4Rh0/NTyEJh+SF+xZnnpAyyj2DJgIsPPf8Jubfl08iCDROjDkchHm7Uye6iohZFmJduO
 3dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438727; x=1706043527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbwYjyXSBpPyinrAeXmIDHhORc0A5UKNrKSEWcx5rqU=;
 b=j+iMiwyWjI8AnJv6UDgggL5f6NgoSu2aQbEpE7PRptS2trcnfkwMAwOAtEOqZLDwkK
 nn2wSCsduyVBkPXhbxDWU+gl7I7aAi2Z187fURioL0qy3/MJydcSYN6ZNqlgO651NRsn
 cT887l7DdqSthTz5zn+N0jckcS6crh1ORDhPphZkKDlV1ZrwnqEMgHGfK853X1I39YR8
 NTtlyxwr7I/+y1E+AeAUPZo+eEVdrxf5T/aelpReN04aXjNRdjf7J5ABni5U4DrUZHKW
 bZKDO5OyhCFxG0cREtAbAqTwcflEv84A9Eq86vEwB2FCnmYYfVcfbMiOuJAHybNtWKH+
 A2pQ==
X-Gm-Message-State: AOJu0Yym8gRjei8M4dSE32ZKv9BC3KKz/Q2NL7adQe664NYLXiPNwkSo
 0J0FxYRGUH5r8QpvxK8LVwuqe+QBuvch1Q==
X-Google-Smtp-Source: AGHT+IF0xfuf6hgHKwUY9chEwSLyZ/jVupNpMOQtOeLJJn1DL65vAsT+X97sP74P0QAUVaGaTqQIug==
X-Received: by 2002:a17:90b:8ce:b0:28e:79cd:26e5 with SMTP id
 ds14-20020a17090b08ce00b0028e79cd26e5mr1841689pjb.40.1705438726771; 
 Tue, 16 Jan 2024 12:58:46 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:58:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 07/13] target/riscv/vector_helper.c: use 'vlenb'
Date: Tue, 16 Jan 2024 17:58:11 -0300
Message-ID: <20240116205817.344178-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1034.google.com
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


