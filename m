Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0907C43602
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:49:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdx-0008Vy-8T; Sun, 05 Jul 2026 00:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcZ-0005Lh-15
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:23 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcC-0004Wa-O1
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:22 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c9e30214d8fso1289180a12.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226279; x=1783831079; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AwlXkf93TRyaeETrOdNkI4UVA8dItVhEvL4JieLFr/A=;
 b=W/ykrwiGXni3xxFNh35T8d89iIZHIVSz0F2bzQChGkhmpTaE2ipQBqRbi8/YKgV904
 hZft/glp3B7EHRCNyK2u4B/wO9V7E5TiC9EjTpVXLKLYM+pLI4Wm5TRdYN8Nzc7nIC5g
 /3wfJXlaarJih6mezMARmoB+Z2u6rF55lRwpRAZj2Z5FedIYW93gsKTX5RT+tMejVJ8K
 ANKbb82X0gkj0xwEAwUQ434e1imrARse1MDgYJMe3w4Kj0UtftoZeUSsdFLrV++qpQqf
 Kk1SLAr3xHsm9utMWNf0R4pp6sQ1uPJJstiQJIdABvAcNbsbGODDV0/lTjQzwunBrGjT
 2EAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226279; x=1783831079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AwlXkf93TRyaeETrOdNkI4UVA8dItVhEvL4JieLFr/A=;
 b=QPOTg4yNAT/pv/PkkYYRnUO1uojIK7adLB4dTbtrT5TXXS/GscCd9wezN0wlqZcji7
 mDNAkjPtJLWOb8OsQq91kHA1Cfsuosm+UdKxZrVCyQSYH6+YLTs6d3BjUMV431VvFHfF
 M0EjvbhBGJFwtNe2WnMAKew8SXFAV0zIaQdhLW7CcjfeTgsl24VB3V1L/qjPqtUAu17T
 4KHlnITDBWOBSc0+KMkrlSpWC2Cv5uygzRZwwlK8kLhIR/5xY+Sbc47a9SObt+EiLrTV
 Pn7KXSzTxS3fX4usS+cRUBP7JPn9sVv7OlM2UvOoOWKZPpK352DEggUy+oZ5zOo85UkF
 Zzyw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+2JMzrr6uF2zdm73AJ4ofUNQdjx8X6oBtjnBKNNTiNfAtkJWd9vMD7yzCJxq+0O7D3Hi9K/Jg329z@nongnu.org
X-Gm-Message-State: AOJu0YwSFzL0pattFjqk6kv8JgYXphD91QSAgyupiY1FZ2Mp3b69d6jW
 1x+gknwVX+hGb9MnAMwsB7On2ZOkrEgt78/ktW6TUA6+NRBUq9iomfcYdYs/zjj/47SSfU/A8XE
 1hxNi
X-Gm-Gg: AfdE7cn0HXU5pQSG0tXWhBT622y36MwitPVTWS1frJ1PLXE7f59Rt8ybGu/IVt/vZuR
 N9ih68fqp7UrNYMzI0Wc94u8b4cBwcr0tufNi5R935eEuPW4fm9QMT7rKiOUKGiQsMXMvEkT22r
 ZkStFbxIMR4BntRvqw0BkCk/DWyAhud9DVaiKMluKWNfhVF/HmKYocsL5JDsv6sA7Q+IdjtA3eR
 IHRDxtk80JBLSaFiCHawNPAu4wjbYcqC1Y7dmMzcf5AWYLDLZo08OXtq6MqdsTfA7f0kozB90jf
 9JkIXdrjdZZ9sfZn/f6UJSznQScdVr/I8+KhoXgLuArv3kp/4S5LKV/9dsT6fuX8K9+LDlnELJC
 hMyW/Vb/xW8q3FtAoW+1IlU27VBkyzHATFp/97OhuJp3HH5BLp/vs20WAeEktjIFu6Z7iTlPCVc
 7KCLimPz4HQDU74QrVM2Of6qSoxRQrnnW00jjFaIxaEsqga0U=
X-Received: by 2002:a17:903:3c45:b0:2ca:64d3:f0da with SMTP id
 d9443c01a7336-2cbb9ee00cdmr54702325ad.32.1783226279046; 
 Sat, 04 Jul 2026 21:37:59 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 38/46] target/s390x: Use CPUBreakpoint arg in
 breakpoint_handler
Date: Sat,  4 Jul 2026 21:37:17 -0700
Message-ID: <20260705043725.1373137-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

We no longer need to test for BP_CPU, or clear watchpoint_hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/debug.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/debug.c b/target/s390x/tcg/debug.c
index 58d9cc6e79..ef0d953e01 100644
--- a/target/s390x/tcg/debug.c
+++ b/target/s390x/tcg/debug.c
@@ -52,9 +52,9 @@ void s390_cpu_recompute_watchpoints(CPUState *cs)
 void s390x_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
 {
     CPUS390XState *env = cpu_env(cs);
-    CPUBreakpoint *wp_hit = cs->watchpoint_hit;
 
-    if (wp_hit && wp_hit->flags & BP_CPU) {
+    if (hit->flags & BP_MEM_ACCESS) {
+        /* watchpoint */
         /*
          * FIXME: When the storage-alteration-space control bit is set,
          * the exception should only be triggered if the memory access
@@ -62,7 +62,6 @@ void s390x_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
          * bit set.  We have no way to detect that with the current
          * watchpoint code.
          */
-        cs->watchpoint_hit = NULL;
 
         env->per_address = env->psw.addr;
         env->per_perc_atmid |= PER_CODE_EVENT_STORE | get_per_atmid(env);
-- 
2.43.0


