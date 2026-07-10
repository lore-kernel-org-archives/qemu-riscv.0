Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C6DC44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:56:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIF2-0001cE-UG; Fri, 10 Jul 2026 16:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF0-0001Xr-BL
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEo-0000kC-6a
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:34 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-845c92bc464so1259628b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716860; x=1784321660; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9FVe4IDYzuWlBAdVKn89Oel+X5gqBqY4ENpHT0MrX5Q=;
 b=rszTJ0XCFgp4EQ2zXVI82oN5tZNn9S4HW3Xonoqt1nMeIjecdfk2c+b7b3nvgUB7oS
 TCGeN6FBnq5tZPF3M5zVNgbifvo3hKP/ETJUvT2ih5bHYViFeBSpQqDcBuT6mCcubVQx
 igVSS9EL7R2hYw4E3vEZICD69QZfLRS4c3vUElI3JVsRtCBSLk4ASbUFbYoa53jKrQSA
 J5ToyHuv/tN07Ah8i+2MAyjhKERNFdMKHpKZmJIpjH0RtMgulS1tVGSJ0hgum3ODiM34
 BcuAjIS/gxRbc8tu6UnO8ItNFtkGB1UdetvIt+sughG3CNJUPFLrr1mfPA7c70CYJqME
 WtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716860; x=1784321660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9FVe4IDYzuWlBAdVKn89Oel+X5gqBqY4ENpHT0MrX5Q=;
 b=eD3z2SY+q2oXqWRNN1Ulm/xeS4sh0+SVXCNX5EA4SFK0y90RWITLXoNueb/II8+k/2
 8Wefzgt7W/q8KMWSpOJg/GCV0wYqcSemQ/DuGXTeMk8q8PFTqlYO88TngBaYghyOeM7N
 eZz3Q5smrpxWxZjoa0qDNhQNTLu7I1izoAym6nGslBY8MRy19YEKPQNXf76jv82elDe0
 W4HxI/iDXFyadIjCT0njruQWJ0w+rHbVvEvjDH9y1puxCUCdElsWAz209ERGijESz4jV
 k0DMKflJWew1++34t/cJzNkfsvAimkhy3r3txuJK+FMwZwWUCd9pMlug8nO1/jJBkLB2
 s8Jw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro+T5RpZRaKDVZ8eqtCLHw1H44wX3CxaoWawSYICNqNyWJmmWmz6UQ8P813INuzwkIQI23b5Z5qnW69@nongnu.org
X-Gm-Message-State: AOJu0YxuO92nJ52LkJWpTeSQpjLBZGr0oIYWr9ei2V9i/ZxWZ3Cbu4OZ
 urbNEhRqgv+yFpTV3sJrKXmzC/YM4FHomD/IXMw3DA7MsFzcBT3HEAd7YlPot+FcYOo=
X-Gm-Gg: AfdE7clfqXNs1hf7CPqsexWvnIWS0zR4EMAx3b3JNn/i4Q+9I0BFxgMkjyBksC8DE/f
 /+yYHYI4ys2zbmPg1cGzsKmO9kHK8CKBNJubIAg6SKBEeb8rkQO5m1ZhetGX4mepv8y4+WJs4ky
 4O4cer5S5DdNUrA1kq3ciM8ETf9FeuNiggmntTnh3Hzt6yIsML7UQAEd9ujWrx6DBFbgA9Se1XT
 78MevlBIzECfiQ1rt8ToJs5vX/hxCAPzxYX+e/NkC+6wW5rTmahg/KTkPktzlZw6xXwDhHLm/4p
 h5menwZZ0Lz/Y6din6DH32FYPNqGN8z7JY1uIQ5XBOkt3MIRWF8RsETiytCXWsUu6l7WaaleCWt
 bNEdzBj2Pq6OacCiqKVZigq1KNqVH/xObqtyQApRLLg7KIBbRYOMy2aQkCYYezJPB+5mldE0jB2
 16+OO3MIshuJO6c57Px4o0prtpHAVl
X-Received: by 2002:a05:6a00:3388:b0:845:d274:c021 with SMTP id
 d2e1a72fcca58-8488970be58mr554168b3a.58.1783716860358; 
 Fri, 10 Jul 2026 13:54:20 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 16/51] target/arm: Make check_watchpoint_in_range static
Date: Fri, 10 Jul 2026 13:53:26 -0700
Message-ID: <20260710205401.836304-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

This function is not used outside hyp_gdbstub.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h   | 1 -
 target/arm/hyp_gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 49ec97bd1c..95f32ad308 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1975,7 +1975,6 @@ bool find_hw_breakpoint(CPUState *cpu, vaddr pc);
 int insert_hw_breakpoint(vaddr pc);
 int delete_hw_breakpoint(vaddr pc);
 
-bool check_watchpoint_in_range(int i, vaddr addr);
 CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr);
 int insert_gdbstub_hw_watchpoint(vaddr addr, vaddr len, GdbBreakpointType type);
 int delete_gdbstub_hw_watchpoint(vaddr addr, vaddr len, GdbBreakpointType type);
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index dda6946dda..c91efa7495 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -182,7 +182,7 @@ int insert_gdbstub_hw_watchpoint(vaddr addr, vaddr len, GdbBreakpointType type)
     return 0;
 }
 
-bool check_watchpoint_in_range(int i, vaddr addr)
+static bool check_watchpoint_in_range(int i, vaddr addr)
 {
     HWWatchpoint *wp = get_hw_wp(i);
     uint64_t addr_top, addr_bottom = wp->wvr;
-- 
2.43.0


