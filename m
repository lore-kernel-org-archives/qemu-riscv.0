Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE87C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:49:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKo-0007RC-Hg; Sat, 15 Aug 2026 15:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKj-0007K4-5I
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:21 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKh-0008M7-HS
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:20 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso39478005ad.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823178; x=1787427978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A0aLKOztLw78X0OgZcDJCRDvYWBytKazqo7YQ2T67oc=;
 b=QDtStq+FgM+3/MUf7syK6CrTyWckeeD/IZuLSXXzIsPBSihsZXODa7Vs1bDzB87WBV
 O/Nc75y+4BnRQzoP1HnXEfh4IOONPFwWMcvkTzgtDU3nrEPudPovK2Dq3E3a+dVeg9vf
 Tp9sXrwdV7il0gfZvinRXf++x+JvTMMX4rTZkulANBGgjgMj8g1DEhwr14CsvJ2/EwAh
 f6xDAlZlVNr023ix84hjG+NtTLFqCzKNlm0L/7jILPAN4lQTrZt9P8zC1jm/xsW/wP4b
 GFyB7y9i+j4zv02KlvNIJkX8b9dvbRgx+EFJpTXvqMtKFoIc4QMc6ElxCGl2S772fAah
 zJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823178; x=1787427978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=A0aLKOztLw78X0OgZcDJCRDvYWBytKazqo7YQ2T67oc=;
 b=qJR9eioh404hFkLSs0rqdkjlC/goDOGC58C8KUvHcojFys6G2lcP3r9wGVXTsHXnLE
 zZHyhN+5qgnaczXm/vO9idYIfatp71zJmYs9UI+QLli4zGbt74j23T6gCdsy9rFB1lJV
 DgUiHqsWqNrPUzukYdQfUbMPe4SaVmIfQDNcKQ7TB2HHEy75IHh09Z6A6T7T8HXXpiHD
 fTnpER5DONBeT1mRe5BuQDYY+KaYIj49jLFLXBAmjLLU9k7Y78k9V8OS1kT7/mRZwhdN
 paX0uIZ3x0pne9kras1ADV4joip/RmojcblF3F+TALFJKW3nOx4MbaJE1wdsZi3UexDc
 HtBQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrSmR0PEQKV4gwnc7MxK7Z6fdvc7Sny+GXyfnlV95FmtWNP/s4yDptt/mW3gUwx4/Ka5PyiuRCrg/Xm@nongnu.org
X-Gm-Message-State: AOJu0YyUUw4pfMh1mXiVyoMRlYEZAIwzmT/Plqym5W1tjGFmxX2M7xKL
 ayxu+amJpshIlPEq8LCPtAlvj2Qe29HnEQFfbGLPsk4tjYbfqC1iX/WEp8I0HoLZK2A=
X-Gm-Gg: AR+sD131lk/tV5PlaJ0p37t/0U+Ndqbgvd+KohMZLmnqmExt0YWsujInoZR8L2UR4J2
 U4PChxHQjZf5n3G6ss5TcrJry3RKQL2/uKP8eoSCzW/5Hj6i6bIVOu5M7VQxmLiAxEPTYBdkBki
 661EktMbl27Mqkkx2/FSVqfgEzSRMa8O9Xxhhb79IsWpVB/yY+2pTrv3c3zg5YNGLlidwKZOXtN
 1x0LJ76sKGuiinBRJsFiluvHc3UlFOEpqdBjKq9IzSYgXDxuxCFAWv16xMwCF0DmZw7YgbBxcNZ
 4vXbKttqyS/F33qXP4uRNMg54cHjr1fRLFP9YZW5nPNP+1+Rr2WDJy7r8Dlb3Iz8nz4j8OSXSsJ
 F4I/UzCoeAT9ekn0Q4z/XpVBT1AMg621b+mJaV7279MDzrIQ9zU8Fs/tV0JySo0G8zefT+SFIjk
 HVEYobYupgISz/W0HSUI7o4nQe2yfXQ/xkTGsO5d1BExDrmsBwNWOTGTp+EezAxUjbb57VMHKZc
 tOrO9HoRvk0k4vYkx7d
X-Received: by 2002:a17:903:1b46:b0:2cf:7db9:e13e with SMTP id
 d9443c01a7336-2d3afdaf598mr128004755ad.3.1786823178266; 
 Sat, 15 Aug 2026 12:46:18 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 18/23] target/riscv: Build MemOpIdx to vext_ldff
Date: Sat, 15 Aug 2026 12:45:43 -0700
Message-ID: <20260815194549.1377505-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Use mmu data passed in with VDATA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 5ead4cd6fe..9c643f60ec 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -720,7 +720,8 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
     uint32_t msize = nf * esz;
     uint32_t vma = vext_vma(desc);
     target_ulong addr, last, last_in_page, page_split, elems;
-    int mmu_index = riscv_env_mmu_index(env, false);
+    MemOpIdx oi = vext_oi(desc, log2_esz);
+    int mmu_index = get_mmuidx(oi);
     bool first_active;
     int flags;
     void *host;
-- 
2.43.0


