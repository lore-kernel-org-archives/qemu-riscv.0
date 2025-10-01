Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA80CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:17:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yS2-0003lT-Bd; Wed, 01 Oct 2025 11:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yRw-0003Up-6C
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:09:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQA-0000nO-NL
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:08:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso6616557f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331208; x=1759936008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgRekvmTJ/VCtBPy89EpCeHzqbjnCgHMk9XzcH8ZZx8=;
 b=coLbB4WwvretULXAEtHly+zNKyYSKZ5OlEHXpauWu6MnzPmYu+rAGoHVgw+JTIvoxA
 HXwlt/kv2xIh+4giG7/UrjeCzmca7CFh8k9ERIRw47R+g06dA9w4B56PgSRsM92EBh6b
 gGfA9SnwWrERR6D6KFp71B2sED2wqsdGUoOPNB3V7yzhWmVk5X0w13HJ0WvhH11lQSl4
 wgNSsBKfP6GoDBUVB+wJXbFKotuQL47umPUXqBRoJf/CD/J8wDBfIWGkCTff9S2xyK4f
 /MB6ATIAmWD0Wc/VwYAmUQdgvmye1fRdImRQ+iVF7Q2x9XmM16KeQbjHf2bioIQoselD
 lShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331208; x=1759936008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgRekvmTJ/VCtBPy89EpCeHzqbjnCgHMk9XzcH8ZZx8=;
 b=cog30/JmZtEvXDGAdcUZlNy7DNzQaxmtejhV51T4LWuoavQukaSo0rDXN6A82+CXha
 uDfkZSayMfa9k+FQT2SoHTyuWGy1NsIJxaKQLuSh2/UMPxvEpnqGr/hEyWbJtCzGW4e5
 32+bu85umjqZpRWBFyA8aanzfYKKIyQK7qjjFmX4bRgBdgozEZvg/algo0EtFJpVYzff
 gJYthXvrGEkhMgwi4uC9G86cqjXtV2XCxPyJc+LSxi+qgrt07FEU10wMSAooxJVjHxiq
 E+aEVrzWWTkyNtwAR9WOS1VBB2VRe9HBWGUN76cLdhf+lWBjntghEwRd38QdnxcSrPdq
 12LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbfXf0AhrsNorubgUx2r4k1tYrEkHof0EBpk30tEAv7fqufe2tJPJo/Yz5kc7ZMEvu2o2OeKhYmaSr@nongnu.org
X-Gm-Message-State: AOJu0YymqVtW78xQg8M2DWaYrqUIkX3rgs4Q96FcdcHo4bge8FanInQd
 x0vVfTQI2YXJ6ZDe2nBvKfHdSocR3DGbEBOYu6b6dmmJuN7Mwj0szzcd9jjqSAoirYw=
X-Gm-Gg: ASbGncs9Ofh7n5voCfBpTcLOgJv/onVvDQOkgOQnfRlDruDaVL17+WpVBMZ8nxUSPlW
 6Nf18DLxtvENvXfb+Z9IDkxx2oRnqn28m/X2tJ7Sw8X2NNs0Wyec5sjZ7hua8u6Z+NY+7IlcNG2
 1VXd78rXO7PcaZkYOuHg33t2B2MohBMJD53OAUz0lkQsg812st+Xic9yX7GnnEi8EJ6Ba2XZEoy
 Zh72aAiljZ4OhV1EwTKBKM+DyGw1G5i0B5pXPqjupxms3ZcN4zfhyyuG/d/GI3q6YRf+Gnsl1Ei
 fsQKQGld5gk/MnwH6cfpucnjJu8zPgYF+3I5DkTgEdm9rdHk6DHKVSyPPMoOEjHdt2qb7OhfJAF
 sscgFrUsXAo58E8TF6PijwZLJ/zyUcFadeNKiM/clfkjSDVNUUXYQP/azpUCwblA6tVC24DGQzw
 R13O96CDU++0yTtj2wRJ0T
X-Google-Smtp-Source: AGHT+IF6btBrTtBXsCyTjEV0w6exyA7U2R5NCMxQNV+7lluj+aV+XkDultE+kKDstjJdSU31d77zqQ==
X-Received: by 2002:a05:6000:200d:b0:3e2:b2f0:6e57 with SMTP id
 ffacd0b85a97d-4255780b898mr3265768f8f.36.1759331208335; 
 Wed, 01 Oct 2025 08:06:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb1a3sm27980067f8f.10.2025.10.01.08.06.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 15/22] target/m68k: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:20 +0200
Message-ID: <20251001150529.14122-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/helper.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 15f110fa7a2..0f8512af72c 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -491,6 +491,7 @@ static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
     int32_t size;
     int last_attr = -1, attr = -1;
     CPUState *cs = env_cpu(env);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
     MemTxResult txres;
 
     if (env->mmu.tcr & M68K_TCR_PAGE_8K) {
@@ -505,25 +506,25 @@ static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
         tib_mask = M68K_4K_PAGE_MASK;
     }
     for (unsigned i = 0; i < M68K_ROOT_POINTER_ENTRIES; i++) {
-        tia = address_space_ldl(cs->as, M68K_POINTER_BASE(root_pointer) + i * 4,
+        tia = address_space_ldl(as, M68K_POINTER_BASE(root_pointer) + i * 4,
                                 MEMTXATTRS_UNSPECIFIED, &txres);
         if (txres != MEMTX_OK || !M68K_UDT_VALID(tia)) {
             continue;
         }
         for (unsigned j = 0; j < M68K_ROOT_POINTER_ENTRIES; j++) {
-            tib = address_space_ldl(cs->as, M68K_POINTER_BASE(tia) + j * 4,
+            tib = address_space_ldl(as, M68K_POINTER_BASE(tia) + j * 4,
                                     MEMTXATTRS_UNSPECIFIED, &txres);
             if (txres != MEMTX_OK || !M68K_UDT_VALID(tib)) {
                 continue;
             }
             for (unsigned k = 0; k < tic_size; k++) {
-                tic = address_space_ldl(cs->as, (tib & tib_mask) + k * 4,
+                tic = address_space_ldl(as, (tib & tib_mask) + k * 4,
                                         MEMTXATTRS_UNSPECIFIED, &txres);
                 if (txres != MEMTX_OK || !M68K_PDT_VALID(tic)) {
                     continue;
                 }
                 if (M68K_PDT_INDIRECT(tic)) {
-                    tic = address_space_ldl(cs->as, M68K_INDIRECT_POINTER(tic),
+                    tic = address_space_ldl(as, M68K_INDIRECT_POINTER(tic),
                                             MEMTXATTRS_UNSPECIFIED, &txres);
                     if (txres != MEMTX_OK) {
                         continue;
@@ -732,6 +733,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
                                 int access_type, target_ulong *page_size)
 {
     CPUState *cs = env_cpu(env);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
     uint32_t entry;
     uint32_t next;
     target_ulong page_mask;
@@ -768,7 +770,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
     /* Root Index */
     entry = M68K_POINTER_BASE(next) | M68K_ROOT_INDEX(address);
 
-    next = address_space_ldl(cs->as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
+    next = address_space_ldl(as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
     if (txres != MEMTX_OK) {
         goto txfail;
     }
@@ -776,7 +778,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         return -1;
     }
     if (!(next & M68K_DESC_USED) && !debug) {
-        address_space_stl(cs->as, entry, next | M68K_DESC_USED,
+        address_space_stl(as, entry, next | M68K_DESC_USED,
                           MEMTXATTRS_UNSPECIFIED, &txres);
         if (txres != MEMTX_OK) {
             goto txfail;
@@ -795,7 +797,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
     /* Pointer Index */
     entry = M68K_POINTER_BASE(next) | M68K_POINTER_INDEX(address);
 
-    next = address_space_ldl(cs->as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
+    next = address_space_ldl(as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
     if (txres != MEMTX_OK) {
         goto txfail;
     }
@@ -803,7 +805,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         return -1;
     }
     if (!(next & M68K_DESC_USED) && !debug) {
-        address_space_stl(cs->as, entry, next | M68K_DESC_USED,
+        address_space_stl(as, entry, next | M68K_DESC_USED,
                           MEMTXATTRS_UNSPECIFIED, &txres);
         if (txres != MEMTX_OK) {
             goto txfail;
@@ -826,7 +828,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         entry = M68K_4K_PAGE_BASE(next) | M68K_4K_PAGE_INDEX(address);
     }
 
-    next = address_space_ldl(cs->as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
+    next = address_space_ldl(as, entry, MEMTXATTRS_UNSPECIFIED, &txres);
     if (txres != MEMTX_OK) {
         goto txfail;
     }
@@ -835,7 +837,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         return -1;
     }
     if (M68K_PDT_INDIRECT(next)) {
-        next = address_space_ldl(cs->as, M68K_INDIRECT_POINTER(next),
+        next = address_space_ldl(as, M68K_INDIRECT_POINTER(next),
                                  MEMTXATTRS_UNSPECIFIED, &txres);
         if (txres != MEMTX_OK) {
             goto txfail;
@@ -844,7 +846,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
     if (access_type & ACCESS_STORE) {
         if (next & M68K_DESC_WRITEPROT) {
             if (!(next & M68K_DESC_USED) && !debug) {
-                address_space_stl(cs->as, entry, next | M68K_DESC_USED,
+                address_space_stl(as, entry, next | M68K_DESC_USED,
                                   MEMTXATTRS_UNSPECIFIED, &txres);
                 if (txres != MEMTX_OK) {
                     goto txfail;
@@ -852,7 +854,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
             }
         } else if ((next & (M68K_DESC_MODIFIED | M68K_DESC_USED)) !=
                            (M68K_DESC_MODIFIED | M68K_DESC_USED) && !debug) {
-            address_space_stl(cs->as, entry,
+            address_space_stl(as, entry,
                               next | (M68K_DESC_MODIFIED | M68K_DESC_USED),
                               MEMTXATTRS_UNSPECIFIED, &txres);
             if (txres != MEMTX_OK) {
@@ -861,7 +863,7 @@ static int get_physical_address(CPUM68KState *env, hwaddr *physical,
         }
     } else {
         if (!(next & M68K_DESC_USED) && !debug) {
-            address_space_stl(cs->as, entry, next | M68K_DESC_USED,
+            address_space_stl(as, entry, next | M68K_DESC_USED,
                               MEMTXATTRS_UNSPECIFIED, &txres);
             if (txres != MEMTX_OK) {
                 goto txfail;
-- 
2.51.0


