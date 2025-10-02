Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E496CCA471
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 11:29:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4HQW-0005pR-FJ; Thu, 02 Oct 2025 07:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v4HQO-0005mO-N9
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 07:24:40 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v4HPu-0005rF-Ep
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 07:24:37 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-77636fb28f6so8894277b3.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1759404241; x=1760009041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1kLGIPbHbTDS8lbUiAICF5bBPGnw8+lNBq/HIivLSU=;
 b=cfeCC4Gbv8T1LzJJKAtvy1cWJzQTq23lWijKbtxlEFwGx4uNtDfyoGmtF2m0TRgtuO
 C0J4anWtvMc/DCW2/coqWZD1gsI4VESf2Km4ANp+3IStM4+nMJa2finC4KB1eKOF7NF5
 28UHXAX5EqE23oxfmwIpIGGz3r2lvlPKqnpJ/LWsZwfnRDV5UB4pGkUjA6wTGeNPeR9b
 oNzyAtfbQPoDQNh5CZBwEts+bPUxVTjj1BUaopSmQg1Hs08qKgPFKnsGBSUAw458YMxn
 FCQbx1TUKdWATEqXrr4rG+NW0I3loGR/h6zdc+5jIQBcvLubtjsZU0WY4kTFb9FAZ6Bv
 Et0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759404241; x=1760009041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1kLGIPbHbTDS8lbUiAICF5bBPGnw8+lNBq/HIivLSU=;
 b=YWjtXJjK8zbjne0HqtUlb7JkYfyzvnDEfLWdUgtUifTxntVlkDAxCa6E5WU3lMaLUi
 aJyHNMJYA7JpULAWcZK/Vms6fEb4wF6dxM1P0ykW50YCLZ6ulEnSqHqaIavj/14iYsq5
 s8DDU/QPn1SZ9Gobh2nQ5AUZ0MJBQJqzcGKwFLSzOrQho9sUuC/UIXSFemNrtLMpyih+
 kj1umsUlW5/0+02gZXXjT//hY4VzFUjeTJcYCsUkMF/5xhGkuxs3u7/Uo/yD5ax7ebt5
 Udg+AOnATiujtZMOpTpzaYOQqqG/rKkU91+HZPDpXjhMgvfbugwzhIk2bnxcjkNn2w42
 1Dvg==
X-Gm-Message-State: AOJu0YxBWxTv1j5ObzOs4hU4iLkVTD+lDNRxRRv8d0Mei7S/6BE2Maky
 tuOx2HlELsszFoxfcsuHgT0+Z9D8r16Bdv+6iy6yZAuEile4KDNXwTlu0v9vg9hIG9c=
X-Gm-Gg: ASbGncvBsoi1mQajd89RvwqSwqlOBSkwHU5NbRXGhe4y9PlBazqnOnR9Kr1NuuA65pu
 TbAy0Wf3FUD06ccyLCfYxQ9AbCK3EiJsZrMOhogZjK+j86MJna3hjqx3Auuzcx5ZMYySZWSnBvi
 I+ePxOsCkjzMCCglhsAtiS8NazK2YuZFXLbxTlsU9A9Yeq4F9sf4RrXlpSGZHQGB3/+DlBYLuxM
 PT8LQGATZERdYj79i7gpT50gPIq7VToTXfFGOMe5ZLJibaK8adYbxg8qI95UfLlEAaKw65FyVM9
 XIIXuYIiDlpPuCqW1QNoQdqI5b1GnuIOT8prYClQFsSfFh+7uLYRiIPo7nC9dKHeWrIv0DXa8Cw
 Xlk6onBzDviX8fqHYYgh/6C96IsBYkZgzNavhRb08GFfWjVrINLOWOjFmJEcngz6ZLjMOuhMGM9
 U=
X-Google-Smtp-Source: AGHT+IFI34wGdIDLRJPwbhbDIuAqXCIUr5sYXxtXyXbeg04vfN0TS6MsbqQRdGpkKXB2kmk+fyHOug==
X-Received: by 2002:a05:690c:6f86:b0:720:58fd:6433 with SMTP id
 00721157ae682-77f6f39e242mr100515007b3.35.1759404241295; 
 Thu, 02 Oct 2025 04:24:01 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 ([2804:7f0:bcc0:b174:a9af:8146:7deb:fbf3])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77f81c068f6sm7331627b3.5.2025.10.02.04.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 04:24:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 08/17] hw/riscv/trace-encoder: write e-trace packets to RAM
 sink
Date: Thu,  2 Oct 2025 08:23:26 -0300
Message-ID: <20251002112335.2374517-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002112335.2374517-1-dbarboza@ventanamicro.com>
References: <20251002112335.2374517-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We have the needed pieces to make the trace encoder write messages (or
packets, in e-trace lingo) in its associated RAM sink.

We'll start by writing a sync message that we're already able to fetch
from the TCG instruction train. The trace encoder must be able to
read/write TR_RAM_WP RAM sink regs to know where it is supposed to write
packets, thus a handful of helpers are added to manipulate both the ram
sink SMEM memory and relevant registers.

The bulk of the work is done in trencoder_send_message_smem() where the
trace encoder writes each trace packet. The 'wrap' mechanism is
implemented to keep writing the RAM sink memory even after a SMEM
workflow.  If we can't fit a full packet in the end of the ring buffer
we're filling with NULLs and writing a new packet back to ramstart.

In an overflow event we'll wrap the TR_RAM_WP_LOW WRAP bit and userspace
is supposed to clear it after the wrapping was handled (i.e. userspace
read the whole ring buffer back to the start).

We're also allowing userspace to freely set ramsink and ramstart before
the trace session begins, allowing for more freedom w.r.t where the SMEM
will be written by the encoder. Note that this also means that userspace
is responsible for setting at least TR_RAM_WP_LOW and TR_RAM_WP_HIGH
before starting a trace session.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/trace-encoder.c | 121 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 9701ce43cf..16c9475d46 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -20,6 +20,34 @@
 #include "system/device_tree.h"
 #include "hw/register.h"
 #include "cpu.h"
+#include "hw/riscv/trace-ram-sink.h"
+#include "rv-trace-messages.h"
+
+/*
+ * Size of header + payload since we're not sending
+ * srcID and timestamp.
+ */
+#define TRACE_MSG_MAX_SIZE 32
+
+static TracePrivLevel trencoder_get_curr_priv_level(TraceEncoder *te)
+{
+    CPURISCVState *env = &te->cpu->env;
+
+    switch (env->priv) {
+    case PRV_U:
+        return env->virt_enabled ? VU : U;
+    case PRV_S:
+        return env->virt_enabled ? VS : S_HS;
+    case PRV_M:
+        return M;
+    }
+
+    /*
+     * Return a reserved value to signal an error.
+     * TODO: handle Debug (D).
+     */
+    return RESERVED;
+}
 
 /*
  * trTeControl register fields
@@ -82,6 +110,41 @@ REG32(TR_TE_IMPL, 0x4)
 REG32(TR_TE_INST_FEATURES, 0x8)
     FIELD(TR_TE_INST_FEATURES, NO_ADDR_DIFF, 0, 1)
 
+static uint32_t trencoder_read_reg(TraceEncoder *te, uint32_t reg_addr)
+{
+    hwaddr addr = te->dest_baseaddr + reg_addr;
+    uint32_t val;
+
+    cpu_physical_memory_read(addr, &val, sizeof(uint32_t));
+    return val;
+}
+
+static void trencoder_write_reg(TraceEncoder *te, uint32_t reg_addr,
+                                uint32_t val)
+{
+    hwaddr addr = te->dest_baseaddr + reg_addr;
+
+    cpu_physical_memory_write(addr, &val, sizeof(uint32_t));
+}
+
+static hwaddr trencoder_read_ramsink_writep(TraceEncoder *te)
+{
+    hwaddr ret = trencoder_read_reg(te, A_TR_RAM_WP_HIGH);
+    ret <<= 32;
+    ret += trencoder_read_reg(te, A_TR_RAM_WP_LOW);
+
+    return ret;
+}
+
+static hwaddr trencoder_read_ramsink_ramlimit(TraceEncoder *te)
+{
+    hwaddr ret = trencoder_read_reg(te, A_TR_RAM_LIMIT_HIGH);
+    ret <<= 32;
+    ret += trencoder_read_reg(te, A_TR_RAM_LIMIT_LOW);
+
+    return ret;
+}
+
 static uint64_t trencoder_te_ctrl_set_hardwire_vals(uint64_t input)
 {
     input = FIELD_DP32(input, TR_TE_CONTROL, INST_MODE, 0x6);
@@ -171,6 +234,9 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
     if (!te->trace_running && trTeInstTracing) {
         /* Starting trace. Ask the CPU for the first trace insn */
         te->trace_next_insn = true;
+
+        te->ramsink_ramstart = trencoder_read_ramsink_writep(te);
+        te->ramsink_ramlimit = trencoder_read_ramsink_ramlimit(te);
     }
 
     te->trace_running = trTeInstTracing ? true : false;
@@ -274,12 +340,67 @@ static void trencoder_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void trencoder_update_ramsink_writep(TraceEncoder *te,
+                                            hwaddr wp_val,
+                                            bool wrapped)
+{
+    uint32_t wp_low = trencoder_read_reg(te, A_TR_RAM_WP_LOW);
+
+    wp_low = FIELD_DP32(wp_low, TR_RAM_WP_LOW, ADDR,
+                        extract64(wp_val, 2, 30));
+
+    if (wrapped) {
+        wp_low = FIELD_DP32(wp_low, TR_RAM_WP_LOW, WRAP, 1);
+    }
+
+    trencoder_write_reg(te, A_TR_RAM_WP_LOW, wp_low);
+    trencoder_write_reg(te, A_TR_RAM_WP_HIGH, extract64(wp_val, 32, 32));
+}
+
+static void trencoder_send_message_smem(TraceEncoder *trencoder,
+                                        uint8_t *msg, uint8_t msg_size)
+{
+    hwaddr dest = trencoder_read_ramsink_writep(trencoder);
+    bool wrapped = false;
+
+    msg_size = QEMU_ALIGN_UP(msg_size, 4);
+
+    /* clear trRamWrap before writing to SMEM */
+    dest = FIELD_DP64(dest, TR_RAM_WP_LOW, WRAP, 0);
+
+    /*
+     * Fill with null bytes if we can't fit the packet in
+     * ramlimit, set wrap and write the packet in ramstart.
+     */
+    if (dest + msg_size > trencoder->ramsink_ramlimit) {
+        g_autofree uint8_t *null_packet = NULL;
+        uint8_t null_size = trencoder->ramsink_ramlimit - dest;
+
+        null_packet = g_malloc0(null_size);
+        cpu_physical_memory_write(dest, null_packet, null_size);
+
+        dest = trencoder->ramsink_ramstart;
+        wrapped = true;
+    }
+
+    cpu_physical_memory_write(dest, msg, msg_size);
+    dest += msg_size;
+
+    trencoder_update_ramsink_writep(trencoder, dest, wrapped);
+}
+
 void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t pc)
 {
     TraceEncoder *trencoder = TRACE_ENCODER(trencoder_obj);
+    TracePrivLevel priv = trencoder_get_curr_priv_level(trencoder);
+    g_autofree uint8_t *msg = g_malloc0(TRACE_MSG_MAX_SIZE);
+    uint8_t msg_size;
 
     trencoder->first_pc = pc;
     trace_trencoder_first_trace_insn(pc);
+    msg_size = rv_etrace_gen_encoded_sync_msg(msg, pc, priv);
+
+    trencoder_send_message_smem(trencoder, msg, msg_size);
 }
 
 static const Property trencoder_props[] = {
-- 
2.51.0


