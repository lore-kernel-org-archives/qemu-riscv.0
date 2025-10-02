Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767D2CAC5B8
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 11:29:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4HPr-0005cX-Oi; Thu, 02 Oct 2025 07:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v4HPq-0005bU-CV
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 07:24:06 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v4HPc-0005mN-Qv
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 07:24:03 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71d60504bf8so9729117b3.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1759404230; x=1760009030; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4oWJFRipckVauh9JoHiRLB1pN+6sexnxyOLUZqg8Jxc=;
 b=jV6Kxr+VCY0PS3xjKyPa4Cd40gkJxqdehkQJB0hU/T2v+YvDIzucmifQpFkKL6x062
 R8N+HG9RPrJnK5jEhqMZiIeZlbpzQ6fpF1Iq02kYRVzgVvIaYEaMS2TOFR2kwkyJsWwr
 /0Ffw48KSMb7yqW87SpSY+MArnOZSP4tm6QNjcfNYFXopmYMjDJEUXfVV6zxt6ILPsc5
 j/8y2CCCwDo6rt0JOsJSWJ3cgQTlBUV30CKTYYVHYdH/m8wJ3mvmeDnk7NTvXvdKtrY8
 k/WfqF4lrSGN8cujQcR6Cw3N/ZbbPvu/XSS1IdITFWD0cI/dKU4OeeNVBeWusrzRjhgO
 6FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759404230; x=1760009030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4oWJFRipckVauh9JoHiRLB1pN+6sexnxyOLUZqg8Jxc=;
 b=OitC4s44AwjClsND9h7RaIVd/IlFP/Q8UB55ta7wvGXPXF3HT9uk+RfdlPCe+BQ79N
 /2M0eFojDHnBKOUgfS6e/xVB3a9uQUtJe7UZPBxmrIAF/U8VuskzgRCE1mQi1A+2tZy2
 8lPOvA+996lfM5xN50bDhT28qqlwSbtd40FTOkS5/bZVt/aWXYo3SwbyGm4+ZE8VmXyq
 lXojVK4SeTHQdcU+9dN8CfE4jWnZy35uyu7juT5W1yH5b3TcI/MBxForjTa0dNR886Wt
 HlMUJRHPuD/zDqyTceFIRcLqRD2wq12bOLGXsGxs4BErsU+E0xPB7j2BLYhV02ZBuRY2
 TEZw==
X-Gm-Message-State: AOJu0Yx6cDza2Vb8p8+0K7vpKfWHRGgfeFExACDptsMDDWnpQ5Dvn9s8
 zYDA9t2Cesj52yhyQR7q4x9wK9m0WdX6jw50C6ox5/tcUSR8lknv/2W+xbD8kDzceQU=
X-Gm-Gg: ASbGncv61pSkBH+D6NqNZLuSGpMR2Rv9lIcaW+6jiX0snqN+rioBCta7fGESZm15kKC
 bbeJBQkqxkM8rLBhQbDYzfu2mrfvEENKmP9tYSInMjjLAWw+IXjKdiplQeQs1T6IrtqABWOMrBp
 poZwFo3wIV86bAhN5WDu2dl3Ya/lUFpT2FPhoZ9WR6PuKPTJw/k6i0JxBqCrGs32kNC5zcQ3DKm
 PGgGulmgbySDM6LdvgjDMIYjqKJO4NEQpPT4IkcxR681jfuVGwNhWd4iHsOM/mIT/6abF8UxK/H
 AdfTBH2XTgigHj9QwfMV/k8huaEfMLa5u0RudDKWlBM/4aXL3zJ5pPlwIA1OjtR3htU5pVz8veC
 n5X7ke9nX1OTRt+/hEVQ5WihOfrqwDIBnMwxNKHRQam0biTBLvn27x2/hUrjlvlxrnBuYDu7opO
 I=
X-Google-Smtp-Source: AGHT+IFYMMfH4Z/qvlCAX7wDGB6R1diFCB0s+OlXtJaJpwjbqmhGCfCDm1eQ9yyvPtscDSMQ1h4wuA==
X-Received: by 2002:a05:690c:f81:b0:77f:746e:ea0e with SMTP id
 00721157ae682-77f746ef67emr74247077b3.31.1759404230595; 
 Thu, 02 Oct 2025 04:23:50 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 ([2804:7f0:bcc0:b174:a9af:8146:7deb:fbf3])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77f81c068f6sm7331627b3.5.2025.10.02.04.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 04:23:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 03/17] hw/riscv/trace-encoder: add trace start/stop logic
Date: Thu,  2 Oct 2025 08:23:21 -0300
Message-ID: <20251002112335.2374517-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002112335.2374517-1-dbarboza@ventanamicro.com>
References: <20251002112335.2374517-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Starting/stopping a trace session will rely on two flags:

- trace_next_insn: this flag will be used to signal the translation that
  the encoder wants to know the PC of the current insn. The translation
  helper (to be added) will clear this flag after sending the current
  insn to the encoder;

- trace_running: shows that we're running a trace session and certain
  insns classes (traps, certain jumps and branches) need to report to
  the trace encoder.

These flags are controlled by the trTeInstTracing bit. This bit requires
other two bits to be set beforehand (ACTIVE and ENABLE). We'll revisit
these bits in the future as more features are implemented.

While we're at it, add hardwire bits to indicate which features we're
(not) implementing at this time.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/trace-encoder.c | 107 +++++++++++++++++++++++++++++++++++++++
 hw/riscv/trace-encoder.h |   4 ++
 2 files changed, 111 insertions(+)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 21bf650a6a..d45e45d17e 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -30,7 +30,11 @@ REG32(TR_TE_CONTROL, 0x0)
     FIELD(TR_TE_CONTROL, INST_TRACING, 2, 1)
     FIELD(TR_TE_CONTROL, EMPTY, 3, 1)
     FIELD(TR_TE_CONTROL, INST_MODE, 4, 3)
+    FIELD(TR_TE_CONTROL, CONTEXT, 9, 1)
+    FIELD(TR_TE_CONTROL, INST_STALL_ENA, 13, 1)
+    FIELD(TR_TE_CONTROL, INHIBIT_SRC, 15, 1)
     FIELD(TR_TE_CONTROL, INST_SYNC_MODE, 16, 2)
+    FIELD(TR_TE_CONTROL, INST_SYNC_MAX, 20, 4)
     FIELD(TR_TE_CONTROL, FORMAT, 24, 3)
     /* reserved bits */
     FIELD(TR_TE_CONTROL, RSVP1, 7, 2)
@@ -75,17 +79,116 @@ REG32(TR_TE_IMPL, 0x4)
 
 #define R_TR_TE_IMPL_RESET (BIT(0) | BIT(8))
 
+REG32(TR_TE_INST_FEATURES, 0x8)
+    FIELD(TR_TE_INST_FEATURES, NO_ADDR_DIFF, 0, 1)
+
+static uint64_t trencoder_te_ctrl_set_hardwire_vals(uint64_t input)
+{
+    input = FIELD_DP32(input, TR_TE_CONTROL, INST_MODE, 0x6);
+    input = FIELD_DP32(input, TR_TE_CONTROL, CONTEXT, 0);
+    input = FIELD_DP32(input, TR_TE_CONTROL, INST_STALL_ENA, 0);
+    input = FIELD_DP32(input, TR_TE_CONTROL, INHIBIT_SRC, 1);
+    input = FIELD_DP32(input, TR_TE_CONTROL, FORMAT, 0);
+
+    /* SYNC_MODE and SYNC_MAX will be revisited */
+    input = FIELD_DP32(input, TR_TE_CONTROL, INST_SYNC_MODE, 0);
+    input = FIELD_DP32(input, TR_TE_CONTROL, INST_SYNC_MAX, 0);
+
+    return input;
+}
+
+static uint64_t trencoder_te_ctrl_prew(RegisterInfo *reg, uint64_t val)
+{
+    TraceEncoder *te = TRACE_ENCODER(reg->opaque);
+    uint32_t trTeActive = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, ACTIVE);
+    uint32_t trTeInstTracing = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL,
+                                                INST_TRACING);
+    uint32_t temp;
+
+    val = trencoder_te_ctrl_set_hardwire_vals(val);
+
+    if (!trTeActive) {
+        /*
+         * 11.2 Reset and discovery, table 58, trTeControl = 0x1
+         * means "Release from reset and set all defaults." Do
+         * that only if trTeActive is 0.
+         */
+        if (val == 0x1) {
+            val = FIELD_DP32(val, TR_TE_CONTROL, EMPTY, 1);
+
+            return val;
+        }
+
+        /*
+         * 11.3 Enabling and Disabling hints that the device must
+         * be activated first (trTeActive = 1), then enabled.
+         * Do not enable the device if it's not active
+         * beforehand.
+         */
+        temp = FIELD_EX32(val, TR_TE_CONTROL, ENABLE);
+        if (temp) {
+            val = FIELD_DP32(val, TR_TE_CONTROL, ENABLE, 0);
+        }
+    }
+
+    /*
+     * Do not allow inst tracing to start if the device isn't
+     * already enabled. Do not allow enabling the devince and
+     * and enable tracing at the same time.
+     */
+    if (!te->enabled && trTeInstTracing) {
+        val = FIELD_DP32(val, TR_TE_CONTROL, INST_TRACING, 0);
+    }
+
+    return val;
+}
+
+static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
+{
+    TraceEncoder *te = TRACE_ENCODER(reg->opaque);
+    uint32_t trTeActive = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, ACTIVE);
+    uint32_t trTeEnable = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, ENABLE);
+    uint32_t trTeInstTracing = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL,
+                                                INST_TRACING);
+
+    if (!trTeActive) {
+        te->enabled = false;
+        te->trace_running = false;
+        te->trace_next_insn = false;
+        return;
+    }
+
+    if (te->enabled && !trTeEnable) {
+        /* TODO: this should cause a pending trace data flush. */
+    }
+
+    te->enabled = trTeEnable ? true : false;
+
+    if (!te->trace_running && trTeInstTracing) {
+        /* Starting trace. Ask the CPU for the first trace insn */
+        te->trace_next_insn = true;
+    }
+
+    te->trace_running = trTeInstTracing ? true : false;
+}
+
 static RegisterAccessInfo trencoder_regs_info[] = {
     {   .name = "TR_TE_CONTROL", .addr = A_TR_TE_CONTROL,
         .rsvd = R_TR_TE_CONTROL_RSVP_BITS,
         .reset = R_TR_TE_CONTROL_RESET,
         .ro = R_TR_TE_CONTROL_RO_BITS,
+        .pre_write = &trencoder_te_ctrl_prew,
+        .post_write = &trencoder_te_ctrl_postw,
     },
     {   .name = "TR_TE_IMPL", .addr = A_TR_TE_IMPL,
         .rsvd = R_TR_TE_IMPL_RSVP_BITS,
         .reset = R_TR_TE_IMPL_RESET,
         .ro = R_TR_TE_IMPL_RO_BITS,
     },
+    {   .name = "TR_TE_INST_FEATURES", .addr = A_TR_TE_INST_FEATURES,
+        .reset = R_TR_TE_INST_FEATURES_NO_ADDR_DIFF_MASK,
+        .ro = ~0,
+    },
 };
 
 static uint64_t trencoder_read(void *opaque, hwaddr addr, unsigned size)
@@ -132,6 +235,10 @@ static void trencoder_reset(DeviceState *dev)
     for (int i = 0; i < ARRAY_SIZE(te->regs_info); i++) {
         register_reset(&te->regs_info[i]);
     }
+
+    te->enabled = false;
+    te->trace_running = false;
+    te->trace_next_insn = false;
 }
 
 static void trencoder_realize(DeviceState *dev, Error **errp)
diff --git a/hw/riscv/trace-encoder.h b/hw/riscv/trace-encoder.h
index 71002f58a4..001d872514 100644
--- a/hw/riscv/trace-encoder.h
+++ b/hw/riscv/trace-encoder.h
@@ -33,6 +33,10 @@ struct TraceEncoder {
     hwaddr ramsink_ramlimit;
     uint32_t regs[TRACE_R_MAX];
     RegisterInfo regs_info[TRACE_R_MAX];
+
+    bool enabled;
+    bool trace_running;
+    bool trace_next_insn;
 };
 
 #define TYPE_TRACE_ENCODER "trace-encoder"
-- 
2.51.0


