Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E619C61DBC
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 17:41:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyv9L-0002O3-0L; Tue, 25 Aug 2026 13:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wyv9J-0002Nl-IE
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 13:41:25 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wyv9E-0000gr-E3
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 13:41:22 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5b48ced973dso13237e87.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 10:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787679679; x=1788284479; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6hFzhnXZVfwVXKavQF9nMPh7v7vdOVoePn53autvXt4=;
 b=c0BjsoUyB9iSEOrEq0fGA2tHMUaXGWD08crPAThLPl5IRx5Z6CgfPUx6jn1F5xQTMF
 hwXSsCBelQ4aH2JBqkUjZ4cy9W9V/aWmNv2hMvpBcc/a2/hj7CyBfwXuKocF+OihpEkr
 osh1URz2+MMriWzhRktdXrKYWXjqNU6uzYpkwzUYlsunR8V50Zgw4SIcw2oxXeRuIbu3
 CdeehQThX/5cpX5yd0F3XyFkcbo3Fx1oHAgHdGbFADF3LqnnmURuVmzGnVvTcgCHmZ5N
 Dh8zLrO3d0Vm6q20EqNHJz542Hzln1O19B72oZY4GTDoZ2nW0ZtamOQEd5DWm6VoADXh
 LpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787679679; x=1788284479;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6hFzhnXZVfwVXKavQF9nMPh7v7vdOVoePn53autvXt4=;
 b=HQGhP6OadwCqgDNJ4ZvIiUKM+sMM9b8e6qIzSDA4UJgMuHmbbOMrJG2cmWQGa32Jft
 VTag2FHpIV5AXKkbzwx2+rbu37GstZMBxFjEsFyZQs+MbHTwZBkMDzTGXWdHX41c6Ld4
 IT+eqAYdVAIrr3+fGRBM0jJadHcuBhFI+VHyujsr3Toz8388bR1G7AKf2NCIGmgo/9NC
 cUF9zcx1po8z4eU1TPsf9D5Oh/f433aMY7a6o5IYda1Zamf+Mt0iCl7GXIZ92NG3STjC
 +rndzPG/A3ATeo7C5g/lPuhaXwrKNS5mX/3I8PBAGIzNjPTh/MzuzSvl5gB6Lp3pZ0Um
 Ko1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYhGGqp9g0Qu6o3A4cf7AiT7t+GWqVvERjZYqewqS4iKQuTdGRAk5N8BirIZPURMMhzCM9nYxIik3g@nongnu.org
X-Gm-Message-State: AFuF++mKjxVVTPe2fAPVGgjgxHTUEOWr+qMizCylgXkDyfDd0C8dwL01
 6ujBdVlAmubGCWLRoiy8I+NpS8D8QkiE+rtllhlz9ITJ54z78UiUiNBx
X-Gm-Gg: AR+sD13D6Oj2ZFzXJeTuw29IS+dwEC6ig2HTvghnC6XyClmYTnnD2qktrMXeyN8lCj9
 Glp++pM5amy6XKx81QqWlGDkr264NC8TuSNaQH/mYZZPmlwEp0qIf15bnkryjihFWJBIc6jbJq5
 afvC+rg5XeAH82Fa6M78ypA5WdodUuu23PcKKdZHzyvz22Cho4T9uOhyReq2gAAf5snjv0F9/tb
 04+XNrutHhPl4n8Jkvj8UYCEPzb1u8OfO2UAH9Fobb92ryNHScDNtZlv2Nam+maa6QMKfcoeqM0
 O1XpHZOv3KFTcQm+2smyDk4q6K4K8l4GtPdv1elJnEJmlACqIaQTlGpWygY0IWT6/WDRKlT5QO1
 pgB41k4kQc0mgIKS8blI9OJin+Iujk1I1wxlBstMVgVD2xdCF4fefcHlDA+ztp2fnxvJDgWimGL
 ehghUvXjXnmxAgfC6qH3DAB0wiXpHGKpxrOkiIcMmFkl8Vx1FdHpNMIVg3GErwRoEgfy2os+Lvb
 zs8DtYNUrdKW/qnklAjmo6K0E0=
X-Received: by 2002:a05:6512:a34e:b0:5b1:59ec:2452 with SMTP id
 2adb3069b0e04-5b48421b64cmr7627712e87.9.1787679678283; 
 Tue, 25 Aug 2026 10:41:18 -0700 (PDT)
Received: from localhost (broadband-90-154-73-22.ip.moscow.rt.ru.
 [90.154.73.22]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b4a41539a6sm85328e87.3.2026.08.25.10.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 10:41:17 -0700 (PDT)
From: Konstantin Semichastnov <antikostya2@gmail.com>
Date: Tue, 25 Aug 2026 17:31:23 +0300
Subject: [PATCH 13/13] hw/riscv/trace-encoder: refactor register accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-upstream-ntrace_core-v1-13-f8be2f40d2fd@gmail.com>
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
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
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

