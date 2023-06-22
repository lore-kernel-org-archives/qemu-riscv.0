Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DCCEB64DB
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 13:59:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCKoy-0007r5-S2; Thu, 22 Jun 2023 09:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKow-0007oo-Bo
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:57:58 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKou-0001lE-KK
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:57:58 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1a9ae7cc01dso5059868fac.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687442275; x=1690034275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUy8spMlJhAEp8KKmFBdTT3DjIC/nXTZCl3Npb8QGK8=;
 b=iYwBUwNhkPBxrsxqIvZPay6Gt5H2e48zXhwaef50/ZRKYD8y9yhsKC4FlWEj0cDFnv
 pftq6U6ZFOI2uQnN2ShM6ppy3LPgTaE5fmrtoRjtA6bYlAyocKrm1L4MyCzF9tmd5l21
 5phy8cX369D5UmX/af5LTYwoVKE4ValEu7XTYpAVnLBDuhAn4H61x1uWlzqC1ZNlaumB
 0gTuXiIvyXrNKTc0XQCT+94E5lYdyl3xxIfoEGR1CD0FfK23rtl4iWPNmfQwbDKbPbUS
 ryCdEw9nYeomgaFpsMCxXw+khXkdQF0tc5TJgLdV3PJLR5ybHVCXNGODtdSvHP99oUyf
 jY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687442275; x=1690034275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zUy8spMlJhAEp8KKmFBdTT3DjIC/nXTZCl3Npb8QGK8=;
 b=R6HP7LW9xv03yvAeQdUOoyV4J6uSvpsRWLW3DlLjWTcEQmHXP0IpGpjAEvfjhdWzXn
 XmukzgAcjUtxjfxlUbpcHNiYSpzXL49YexGXuvIQwNwpjg9xWLxz85BuOcgAuxHsjYDI
 euCYZGQngKXwQUvyigyW722LtKCJ/+jewQZY19kHlGFQEwSNU9ep5LoRpZnwRUNUX6bR
 fkXwp/D8JUAshsy32KGali9YExYXXqpAqZEw5xFUpMGgPyw1dEuCeTpVWtsohXq8cU7h
 BJOztJnuRnC5QSab8TSONsebmXNTXCSfzLmwApIxkImX4zv1WQ+LbzK5xnpX3eoAN+ak
 FF5A==
X-Gm-Message-State: AC+VfDyBLd7fZWWlJGDgKFZslDN/aA5KEDfFX6pFurhSUtT1OQbx3jia
 FBisfusMeqNP76wBSqGj8OBfhA==
X-Google-Smtp-Source: ACHHUZ4OjM+W1Hz51ahUx7qZ1pUIni19v8ptxLiH5u10xPSv293O3CwLyLh5yh8LITPfBPNKeYATVQ==
X-Received: by 2002:a05:6870:a486:b0:1ad:2b76:c3 with SMTP id
 j6-20020a056870a48600b001ad2b7600c3mr2312034oal.39.1687442275181; 
 Thu, 22 Jun 2023 06:57:55 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a4aa446000000b00562f06fb5easm156677ool.11.2023.06.22.06.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 06:57:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 15/19] target/riscv/cpu.c: remove priv_ver check from
 riscv_isa_string_ext()
Date: Thu, 22 Jun 2023 10:56:56 -0300
Message-ID: <20230622135700.105383-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622135700.105383-1-dbarboza@ventanamicro.com>
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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


