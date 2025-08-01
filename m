Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B90DC87FCB
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 23:34:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhzCI-0005AY-3p; Fri, 01 Aug 2025 19:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8w-0007VQ-P2
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:31 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8s-0005xb-4a
 for qemu-riscv@nongnu.org; Fri, 01 Aug 2025 19:26:30 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-31effad130bso1146512a91.3
 for <qemu-riscv@nongnu.org>; Fri, 01 Aug 2025 16:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090784; x=1754695584; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjQRkF3T2e1TLC4uRUvYI8Of7xM4pUkpWBxjX1/U+Cs=;
 b=yWSM7QOabctrvyX59t5uENmnS8rF3qGvxGTCH3VjnobHpRo4Jmx1MZuLK89wy5ZO/Q
 osHuQJQvXP88O+03OMhqkGi9jC7o8FzskxCNuL57jw1bam4rYRbQbdgr1DssUsgSnlQo
 QUVVUCrzRLD4v+0GTi4+lwnsyQhMPY1apSKZNye4+Up98PmbF0NiPzttC+NjX7Gr1shh
 9/kWhv4v7vX/4OdjVjtaQ/GV/lCHTfl/JeZ2Or5C9PjRGLlt8AxOm6mqHThaB5P2GcW4
 8TF3Wdc4vncdGDN6LfniH1suUdDQCY4NTNl4j/810gKA2cUsVjCYERSKci09bnKZ6uy8
 HgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090784; x=1754695584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjQRkF3T2e1TLC4uRUvYI8Of7xM4pUkpWBxjX1/U+Cs=;
 b=bO9mH1WEoEur4VOUgWbYTPKS+QNlvVM1K/Sbgwu79d+PQ7M8SjiBmzCKydnSmDWjky
 GTDuh3CiEc1CYKQUTEoryAgr5IRVAIZWmTC/aoGJep2lrYAexvPdIcScAHi12nnOoOdr
 US/u16C4ybGMcux/a15CUZuUElP7uAf1+/FXvmVnTMY7Q2y8WVmQY+dIMmrXfPavsFYv
 pbWCxR8/pK/KsK/IHdJClJwJkNtx/8VpTNsHLIhvn4SMyce/ZUsIWEdeeajMFzofMJoK
 sKVNEUv/2lmpKih2rbGI7T1MTZpw6gWs/bP1zoyEU7CbjpS+llZhqEkRLP3+gL7jODuA
 GsUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfQa5kOVOLjmFsFV6xEihUfx7xWQh0bfDmYL4yf9Qzma7265bfLSQmF9H9i6L07xJ+KrL4hv40dPHV@nongnu.org
X-Gm-Message-State: AOJu0YyhnGeaL3Ikc84ryRFbaKpuY5Vc1089uCLpRIACizZAZp/KQyOP
 rFW5crDToy7QL00PiH5KerN5ny6Nxg0jnl6TVAt9ZDbtmlHel3jl6mhjWQzBsPqa3V0MSQxCkeU
 f/MGTgJI=
X-Gm-Gg: ASbGncvf1iUFguRrRgKfVZrosWXWHG3s2eUKUP9pbmc/gi8344deTbe61mtHGX54ITB
 viNmPlGRk6J89b3GHLtTMQMu0sguRHLoK36+hJhmV69BLnsWpRKE81dF5/1ayhfmaj+mvBIqVg1
 rA6TYp2BOfUSXverV6HEP+tYYIHqwFJ4axbxPBWnl8iGu6/imh+pTyBq68f/8OL0TqaW5n+WlKJ
 ZVl3k5NCPLqCf9c9+j0FAY3/4epHxw5Ocsesznxrlwb5BXz/Jk4D6xydvqirr79x4vqQq8yOgNi
 TY/rnQJTJ16DIPqSKB2RTwQXSL+J+u9qr68emo+Qk1evIRXJULI2i35f3wzbx/HBlm2+6mcQCUg
 Equzpf4k+DRORap7KfdtZMg==
X-Google-Smtp-Source: AGHT+IGB0AcTzr6B4F26dGXej77A/yeTKgm5nnIegOXWvsK2bVPvbV/VC1rPwyiZ3A8RMZd45FLWiQ==
X-Received: by 2002:a17:90b:4b83:b0:31e:4492:af48 with SMTP id
 98e67ed59e1d1-321162d3205mr1860771a91.28.1754090784640; 
 Fri, 01 Aug 2025 16:26:24 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 09/11] semihosting/arm-compat-semi: replace target_long
 with int64_t
Date: Fri,  1 Aug 2025 16:26:07 -0700
Message-ID: <20250801232609.2744557-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102b.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 23319552a31..550c8f3589a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -501,10 +501,13 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_ISERROR:
+    {
         GET_ARG(0);
-        common_semi_set_ret(cs, (target_long)arg0 < 0);
+        bool ret = is_64bit_semihosting(env) ?
+                   (int64_t)arg0 < 0 : (int32_t)arg0 < 0;
+        common_semi_set_ret(cs, ret);
         break;
-
+    }
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
         semihost_sys_isatty(cs, common_semi_istty_cb, arg0);
-- 
2.47.2


