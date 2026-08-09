Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDA2C5AD56
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 01:35:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wssQC-0000IM-42; Sat, 08 Aug 2026 21:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQA-0000Gp-7x
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQ7-0002Hl-R8
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:49 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38fdeaed181so890489a91.1
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 18:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786239226; x=1786844026; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KIM92dYKj4IImhb6gA2mCC61KUGnHOCCs2e0Y+4NqIo=;
 b=tBt6XCW4pcFEqCwX0WnFIufNY0GxdAHUBJGxv5qLZdWkoT6kkm+P0GkoZidwdPBKiI
 as3DxjcmOE9zlCOCF2mnx09q/pyxtfhRae4STieekCPCgwGwBDN562I7lZhOvq8LslGM
 loGwzm0JHSKx1ycLjwAEtr2OOzc2w4xQeW6uuYebxbGWhoZrSgSB8sBy/xIqFRSxrGS4
 xzxkn8bWBYBzU1qJg/Y4BloypCTaWrdlnNaWYo7YY4fW/21QGfHS2ZFjgCljVzl0Qu2/
 IQjUswJS4ke8TGYhQ6K3E61A5PZY31XTulAzSzcKrhzStT1ih7XUSa4nrBY8AVCqNifS
 KhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786239226; x=1786844026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KIM92dYKj4IImhb6gA2mCC61KUGnHOCCs2e0Y+4NqIo=;
 b=B4+DCuP0PjBi4vS8k8n6cXw8NdH/CQYSfPqGdyrHM2So7r4uKwE+jjboSQd6xnYyTV
 ZAPmIr6SrcCJSTAIgM863Daz8TMBJQJxmAyxLAuuSLgfhD/2eY9tjcLyFoOcppry/QgQ
 PtdzRhJqFJbcFDbS5bEbSWhWI8xnh9phC6H1OKM9OWrjIAnLGnOYy3vplPY2kaaQjx0P
 gAK9OevWGnuz0ycufWNpk+cY87MjZ/YNs874oxLcKH1XcvyEYhKW7vBDi6++JVfL+Mrk
 tv9dyX15jy/SSzt91RbEC0Dd0wHrjlGzvsb8pGGvoqLl+6WbsF66S9GwJXMn7ODj2i+0
 F3zA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpauJDP8i5uOYfF1O9gAakVGrMm8nsA2xErqASbO8CR1w8NXPRs6ME1F95hLT2cRw2cehha64vHWTW6@nongnu.org
X-Gm-Message-State: AOJu0YxzgKIEFu8VR8H3ZNZI5WsxR6SVpM4NiCIxOjcjfSw/gtGQolPa
 kwDdK3RwXciA7Ofk3dXWYioHOsyP326OIp+16reVZrr8hWZHkss++6wKEquNTwyToWs=
X-Gm-Gg: AR+sD11tTZwG0t/4lDYTB9NBqJsVuPY6aK7a69b+PvS4hB26uBNo7oUdpt4UZl9NAMf
 48TRG5mOFsihGO5oKaiMs559oW2MHwDQbh88e2k6NIimoUBD4PP8j1YrWqFvqUW1242OunHs265
 NcXbLpAlynfWmSnOWd6/0DN1zuKoeQACzZFHyst7Ziiv4tfIO/hWs3kALR6kZUz1j+tKDEpvuHw
 WBMtQ8VPjvQsTuVrGidIFaZyGKPv86H6eu4EFuBXzY3iofQUhS/8BOGA08FkUK6E5mwXqIkhrr9
 LTUQlt7BJ8fKlN+AKelBOh98CERD1e0+NGGCcA6fWbPzkeEkBlDIUl2lS/PSv3XQfKoA1GuBlff
 QyUBPb25qrT5uB4OWo4Nz+LafxA27igSgEnWFtVibrpcvhQMHs7XsOsEesv3iiP9tGnurij1caf
 qJ1AJtixKd3pWOdaU7Ea4TuTkHG3nOUN3Y3TnklhOJxUGK6VScBdKmNShIh8ap8SfKa+ZegW788
 N4y4ERaJxy+S+7/Qqp1
X-Received: by 2002:a17:90b:1e53:b0:381:a766:efcb with SMTP id
 98e67ed59e1d1-3903c54cf2bmr31311730a91.4.1786239226433; 
 Sat, 08 Aug 2026 18:33:46 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085de8ddcsm10067927a91.6.2026.08.08.18.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 18:33:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 1/9] target/riscv: Improve riscv_has_ext
Date: Sat,  8 Aug 2026 18:33:35 -0700
Message-ID: <20260809013343.664966-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809013343.664966-1-richard.henderson@linaro.org>
References: <20260809013343.664966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Constify the env pointer and return bool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c9dfa7daff..376cff656f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -615,7 +615,7 @@ struct RISCVCPUClass {
     RISCVCPUDef *def;
 };
 
-static inline int riscv_has_ext(CPURISCVState *env, uint32_t ext)
+static inline bool riscv_has_ext(const CPURISCVState *env, uint32_t ext)
 {
     return (env->misa_ext & ext) != 0;
 }
-- 
2.43.0


