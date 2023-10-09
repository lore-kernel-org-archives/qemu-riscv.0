Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA235E95A96
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:05:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpo2n-0006Wb-DF; Mon, 09 Oct 2023 07:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpo2J-0006Dd-Ki
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:02:56 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpo2F-0003Jp-80
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:02:55 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9ba081173a3so373615066b.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696849369; x=1697454169; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiQptftwL5VXY8hh/NkEc1RQ3pCoaIPPTThM9LhP2mg=;
 b=Aw5tUoRgV8P+/v9SSopyIDHpta/YJBaKTMhWlf9KEZxznniKi41piBogxj8m8eZqEb
 G3UCfVDrGY+Ew8kLzQNuZk68EIHdIbfjtp0lICMaPW3bL3q9YbEvPjZal74oOhZl2ATr
 jdWi+a+/iMXckmxzlj0h/fTBDB908qiQqkRepvskv1Zk1tUzhHuAS6HCAPeNH03T5gxb
 1e4BJpnV0NoPBE06xvEEvEowsQcfFVwD7gNXa8euPaedn/7GqUzahF0DqQfqneWYwYpY
 /8EkiY9owJX/mMgoeGuiEL3WgbSTqFrqfNVoXTE2A5+ty806IpEulZkca+cyFzOlIbV+
 Mm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696849369; x=1697454169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xiQptftwL5VXY8hh/NkEc1RQ3pCoaIPPTThM9LhP2mg=;
 b=FfT5ta8xxfmj9/8ZXf4Bf/LqwwFnz+PtVAUBIedDKp/VZS6Hw6735yu1QcNCsx0D0d
 PlwUULQn/qJFVqhmF1t1Bm9TZ0CNAr7YnaP6DiCGZ/4QqDuLbXFvgPmZd8tMcrnHlWZW
 UQuO6yeEaq9miOq1gau7RVKy0RIVQufDiC+Qa8KtvAElV29CePp0UwsdE/gwl0YF01XZ
 BWr+KLQG89onuR7L2Gk0X+adl7FgrTsA0CwkR/5HTaEoiS/DrQ8P6cSJ1XSsdTSMjD+5
 rZLvtIfX3k7l9i2JC5a72XZ35GSNK7eIVxVvRsd52oj+yiaF3RHtIyCunHEvu1QK+9s9
 AuxA==
X-Gm-Message-State: AOJu0YzSGm+4/04Qv31Anfb3r5EYAkTrteOGaNRq+ufoWOPkYfI3zJg9
 q9ihwWCQjWYLJ2vSHPjhd6N1Ag==
X-Google-Smtp-Source: AGHT+IH51i2YmgVDgqsz7gMnBc7EgMntzrFIvbCRnz+yd2esZN+fsrmx9f5I5pkTsF8wHPzj1WV+jQ==
X-Received: by 2002:a17:906:257:b0:9b8:8bcf:8739 with SMTP id
 23-20020a170906025700b009b88bcf8739mr12523747ejl.75.1696849369471; 
 Mon, 09 Oct 2023 04:02:49 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 m22-20020a1709066d1600b009adc77fe165sm6581447ejr.118.2023.10.09.04.02.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 04:02:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/6] target/ppc: Use env_archcpu() in helper_book3s_msgsndp()
Date: Mon,  9 Oct 2023 13:02:34 +0200
Message-ID: <20231009110239.66778-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009110239.66778-1-philmd@linaro.org>
References: <20231009110239.66778-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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

When CPUArchState* is available (here CPUPPCState*), we
can use the fast env_archcpu() macro to get ArchCPU* (here
PowerPCCPU*). The QOM cast POWERPC_CPU() macro will be
slower when building with --enable-qom-cast-debug.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7926114d5c..a42743a3e0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -3136,7 +3136,7 @@ void helper_book3s_msgclrp(CPUPPCState *env, target_ulong rb)
 void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
 {
     CPUState *cs = env_cpu(env);
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    PowerPCCPU *cpu = env_archcpu(env);
     CPUState *ccs;
     uint32_t nr_threads = cs->nr_threads;
     int ttir = rb & PPC_BITMASK(57, 63);
-- 
2.41.0


