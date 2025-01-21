Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AB8C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:30:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFBK-0000wD-JK; Tue, 21 Jan 2025 09:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBI-0000rJ-FD
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:40 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBF-0003B3-QN
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so4645778f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469476; x=1738074276; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hABGcPHmiijhFm7hjFblq4xQHOf2UnsfnjVyHAHFsw=;
 b=HevhkfgqFto4/R5hN1Lhk7bFrknBJ/L9gEgDZ+x43RGYI4R8VhjT+MHdAYd5yIrk/w
 r//GA3F7IUyqWcrXciPS7yU5Qs8ajcfgjRTfCuC0K2j6L1ThYprNF6uId/+INJg5y3ax
 n30nobJdQ1lBRM64aHdpxSNVOc0nXTmmsWVixOMWOUiRkiBXkwNU+6VMyPVkDeXR8yNP
 By23wmbvqIDKXABhrG/u0X//zLPtLJ6Gt90Il1Zm+l4syATLCKpCm9nxWnQYgec3q7kl
 2/KwS9d4sblBav+XEtIktjV5Tkb79z9ek9lyc75+ttzYgdoOYVV5W+vm1cJPWgfXXF+7
 jaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469476; x=1738074276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6hABGcPHmiijhFm7hjFblq4xQHOf2UnsfnjVyHAHFsw=;
 b=OXNe/LEJqRCLL4SV0qzfk/+WW++En5F5Yvsoty1bZCP3s3OF8lFDIrzLo6XgJrn/Qk
 r/ZhUtWxNGEIhzyktREotnNvBFjWcDTC34TcP3bgV7h8BU8Cfu1t9YxHUKeiNdXS2gi/
 frOMsDjyaCXhRJeycfMRWCVCC7BdXiM/i7Qsalz3uTms1uNvpQH9cJb251SDwNzy1uWD
 ZImQx3dIAzhzuRhWD74Vfpgd8gwkvVBWhSn5iRKjWAvZWjIT0cNi2uh4ZDZx1p6inH2y
 E1VSPRkb8L0DBv0p94xlAqX/2hwPzlT7sCIRVmd3M9+d2/SY/c+aTgM5q9wn/8B1wN96
 i9hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvl3XbJBR4/8owbaJdaUsEYl//wC9gqq83135bu62hAo60f70bAommHCm1CoWEfTufMSQlHRa9B2Fx@nongnu.org
X-Gm-Message-State: AOJu0Yxrk04T5p8UZ2h2oovFXc1yMcPaNs/sec3ziuzBQ+3DkSp3ZjUE
 8LP53iST5Zayy60+PZVuHnFxyi47IYn3lUbgWG+ou49XwTTf1QnVdaelOpnkIo4=
X-Gm-Gg: ASbGncu63mT+09vJ1pSVMtBwNrtTS9KqM4gbDBmxuH1TyLf9WKKc6XiczLZ7cbxgttB
 XDO2eX7JHqqKlNwm8RXQp9hD5YR8llb2MHw/TI5j74PuPqSQAk6iv5tKVD4Lq2EXDPj4s7Afkie
 q9tGiuS/+djUJLhnVLISpx5aOunKnZitIEra68v3AD0AFHTfDxP98eRH3+FUik6ugXb6X1tcErr
 CMFtQ89Jz/CpjxNl0xu//wYFYl0bZCANGmP0jhkqKtl1Jec7hZPVZyaj3+bdAcv1nsN78LKOrbe
 MbJGbrBLeApxc9vPeRKNeeZxs7T7ZjrI3WPRitVj2S+e
X-Google-Smtp-Source: AGHT+IGIxSjDIteLplytyWb4SbkEn65RNpXJxjDfZiWtqImZKNx2vP8MFkD9+ilwTs8fv4ijYBKL9A==
X-Received: by 2002:a5d:4845:0:b0:386:857:cc54 with SMTP id
 ffacd0b85a97d-38bf5679b17mr12220038f8f.9.1737469476324; 
 Tue, 21 Jan 2025 06:24:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327556dsm13492289f8f.71.2025.01.21.06.24.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/28] target/hexagon: Remove CPUClass:has_work() handler
Date: Tue, 21 Jan 2025 15:23:24 +0100
Message-ID: <20250121142341.17001-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
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

Remove as unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 0b7fc98f6ce..f77e305d611 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -262,11 +262,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
     cpu_env(cs)->gpr[HEX_REG_PC] = tb->pc;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
-{
-    return true;
-}
-
 static void hexagon_restore_state_to_opc(CPUState *cs,
                                          const TranslationBlock *tb,
                                          const uint64_t *data)
@@ -345,7 +340,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->get_pc = hexagon_cpu_get_pc;
-- 
2.47.1


