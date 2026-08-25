Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB35C61DBE
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 15:04:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyshJ-0004ET-5A; Tue, 25 Aug 2026 11:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wyshI-0004Dm-0z
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 11:04:20 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wyshF-0004mg-TX
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 11:04:19 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5b2b92065ffso4696629e87.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787670256; x=1788275056; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6hFzhnXZVfwVXKavQF9nMPh7v7vdOVoePn53autvXt4=;
 b=c4fas/I8lscWCSNCByWwFzYICSEIqkqO8atK4A0gcmvWYTTlfagmB25fEckA+DhO0P
 aMqHIcDLigQ6Dw5GSSPaxjyD0ECE/gEPCtgVAFRGIu3qceLlLbgy4JZypYWJxRnbqE0Y
 ZYxxfKKm2ibhD5hgAllMeRlDC1N1IS2e143y4sQJ75uE+1LNxTMzaXq4RHZseC0WYpZj
 YMvOKa2+WoWvCjhzPeD6WnyovNtGQ2pgYLey7l9Rx8y86YbB92Y3UGoIe28yevbmoIJg
 xSCGKW9ADBRbnXUyRgKdJHfGy5CBQafyLYF1zhaBungIsI53IHJqAPYnbCMxB0gU9Utg
 F2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787670256; x=1788275056;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6hFzhnXZVfwVXKavQF9nMPh7v7vdOVoePn53autvXt4=;
 b=UIzhjtzHD0tKqzdNe3PKr8hUyMx8kY0KRtap53nUSgRjM7e9M1yW9h9m8Upt9zBgBN
 eLq1RqA3smi7ysNRCNdKJyaAxotEIffCnYKAlLtai1GdK//R0YccCQPN/JAy2SeyP6Wl
 WP9Mz8PctOs7Q06tR/wVzedaZ+vuI/H5SCUf/HBb+TaOnil/nMDTCLosGVc9HgG+DmOC
 w9IxPNedyPWip0mvlG+7S3T/UdV9w/CCObOICoEMPkc4vltzgabawyj0pQ6PiNDs5H4t
 5v5B7IaH9w//0TSbEhp43bUnJgkSmMZdgSF1/FEfyMPK8M6ZXjQhiOYkAHcKGkzo5riu
 q7NQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpEsZNDxh2gBbV+859JsVIxB+SsoOOJujL6KIfD4fNVHvszzS/uDlTiJ1Dt9VoDQ5kavE7QBmshlI2E@nongnu.org
X-Gm-Message-State: AFuF++nEZd7TDKkrMyqh4Q5poAph9FdQoLo64kj5VZaWu3S5XDg4vSCl
 a+udcvKFuXZQaIINDRW1XReTZbh8908hcuxKKILY/AxWndcLUpwKiry9
X-Gm-Gg: AR+sD13nk9DpS6qYqiCdXVj6YK7tFIiyWbkb1cEYUuhz+KTtTKTEu7hAhf15dfNVl5Y
 LClVg80np4qzHh91ZlRvviCshJq56VpXj6EIiRjMdFRbosDg72kla1nGZCrVAg8lbJ8xNmQa1Nh
 /kdEpAsUxky9FX5mDwKSps9gN/YfhR2AM6nC6+S/fqHcN4iS6zK/ieYYRCjFHmoFgdz+R/blIUi
 usS1/Cms5kTy4axWHf/GLzrTOgcuZTL6999/b/yELiOgAOnjBN/oL787kFBj5Ymrv09L1LCwAdX
 cxBEt6iTObOcfya9JIXar5fToo7M7IClmuN5hhwqelV5xb423nkXE1xXWXq9v6Hy0/gKJxqPCB6
 N2cKNqwGHpno1ib5O73nV3idJuKV3NtyeF4LQPmmxtSQCarfpV0IJ3tyNAD3l0+POMczBnhoy8U
 VCy0TgeUU3dXYQZfK3tCyG58F3XFOlVPRYsrGnDl3BnnPtc6SldXvqrr9gFBaWKl2zQrO/t6Klp
 dCBBLB3yQWglUYL6B5Q5QToY6Va8B+K/QBmvA==
X-Received: by 2002:a05:6512:3e17:b0:5b2:a6e6:8d83 with SMTP id
 2adb3069b0e04-5b49cdce5acmr2065214e87.23.1787670255751; 
 Tue, 25 Aug 2026 08:04:15 -0700 (PDT)
Received: from localhost (broadband-90-154-73-22.ip.moscow.rt.ru.
 [90.154.73.22]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b4a41af742sm7287e87.58.2026.08.25.08.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 08:04:14 -0700 (PDT)
From: Konstantin Semichastnov <antikostya2@gmail.com>
Date: Tue, 25 Aug 2026 17:31:23 +0300
Subject: [PATCH 13/13] hw/riscv/trace-encoder: refactor register accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-upstream-ntrace_core-v1-13-52337055bab2@gmail.com>
References: <20260825-upstream-ntrace_core-v1-0-52337055bab2@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-0-52337055bab2@gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexei Filippov <halip0503@gmail.com>, 
 Konstantin Semichastnov <antikostya2@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7145; i=antikostya2@gmail.com; 
 h=from:subject:message-id;
 bh=VPZj6qaybPqAxN2q+RWa/rzihxKphwFDuAjBCpW3N4g=; 
 b=owEBbQKS/ZANAwAKAUiKpW6lUN52AcsmYgBqjacuLTYbIdJTx6pHRQiNYcvPGA/zWhVRT/1tV
 5GuMMYYf+CJAjMEAAEKAB0WIQRMBWLx2o+linEPEBhIiqVupVDedgUCao2nLgAKCRBIiqVupVDe
 dnttEACQwVvAawZyb7wzL/aZKMkYQ0raQAeAM2VnkB5HwBFuKhZrsWfDPfmLSAJJmLZyJ69Gp+x
 lDMfoKfsvbflh5hUt55b1B/gfUhn3Ic8PGXlTCF83mr5+AJ9JhZLUZ+Emy/yHkoUDbDU1ZMjNem
 xW8xaLpqL6SSc6SK3C0v5GE5pGIOTpgXqAaL8PWqxlmczna5TtJIpKFQ3RqzqbNgcjyuOIwr58Q
 DY8pF5WDyAFm1esETdJmY2K0DMkbZAtknS0cSGUg2wO3YK85bHSNuV4I0+tHTxihlceyc4dWL5s
 2QNTCgcD3oC+ntV++StyxSrU8WErR4Pw8HHeGnUf7KR+UlroyTWu2dSHQnmt9xux2Hmd3Jr5YZc
 Dtm+jge83rfVBxB2UN1KblLn9fyGo4JxlLnPXQjzCn12A1pnKFfuXibPNQUvgxAYmLN49h+ZtHo
 Wc9CRI7Kglcl8zNCnvnPrfmwo89bzT8HyI4Cuil6hSWUdPFrYC1/QzgpJdvUETVaSpE83O3INDQ
 djdsbXKiM5uIxMc01Umg4igBw3nnnQK01zO04g1DbYMD+goS15A3Hv+n3XqIhnLbdZfm/mc8Kcv
 VA1wS8DuniDoN6lAEz5Odsf7FZTHUL4xtC0uUPeVA8f+ABBIT5zIIYkz7doCikZVX6tmkUJ5PMe
 bQzStYKAxF4xJdA==
X-Developer-Key: i=antikostya2@gmail.com; a=openpgp;
 fpr=4C0562F1DA8FA58A710F1018488AA56EA550DE76
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=antikostya2@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Refactor pre-write and post-write trace register accesses.
Remove unused `enabled` flag.

Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
---
 hw/riscv/trace-encoder.c | 79 +++++++++++++++++++++---------------------------
 hw/riscv/trace-encoder.h |  9 +++---
 2 files changed, 39 insertions(+), 49 deletions(-)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 58ed4b2646..7fd5c3a578 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -161,6 +161,7 @@ static hwaddr trencoder_read_ramsink_ramlimit(TraceEncoder *te)
 
 static uint64_t trencoder_te_ctrl_set_hardwire_vals(uint64_t input)
 {
+    input = FIELD_DP32(input, TR_TE_CONTROL, EMPTY, 1);
     input = FIELD_DP32(input, TR_TE_CONTROL, INST_MODE, 0x6);
     input = FIELD_DP32(input, TR_TE_CONTROL, CONTEXT, 0);
     input = FIELD_DP32(input, TR_TE_CONTROL, INST_TRIG_ENABLE, 0);
@@ -179,6 +180,7 @@ static uint64_t trencoder_te_ctrl_prew(RegisterInfo *reg, uint64_t val)
 {
     TraceEncoder *te = TRACE_ENCODER(reg->opaque);
     uint32_t trTeActive = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, ACTIVE);
+    uint32_t trTeEnable = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, ENABLE);
     uint32_t trTeInstTracing = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL,
                                                 INST_TRACING);
     uint32_t trTeFormat = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, FORMAT);
@@ -187,40 +189,30 @@ static uint64_t trencoder_te_ctrl_prew(RegisterInfo *reg, uint64_t val)
     val = trencoder_te_ctrl_set_hardwire_vals(val);
 
     if (!trTeActive) {
-        /*
-         * 11.2 Reset and discovery, table 58, trTeControl = 0x1
-         * means "Release from reset and set all defaults." Do
-         * that only if trTeActive is 0.
-         */
-        if (val == 0x1) {
-            val = FIELD_DP32(val, TR_TE_CONTROL, EMPTY, 1);
-
-            return val;
-        }
-
         /*
          * 11.3 Enabling and Disabling hints that the device must
          * be activated first (trTeActive = 1), then enabled.
          * Do not enable the device if it's not active
          * beforehand.
          */
-        temp = FIELD_EX32(val, TR_TE_CONTROL, ENABLE);
-        if (temp) {
+        if (FIELD_EX32(val, TR_TE_CONTROL, ENABLE)) {
             val = FIELD_DP32(val, TR_TE_CONTROL, ENABLE, 0);
         }
     }
 
-    /*
-     * Do not allow inst tracing to start if the device isn't
-     * already enabled. Do not allow enabling the devince and
-     * and enable tracing at the same time.
-     */
-    if (!te->enabled && trTeInstTracing) {
-        val = FIELD_DP32(val, TR_TE_CONTROL, INST_TRACING, 0);
+    if (FIELD_EX32(val, TR_TE_CONTROL, INST_TRACING)) {
+        /*
+         * Do not allow inst tracing to start if the device isn't
+         * already enabled. Do not allow enabling the device and
+         * and enable tracing at the same time.
+         */
+        if (!trTeEnable) {
+            val = FIELD_DP32(val, TR_TE_CONTROL, INST_TRACING, 0);
+        }
     }
 
     temp = FIELD_EX32(val, TR_TE_CONTROL, FORMAT);
-    if (te->trace_running) {
+    if (trTeInstTracing) {
         /* Do not allow to change tracing format while tracing is enabled. */
         val = FIELD_DP32(val, TR_TE_CONTROL, FORMAT, trTeFormat);
     } else if (temp != TR_TE_CONTROL_FORMAT_ETRACE &&
@@ -232,6 +224,15 @@ static uint64_t trencoder_te_ctrl_prew(RegisterInfo *reg, uint64_t val)
         val = FIELD_DP32(val, TR_TE_CONTROL, FORMAT, trTeFormat);
     }
 
+    if (!FIELD_EX32(val, TR_TE_CONTROL, ACTIVE)) {
+        /* Disable trace encoder if it becoming not active */
+        val = FIELD_DP32(val, TR_TE_CONTROL, ENABLE, 0);
+    }
+    if (!FIELD_EX32(val, TR_TE_CONTROL, ENABLE)) {
+        /* Disable tracing if trace incoder being disabled */
+        val = FIELD_DP32(val, TR_TE_CONTROL, INST_TRACING, 0);
+    }
+
     return val;
 }
 
@@ -263,35 +264,27 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
     RISCVCPU *cpu = te->cpu;
     CPURISCVState *env = &cpu->env;
 
+    bool trace_disabled = !trTeActive || !trTeEnable || !trTeInstTracing;
 
-    if (te->ntrace && te->enabled) {
-        if (!trTeActive || !trTeEnable || !trTeInstTracing) {
-            uint32_t inst_len = get_inst_len_at(env->pc);
+    if (te->trace_running && trace_disabled) {
+        /* Stopping trace. */
+        /* TODO: this should cause a pending trace data flush. */
+        te->trace_next_insn = false;
 
+        if (te->ntrace) {
+            uint32_t inst_len = get_inst_len_at(env->pc);
             trencoder_send_prog_trace_correlation(OBJECT(te), env->pc, inst_len,
                                                   CORRELATION_TRACE_DISABLED);
         }
     }
 
-    if (!trTeActive) {
-        te->enabled = false;
-        te->trace_running = false;
-        te->trace_next_insn = false;
-
-        env->trace_running = false;
-        return;
-    }
-
-    if (te->enabled && !trTeEnable) {
-        /* TODO: this should cause a pending trace data flush. */
-    }
-
-    te->enabled = trTeEnable ? true : false;
-
     te->ntrace = (trTeFormat == TR_TE_CONTROL_FORMAT_NTRACE);
 
     if (!te->trace_running && trTeInstTracing) {
         /* Starting trace. Ask the CPU for the first trace insn */
+        te->ramsink_ramstart = trencoder_read_ramsink_writep(te);
+        te->ramsink_ramlimit = trencoder_read_ramsink_ramlimit(te);
+
         if (te->ntrace) {
             /*
              * N-Trace require to trace from very first instruction,
@@ -305,13 +298,10 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
         } else {
             te->trace_next_insn = true;
         }
-
-        te->ramsink_ramstart = trencoder_read_ramsink_writep(te);
-        te->ramsink_ramlimit = trencoder_read_ramsink_ramlimit(te);
     }
 
-    te->trace_running = trTeInstTracing ? true : false;
-    env->trace_running = te->trace_running;
+    te->trace_running = trTeInstTracing;
+    env->trace_running = trTeInstTracing;
 }
 
 static RegisterAccessInfo trencoder_regs_info[] = {
@@ -380,7 +370,6 @@ static void trencoder_reset(DeviceState *dev)
         register_reset(&te->regs_info[i]);
     }
 
-    te->enabled = false;
     te->trace_running = false;
     te->trace_next_insn = false;
     te->ntrace = false;
diff --git a/hw/riscv/trace-encoder.h b/hw/riscv/trace-encoder.h
index 55d53c2582..b3cdbf9374 100644
--- a/hw/riscv/trace-encoder.h
+++ b/hw/riscv/trace-encoder.h
@@ -39,13 +39,14 @@ struct TraceEncoder {
     uint32_t regs[TRACE_R_MAX];
     RegisterInfo regs_info[TRACE_R_MAX];
 
-    bool updiscon_pending;
-
-    bool enabled;
+    bool ntrace;
     bool trace_running;
+
+    /* etrace specific */
+    bool updiscon_pending;
     bool trace_next_insn;
 
-    bool ntrace;
+    /* ntrace specific */
     uint64_t last_addr_reported;
     uint64_t last_icnt_reset;
     uint64_t icnt_accumulated;

-- 
2.43.0


