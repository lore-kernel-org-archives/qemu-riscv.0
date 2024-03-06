Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4CCC54E41
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 17:21:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhuw6-0008BH-MD; Wed, 06 Mar 2024 12:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhuw5-0008AW-79
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:20:09 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhuw3-0001CR-9a
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:20:08 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5ca29c131ebso5925366a12.0
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709745606; x=1710350406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMBh/u49DOAEejhXpEpyFUDYeRYjhmZaHILM+RyspVc=;
 b=buQP+H7dSgIibeHkksDhYh4nRQ00st3y+chtl7r9LeVqaxHDmLb+PBSfJCvyFgsFcr
 kvfHjigtg9mACKuJlmvmsbO2GeSBoY7huF5G0ryWkjt8K+WIIrb0KZookYfUWbcf+eJ/
 MdulE+xhkxzG9n96G2cElp8XQ02Lf4YRZKcXZxgHSKQbJZSddpM4r47mJs+EcRTUVYvx
 B4tv9ca8IiDzogO3ck6Bf37rzFYFsM69D3KbTTG5BnvEcPuzq1/l/d35gFKBwBmQNoJO
 7ypcmBJtMKleQgi291GbwuVFJFuYM52AlZLgkzeDEoUxcp8U4wPOrpIdIaNStGKp2jcc
 sK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709745606; x=1710350406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMBh/u49DOAEejhXpEpyFUDYeRYjhmZaHILM+RyspVc=;
 b=Xb4GaNf+4JGL6Taa1i3cXeUGmVpmFEFU8NtrtOdpih1CxnJelLUTEkDe2yvsmbIYIN
 hR5zRz1FV925Rl6dlA6a6jq7DNUJK5Ei8DQfH0SvXtq0uA/LjwKRGmAb4AP3XRAwzHrN
 9Du102vZpx9JaWE0xqSq0qHgceYF9iv7w6Exje7z4FwpZvnsd0Z6IEWOoRev31E5muj2
 6vq4leJz/KIRur9X14PmoGIbnmiBunDwb6azsyXuRKwFP4gbIg0rG0Hvm05xjY/Sly2u
 oWvupTPQd2dUcuvVE3Ms36ctWoR6pBvgZzGODCbPgjtAQmVAkODXMwd1t5Any/JZ+27O
 NSkQ==
X-Gm-Message-State: AOJu0YzpoweKKYj2eHJChT2R4Fr66jbFFkRDntsC/fZSSLBtUC6qiVjs
 AOfs48PGyL6D7K20sULwaYX7wedKxWufFJGBScdCkgEbj4TBoRn8eaufsKEcV2I=
X-Google-Smtp-Source: AGHT+IGBMs2oJ/Cl1sXwLlnooX6Yypww/85KPJYpEssH5fcRlOmZO+eJNN41uOy69frFsPwdnTodHw==
X-Received: by 2002:a17:90b:3585:b0:29b:f79:2b75 with SMTP id
 mm5-20020a17090b358500b0029b0f792b75mr13683412pjb.7.1709745606002; 
 Wed, 06 Mar 2024 09:20:06 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a170902c71100b001dbb6fef41fsm12869712plp.257.2024.03.06.09.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 09:20:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 9/9] target/riscv/vector_helper.c: optimize loops in ldst
 helpers
Date: Wed,  6 Mar 2024 14:19:32 -0300
Message-ID: <20240306171932.549549-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306171932.549549-1-dbarboza@ventanamicro.com>
References: <20240306171932.549549-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
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

Change the for loops in ldst helpers to do a single increment in the
counter, and assign it env->vstart, to avoid re-reading from vstart
every time.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index cc7290a1bb..1ab386830a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -208,7 +208,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t esz = 1 << log2_esz;
     uint32_t vma = vext_vma(desc);
 
-    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
+    for (i = env->vstart; i < env->vl; env->vstart = ++i) {
         k = 0;
         while (k < nf) {
             if (!vm && !vext_elem_mask(v0, i)) {
@@ -274,7 +274,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t esz = 1 << log2_esz;
 
     /* load bytes from guest memory */
-    for (i = env->vstart; i < evl; i++, env->vstart++) {
+    for (i = env->vstart; i < evl; env->vstart = ++i) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << log2_esz);
@@ -388,7 +388,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t vma = vext_vma(desc);
 
     /* load bytes from guest memory */
-    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
+    for (i = env->vstart; i < env->vl; env->vstart = ++i) {
         k = 0;
         while (k < nf) {
             if (!vm && !vext_elem_mask(v0, i)) {
-- 
2.43.2


