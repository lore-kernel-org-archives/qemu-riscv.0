Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6D4C982DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 15:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7afX-0006Qi-7k; Fri, 18 Sep 2026 11:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1x7afS-0006QG-0t
 for qemu-riscv@nongnu.org; Fri, 18 Sep 2026 11:38:26 -0400
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1x7afQ-0003DI-9u
 for qemu-riscv@nongnu.org; Fri, 18 Sep 2026 11:38:25 -0400
Received: by mail-lr2-x10.google.com with SMTP id
 38308e7fff4ca-3a2ff163f65so7032951fa.1
 for <qemu-riscv@nongnu.org>; Fri, 18 Sep 2026 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789745902; x=1790350702; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FxhT0nhez3I36gywC46KR4KrhV2ZwbPVmTIAoxHV7H4=;
 b=QwFK0aIqA9W7vn/fd6QCWjWt5pnv6lX8tblCVQrbvGmfexGlEek/wHaVS5qHTrWLIi
 r4apYQ7XpZ9sdfiqsBYjobKadKscP6ZXHG0JIQteCEpL+ost20DrzuKKtvWRqNrg2n6g
 UiRQ+wrpX9udX1LsdqTqNKSlqgYi5SnIvlNBa9xuM7vz+ApuxCsalEgkhdEcOY+gL8RT
 7jkzgaAY5PMnB4a5osjCedE9M8Pdvd6ZYIh2LUADfaeVJK5OxMhZiLb1U7gpZZzKMzm4
 A7GoZ/cgF9xxDS5jGdSjaQBb2b3BsGrOfi6XbAxdXSQF7CmlqPDn53dzLy8dpYe8W0U/
 6R8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789745902; x=1790350702;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FxhT0nhez3I36gywC46KR4KrhV2ZwbPVmTIAoxHV7H4=;
 b=llP6FRlN9NlWG/meh3pRJZyviCv/i5ZE6Wo+58dX1s2TzfwEC+/bEGhw8idYpNge5e
 ZmrmmrSVRJQVhsfxou+y/zt5D6qSj6DRGPd+xlmKv8uCdIwbE/Dc8YhoczX8n3SLqDGb
 ZCDBE91p9bk7ZKqMFZbJxDBWT5znaOiq0UEQ5BQkGrRaEaf0uB8DNM744/kPb4nfoAmV
 LXBt5fe84fynrrTLzuYe6JJ2pLtnfVYtG7SxKjn8/8EJIISh+8Em05ZFIvwq11I/Brm/
 5sEjbev/hx+kJgDR0LM1hLiaxKNnsCkPIHfBhF8LKZElKSJMP5KWuulv4wXTU1mWF5Xl
 1I4w==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4Z7GqKtcEzy4RplpDqBt8Xck3cnYULeAJtCoH9cqbOLdjImGSTKbtvHkGZY/bt2V4GbBFxXiv0wwC@nongnu.org
X-Gm-Message-State: AFuF++naVz8nONyCGQO4udcqdRelm64nBiifnZyW22PBjwv/8AdShgcx
 O/PfRGBqtlXG22TQejZsOa4X3VJDrpnuFY4Y86UAZfmOPYQei/6iAXk2
X-Gm-Gg: AYBFou0SAOSoEB92KBXZPTNkLKTG36FY9wlJ9Cx+keMXZRBr/Bv8XF/4r5ZYvNDUIGl
 F43jMY0s2DpxjS5pER7tw6stz+eyIc/6kDCNFns10tqEWWC+Fv/reO9P29LNhW4FRjX7cyZcaX9
 6ipux4P35pTGlCfsKV6CP8n9SXfTBCh//4vkIhuN1UyzxoCESOXyZvhYs7o+vqZCki+JR9CnxEB
 E7CGxCZFSB2nmHse9B/e2iGjx60cxLdY+T2mp7y4KucH9VYVDVBGOk7DF0xn757uwt8jQEcxp4W
 QwXyfJhi4fqkzQOYpzxkIJ4ZC5opET5Ia5+SgvFmTasqL2H18LnLF+ph2KiHx5aliB019Gm+9Nm
 zuPN9quFeE8Rm/uzUuuyoh9JGpCujBvi+Y0u+KIuOXiA65El+dQhr3A30bQ505sb1SlmYKQy3qc
 A0GhN6ATyksI+03SpyEqBdib3+VP9m4RViZLCTpSCfwzEPWqFjGzMSzyRA6xn7oL8DmP32wdARY
 h3RhJc=
X-Received: by 2002:a2e:b889:0:b0:3a5:fe42:8c9 with SMTP id
 38308e7fff4ca-3a5fe420e6emr5279681fa.24.1789745902105; 
 Fri, 18 Sep 2026 08:38:22 -0700 (PDT)
Received: from localhost ([213.79.119.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a5fd8a84c0sm5649231fa.40.2026.09.18.08.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 08:38:21 -0700 (PDT)
From: Konstantin Semichastnov <antikostya2@gmail.com>
Date: Fri, 18 Sep 2026 18:34:37 +0300
Subject: [PATCH 1/6] hw/riscv/trace-encoder.c: support ACTIVE ENABLE EMPTY
 of trTeRamControl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-ntrace_msg-v1-1-16a56ad8e0ef@gmail.com>
References: <20260918-upstream-ntrace_msg-v1-0-16a56ad8e0ef@gmail.com>
In-Reply-To: <20260918-upstream-ntrace_msg-v1-0-16a56ad8e0ef@gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-riscv@nongnu.org, Alexei Filippov <halip0503@gmail.com>, 
 Arseniy Semenov <ar.semenov@outlook.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5390; i=antikostya2@gmail.com; 
 h=from:subject:message-id;
 bh=uzEAaoZU/K6brHVw0Tn88cMwxEl+4Nljo09TqtCiixg=; 
 b=owEBbQKS/ZANAwAKAUiKpW6lUN52AcsmYgBqrVoNh+8ZMwzHlSTLSZbNM9iEKO6YW71r6omQX
 PtOY4ZnBaKJAjMEAAEKAB0WIQRMBWLx2o+linEPEBhIiqVupVDedgUCaq1aDQAKCRBIiqVupVDe
 dmJTD/9d+3GjehxcP0NI15RmdABrkvgKwMkjiV0Vv+Ai3b0uiZvTlttzfcJgQJ3z4CmSuY4sEhc
 OZ4VxFwVbzAq3ITOwIuSQEXCtGKOz5zPGQ8IKrwchIlaVQZrdmtcp0rC8mbX9ZneF+Cei6KW163
 RMwlO56yV7+idQhWO3a5lMsmFb478S4NnkfDpn1+QxRucFAtMCZZDAKpBHtl+WIZPYL7SFrXK9a
 PmyAR7M05VIoPwb+a/g5X820VtCwJt74pVj3psK/EHAC/EfJ+8/20CORxsfUU/mmHXbA3hSnR8N
 uTxzKrhhgKfbROlJ5mTfs4b5s4fVNn12uRrak4GMXKbwPJgncs6AM1ShxYnH1mgioppBmvBzECU
 mLoVoTU6vPZudSSqcMr3mEP/42zSzKJ3d9RuFE2mSr72km5lxaJx9n4wCSb6OXmOSl0JoKmE7Xr
 1uPxe/S5Ai9n6yM1xUVkOt+WEKAUeK8YPVredTz2byvsFxS5a5CCYGt0xzJHtX6q6GcWSvWyd0+
 1xAOzb+Y5rIaIotT6Lg7DV9wbnDV7ETpDO/kvdv++PSs5+VKq53A+Uv5PNX8HHXzQpTAhf7bFTE
 FvT49PrV5bWaPhNZ76JTPvVszM0JS6FOFqb9gfKnCaWCCzdqgcJ3LCa1hwaNpZysq8EK9wge+mi
 mpj0gv9FeijKGfA==
X-Developer-Key: i=antikostya2@gmail.com; a=openpgp;
 fpr=4C0562F1DA8FA58A710F1018488AA56EA550DE76
Received-SPF: pass client-ip=2a00:1450:4864:38::10;
 envelope-from=antikostya2@gmail.com; helo=mail-lr2-x10.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
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

Signed-off-by: Alexei Filippov <halip0503@gmail.com>
---
 hw/riscv/trace-encoder.c       | 16 +++++++++++++++
 hw/riscv/trace-ram-sink.c      | 19 ++++++++++++++++--
 tests/qtest/riscv-trace-test.c | 45 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 7fd5c3a578..41bb750043 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -159,6 +159,18 @@ static hwaddr trencoder_read_ramsink_ramlimit(TraceEncoder *te)
     return ret;
 }
 
+static uint32_t trencoder_read_ramsink_control(TraceEncoder *te)
+{
+    return trencoder_read_reg(te, A_TR_RAM_CONTROL);
+}
+
+static bool trencoder_is_ramsink_enabled(TraceEncoder *te)
+{
+    uint32_t reg = trencoder_read_ramsink_control(te);
+
+    return FIELD_EX32(reg, TR_RAM_CONTROL, ENABLE);
+}
+
 static uint64_t trencoder_te_ctrl_set_hardwire_vals(uint64_t input)
 {
     input = FIELD_DP32(input, TR_TE_CONTROL, EMPTY, 1);
@@ -427,6 +439,10 @@ static void trencoder_send_message_smem(TraceEncoder *trencoder,
     hwaddr dest = trencoder_read_ramsink_writep(trencoder);
     bool wrapped = false;
 
+    if (!trencoder_is_ramsink_enabled(trencoder)) {
+        return;
+    }
+
     if (trencoder->ntrace) {
         /*
          * RISC-V N-Trace 3.1. MSEO Sequences:
diff --git a/hw/riscv/trace-ram-sink.c b/hw/riscv/trace-ram-sink.c
index 03ffa9caae..daf3c67d57 100644
--- a/hw/riscv/trace-ram-sink.c
+++ b/hw/riscv/trace-ram-sink.c
@@ -44,8 +44,6 @@
 
 static uint64_t tr_ramsink_ctrl_set_hardwire_vals(uint64_t input)
 {
-    input = FIELD_DP32(input, TR_RAM_CONTROL, ACTIVE, 1);
-    input = FIELD_DP32(input, TR_RAM_CONTROL, ENABLE, 1);
     input = FIELD_DP32(input, TR_RAM_CONTROL, MODE, 1);
     input = FIELD_DP32(input, TR_RAM_CONTROL, STOP_ON_WRAP, 0);
     input = FIELD_DP32(input, TR_RAM_CONTROL, MEM_FORMAT, 0);
@@ -56,8 +54,25 @@ static uint64_t tr_ramsink_ctrl_set_hardwire_vals(uint64_t input)
 
 static uint64_t tr_ramsink_ctrl_prew(RegisterInfo *reg, uint64_t val)
 {
+    TraceRamSink *rs = TRACE_RAM_SINK(reg->opaque);
+    uint32_t trRamActive = ARRAY_FIELD_EX32(rs->regs, TR_RAM_CONTROL, ACTIVE);
+
     val = tr_ramsink_ctrl_set_hardwire_vals(val);
 
+    if (!trRamActive) {
+
+        /*
+         * 11.3 Enabling and Disabling hints that the device must
+         * be activated first (trRamActive = 1), then enabled.
+         * Do not enable the device if it's not active
+         * beforehand.
+         */
+
+        if (FIELD_EX32(val, TR_RAM_CONTROL, ENABLE)) {
+            val = FIELD_DP32(val, TR_RAM_CONTROL, ENABLE, 0);
+        }
+    }
+
     return val;
 }
 
diff --git a/tests/qtest/riscv-trace-test.c b/tests/qtest/riscv-trace-test.c
index 66069f7a56..8f0a751fd8 100644
--- a/tests/qtest/riscv-trace-test.c
+++ b/tests/qtest/riscv-trace-test.c
@@ -39,6 +39,11 @@ REG32(TR_RAM_WP_LOW, 0x020)
 REG32(TR_RAM_WP_HIGH, 0x024)
     FIELD(TR_RAM_WP_HIGH, ADDR, 0, 32)
 
+REG32(TR_RAM_CONTROL, 0x0)
+    FIELD(TR_RAM_CONTROL, ACTIVE, 0, 1)
+    FIELD(TR_RAM_CONTROL, ENABLE, 1, 1)
+    FIELD(TR_RAM_CONTROL, EMPTY, 3, 1)
+
 static uint32_t test_read_te_control(QTestState *qts)
 {
     return qtest_readl(qts, TE_BASE + A_TR_TE_CONTROL);
@@ -67,6 +72,42 @@ static uint64_t test_read_tram_writep(QTestState *qts)
     return reg;
 }
 
+static uint32_t test_read_tram_control(QTestState *qts)
+{
+    return qtest_readl(qts, TRAM_BASE + A_TR_RAM_CONTROL);
+}
+
+static void test_write_tram_control(QTestState *qts, uint32_t val)
+{
+    qtest_writel(qts, TRAM_BASE + A_TR_RAM_CONTROL, val);
+}
+
+static void reset_and_enable_ram_sink(QTestState *qts)
+{
+    uint32_t reg = test_read_tram_control(qts);
+    reg = FIELD_DP32(reg, TR_RAM_CONTROL, ACTIVE, 0);
+    test_write_tram_control(qts, reg);
+    reg = test_read_tram_control(qts);
+    g_assert(0 == FIELD_EX32(reg, TR_RAM_CONTROL, ACTIVE));
+
+    reg = test_read_tram_control(qts);
+    reg = FIELD_DP32(reg, TR_RAM_CONTROL, ACTIVE, 1);
+    test_write_tram_control(qts, reg);
+    reg = test_read_tram_control(qts);
+    g_assert(1 == FIELD_EX32(reg, TR_RAM_CONTROL, ACTIVE));
+
+    reg = test_read_tram_control(qts);
+    reg = FIELD_DP32(reg, TR_RAM_CONTROL, ENABLE, 1);
+    test_write_tram_control(qts, reg);
+    reg = test_read_tram_control(qts);
+    g_assert(1 == FIELD_EX32(reg, TR_RAM_CONTROL, ENABLE));
+
+    reg = test_read_tram_control(qts);
+    reg = FIELD_EX32(reg, TR_RAM_CONTROL, EMPTY);
+    /* EMPTY should be 1 */
+    g_assert(reg);
+}
+
 static void test_trace_simple(void)
 {
     QTestState *qts = qtest_init("-machine virt -accel tcg");
@@ -74,6 +115,8 @@ static void test_trace_simple(void)
     uint64_t reg_tram_start, reg_tram_writep;
     uint32_t reg;
 
+    reset_and_enable_ram_sink(qts);
+
     reg = test_read_te_control(qts);
     reg = FIELD_DP32(reg, TR_TE_CONTROL, ACTIVE, 1);
     test_write_te_control(qts, reg);
@@ -119,6 +162,8 @@ static void test_ntrace_simple(void)
     uint64_t reg_tram_start, reg_tram_writep;
     uint32_t reg;
 
+    reset_and_enable_ram_sink(qts);
+
     /* trTeActive := 1 */
     reg = test_read_te_control(qts);
     reg = FIELD_DP32(reg, TR_TE_CONTROL, ACTIVE, 1);

-- 
2.43.0


