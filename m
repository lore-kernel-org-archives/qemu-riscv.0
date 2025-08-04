Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55B9C87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 19:27:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj0mx-0006lx-LE; Mon, 04 Aug 2025 15:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06W-0001B3-3l
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:13 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06Q-00019f-4Q
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:11 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-76bfd457607so1435151b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 11:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332804; x=1754937604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2zHTZ6BcoGUiKxWVAKTw6l3A4hCrK5GgqF5hsYKgdc=;
 b=aJfPubW9xDlrTiLUdg34kSLT30m8u6bSj7CmttNDD/rVhiq6ZHpQPCd1eC5+lECY6K
 R0oErYx8jtKiD+8kXuZo7lgUUF6zoMVDh/xpMvP7yj13Nh+NAat6JoM+KsutoN87Vy/Y
 WgXqHvcWZShj/heBij0B02nXuaIPlz4kpWl+c9DBN+bWmXvY0SXwFJhD8JZtqsdGtOKo
 xt/EjM6ONGy6EZhSPjV2lHRzgBM+1Ypfz0f7Fq5I8eivjRgB5hQc3hHoc/PoScP76q0C
 1okuWNYDVEylzn6J6K/xpwRE7HA6Oy/oZFlCDUPORtqavyAmx+qBT2EUdrmyDH2wxaGj
 kssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332804; x=1754937604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2zHTZ6BcoGUiKxWVAKTw6l3A4hCrK5GgqF5hsYKgdc=;
 b=iz5MYmjwV5rdzvJwt2i0XF5zbNTHYYbOxqV9rqjrnxelBn60kOSZs5Hctj3bhbaPmq
 Tdh0cuRp5qWc0ubJEBFPm0Ap7M3YsBovJ/tFzgaBPGAzAyEjF2CfDPrllsF8cDwsOpmo
 DbVv9Dop3nBpzTGXFL1sNJkMHtZeE/A/AKN0tlrt0IF9fCYx8T2o07B0OGRt0qGKPTCX
 0dImYBzRI57BtGvfHXh9fKg+oXqZMD1BwcDxzIme5iXFLrbbxr4nfzSI3H7IW2XOW2No
 k1gSnsqrIG1chZmJreyPYneUa0aDzbE5G3CmLo1d3lONupdT6YRepUOeyPZwbmY6HCCR
 zv6w==
X-Gm-Message-State: AOJu0YwJ7iasIaA+MZq0dh2QGo2vvs0nbIDx86fE8NICyI/SkazUUhnC
 u1MuPPUW3bbIhGzzUYO5kTT/MrDNYVkHOrjvQy761wVKezvqH9yX2VSKSBUQYR9Z06w=
X-Gm-Gg: ASbGnctor8UY17PkqYKm71CbPVtmQukjdGgJF3Yke0IBJH1dFzcKhlePzCuYyGI59uf
 /dWTjpH4meuG1GwbyH4O/g/Y93cOjxfH6kgIgLdXc9BuUoXHsvAnLzWxlIFbDWoFI+IEJkd3gPY
 yURTcIExgsfZ82PqYAdPT5qeWPOkrKp+QZPCO0qL6LCKHSE9MT5IUjnCGZB/pfaPEfUhvFrDz4q
 TEDkWYi8fn+OIUKX9SdaO4L2cz/qnhWhv3hjgND+VUc48DxXv5u52rSRJSPnL9GNZydqQ+QmUL1
 v9IPZNgko1DscizM4wCf/0Y3tHH3v39dxLzwd+pzz9dTG0h4yzICAQMUM6Tg4ouNL1b1az2ty/K
 G4SmT9LpM4ft3w9zv2gOt9w==
X-Google-Smtp-Source: AGHT+IGDIiDvwkp07Cl3q9p2tPrnYkh/KID/Apb+z9tDpROIyRYMrq93rK7+HyYmg53wUZ8dfa16Lg==
X-Received: by 2002:a05:6a00:114b:b0:75f:914e:1972 with SMTP id
 d2e1a72fcca58-76bec4b7d16mr11669416b3a.17.1754332804529; 
 Mon, 04 Aug 2025 11:40:04 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:40:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 08/12] semihosting/arm-compat-semi: eradicate
 sizeof(target_ulong)
Date: Mon,  4 Aug 2025 11:39:46 -0700
Message-ID: <20250804183950.3147154-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
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

No semantic change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5877214c47d..c03096b253d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -786,7 +786,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
-        if (sizeof(target_ulong) == 8) {
+        if (is_64bit_semihosting(env)) {
             if (SET_ARG(0, elapsed)) {
                 goto do_fault;
             }
-- 
2.47.2


