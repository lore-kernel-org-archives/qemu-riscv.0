Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF83CED606
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 10:59:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLJR7-0005Af-VW; Tue, 18 Nov 2025 05:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vLJR6-000571-1v
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 05:59:48 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vLJR4-00009x-KV
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 05:59:47 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-bc274b8ab7dso3797146a12.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Nov 2025 02:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763463585; x=1764068385; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYm/oafUQ96KV1KrJ5UIi5YiWsP4bo/zOXkfAj3wvwo=;
 b=RizR/oj4piycARk89LIg+OFMFELZGSh0HFqjzY83Q7o9PUudATtn+Ut0zOy+SdLSGc
 AkXunBSOBph3Rf1hhNMuXyztsqRzSCYzvNCqLZSn9yV5TSx8nYOvv8Rsq6Zv+oTcxH4F
 9R4Dq47uYf40WYy/JTGim1fQZX+QMvEqiAMwhAfivQpyjNAlJS6MxxgDGLn1vGG4TbnJ
 ClTvG0CSpG+UBoTBsJ1XWZgCGz0He6KaZqopv2RmUywLbPYqTjZ33N8AcDq4ShYxV23L
 ZQBCFD4Li/N/bUao1TQvaMKmNzBYNGBnNmbUXCDPfHE729BbjNQ7Okl6IM14UZGYA7HQ
 EKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763463585; x=1764068385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xYm/oafUQ96KV1KrJ5UIi5YiWsP4bo/zOXkfAj3wvwo=;
 b=ZsyrmHKxqFhHhhz34cKrLgI2GGIuB/63rkK+ve1kVgVT21h9il5N8aU0jsCSZIEAeq
 aRtIZgS52n3pfk/gq43y88FP/1pO+WOqkyNpaUz+nEBhNeP0mIqcik0IVwBWrt3a4zpL
 1t1JhPxPrY1tK/mN+xtTbbxIBQOLMlBndKKqdznpxkeDnJcgEY1/LHmdyVYWssVm+d6D
 FSaAoVEFqBGi+Fx9ALMkNCNA1eqywiiZO3MkKyE8Fd7Ffbx9wCi5fc0uxUHNEDpbjEzy
 AUiPgV01WVG4TAIQ7M88h3C9Z380jAzoJaMgjT57SHgKCpEoDcspcO403F/GjtKTS5YD
 fIBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK8FIjalpcpQuO7E8gK8TISB6PitFBEWl5yjL1fph99rQRCwARQIPFyZPb0tNJ+GjPslzkhD9IndXY@nongnu.org
X-Gm-Message-State: AOJu0YzHq0cgNNOf1C7eciEnNoKMykhFRBdxx0SDiidQNr3O9X1JGFVD
 MykDoNcYpiD0nLFVZEspwJgqgY8XeAt+j5U1R0azajuGu9ZGk9FLbqlNfeMvuhLAkZ8=
X-Gm-Gg: ASbGnctgjn//jamIYXFqnqdWHDhSPPULXTCTJsUJ4RFFrgP3EQN/LGQUVRAp/Fk9bXM
 6vHMvxK2gDFOzZC1eHeHGqunfcY/GRfPOozcRBRt9Rtc3L1nExMMdA1n4bvibGVAP2EK8Eu62cx
 Xe+nWye2ACrV3f06iCY01LhvAoA0lfl3bI7muTsXyWZs3wlNfPlaljeK23OmI9bw9wiGgyKPCmZ
 mhz0TC91CkZ6YSIS9Y1rb97Zjr/rck6NLu2T20B9sYMBFNlwVSoyXzlJnJw1JrWtYIKp3Mg6xor
 FwVkvj/KPYu0eL/3nP112hW05mXYfea+QzDBgbUZ0XenroVWJJzRyuICMqEd4g+sbHUbgkw4rGP
 ZZ8wPatSFcD5eJxm0RgJ6Ik5n9L91cO3N64Bt/qy0dZPWSirQvS9bZ0MZzghsg7MQpDsO2x2AUD
 MqoIITSgoJHUWsFJtQdv1vGCFTMXNc5mAAYXPdXNKKzDEdAXzL
X-Google-Smtp-Source: AGHT+IH/Zm526KDj+WaH8ttm5/E8z62aV1zhs++U9UuITo2EzODoxGkPnBboZmi+SkuqkF0DLGtuwQ==
X-Received: by 2002:a05:7300:d581:b0:2a4:83c0:6509 with SMTP id
 5a478bee46e88-2a4abb54ebamr6282350eec.27.1763463585179; 
 Tue, 18 Nov 2025 02:59:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a49db4a36asm43989903eec.5.2025.11.18.02.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 02:59:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 1/3] target/riscv: fix address masking
Date: Tue, 18 Nov 2025 18:59:34 +0800
Message-ID: <20251118105936.2839054-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118105936.2839054-1-frank.chang@sifive.com>
References: <20251118105936.2839054-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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

From: Yong-Xuan Wang <yongxuan.wang@sifive.com>

The pmlen should get the corresponding value before shifting address.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 172296f12e2..9b3f01144d2 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -203,8 +203,8 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
     if (!is_virt_addr) {
         signext = riscv_cpu_virt_mem_enabled(env);
     }
-    addr = addr << pmlen;
     pmlen = riscv_pm_get_pmlen(pmm);
+    addr = addr << pmlen;
 
     /* sign/zero extend masked address by N-1 bit */
     if (signext) {
-- 
2.43.0


