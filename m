Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E374E7717F
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 20:10:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMBzO-0007hi-OG; Fri, 13 Dec 2024 15:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMBzN-0007hE-63
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 15:10:17 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMBzL-0005b3-7Q
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 15:10:16 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-71e1d6c7738so1149672a34.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 12:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734120614; x=1734725414; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5mnyXonXiy4zaF6iAQaiGzQHiUuvaz9CiX/0uI1U14=;
 b=VBwJy9vTLOLmFAUpdOufsHf6tB8Qt/9t02b9YR4cp/DverLqdDXeDNtl2IonFIuL2S
 xZ1T6k8W1RK9tUpa4wOvVYGjnuOlVXBvWLDPD0os9/YboHn2QRgt9mIirUxNbiviXMbl
 dW3j1e/wHgVoqYEYXv1Kl/diikmFstLNzIV1+m+5pKPKigAQB76ZvuVlcWUUBda23yjH
 6fVmviAJgLLz9sIGsSPZT6dRoIcBRXXqGCpQGInydJYJtt/D9rcOrWdpAFMxsRLuzOpJ
 SoAlnEwACHCEurcL+KyFiLesBwYu25YtAW5UB4+fA4cUp3B054Y41e2SidBQf8Yn66Tw
 IW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734120614; x=1734725414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5mnyXonXiy4zaF6iAQaiGzQHiUuvaz9CiX/0uI1U14=;
 b=qKngBhTfo2zbSfpttYvhDBR2u9v1nWy04u8GullOqS2E9WmjliUiARu+YErm/VAI9Z
 S1mCi0Y/PPz7RR1BlXO0S7Dk3KRz9FwmZTeYFnC9NZ/0ixfFZPFyoDAkVa0I2D7aqwq4
 +W7tUCdDPhVQv6mBylvQ4IyaFf410MFzMq0oHR1fRBFjmjVKDAZVXXeWwiwiSz1jTRgX
 vtTEqVnPCThCMv4nUKHDx/XAA7EoIJ460JJhw2+na+c5aCjhzNtAGmv/uBr0paWoZKdI
 Ze/j8iOPIOtL2+WMhdTeIS8sL1cz44lzJyDcGJdYD/DWvlEvNq1K1UiR2MdG7qLhLF3i
 7DMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRmelQTWeC+M2DLLu69EU1+hlDxQEP10p/jbuorNsVnD03hqygOS901xMV7kYVejqp57juPICq3YQS@nongnu.org
X-Gm-Message-State: AOJu0YyPjBtIVJVqFQ6e6UCq5R6+5fecTt6eWKuuIsF9yUgKn9nWuZdf
 9V1if0LQ6WPpSsTJZ+C7DAsSf8S+xurE9TIyWsA66yC4Dnm5y7IOdq2bcTfuVOjSY8URFJLFXRN
 KJbk9OGeR
X-Gm-Gg: ASbGncu72yLz0joZulDxN820/HqvT7Mwen5ud8EIBcT+1GGZhFx+Qe2PoIG53YM3fJo
 dXj/gPc9NKlvEFCxtYKNfhXIBfjThMjkZBdMzKH/BEL5Xl/a4BSoolBzdbdZ8i6bI/LMfgWnpnm
 aYIFgvPKalFmHhkdfA6zNpoqeiCpheYvz6of8Rk1G3za04OfWk7pQLG75foBf2quSltyDtMtQWg
 4Xf6FurnSjkbMT0D0ic4t3CiS+c3r6MQlDm8uoW+/j2gpsCRA+kz9Sh/7D9HvUQ
X-Google-Smtp-Source: AGHT+IEJ015TDxooW1bcwkHq7R9aa7avAnhNp6/EbYwYtTQCLhkaK7I4Y49PNsTHyeblDmwhqU7/ww==
X-Received: by 2002:a05:6870:7007:b0:29e:65ed:5c70 with SMTP id
 586e51a60fabf-2a3ac99010amr2092273fac.30.1734116883097; 
 Fri, 13 Dec 2024 11:08:03 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:08:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Artemev <roman.artemev@syntacore.com>, qemu-stable@nongnu.org,
 Denis Tomashev <denis.tomashev@syntacore.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG target)
Subject: [PULL 2/4] tcg/riscv: Fix StoreStore barrier generation
Date: Fri, 13 Dec 2024 13:06:34 -0600
Message-ID: <20241213190750.2513964-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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

From: Roman Artemev <roman.artemev@syntacore.com>

On RISC-V to StoreStore barrier corresponds
`fence w, w` not `fence r, r`

Cc: qemu-stable@nongnu.org
Fixes: efbea94c76b ("tcg/riscv: Add slowpath load and store instructions")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Denis Tomashev <denis.tomashev@syntacore.com>
Signed-off-by: Roman Artemev <roman.artemev@syntacore.com>
Message-ID: <e2f2131e294a49e79959d4fa9ec02cf4@syntacore.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index f8331e4688..96f9a7e348 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1624,7 +1624,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
         insn |= 0x02100000;
     }
     if (a0 & TCG_MO_ST_ST) {
-        insn |= 0x02200000;
+        insn |= 0x01100000;
     }
     tcg_out32(s, insn);
 }
-- 
2.43.0


