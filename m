Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19924C44509
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:01:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIKB-0002ZX-HM; Fri, 10 Jul 2026 16:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIQ-0000yA-2E
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:58:13 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIID-0001xA-Jj
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:58:05 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so1158921a91.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783717072; x=1784321872; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XDiSL4skeBdw/QfZ4bPcuanFzLKyweW4gBYzMWPnN78=;
 b=SWigjjwV+adHRAHruT2Xzf4LIZ/QXekhl5kA0EvV/cGTTxJjhPwtaDkfEp35/n9uzq
 hQ+uKQ1Xjyxsykur9kI8zTq6EiDLtTfLKBzKd/mGCp8RdCe/ptxohScWZJDCqHhtTYPS
 0rfng+ByxQhUS9VgGypuw7XFDrF1nF362CFcaDX7D0jn9naGvnP9EySQ4ZqpJSS39TV2
 UQe/ldUZPvp5ZkAA7lDMeiU0+OFrfXQXDE8+EWYDFVahuhEoqxkkcPMF9O7e01RYS/mH
 BA/U2hJHub7wxTYbqX5GVahcN3+9gdVS7Do/wba1da75/Gq/urmZzIKrjcVFDw2kPOvP
 W/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783717072; x=1784321872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XDiSL4skeBdw/QfZ4bPcuanFzLKyweW4gBYzMWPnN78=;
 b=SOl2hDhx+s0c491NINGtnAYh1FoJKe8iWS8FjaMhDS5ZwMhdZb1Uw5/V3Ar2J+lan7
 Sed9DugN+Lqg09742kAIMTlvygniJqiQPp4eU81C+tuJ2Ci6L+IGdu80fB++msple1pC
 u5PiTKnz0aPxYebdRKEg0LPHVNxGmv1koFzMC+Ue2ldyOBKlmEi2nsaHIiQCFbNuMJNW
 VDopH0z/dkPk7/nsBk9yRzCJPCnPTZ9sBci3jwAY2FsnGxePDrkXtzPDdLp7mUKxsKRw
 +pKpjkZy7cbxrV4+gY3Nifq1xGBLvoON3UlcqwRx+v79yioR0QTPCf1iFQZ6CZ1WgCDh
 4kxw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0f5J+hVFckCW45LOVh/AK7hWg9TAIey6a7jkKNZA8YkiNn+b4l30JFb66WKggIurCIUOI1eZBD262@nongnu.org
X-Gm-Message-State: AOJu0YwikQl4oGBDozZNJNewqzJX8UHObGnzyovcEv3WDb/1WKt8H55H
 B199fZsU50y3A0PMiiCJPjAH1UztHo1QxWnL4nss7vUPL9nKlw81q8s1Rnapv6pTLTc=
X-Gm-Gg: AfdE7cmqWurdl2o9rLp3Lq2WigQ9qArtoB7BTMTwBcljQh1xRaykr9Izb+dlbbnVEZG
 Kb+0gmlJOApTjvJYjv1DvXUu6LFJpvbr/m2AtZL6yhlwMt/Y7FKm+9iUaH1qCs4H732Y41DLgtV
 JP0N1Yy+j+xuxNNAG7uLDSM2pJj4JgBpFfm/ZIqxVsDcrNlVGV3+9FplYC+gA57OYNlKRw5xzzF
 2BTZxkTOB/nKsI9csnjPelPJLRM5dFI38ph68iDqHzgqGoN8Ma//4qBJ5gcWMvvtRBLhkIRuyIQ
 rRKUFFUqAoeXBPDAFuKgU3o93PGuzWQDT3zRiYcuMQd1+hREkZl/vowVQcYWwkCue0CNk+6fp2m
 b3s34xq/eaur8zNRXvAEl/DKtc3l6LahETTn0BkOASuee2zb+7JHfwxXT93DgHY2/4D+e4jQbm+
 k2ROy++tjGZUSMDXrW0w==
X-Received: by 2002:a17:90b:3806:b0:37f:e326:6559 with SMTP id
 98e67ed59e1d1-38dc7b37972mr513114a91.22.1783717071586; 
 Fri, 10 Jul 2026 13:57:51 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a58792cdasm3256221a91.16.2026.07.10.13.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:57:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, qemu-stable@nongnu.org
Subject: [PATCH v3 48/51] target/arm: Be more defensive for invalid
 tlbi_aa64_get_range
Date: Fri, 10 Jul 2026 13:53:58 -0700
Message-ID: <20260710205401.836304-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

It's possible to program TCR_ELx with an invalid granule size,
which could match passing an invalid granule size to TLBI RVA,
which would then fall through to assert in arm_granule_bits.

Cc: qemu-stable@nongnu.org
Fixes: 3c003f7029e ("target/arm: Use ARMGranuleSize in ARMVAParameters")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/tlb-insns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index 1a0a332583..b24eb57788 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -854,7 +854,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     gran = tlbi_range_tg_to_gran_size(page_size_granule);
 
     /* The granule encoded in value must match the granule in use. */
-    if (gran != param.gran) {
+    if (gran != param.gran || gran == GranInvalid) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
                       page_size_granule);
         return ret;
-- 
2.43.0


