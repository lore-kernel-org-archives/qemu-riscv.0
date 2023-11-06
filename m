Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D67C4167D
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:09:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxRH-0001zm-EL; Mon, 06 Nov 2023 06:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQa-0001Bs-6k
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:05:57 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQX-0004Ll-BO
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:05:55 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40839807e82so26111135e9.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268752; x=1699873552; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZ4xqFJalLvpzsW1bcHeUL/13mhLi/mzZSAy+mux2v0=;
 b=QrGpKoJ+ZHnculWUTSEqv2x+dQvx34HmqcAoNg3rnaUvJfSUNSKNMsl2+ESXeRFx4N
 ZyiaT54qEsy0P3/cvO+2GAIE0v9/gQLuEqjFaVbqo/0rqHy/WEmZuWg+/Gc6tXjOs/3f
 0FyOsiOEqK4NFBIia5GdVxUxu9c9doDre+aVRops+lgQEEDo4XnQ5/fCCvJ4Exjn5PdW
 uZFol2pzW1HKx0aE2QVsPJLl8EDNmBCkPlwua47ANoRR8zfXOunTAtaOd8Cbi1o4hm9o
 92dp88kXn7FCcaTwpu+LasrqUtqTq+yOAjZW9opJeh+Mynv9Wa1Si3quKUV+gK0COdr5
 YLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268752; x=1699873552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZ4xqFJalLvpzsW1bcHeUL/13mhLi/mzZSAy+mux2v0=;
 b=TzOAVTMjKrpj9h7sYIJcFdUS7zT+T+6V8CkyVyzCMxknCslnAqFkqBoG5N4uXf4hLC
 gIYIXLr/Cec+XluvFRQ2zkp8I7NGXij2f7x3X3bxfpIiJVOfj3Q5Tg5dej6HLqQIrMy4
 5qBY0wYnqPDKlk4RcUZmwxhVgTBQ1En5Lhqd+HG+xGi+wni4eojFOcdhOcb7TRojxCSi
 nAUg9mlaxI4Bi8TeaIswLL+8YHmxr5AKsxWgLrFb5Q0buXTTYbUBTeKgGwQgBbQnuS+O
 WI+wVCaoCuAq9ZOUPiX5e/Ek6BYl+PCvxxX7tha9+AUsnzwPrsZ99lTHA8dJw2vKiNaC
 bJow==
X-Gm-Message-State: AOJu0Yw8bsTQwObHKrxX75jxVWfjHlfTC9ycqHvo96XmE/0a6a3Rn3Yv
 T0oUilqi0ucxkJ4z5NL6jEbOLw==
X-Google-Smtp-Source: AGHT+IG9mJw0F90hy4Uu6xuSpQrJC5TM2lMXtp6Q5jTJMspVFVuvMPHpaiGipu7vhxIPNtgi1AXh6Q==
X-Received: by 2002:a7b:c7c9:0:b0:406:45c1:4dd with SMTP id
 z9-20020a7bc7c9000000b0040645c104ddmr10153754wmk.14.1699268751703; 
 Mon, 06 Nov 2023 03:05:51 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 bh5-20020a05600c3d0500b004094e565e71sm12164949wmb.23.2023.11.06.03.05.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:05:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 19/60] target/ppc: Use env_archcpu() in helper_book3s_msgsndp()
Date: Mon,  6 Nov 2023 12:02:51 +0100
Message-ID: <20231106110336.358-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

When CPUArchState* is available (here CPUPPCState*), we
can use the fast env_archcpu() macro to get ArchCPU* (here
PowerPCCPU*). The QOM cast POWERPC_CPU() macro will be
slower when building with --enable-qom-cast-debug.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20231009110239.66778-2-philmd@linaro.org>
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


