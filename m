Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32AFC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:37:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD20S-0004Dn-TN; Tue, 12 Dec 2023 07:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1zm-0002So-QS
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:36:18 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1zi-0008Ud-ND
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:36:18 -0500
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bf26b677dso5328275e87.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384565; x=1702989365; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCN6XEpRfBzl6QRBVexJQczvz29R6MzglzJSIvh3kCU=;
 b=aG6/g82XeI6bfBPhwMK6Lzv9kR9aCU7Q7PaSmZGzET8LdmNENBP0karaZnrBkKxab/
 Is3iDFWvfgJqPGwT4i9E6L+iQyO1nKPBT2xppzX+hY9/FzDldX2e6Uo+egq/9KDZYXC3
 mWi+mPIFQRr0hODuk6cIIAx8rBNTNDRJ7ldzOY7q4ISTtCtniGofz8pEOb91RyEPseLV
 xjSxmHJvJez10P/LmlNJU56ZHjW8rjQRyrGqvXOmOi+nYmIGBJd7IsZNR5SegYagDI3z
 at/E2p6Kz3LU3lTyGfkGh8pwJlD+7WSqu+DO0d5tsvKY/XgyW35mhf5FGyd+EcIF/hQY
 jq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384565; x=1702989365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCN6XEpRfBzl6QRBVexJQczvz29R6MzglzJSIvh3kCU=;
 b=E7x2mHYT8pRmBsFZJOOl4jv52CtDEg+8tslei/FtyO3u1SFaMoHuJGmUfOiZgEXhUG
 eS5vHCUtSQUkhpZFG5EZoHnUaIfgpoIQxTRVsAgilPan3fBzTMYWxhriyXw7ZaazN1OU
 jWIZolTb2rIJV0pBJLPztPCJQ4ZVICy9rZoKF4XFnc7XAyZ8uhFI0LNAMXcjBsjvmPMW
 s8m9i7NcHQKdykZ7wIrBm5kolrd5Ba6P8dL3F4/zfq1HQimNQhxOgoQQCt5UyxOswFBo
 lIUiPQ5UbYGb5Df7ivW792LiLYNznPDOWkMBozZ8fF6GehWtuUByOwitTjOm7SYRZoZ1
 +kuQ==
X-Gm-Message-State: AOJu0Yx5ayuDQQMnuTy9KvbRvlZFScSfx/tcTEjXv4pN8yaoBnf1IBo3
 nO/ICSn06eRG8/FvlNFwmBA50Q==
X-Google-Smtp-Source: AGHT+IFmeBvWgvvBbzYGkF+zYPl5+e01JLIWWNuas4xPI2HT4LsHsl0TWRedv0QHFzvG+nl31n4+yA==
X-Received: by 2002:a05:6512:281e:b0:50b:f9b2:d00 with SMTP id
 cf30-20020a056512281e00b0050bf9b20d00mr2195977lfb.22.1702384565627; 
 Tue, 12 Dec 2023 04:36:05 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 dn20-20020a05640222f400b0054cc22af09esm4672659edb.46.2023.12.12.04.36.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:36:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 17/23] target/ppc/excp_helper: Avoid 'abi_ptr' in system
 emulation
Date: Tue, 12 Dec 2023 13:33:53 +0100
Message-ID: <20231212123401.37493-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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

'abi_ptr' is a user specific type. The system emulation
equivalent is 'target_ulong'. Use it in ppc_ldl_code()
to emphasis this is not an user emulation function.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a42743a3e0..3d7c9bbf1a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -142,7 +142,7 @@ static inline bool insn_need_byteswap(CPUArchState *env)
     return !!(env->msr & ((target_ulong)1 << MSR_LE));
 }
 
-static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
+static uint32_t ppc_ldl_code(CPUArchState *env, target_ulong addr)
 {
     uint32_t insn = cpu_ldl_code(env, addr);
 
-- 
2.41.0


