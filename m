Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4911ECF8840
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 16:34:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swlFc-0000dZ-UZ; Fri, 04 Oct 2024 12:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlF1-0007pb-NN
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:33:23 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlEz-0005rc-1N
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:33:19 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2facf48157dso25858461fa.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728059595; x=1728664395; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sos7CbirHso2UkebMmuBOYVoWuS2tFtvh+AVgSe77UQ=;
 b=FSX6BOSJB9wZcloMRiCyaAT97UBbQi1NKzy9WJdy9whe6In7PtuKCv1qdeb4TH87Ig
 X2NrfrL0fXFcwNYyOxPBR1fxFvmkVmPo9Wr5eRKlA+ckacRSCVoO22gn9jVCK5ZH6CcM
 2JF2RJMhFD0BBo3WXwX4f1ylheyk8SjXQ6On1ygaR2/lTw5QoqO6LcR0ghvwGH8UkBop
 wdZvYYQCbRf7s7+RvZ8krEKvCInILR89VxXt2X5otiTowTsBYh44mzoUH13DdCpYNzck
 X/O9bFAqBXFWNvSmFLqABPoncYLPlsHCPi5DtOW1pkHafP84W1hWrXA9if0mZTLo6piN
 KaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059595; x=1728664395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sos7CbirHso2UkebMmuBOYVoWuS2tFtvh+AVgSe77UQ=;
 b=RZVjw2Dah2H0Rb8GsDS/TZwvP4mCAOtbpIN3SQjNPvQs0F69anfJDmK8brgXjxLUNv
 OJyibhEgLIdIueDprUhxt0kYjsmSgWrmFF9jmJBBUq4AFNadJfOZCp8WQbOK1FMPCtfS
 9tJU2GjKQWNz+H2XCtBmQS84CV5iNvtWLyBlMyRqgHkSYy3mJsRcfScATJKQhKxsFMuf
 BQLfZ41GaL60uNiT+IsAn4UNqBeIUDebtdXhjCfT2mdTMQ06ltRdK5Iquu6cLX3kKHbq
 ox4DwkQC8tzymccsDFMpZjbJ6zZiqOSisuiM3ctKuT8/vexEA/U13nnC1dmlH3GOJ2Sc
 P+8g==
X-Gm-Message-State: AOJu0YzSL8kRxzC12CUL7oiBBOS4MQr5tYOIM5k9KiV/+GcnhK3UhkEt
 KfQS30vumHuiJ1vP79xxgOnWJSvxpSUzKrWhEt8fVv14jwUM1a9++z1vVvXBlTk=
X-Google-Smtp-Source: AGHT+IHeOcG9Bnpx0IjVn7kLXVDgEz9fm68zgEHM60SbXPFLEIbauMEVjdnVKL9SBHFoEGkeAwTBUQ==
X-Received: by 2002:a05:651c:1986:b0:2fa:c5b0:39a3 with SMTP id
 38308e7fff4ca-2faf3c13677mr18816021fa.14.1728059595277; 
 Fri, 04 Oct 2024 09:33:15 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ac461fsm207201fa.47.2024.10.04.09.33.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:33:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/25] target/avr: Use explicit little-endian LD/ST API
Date: Fri,  4 Oct 2024 13:30:26 -0300
Message-ID: <20241004163042.85922-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004163042.85922-1-philmd@linaro.org>
References: <20241004163042.85922-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
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

The AVR architecture uses little endianness. Directly use
the little-endian LD/ST API.

Mechanical change using:

  $ end=le; \
    for acc in uw w l q tul; do \
      sed -i -e "s/ld${acc}_p(/ld${acc}_${end}_p(/" \
             -e "s/st${acc}_p(/st${acc}_${end}_p(/" \
        $(git grep -wlE '(ld|st)t?u?[wlq]_p' target/avr/); \
    done

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/avr/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/avr/gdbstub.c b/target/avr/gdbstub.c
index d6d3c1479b3..aea71282a58 100644
--- a/target/avr/gdbstub.c
+++ b/target/avr/gdbstub.c
@@ -69,13 +69,13 @@ int avr_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     /*  SP */
     if (n == 33) {
-        env->sp = lduw_p(mem_buf);
+        env->sp = lduw_le_p(mem_buf);
         return 2;
     }
 
     /*  PC */
     if (n == 34) {
-        env->pc_w = ldl_p(mem_buf) / 2;
+        env->pc_w = ldl_le_p(mem_buf) / 2;
         return 4;
     }
 
-- 
2.45.2


