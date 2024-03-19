Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421F1CD11BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:43:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbcS-0005EL-Hb; Tue, 19 Mar 2024 11:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcR-0005DI-GA
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:43:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbcK-0004lP-Gv
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:43:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41412411622so15721505e9.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710862986; x=1711467786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuEAK7pSccwrCzu7hxaK2/2f3QdH4s+KeUETWrTDkmI=;
 b=HwRJUTyvxHIoyfcsI9rTdFZUKEObmCEulrwneWFcy8lKikqBS3H2bgpP9xEAijpsjo
 G/3sLRDVKMFhVzSCChyfLxIJFiLnIosR/gJQai42DfiArhp+3pe9dcNpMXsGP2y753bH
 2484zeTOLVLqnXQ3fwBZ1cH1ZmbgqbO8FqRW2+D99i2nzPN5CuqdrqiWOVEsdy20b7m9
 yrsXwSe7VKQH1hMobtNXc4FZIDItsXgS//Oq3P2o4n1KKFG939e4/tE/rEl/dnmy2VFz
 ejV5pBW0tleLZl7WgHPAkieyQthuZL1W5jKE3dLbJSmfvjK3mCNDU4fxYfkE2bi5GVCD
 aDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710862986; x=1711467786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UuEAK7pSccwrCzu7hxaK2/2f3QdH4s+KeUETWrTDkmI=;
 b=nA3m8PsP5qHa/oz1yzULixXUcQcgCbxA7qMIqbdEwqramxCfPOhMSEy/QYXidMI1p/
 DM50ZkcwZDZrOggy3RXSOrP4Gl8caHBS1I1WEege0L9+HtpDVtBEOIgoI0ZW+5Kzf/i7
 oGWLgMrCG2vPcDHQrxWrHeCi3Bz4rtbSkyIEKxj3UlAPTPWr3zuNGzqSkzv2ZORuYrmq
 kK5dzrgGSBegsC968zN+NZUpIJRamzAtM3dnUsKcwbQUZtgPS10ZLfKqT8uAwr7ia30R
 RZ+eqOScP6gCbo84AZ6Qvulp/wLKSmf1iTEQCzdH5i7DjFkhsYuLNgPireLYH5/3hmAn
 kA8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuDyioNjUXgSS6FG46x6yq7KM/5wyqlhCihoV62I4ToIRNJqlaw7AD005pwAt6qcL6vrGvXrD9rjNK0SjYPSuT+3p0DL4=
X-Gm-Message-State: AOJu0YypJKrAjVA0eDyQ1WZdSTiwLo/ga3ODaR1sgS0ffCpU4FsGP8n0
 LLC+ocCoyXzDMU4T0RTgMcjOWyYCakvFIwzOCUm/fvjrWPDx8cU1q2qbaKq2mK4=
X-Google-Smtp-Source: AGHT+IEwjXyq1lx/4wp5+SvJ69Rn1Jf0HcOxQkPwDffs0fSluS4MDfEEylCe6pbiQlunyuQa1ieLzA==
X-Received: by 2002:a05:600c:a47:b0:414:860:bdc9 with SMTP id
 c7-20020a05600c0a4700b004140860bdc9mr6982443wmq.33.1710862986594; 
 Tue, 19 Mar 2024 08:43:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c4f0c00b0041409d4841dsm10415982wmq.33.2024.03.19.08.43.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH-for-9.1 01/27] accel/tcg: Ensure frontends define
 restore_state_to_opc handler
Date: Tue, 19 Mar 2024 16:42:30 +0100
Message-ID: <20240319154258.71206-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5c70748060..987e6164f7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1069,7 +1069,10 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
     static bool tcg_target_initialized;
 
     if (!tcg_target_initialized) {
-        cpu->cc->tcg_ops->initialize();
+        const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
+
+        assert(tcg_ops->restore_state_to_opc);
+        tcg_ops->initialize();
         tcg_target_initialized = true;
     }
 
-- 
2.41.0


