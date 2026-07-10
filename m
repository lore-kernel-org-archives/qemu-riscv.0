Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4191BC44508
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIG3-0002ix-Mk; Fri, 10 Jul 2026 16:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFD-0001kk-3e
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:47 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEw-0000rP-KV
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-848882fdb18so343476b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716869; x=1784321669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oTQ42LKlvaXUmLWp84DyN7oebX42kH2GrCSdO42BkNs=;
 b=nPlyKx4uzAOKw2uirf/xZ9exHJsp3oN3YTEYePgVhZPpFLWok0T6nbuE5nkc2Y/m7Q
 6D+T+7cEnfIIJbwJAPvd90UDRCj54XlGvC4QSspveQM9k7d3cx0jVjijGx1Tg6hXTjSd
 2a0p+IrIvUa15CCbzxYxCXfDRJH60ktXGutwZuYpnnhGu8M8aWHLenBfSNX+XK1oIeDH
 uvY9sTff79AD5jJ2RCGBywSTeZ+P2ISPd5cWMISZFZnt8FM+p3FYMKau7LY8HFwI0tWh
 0Xttku3klGSHY2+/ErBEHQ4gv+HtLsiv7zD2HtK8yxZaKQvPVBic7E/Ba8Fv+DEzGcHf
 tuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716869; x=1784321669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oTQ42LKlvaXUmLWp84DyN7oebX42kH2GrCSdO42BkNs=;
 b=fG6B4B0nIoZ7J4YUgC8rveemVbpoH80dkP5XGXmEQtFPo15WgQmCOUFIOb3q7yD9n5
 6tXkTnZUlosPtP8E1s4RAQId27Wv2SImwzqsDjN5V357h2STUD3B3CwV5mPU4dGViAVL
 tR2yoPWx/+YdkmtxoSSxD82jCDZhnh8E3cm5ZjGm1s/6IrT7xpGWkv/BWWZp4kt2livz
 7zWduZqONo17RNGRlXj6aqZtC1n0GoLE3MEnnJP7Vi0uYy/HUZ5Zns+BFeZ7/Y1ng/qf
 YQQjPbd6rgey9R9ZasLs6DFUDXOdMEtEJqiA5OwwayJNQRpAAJdaA4Mob73Mn/tDKziZ
 pXDQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro4yAfHcdwGNDjHHhXE1aIbWSoR6zuW1AC1ccV6Up9en1RmytyLOtKzYP6v4AnnQHM7jUKiUueG3Cgt@nongnu.org
X-Gm-Message-State: AOJu0YyTN9IqDPlbLbgeE4lK1fTSzrrIAyHBWUCMEjB5IrHTbEklE3ef
 v3NwUGV5E3BlTWuDNnQwmS6YGP2r0X+kGHdIHKskxqVKV77p3CIwcXsfMZj7YwFEJvo=
X-Gm-Gg: AfdE7ckCLA5yoWC9XXtaUwPv1CF+J94sWwLJBySIj7HrbCRwDNVLB0C8bahqyVVI7Du
 8Hz3Ui/mIw5UEARmC0KbEdpjXbemLGex8Zv7cK5HJcGxQLHra79Mt4YX1wfiD4ocjqMn5SdbMX3
 y9h7fh2T5jushulBiKDHQV4FHMYyQXWvZ3qzyAo8nID8i/T4vdSxN8otI5G9+FMWila0Bz/jgAM
 C+zQyNa8bdiY8X6GrJX7wnEfVnM9jUx2z9O22ULYHfWymnA/Pjh4gKI1qAZ0k+XyYauaTXbE6a5
 5oFWfTdhnpEw3OenYMGFnmapUb/cQoEskEUxERSB1wq9J1x1IJViggzBoyytKryT67MlR2IvfkP
 bP8vGm/36EJ07X4oN4Ps59+cZCn+JhP4pQ16w41eHRv4w1F+bAR0xQusM5k17FZsACPw+ftJhh4
 B2ujbdyjI808kKpWWbOg==
X-Received: by 2002:a05:6a00:f89:b0:848:3e74:85eb with SMTP id
 d2e1a72fcca58-84889611e4fmr542804b3a.1.1783716868959; 
 Fri, 10 Jul 2026 13:54:28 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 24/51] exec/breakpoint: Add CPUWatchpoint.hitlast
Date: Fri, 10 Jul 2026 13:53:34 -0700
Message-ID: <20260710205401.836304-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Allow the debug_check_watchpoint callback to see the
entire range that triggered the query.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h | 1 +
 accel/tcg/watchpoint.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 60fda8dbb7..fe6dd02bdf 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -37,6 +37,7 @@ struct CPUBreakpoint {
 struct CPUWatchpoint {
     IntervalTreeNode itree;
     vaddr hitaddr;
+    vaddr hitlast;
     MemTxAttrs hitattrs;
     BreakpointFlags flags;
     unsigned id;
diff --git a/accel/tcg/watchpoint.c b/accel/tcg/watchpoint.c
index a7ce5fa9dd..edd1d5708b 100644
--- a/accel/tcg/watchpoint.c
+++ b/accel/tcg/watchpoint.c
@@ -89,6 +89,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 wp->flags |= flags << BP_HIT_SHIFT;
                 wp->hitaddr = MAX(addr, wp->itree.start);
+                wp->hitlast = MIN(last, wp->itree.last);
                 wp->hitattrs = attrs;
 
                 found_wp = wp;
@@ -109,6 +110,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 wp->flags |= flags << BP_HIT_SHIFT;
                 wp->hitaddr = MAX(addr, wp->itree.start);
+                wp->hitlast = MIN(last, wp->itree.last);
                 wp->hitattrs = attrs;
 
                 if (tcg_ops->debug_check_watchpoint
-- 
2.43.0


