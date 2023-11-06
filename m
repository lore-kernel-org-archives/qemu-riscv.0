Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0A6C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:23:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxRX-0002fN-Uj; Mon, 06 Nov 2023 06:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxR3-0001g0-IG
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:06:27 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxQz-0004RK-3q
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:06:25 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so32422875e9.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268779; x=1699873579; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9JKKmt1EY/kf3nircSCgd4NoTIWcG19r0u1T6OQDS20=;
 b=QVC1LiYWkKwZSROe1Pmjp2J/0I+cmdIrUx/hucGTjKWd+TsJl18cMyQ4O6e20ongLi
 imefLK1PuwB1JwL3m/iaa5efCxWg85DhUGyQGPzTYgBI2qdg21T7wXlZKOP+HFzt6ESV
 2bXCNkb/PFfE5dcQ34ZDYpzjK00ZFmAEgOtBLg3NsX1Gjs9S7uq9CKNf5mgxkEDiEVQK
 x0aIs2jc2HJgqDYQAfH9LNkpjamCqf/toEpJWbpnasBIh9nxjE0jOxUUBukJCNspWAVy
 AnKuUo94BM83K9mBMNxiCKLLQ7z8WQOzhtKVqTUbR/VF7qwJa12BLQRfQNs5At9eomDy
 GKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268779; x=1699873579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JKKmt1EY/kf3nircSCgd4NoTIWcG19r0u1T6OQDS20=;
 b=JH7WsLVVLoKRTsvtkEvGWRcvyUA2YbR65p013lIKTCBzoLwQdEM7nOsKvQlXiOO8IS
 khXeiQmAFv1SU/9mAWEAgz9PozDpa8sxWR80NQbh+yPt9RVpQGX/dxb6NETd386CPdLF
 OabD1Jw8lUV/qOUP/jUVyB8rktAXb4YYSb1LLrEr8j0Nj9ow2KZO7KfUs+GwdhazSxJq
 dxx6hJ9ZWyXYTe4wtR6f2kzFZOxgakqeH1bS64gLIQOgB0J7hcMSNA4bt8h+LiNN44+t
 cBj2Mn9VszxM5ibd9suu2wxWToP6BoSAAbv+JQFzkmAjXFXBqRk+/8cipQxm/8BTbLtA
 iidw==
X-Gm-Message-State: AOJu0Yy30k/OU2ST8sDXBVk+33MWKXLQLucUyJKOZyWlKzfOhY/tQYaj
 fuiNvwMmpzuwwUEDHSrJwK5pIQ==
X-Google-Smtp-Source: AGHT+IEfybZ7H2Z3J3gHYnthxWPdDRlfQr2CrB6JP1W6Rr4GrrWr88wGlPvt7oAiYP8kPnl41aGPqw==
X-Received: by 2002:a05:600c:1913:b0:409:351:873d with SMTP id
 j19-20020a05600c191300b004090351873dmr24821001wmq.31.1699268779697; 
 Mon, 06 Nov 2023 03:06:19 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a05600c109600b0040523bef620sm5449491wmd.0.2023.11.06.03.06.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:06:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <roman@roolebo.dev>, Zhao Liu <zhao1.liu@intel.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PULL 23/60] target/i386/hvf: Use x86_cpu in simulate_[rdmsr|wrmsr]()
Date: Mon,  6 Nov 2023 12:02:55 +0100
Message-ID: <20231106110336.358-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

We already have 'x86_cpu = X86_CPU(cpu)'. Use the variable
instead of doing another QOM cast with X86_CPU().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Roman Bolshakov <roman@roolebo.dev>
Tested-by: Roman Bolshakov <roman@roolebo.dev>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231009110239.66778-6-philmd@linaro.org>
---
 target/i386/hvf/x86_emu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index ccda568478..af1f205ecf 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -676,7 +676,7 @@ void simulate_rdmsr(struct CPUState *cpu)
         val = rdtscp() + rvmcs(cpu->accel->fd, VMCS_TSC_OFFSET);
         break;
     case MSR_IA32_APICBASE:
-        val = cpu_get_apic_base(X86_CPU(cpu)->apic_state);
+        val = cpu_get_apic_base(x86_cpu->apic_state);
         break;
     case MSR_IA32_UCODE_REV:
         val = x86_cpu->ucode_rev;
@@ -776,7 +776,7 @@ void simulate_wrmsr(struct CPUState *cpu)
     case MSR_IA32_TSC:
         break;
     case MSR_IA32_APICBASE:
-        cpu_set_apic_base(X86_CPU(cpu)->apic_state, data);
+        cpu_set_apic_base(x86_cpu->apic_state, data);
         break;
     case MSR_FSBASE:
         wvmcs(cpu->accel->fd, VMCS_GUEST_FS_BASE, data);
-- 
2.41.0


