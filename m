Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130BCC48291
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 15:23:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rVvMm-0008Jr-8V; Fri, 02 Feb 2024 10:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rVvMk-0008JE-VJ
 for qemu-riscv@nongnu.org; Fri, 02 Feb 2024 10:22:06 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rVvMj-0004TG-HX
 for qemu-riscv@nongnu.org; Fri, 02 Feb 2024 10:22:06 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d918008b99so17697715ad.3
 for <qemu-riscv@nongnu.org>; Fri, 02 Feb 2024 07:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706887324; x=1707492124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1eBy9OUF1KhxciHsZoO2+9UUkK89QSvYzrFDbFxj1A=;
 b=MqY74xdAJkrwp1IsTNc0rWFs7/PnlLDDZh7gTxVOsLMNICG8dVWlhVnuveAusAIKw4
 tzuRPQ4iHfdr6BhUZuDilLNPhfqik5YRwIJQngbC9oH2c9CVUtnfMkIkch+GX1N/8cDd
 /GT+8S/zmQkWW55SQ3eyE7+c3Ca/lzqUpazqov0sdh+9v6V77Dh9sSZDSUAxzd0kDsmn
 shfj0ukugVwrJKzWo7WfvJLrWloQClytdYVMcPZrUOMCNUxaMhObwjR5aP2yRMZn7UFV
 QxLQq/Y5+IZ/Oq+qXmaMsO26PKUxdvKAiN2mSJif7xi+xBghDTP2OEBFXyJ41rA5pZj+
 sFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706887324; x=1707492124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1eBy9OUF1KhxciHsZoO2+9UUkK89QSvYzrFDbFxj1A=;
 b=kLk+zr0t48itioXrV6+j2wjRgrTOJmfJoJ2d97UHSvUJDfzfZ4FwW+IM2eOaNrLhPS
 nGJRQyId50bXeTiQtqSRkDDVCOZWrq+UpmL1CMkqu/UyXV6P1SFrNaJTwhWYaoRzfC4i
 eCOFecIvsI6D6aBk7Pw0dVeLtoPUm1P7rXwPSGaAfnUSBL6I0fEtS+4u5/88CVkBLzDd
 cGL6mPBEeg0TwBe7OPV6Fqq6HyJXmoBaBrgoWzKoVjLwJqVbBTc61//km2izrAmIiIqo
 sHTY4dEegxZzBz66LKOrimDJL0L+A5lilaaWq/FsxWoxiZ3o9mBEIpP+jnfeOc431mvd
 uhQQ==
X-Gm-Message-State: AOJu0Yz7+tdFzZT363Kv0N1+bFWqZjsqry199iPiCp7A4ZtJhBHKk1w8
 PBBon2dw5HyK+/Kangkcm054cBg5qtCEGbsGheQGvQ3weu9j0eCRyjcKLUt8/y0=
X-Google-Smtp-Source: AGHT+IHHgc10WU5KDxEajZP2C4XS3CdWqS/shyT+hcGqzPWu9BtiGVQEJlNFSg4Wb0QKeGGDRIzx1g==
X-Received: by 2002:a17:902:f811:b0:1d9:5038:f116 with SMTP id
 ix17-20020a170902f81100b001d95038f116mr5246635plb.34.1706887324130; 
 Fri, 02 Feb 2024 07:22:04 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUY+b4a9Uob9vNELTmeFd1bTRPJJ2SJ1QH2j/1JhSUCxCWhj33RQ39TC7JNJ8T7y+R7sGXhVTXqcPtfGo7iRK6yfQMWGOHiqc3qSkuuOhmvaSsfdOv2F1cjdeaTUuCPs9BNg3N21RLFkH/+Zvyg6sGTIpk87z9g5zNus70cO/fLVarGegZuEXif0CgjJbX2XO7PJAm94DDCNwZqiJTV7zEx52EwCGUzOU8RanlCg7vp57SBnCiqr5eXJMKfKuCYFG66KeRag1EQFCB9Ngut/YEORLoK0Gq7KA==
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 j3-20020a170902f24300b001d714a1530bsm1734381plc.176.2024.02.02.07.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 07:22:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/6] target/riscv/tcg: set 'mmu' with 'satp' in
 cpu_set_profile()
Date: Fri,  2 Feb 2024 12:21:49 -0300
Message-ID: <20240202152154.773253-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202152154.773253-1-dbarboza@ventanamicro.com>
References: <20240202152154.773253-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

Recent changes in options handling removed the 'mmu' default the bare
CPUs had, meaning that we must enable 'mmu' by hand when using the
rva22s64 profile CPU.

Given that this profile is setting a satp mode, it already implies that
we need a 'mmu'. Enable the 'mmu' in this case.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index da437975b4..88f92d1c7d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1107,6 +1107,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
 
 #ifndef CONFIG_USER_ONLY
     if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
+        object_property_set_bool(obj, "mmu", true, NULL);
         const char *satp_prop = satp_mode_str(profile->satp_mode,
                                               riscv_cpu_is_32bit(cpu));
         object_property_set_bool(obj, satp_prop, profile->enabled, NULL);
-- 
2.43.0


