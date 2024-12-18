Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95089E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 14:25:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNuyr-0006gK-LL; Wed, 18 Dec 2024 09:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tNuyp-0006gB-V0
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 09:24:51 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tNuym-00033x-CV
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 09:24:51 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so4484486f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 06:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1734531885; x=1735136685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Y7B5PzMIQAYWoZxCx+iKjiN9AyJgktzWgwoHucsn1I=;
 b=T1pd2UkYgpCHZiAqXIsDQrUV76dtpEgV5uOF1GnLo25t+1HurG2Zd82CvZHxY5AJC3
 muPEvgqwBZOE4Z+a9CmhY4RYKxy73FXsEXea1c4Cf3gdvkWkRGimK8gq4SGm+JmL7ZpO
 XJaP8CUjYnfLcd3yUwZcQulPmZh+a//b1NSDCLofsnL70DV1p3py0FlX8t0K8e84V57j
 FoDoS6wFMPhqub9pbtxCbLRNG1XOIy5r4RdcEjQW0GkxOQpsLj0RI+mCT72TI775KDY0
 ahkkf8B2kIiQtMbCaervTHTX5HIcyAOg6VYGIQlIHUIGXe5vOmeK80cNrl4KtECL1Far
 L7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734531885; x=1735136685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Y7B5PzMIQAYWoZxCx+iKjiN9AyJgktzWgwoHucsn1I=;
 b=XkGm+9LVjdF+lDDo2cPTuofAqKvGdKv2+pcMnPr0rBP36GVNpyZfUiStfn8u5MTvYj
 XIn8h47b78KmIw6ZAUFHKHEb7cBiy1x1mJMEYu5eAasn/UIFkkH8vT7vNu6pj8eKv+lu
 dQ4SI6gtkaUEeLyFDp+QvM55wr13Yc3YOGJLAlR8xGU1c0lfD+vkOWluh6NhJpmvVwzo
 NPqc64jEouVYBD/XB5A4+9WiZ7FfHYjZQSbodqc5gCFJnq4XizJvL7t0JS5EpQt1NIXs
 d6k1CaiFAUkUUiU6UlyL7hIkzgK0AzF7wt6QxujpDR/x4g3QrEGMCi9C69+/cKErHQTO
 JC3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMHlaadUlJvxT4/GYuhB/G7O23qfUnT25Nf2fkpO7JL5rmvMyBRbB+mnmCpm6XxkDG7VIlypJtPHDS@nongnu.org
X-Gm-Message-State: AOJu0YxByNRJQQDqJSdy5WTs26BrwmODNGui8hMxo/GBltSyGTVPaKi3
 6QYBW6myNCUHawvvLuP9IJGBmiuB7sBYRP4aeuwVmeb1MymPwP6VlKMS1oJFYz0=
X-Gm-Gg: ASbGnct85qqtypScNVGS3pzASwiO2NqTIH22/z2bHQvVJmwXxUE2IO1n/cBOfjM8AkD
 1KuzoYT+nUuuiWIH1hs19elPfGxC4iXMbOGqU3utK/pU4bI0RXeTZDZ/06Z/rvWUrop+vR6z+tM
 lM6IH8/8WdFLqA+89c0ZLDJU/dOQywNmkqZ9ng47FNDIxYNSr1mAncsJ0VDbylt2HzvFfGixJom
 9xsPllLT5NqLmw4EpJxVr0EsaU3DQjGkjAIgzDAROmNg9deNVk3qs0sMkCebj5e+EU7+VlJRii6
 9wMNEh2kOAvPNP1Es549nes0r7lF/Cd2u052qXO/g3UNAP5f
X-Google-Smtp-Source: AGHT+IHNSMtmESVz1QpoKKenS5EyK03qEwWM1pGW3Ka1JECewhOex0OcdvMj7UDKkOr93KrvEj8h4Q==
X-Received: by 2002:a05:6000:401e:b0:385:dedb:a148 with SMTP id
 ffacd0b85a97d-388e4d91e8cmr2852982f8f.46.1734531885537; 
 Wed, 18 Dec 2024 06:24:45 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c806115asm14075200f8f.107.2024.12.18.06.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:24:45 -0800 (PST)
From: Craig Blackmore <craig.blackmore@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Craig Blackmore <craig.blackmore@embecosm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
Subject: [PATCH v8 1/2] target/riscv: rvv: fix typo in vext continuous ldst
 function names
Date: Wed, 18 Dec 2024 14:23:52 +0000
Message-ID: <20241218142353.1027938-2-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <14dfb7b7-98bb-4e8c-a223-c568512180b7@embecosm.com>
References: <14dfb7b7-98bb-4e8c-a223-c568512180b7@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wr1-x433.google.com
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

Replace `continus` with `continuous`.

Signed-off-by: Craig Blackmore <craig.blackmore@embecosm.com>
---
 target/riscv/vector_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a85dd1d200..0f57e48cc5 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -195,7 +195,7 @@ GEN_VEXT_ST_ELEM(ste_w, uint32_t, H4, stl)
 GEN_VEXT_ST_ELEM(ste_d, uint64_t, H8, stq)
 
 static inline QEMU_ALWAYS_INLINE void
-vext_continus_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
+vext_continuous_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
                        void *vd, uint32_t evl, target_ulong addr,
                        uint32_t reg_start, uintptr_t ra, uint32_t esz,
                        bool is_load)
@@ -207,7 +207,7 @@ vext_continus_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
 }
 
 static inline QEMU_ALWAYS_INLINE void
-vext_continus_ldst_host(CPURISCVState *env, vext_ldst_elem_fn_host *ldst_host,
+vext_continuous_ldst_host(CPURISCVState *env, vext_ldst_elem_fn_host *ldst_host,
                         void *vd, uint32_t evl, uint32_t reg_start, void *host,
                         uint32_t esz, bool is_load)
 {
@@ -342,8 +342,8 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
 
     if (flags == 0) {
         if (nf == 1) {
-            vext_continus_ldst_host(env, ldst_host, vd, evl, env->vstart, host,
-                                    esz, is_load);
+            vext_continuous_ldst_host(env, ldst_host, vd, evl, env->vstart,
+                                      host, esz, is_load);
         } else {
             for (i = env->vstart; i < evl; ++i) {
                 k = 0;
@@ -357,7 +357,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
         env->vstart += elems;
     } else {
         if (nf == 1) {
-            vext_continus_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart,
+            vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart,
                                    ra, esz, is_load);
         } else {
             /* load bytes from guest memory */
-- 
2.43.0


