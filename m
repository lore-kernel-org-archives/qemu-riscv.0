Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DABC5475B
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 18:10:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rjk5l-00057Q-L4; Mon, 11 Mar 2024 14:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rjk50-0004tU-FX
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 14:08:56 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rjk4y-0004Qx-Mw
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 14:08:54 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-29c277301c1so362907a91.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Mar 2024 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710180531; x=1710785331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ixFEPVp8c6KmG9HvM9JwOcRXeyd4JQRHbHvx2xyG7g=;
 b=l0znQXubUXM7coF9e9OyewAUHP8vkOOZWbBpsU3wN1k8mVp6ZA1mJoNMmvQV0IkRgZ
 zM+qkR7LRJYWN25mbcQsH5F5oxMXshVq4Or5mpSJ0IzgGuJmc4vmN+/kiJDEiNIgIoXI
 Wi2W9v5p31mW3MXZ1Js9vH25yHIc4ZdygOdhyXcm29Rc+jhk+jKiCVIBK9nPEfzGNuHV
 eU3uIlJL4KQHyQ/G548qAMaM1gaZGZJV19rutAFGFnJwcCd1PClWDrh1lO2/7IGCU8TM
 nN6OIcq9Nc6Xv8KUeMXV3THZh0T1zv5mBgtYc1Apwqu1ka+zslFMIZoV4LzJ3tEbqprB
 x8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710180531; x=1710785331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ixFEPVp8c6KmG9HvM9JwOcRXeyd4JQRHbHvx2xyG7g=;
 b=w3JghA8SYZTXHY35vkENeWcn54vDw7iQCDYeOFML72v2U/NxSBlGUSLwxouVj0j5gP
 RQiEH/+BtCT1dZMwnP6qqq8oSDBCqR3jGV7T0R2AJGnyTQsh1HP92uRTnKGVTiXcScf7
 q/fMRuNNsYL3ZGa5RzrGB2oTwC1toZ2WZqEslHbV7T6qlfAocMKKNp1cguk/5OtZ82xK
 auwPO+Cjzggrt0n6B1ElQ8gF+UbYYVxDdXUevJRBJ88t8GHD78Cu6sYMRc3J+wo6iwfK
 PL4SsXvNoiUpFDo27e0Qpi0++21C6eoZzdJseDY3jjxomwgZMG2LdEtbExCgxe5UiHfQ
 vR2w==
X-Gm-Message-State: AOJu0Yw60Fw7fuD1i7H1dJvVugXkIdoLSzxvSHyCDn0yMD3CqlQXLMwl
 vdd0mXwysp2VbnH9SPr/zFTLfV2AxTZWX/z0+Lnubhkis72NSGqbTm4gK2yt2/0=
X-Google-Smtp-Source: AGHT+IFUbjsm5EeaD5U1j1b4wMNGMGmHDHBMO6A1MCEo9lAus9f7+mgEZmMoQMsvTNxKpchGuhS7DA==
X-Received: by 2002:a17:90a:ff0f:b0:29b:aa36:e845 with SMTP id
 ce15-20020a17090aff0f00b0029baa36e845mr1223293pjb.43.1710180531385; 
 Mon, 11 Mar 2024 11:08:51 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 hk13-20020a17090b224d00b0029c2794d3f7sm525810pjb.7.2024.03.11.11.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 11:08:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v12 7/7] target/riscv/vector_helper.c: optimize loops in ldst
 helpers
Date: Mon, 11 Mar 2024 15:08:21 -0300
Message-ID: <20240311180821.250469-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240311180821.250469-1-dbarboza@ventanamicro.com>
References: <20240311180821.250469-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102b.google.com
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
index b4360dbd52..712a2ee4dd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -209,7 +209,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
 
     VSTART_CHECK_EARLY_EXIT(env);
 
-    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
+    for (i = env->vstart; i < env->vl; env->vstart = ++i) {
         k = 0;
         while (k < nf) {
             if (!vm && !vext_elem_mask(v0, i)) {
@@ -277,7 +277,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     VSTART_CHECK_EARLY_EXIT(env);
 
     /* load bytes from guest memory */
-    for (i = env->vstart; i < evl; i++, env->vstart++) {
+    for (i = env->vstart; i < evl; env->vstart = ++i) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << log2_esz);
@@ -393,7 +393,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     VSTART_CHECK_EARLY_EXIT(env);
 
     /* load bytes from guest memory */
-    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
+    for (i = env->vstart; i < env->vl; env->vstart = ++i) {
         k = 0;
         while (k < nf) {
             if (!vm && !vext_elem_mask(v0, i)) {
-- 
2.43.2


