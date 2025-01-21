Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7087FC0218E
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:27:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFAi-0000Qc-63; Tue, 21 Jan 2025 09:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAg-0000Po-4b
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:02 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAd-00030H-G3
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so58544295e9.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469438; x=1738074238; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8Fp3sEVk5tNH2xc5e8sHq21AAMknUb1MPMoentFoZ4=;
 b=rAh/6Mikcxxi5oc4GjunUU/9Cw1iL7gTIBpM68n/k5sw/RodEzS/pgFcUDv1ZRDFCH
 WxQEVfVw9JHduRVJ0PR4mXtBOSa89ngwPEEv3GMRWcsIWnKGe+9/1g+rCaMD9tYx38MO
 3zYWnE7jZjynmmd2n1clWWZg0kx+ipPlADysxETNUAbLULu3V7SHaNtY7xe6oURJggRo
 BdR1nw0N/9lWOEBrnL5f6LhrX30w5I3zZ07julFpfa5X6LkadDPSQ9mhlVfOtXFxY41p
 YaGCGARcdT4uEyznjEmtOVTt3fpryimpJEU2fgviQp0DBmV35KmI9foebYnkrHWSnoMk
 bYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469438; x=1738074238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8Fp3sEVk5tNH2xc5e8sHq21AAMknUb1MPMoentFoZ4=;
 b=ZqVYbWUyfd0Y3InGCef/8q6uvObgXtn9JXYn4j2wGkDxgMe3GG/orRTti0i/by0Zg/
 xFxYWs2FDraZMP8nBbj/yL6jlMyAdfpokNoUvHZ31y6EU0Gt3zJOXPvjazKILTBomlaq
 f8xnBhZ6GD4DBcckvWsAZDrmW0DOdnVH/buZQ9SdeR26hEelC3QQnISm2OHe93bhxg+r
 bTxpCc6IyZ6Zz1J+kkKVbfm2+e8jOBqnUDNocfnCtQzT4rg3mOg1e46MGJmtoWsd+bCK
 USvqTvzf3UMzeTs/+2Qjcc8JymDTITOKnsHaaBxVKUFwujdrfOstYoa/K8VwpBCfxbCn
 Mqlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt78WCYjRTddF6eXwbDRJ2HPugadccPXqw5cxr30y7uwO89EQ3sAxvc1aaxnSrMbyDcjV7lDfv0mIw@nongnu.org
X-Gm-Message-State: AOJu0Yy/5LZ41X4ai+pfy93NW6gxuMjH8qEoohHucv2sn9y1Lu2yU4xz
 Y/oXWT1VHmmyjVkT2OA+J0y4XFx8PghxfLb83faXbttvJqadCo8Pmf1PdR0g3DA=
X-Gm-Gg: ASbGncuH+xrn3SoTG0wAVgptuTYwYVnPvpTqRjU+/uPizjiCmhHB+sWry60fUC5MXV0
 wi80HzreNqvTkzVZlCfasE8fjHikk581VFtbIHbW8jiLyeSNhBlv5avK7lIKSvi+bjzZ034Gw19
 SvxSrKCqOMIXT+u2loM04Ico/njQ8fImEeAoMZgtCiRa/j6vVTz2xL8aMeetUGCD9/K2AtgD9kU
 bF6+jiJiy+SUnT+xc/WpyDpFOAd3wX3C+Tiy5jQPXsHE4ozWdr3L2U9AEjGpFcftxyLvaULPdQD
 dJGaQ1l8HZWoZDpvpCYykYo92vQDiEHQloNa3oqGQ+Pl
X-Google-Smtp-Source: AGHT+IHRRRFi4Nx+gUlXNrOIqKZ9RUDyB/BIJ9YPDbNLtzDmvPK2tnlKcG5OwU7XsrJAhWhrUi9wvA==
X-Received: by 2002:a05:600c:1c83:b0:434:a746:9c82 with SMTP id
 5b1f17b1804b1-438913be56bmr168297705e9.5.1737469437897; 
 Tue, 21 Jan 2025 06:23:57 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389041fec5sm184313625e9.19.2025.01.21.06.23.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:23:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/28] target/tricore: Ensure not being build on user emulation
Date: Tue, 21 Jan 2025 15:23:16 +0100
Message-ID: <20250121142341.17001-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Currently only system emulation is supported.
Assert no target code is built for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 8e431d79222..cf9dbc6df8e 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -26,6 +26,10 @@
 #include "qemu/cpu-float.h"
 #include "tricore-defs.h"
 
+#ifdef CONFIG_USER_ONLY
+#error "TriCore does not support user mode emulation"
+#endif
+
 typedef struct CPUArchState {
     /* GPR Register */
     uint32_t gpr_a[16];
-- 
2.47.1


