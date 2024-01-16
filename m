Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE925C47258
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 21:03:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqWO-0004gu-N5; Tue, 16 Jan 2024 15:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWM-0004eX-6l
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:54 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWK-0007cs-7z
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:53 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-28feede2624so311151a91.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438730; x=1706043530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C+y3Qrztq/7kPEEkjYH8q/r34iQTuu3hzaoJAG+sufk=;
 b=OilqnivvFU2mUcz3eYgQUsVwgiOdRD+naYGXbrzPcWdroAgsSm8SOxKy1faIzMFx5e
 CuRBQS3oKEiqY5RuEhNo4Cbjes1ZJ7u6H+XJ/ay9QGcB3hrtPvvQIubUvNxRwTjfnW37
 bUsFz58DBSavzigiOC6c3Jw81J8tB9aq2e6jZSgQckgOWtdANLzwfOIY46b8TtJ61Nxj
 hVscMQ8S1oS6TkVEMe6Sm4h+oam5jAXqPlvUtbe+cqkySvhXLwNjBW0dwNGlYQMEqeO9
 cBc5uLuO5gzwwVHPth/Bmx1DdlsqpcQ8vZoM9aQY6Gr63XGuUOQCFQD1YqukeYG2QK9c
 efJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438730; x=1706043530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C+y3Qrztq/7kPEEkjYH8q/r34iQTuu3hzaoJAG+sufk=;
 b=NAPcAOiKdODt8NF5V35xn1PB+iYusAvWUJkNN/XcuWVKN1J70i5X2pbnupSZCakLWo
 hCfPXWN1/emhQxheXxvAJcftUSCB/nRqegHbQ4nx2x2wJehyAvvSpPBqb3oK2H+Pcy2N
 0xKiH8wPlumvDprBAfnsFVF7b3TRojTYc7mB4C7THKmCtYprxyqxKiCgdAZB8I16+37D
 H/WX+gbaHgVzVZwT6iM+M+C7E6gIiUxGeiyqrc5PfWiWt3L2LMgRviHmfwslsNr5FwHn
 5gfIYRC3n3HgLlNUAIYR/omhIWhQPmZ7K4Wmlz9pDjM5bctvmgDg36uwM40Hoq2jFb/e
 WC4g==
X-Gm-Message-State: AOJu0YyTj6Vm3fY4d4t4EfSzOXkm7Kdn+ZgesQFdwjhhwxAamVUsC3dA
 mXoaqLnzoiz0Xg8JIQ/3DBXvpMoiaYVafA==
X-Google-Smtp-Source: AGHT+IE9J29pUsNWTxIh79APWl0lEa+x2PGhHRKG8GUtxrqfMPYm4CEO7/007chcizx7UO57NzwBYw==
X-Received: by 2002:a17:90b:314a:b0:28c:91a5:1e33 with SMTP id
 ip10-20020a17090b314a00b0028c91a51e33mr5214220pjb.12.1705438729958; 
 Tue, 16 Jan 2024 12:58:49 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:58:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 08/13] target/riscv/vector_helper.c: use vlenb in
 HELPER(vsetvl)
Date: Tue, 16 Jan 2024 17:58:12 -0300
Message-ID: <20240116205817.344178-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1033.google.com
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

Use the new 'vlenb' CPU config to validate fractional LMUL. The original
comparison is done with 'vlen' and 'sew', both in bits. Adjust the shift
to use vlenb.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index cb944229b0..b13be1541a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -45,9 +45,16 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
                                             xlen - 1 - R_VTYPE_RESERVED_SHIFT);
 
     if (lmul & 4) {
-        /* Fractional LMUL - check LMUL * VLEN >= SEW */
+        /*
+         * Fractional LMUL, check:
+         *
+         * VLEN * LMUL >= SEW
+         * VLEN >> (8 - lmul) >= sew
+         * (vlenb << 3) >> (8 - lmul) >= sew
+         * vlenb >> (8 - 3 - lmul) >= sew
+         */
         if (lmul == 4 ||
-            cpu->cfg.vlen >> (8 - lmul) < sew) {
+            cpu->cfg.vlenb >> (8 - 3 - lmul) < sew) {
             vill = true;
         }
     }
-- 
2.43.0


