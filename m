Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C94EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 16:37:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEBcn-00044S-VP; Tue, 27 Jun 2023 12:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBcj-0003si-3s
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:33:03 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBcg-0004wZ-KX
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:33:00 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1acdfbe1c78so4522801fac.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687883577; x=1690475577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veNPdoP0KMiS6MurmQQ4EerCcRcND9mpTP9rXWTlN60=;
 b=nqaFwURHP0RMsKZIaZTcnSNdGKfFVXZlA0oejhgVcYARCmK7VeqblRkB12uLKuORDD
 vaBAnQGbs8mm7BbfIWj0zxUnNEhiz+b1PliyFZCJ7CymHx2T9s8KjbRpsZMAFE4ou6V4
 iW2ZFzEhZS2HoFD6v1uX11vYL/0Kmbn5/742rtjytARk3npEF08FfRUJoE/xJUlJz6Qw
 ZD8bBGGSrRA2nQRRytSy5fRMSvMfsUvolUoSw/gMz+BkXkM7yzqVe/2tv3dRs6rNRA1w
 E79Y4RII536YXUy8gQTGvj6YeF8mrZOoAMNbDJcX1y6qY2Bieg9XwqlQ/oo1eb0Xk0d7
 Bz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687883577; x=1690475577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=veNPdoP0KMiS6MurmQQ4EerCcRcND9mpTP9rXWTlN60=;
 b=NfKpQR9k2cAXnJQjspBF3UX8qmBT5rJmvuBG6Vzk5QwdD3emCXWipeqKk+TypSMXpo
 0U2oVKyD6vedl0f+VF0Pqfi3hrybL11fzrD6TTYR658EHSlrgucx2s4C0dVwGE4djWpJ
 x6gm43tu+Z6O4QoVGPZ0hUT1A0e3cOe3eeehV4WV2mSTl18Wmdyr8if2CDI6GNVge+To
 xNqPUSKfoz6FN3Hw31JGUQOADlKwoaK7HijnVr2cJSPfhHeVFL/r8n/jTIJ2NzSkJUJb
 fztyAMYq+mLOjkWebh2JRcnwI+JyPR9Ikl/jDBL3FC4ZfbHjGZhmLH5MRM09Fzb8m1Vy
 qT7g==
X-Gm-Message-State: AC+VfDz/8a6B1l76RSIxiKTNZCZ5A2pKnzovPwbmJd8XUE+2NvhYZeWh
 XDNdhWl1IjoYnYSt+zv0sRGDeA==
X-Google-Smtp-Source: ACHHUZ7NwK7kJ8P8zmsqs/fr3PaCxDSGTrYK3AjuTzfkgRZ77T9cSsU4BWw6sCsKY3wAsoG/bsrr8A==
X-Received: by 2002:a05:6871:4685:b0:1a9:af29:46eb with SMTP id
 ni5-20020a056871468500b001a9af2946ebmr30460404oab.59.1687883577756; 
 Tue, 27 Jun 2023 09:32:57 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 gu17-20020a056870ab1100b001a3093ec23fsm5254134oab.32.2023.06.27.09.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 09:32:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 15/19] target/riscv/cpu.c: remove priv_ver check from
 riscv_isa_string_ext()
Date: Tue, 27 Jun 2023 13:31:59 -0300
Message-ID: <20230627163203.49422-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627163203.49422-1-dbarboza@ventanamicro.com>
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

riscv_isa_string_ext() is being used by riscv_isa_string(), which is
then used by boards to retrieve the 'riscv,isa' string to be written in
the FDT. All this happens after riscv_cpu_realize(), meaning that we're
already past riscv_cpu_validate_set_extensions() and, more important,
riscv_cpu_disable_priv_spec_isa_exts().

This means that all extensions that needed to be disabled due to
priv_spec mismatch are already disabled. Checking this again during
riscv_isa_string_ext() is unneeded. Remove it.

As a bonus, riscv_isa_string_ext() can now be used with the 'host'
KVM-only CPU type since it doesn't have a env->priv_ver assigned and it
would fail this check for no good reason.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5a50cb1d0b..b65db165cc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2001,8 +2001,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
-            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.41.0


