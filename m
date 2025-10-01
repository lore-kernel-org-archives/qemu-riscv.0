Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0ACCA472
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:11:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yRE-0002BT-B2; Wed, 01 Oct 2025 11:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yR2-000213-OM
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:08:08 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPf-0000l9-7H
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:08:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so70575795e9.0
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331193; x=1759935993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcFSHzwi7uBOl2YyW6dgGkKIyMLR1GvdjSiz7OthsV4=;
 b=l4WCmZ46q3O2rseWf0Lq9gMGspWTbGll+/eIQRZWw7bHWMGNZWyKx0xR/T5cpNkRTS
 FJoek2LnaQUy2TQauUNJL7/ILrvsH10xBpGc9SGqY7jzuriojr0RxxVI3gLQRakJTevq
 dZqsGTUQc2iufIgEmPL2v7OAw1/llIFhlsFt6M3QGaCKWeEHjS6Q46cS2JVLIv5+Mvra
 mLLAYpNmxjJED1LEh0M1zEQBZfzoYTQeXo4NtaV4ZEBsImoR6OMAmZoRvusLNTCbVw6m
 aLtr96e5de3Hg8SZghqUBzJvF/Qk5ineIw3rHVJd7ouuW4BhDgHES2cWBHUfcoQafKas
 orXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331193; x=1759935993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dcFSHzwi7uBOl2YyW6dgGkKIyMLR1GvdjSiz7OthsV4=;
 b=gH/pb7R2GCcflTPjM4Knu05Y4z8ZbrWYRTAlBp74tU9q9hKrv/w5AFto5gulQhIXvE
 QsY0qXa872aRHu9abEHMCs9O2KuUufNHI3S7MvQh+1+CyVjjGYGsF2MQ+8ZJ6DqepbsO
 hHjbKZXMwq3oElz9CS12HbB8WBsgO4YorQgCVZ5Ars+GMaUqVyFcRTQr7VdVacwVsTR9
 h4hfhRi9GiVp8Ea4ch7PJWxSqBbzG0o1PGoLFHufNNRyV6XjUFo1xKAYzlPcIldt/KQF
 sgCZAJpMCH01fOm1vC/vVi6KxfSNQzaztCYL4TiqkZ6dECgKngdia4RRZWQNteCyJwDR
 5odQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw/YnaRW95RbR8BEjeFG8x5Qq0RSY9lsg+XaxfISFiO9UY6OQ+TIUXZXgwE49u9qGW5Px9eX4B04rx@nongnu.org
X-Gm-Message-State: AOJu0Yzz9n6PUbhxX9MMiyDdOhQaA106G275KPZ/wVo9VL+tpwZmPExH
 UtrKKM1foMnXkiLMlqf+AHfQ+yehwXlHYwiIQfZBz4NhWgXgMPe0FSwrVc4RI5d7X+M=
X-Gm-Gg: ASbGncuxVrS/QR+x31mzQwriZJIoeE2jac+aszgSlXT/u9kX6ENIkgA2SXmPHQHrS0I
 FOBOcXUb79Sv6xcVMA/zZJlg/roWBPy7bySAGM0uWRwkB5HE/grVwi/QjwmQQpinb4/EJmrVXEc
 e3KWygN2Vg74WRkM+B6RK+hKY0P6a9hqIrqVGEtV69SQc4SCiQjqv48V/soU93mPTUiP1XAzOso
 boglrrNy9T6foG0q3gHG/7AR4wLIS+8V5EOkMNT/pOqD9oVP/T+NLisfvJJxGwl+FOJ+DVGGCoU
 CkBPpbgqt5vycF/f6GUXksrSyymwGl8b/oM2jXu/A/1euQXqLzcyw5DFe9C0oJAYFD/9za3rUuH
 dRHbeUzWLCyPwRUk0tDmEcp9f/hczvgJ8HziJZ2soUWbh2DkjDH1S51uMGbrYIJhOLHFMZkTJlE
 xLk1TTSegXa8w1vSAw8mIl
X-Google-Smtp-Source: AGHT+IG1J0a47sLtwxFcaDSrout4RLN5hlQ7CnmTr7At+cHLbk6rWfBZ9Y0L1CqSK/VyWdUPHPzjcA==
X-Received: by 2002:a05:600c:1d12:b0:46e:3d41:5fe7 with SMTP id
 5b1f17b1804b1-46e612dcff2mr30889775e9.29.1759331192779; 
 Wed, 01 Oct 2025 08:06:32 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6199f17asm43113885e9.6.2025.10.01.08.06.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 12/22] target/hppa: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:17 +0200
Message-ID: <20251001150529.14122-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/int_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 191ae19404b..4dd281e6c95 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -160,6 +160,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
                 /* ??? An alternate fool-proof method would be to store the
                    instruction data into the unwind info.  That's probably
                    a bit too much in the way of extra storage required.  */
+                AddressSpace *as = cpu_get_address_space(cs, 0);
                 vaddr vaddr = env->iaoq_f & -4;
                 hwaddr paddr = vaddr;
 
@@ -176,7 +177,7 @@ void hppa_cpu_do_interrupt(CPUState *cs)
                         break;
                     }
                 }
-                env->cr[CR_IIR] = ldl_phys(cs->as, paddr);
+                env->cr[CR_IIR] = ldl_phys(as, paddr);
                 if (i == EXCP_ASSIST) {
                     /* stuff insn code into bits of FP exception register #1 */
                     env->fr[0] |= (env->cr[CR_IIR] & 0x03ffffff);
-- 
2.51.0


