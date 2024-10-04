Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDFBCF8850
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 16:34:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swlFX-0000Db-MG; Fri, 04 Oct 2024 12:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlFK-000850-47
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:33:38 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlFG-0005uj-Hv
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:33:37 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53992157528so2801398e87.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728059613; x=1728664413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2b2LwHBDDNlQ4lpraog9QbauHHDsoDaj9FTLQzChw4=;
 b=SUWGMhS8Rb1Z8N6M5Ui0gGXejRg6XVT7CurNAYKpuy+W/qKzQKmt8s04pFlA21fb99
 9C5YvEm7CU2XWbBI569KpEPOohBPZM/TRHDNVkIwGYO9dq9Cjwgclt5bLko8f2B8prkM
 D5fNDzTUC2EM4xDnFQO/b2WjYG8T5OLKEokukRLXj0h22AQFr6TAFvZUFJHqxjdn+Cfm
 2oSGpX1M0uRKOYyJ8c9Lb7FwRsormh4gKd/47kKgiBv+Cpx3WpLTEH73HAm53oRLt7RT
 58PPFhsHAFpq9LCCJdTohWN73WyHlyPVGsrygEnX+J6jVdcB6ovwA12LUa4qaNj/9qRv
 rUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059613; x=1728664413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2b2LwHBDDNlQ4lpraog9QbauHHDsoDaj9FTLQzChw4=;
 b=wpJ95saJTrb/dKssdHwAa31ADEQK6qDCqgpp4aCEI0pEe0Gw2AinQYp+vRQqKpnzIP
 ukW/f2GOXmckWIQk3kwnXwgb3C0yOgvfUH69WPRcI1XxInJ+kyq6cnulN7ddfKN8wP6w
 dK4Ya3pQBXuOV2V1gHz1NGeE+Unrbb224jQz6sRXf37nhZVmgD6NPOg2A3SY2E8DCztv
 6iCCwLMb4oiqzVpPyRIPMdExKC8w2waHLvpBA+cUJ0H/a+mXgzXqihlmItkVfagkPc1x
 iJ/kFYnaH1EAJ9gWwtlVl+CDlZRnwglj6/4e18MZUwOQHpd+P8XSrDV+yQNENRFebFtU
 Qmug==
X-Gm-Message-State: AOJu0YyPdnKhUnZRH6WjA/dvJqchdA2MOfkyKNFnIjg3BEpAQPz7QBW3
 FkLr7rOU2uBAK3ypPOHdqyAdeRhMmyVvUq3wA2mXBjH5Twm0lOCeB2NBxt4qnOo=
X-Google-Smtp-Source: AGHT+IE2tfM5rvhVPb80atGah5MIPpETq8Uf1KrfbOqWb+mDr5qJDR6o+kAOVJuXXSpQr5au/SoHYw==
X-Received: by 2002:a05:6512:692:b0:533:c9d:a01b with SMTP id
 2adb3069b0e04-539ab88a4a7mr2428184e87.29.1728059612608; 
 Fri, 04 Oct 2024 09:33:32 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff234d7sm718e87.188.2024.10.04.09.33.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:33:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/25] linux-user/i386: Use explicit little-endian LD/ST API
Date: Fri,  4 Oct 2024 13:30:27 -0300
Message-ID: <20241004163042.85922-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004163042.85922-1-philmd@linaro.org>
References: <20241004163042.85922-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
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

The x86 architecture uses little endianness. Directly use
the little-endian LD/ST API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/i386/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index cb90711834f..0f11dba831f 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -754,8 +754,8 @@ static bool restore_sigcontext(CPUX86State *env, struct target_sigcontext *sc)
     env->eip = tswapl(sc->rip);
 #endif
 
-    cpu_x86_load_seg(env, R_CS, lduw_p(&sc->cs) | 3);
-    cpu_x86_load_seg(env, R_SS, lduw_p(&sc->ss) | 3);
+    cpu_x86_load_seg(env, R_CS, lduw_le_p(&sc->cs) | 3);
+    cpu_x86_load_seg(env, R_SS, lduw_le_p(&sc->ss) | 3);
 
     tmpflags = tswapl(sc->eflags);
     env->eflags = (env->eflags & ~0x40DD5) | (tmpflags & 0x40DD5);
-- 
2.45.2


