Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42284C61DBE
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 14:49:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wysRL-00010g-Vt; Tue, 25 Aug 2026 10:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wys2t-0002sZ-4F
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 10:22:35 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antikostya2@gmail.com>)
 id 1wys2q-0002AY-NL
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 10:22:34 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-39c7ef2b1e2so43387001fa.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787667751; x=1788272551; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=44lRTpz8iB0AVFJbeBxFTF9DSmyurvrQH0SNXPQReOs=;
 b=m+xYoWWARG3wf61oBkyAK4dajDHMP6xgSKbK+v63QLareWkfaRMWl8DwEIPfSlkDq6
 zVH0J8326ivs9esOqsC3vUQ6zvlUxNzE8OBgWKwWMo5YUtN2qU/tqTv3bSkvuxqOnzQI
 XSGViwrNUgN6bu8wvF5nq03tK1v1+y+4Cl/+0QGA6DBzw0ScS69G5C11MTi2Cf8eyuc8
 +h7c9CormtWp/WT8ld4ClWd1dJGsPRZxsQiMGe/2e6Lx+3gRnuYkDrq2ZltBmDpxhw2p
 smEv7Em9ZY5DksAMHm+yJyimAsyNkiDaE287g1xeyo5/lVcQLb6DfxJD8pzwfGnkqlpn
 tQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787667751; x=1788272551;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=44lRTpz8iB0AVFJbeBxFTF9DSmyurvrQH0SNXPQReOs=;
 b=k8LoyeSOgPxC5xKdYK3/jdw7JUaJx5Dw6hphNERArDokr7oJkgY+0HnHkS9gRl1Uuh
 VwqyIhr0auml5wqmCTtGQrOTwGX1D9AMTDvnX0Gqs40js5PTiVjna8HScDsQV1YqSP59
 keqGad7G4xTJfazUDs+zf4KtEJn8DniJhQ4w75SwiiZCMPeGj+cdYSwLniBltCZO/LLA
 G3keMI0SFjziiWEzXbwmYKrktKGAYAU8JYzeQdeFZhznnWtPlmhdNI+gluaFyWzd7e/o
 GueXjyAxwQVX6kUp65cN6RxnYROw7y/Yme6v2ebQG2mGscH0juiVxB5HU9a42AK9Mfjk
 otOA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr7Kdm7JTpTECxkIU91fsnGxTaH0MXrk0gUfiK3wq104OlTyUIHJvnk0ehPxZ5KM+tEbAWT1VjQ9qCA@nongnu.org
X-Gm-Message-State: AFuF++m4/4Z56t2t0IoOQ/6pN8A50nSOMiKQU/6HzqZzp4qR+hI9E7xR
 M3qmLzmTXxyKc8DlKl7rwA98jIB86hBVgCe0x/1oYdspBt48/i3tqYa9
X-Gm-Gg: AR+sD102F8Vh2EvW/+OZ8ctNGxMtVyJ8nYgbSy9FXuvPcO9LJZM5hSjkMYuxdA7R8KF
 1SUtwc8ZDdTAJXPRLzAy1BTFzSwIYc0AwpYaH3h8+/YIlMf6RIIKXrcg9sIrB3qpgE+vTUR1fZh
 TN5CAfRps2TBXyQdRn6bB/+1hqNILUVwbTPmXok5OwR7uTVg11C78UjSQFGeS3Jkz3xK92ZAjV2
 7NBYe+JzbegqV0eNEjIu0ppkBXFyWm+ejIB2p4DuaMeZF6tA9ICdwz34Ui/kpiz7Pq78qelUbrm
 QFhZqQvcFbmK9bc0aA3+QCXbvPiHmnplFS18AptoIEFvcpPQCo8WKyn3sHTLspkIqnoweC0HK6u
 PEoCZCoM7Nhh/ie1I3ieR9RqdNSaCSApsM6vny0SoihvAhir/2OqwlnGwzouqqSA4LcOeR6mN8k
 R4XWp5xpdYrbuWwvfCk9eawEl4INhRiSWtz41kgg1QjRFWqxXpNOxLZkICfDoXN5AVoJ+S1YUFk
 ydr7UAzE5c9oJNzniP/W4ojMK4L0+sFWMvfTe5sUQ==
X-Received: by 2002:a05:651c:43dc:20b0:3a1:7c1c:9fab with SMTP id
 38308e7fff4ca-3a1aebdf04emr59621431fa.8.1787667750777; 
 Tue, 25 Aug 2026 07:22:30 -0700 (PDT)
Received: from [127.0.1.1] (broadband-90-154-73-22.ip.moscow.rt.ru.
 [90.154.73.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a1c82f6b02sm22457551fa.41.2026.08.25.07.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 07:22:29 -0700 (PDT)
From: Konstantin Semichastnov <antikostya2@gmail.com>
Date: Tue, 25 Aug 2026 17:22:25 +0300
Subject: [PATCH 01/13] hw/riscv/trace-encoder: add ntrace enable flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-upstream-ntrace_core-v1-1-f8be2f40d2fd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4404; i=antikostya2@gmail.com; 
 h=from:subject:message-id;
 bh=UFIBq4OXYLwpRLUSsWgnfrok8avlyztAbJkS9Yp8lhM=; 
 b=owEBbQKS/ZANAwAKAUiKpW6lUN52AcsmYgBqjaUixEcWCTvX3jB6AsB7xL+uhsl71ME0igMy5
 Bhq1YR2pamJAjMEAAEKAB0WIQRMBWLx2o+linEPEBhIiqVupVDedgUCao2lIgAKCRBIiqVupVDe
 dpM8EACa9Ct/z3roUHRCTC3BxflLcOWesjBzaB0qR9CVTyiIWfmmj95BDsp0cSoTM1wCZujJymC
 IFt2yERJ+V1U/+3W7J8kRqcoQfAg0uiXmIpBi9oVNmBNAUfe/7TKWzlYC69u8frFlv4X7Dy12j3
 0kvuQe18wh/shLeX6fIP7Wm/Vq3HADg2WCkGE2lJGDk3p1VuZK9LW0UmiThl+qXjnmOwk+xVEJ3
 QwP0T3Wi7rKALbaL/+XKKyDxPYDWKc209Bg6HyM/j7MsDIYDGvOu8CULgWQn7QAbLbtqzj/K/T2
 qMa6VAya8mx/+V23jsY8GNFDWTRLLGIYEF8m1c0querbgGeRtVEgdjbkNPqaZ5C6450+p7JJ0nz
 +lT4Jrztt4xEnAJOPKHs4+BSBVpeQ9mWVXl7ayQkg/QrNTSkg/uHecZvicDRZT4+RqTIg3Lg4CY
 G7O1jHRaDm+XsJzxazsQELV2U8WKjtIroKjCFI3R+0ubSkE/nzV2Ru2Za1aoOZ01ehcmBr4RwMm
 urJHLxgF3Y/mSmQFZCAWggOivBBZVlrALCe0igwEwKvpClR7MobE/4jrC2LEF3ceAzj5c5HjXUZ
 KNv5A7F4fPcdLOOo/bGMyU45UP/ZjljmslDlzKD60+J5qWtJ8qFbG3J0JCxEp+dS4j3gPtPGQGF
 fA507PfAkd7qKAQ==
X-Developer-Key: i=antikostya2@gmail.com; a=openpgp;
 fpr=4C0562F1DA8FA58A710F1018488AA56EA550DE76
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=antikostya2@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Aug 2026 10:47:37 -0400
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

Initial commit of N-Trace support patch series based on "RISC-V n-trace
(Nexus-based Trace) Specification" Version 1.0.
With Trace control devices based on "RISC-V Trace Control Interface
Specification" Version 1.0.

Selecting trace message format rely on trTeFormat bit of trTeControl
trace encoder register.

We will mirror trTeFormat value in trace encoder in `ntrace` field to
simplify checking of current format in trace encoder logic.

This commit only mirrors register value in field, logic based on this
field value is added in next commit.

Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
---
 hw/riscv/trace-encoder.c | 22 +++++++++++++++++++++-
 hw/riscv/trace-encoder.h |  2 ++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 55acb1f2ae..53345a478c 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -84,6 +84,9 @@ REG32(TR_TE_CONTROL, 0x0)
 #define R_TR_TE_CONTROL_RESET R_TR_TE_CONTROL_EMPTY_MASK
 #define R_TR_TE_CONTROL_RO_BITS R_TR_TE_CONTROL_EMPTY_MASK
 
+#define TR_TE_CONTROL_FORMAT_ETRACE 0
+#define TR_TE_CONTROL_FORMAT_NTRACE 1
+
 /*
  * trTeImpl register fields
  */
@@ -153,7 +156,6 @@ static uint64_t trencoder_te_ctrl_set_hardwire_vals(uint64_t input)
     input = FIELD_DP32(input, TR_TE_CONTROL, CONTEXT, 0);
     input = FIELD_DP32(input, TR_TE_CONTROL, INST_STALL_ENA, 0);
     input = FIELD_DP32(input, TR_TE_CONTROL, INHIBIT_SRC, 1);
-    input = FIELD_DP32(input, TR_TE_CONTROL, FORMAT, 0);
 
     /* SYNC_MODE and SYNC_MAX will be revisited */
     input = FIELD_DP32(input, TR_TE_CONTROL, INST_SYNC_MODE, 0);
@@ -168,6 +170,7 @@ static uint64_t trencoder_te_ctrl_prew(RegisterInfo *reg, uint64_t val)
     uint32_t trTeActive = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, ACTIVE);
     uint32_t trTeInstTracing = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL,
                                                 INST_TRACING);
+    uint32_t trTeFormat = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, FORMAT);
     uint32_t temp;
 
     val = trencoder_te_ctrl_set_hardwire_vals(val);
@@ -205,6 +208,19 @@ static uint64_t trencoder_te_ctrl_prew(RegisterInfo *reg, uint64_t val)
         val = FIELD_DP32(val, TR_TE_CONTROL, INST_TRACING, 0);
     }
 
+    temp = FIELD_EX32(val, TR_TE_CONTROL, FORMAT);
+    if (te->trace_running) {
+        /* Do not allow to change tracing format while tracing is enabled. */
+        val = FIELD_DP32(val, TR_TE_CONTROL, FORMAT, trTeFormat);
+    } else if (temp != TR_TE_CONTROL_FORMAT_ETRACE &&
+               temp != TR_TE_CONTROL_FORMAT_NTRACE) {
+        /*
+         * Do not change format, if requested format is not supported
+         * (only E-Trace and N-Trace formats are supported for now)
+         */
+        val = FIELD_DP32(val, TR_TE_CONTROL, FORMAT, trTeFormat);
+    }
+
     return val;
 }
 
@@ -215,6 +231,7 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
     uint32_t trTeEnable = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, ENABLE);
     uint32_t trTeInstTracing = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL,
                                                 INST_TRACING);
+    uint32_t trTeFormat = ARRAY_FIELD_EX32(te->regs, TR_TE_CONTROL, FORMAT);
     RISCVCPU *cpu = te->cpu;
     CPURISCVState *env = &cpu->env;
 
@@ -233,6 +250,8 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg, uint64_t val)
 
     te->enabled = trTeEnable ? true : false;
 
+    te->ntrace = (trTeFormat == TR_TE_CONTROL_FORMAT_NTRACE);
+
     if (!te->trace_running && trTeInstTracing) {
         /* Starting trace. Ask the CPU for the first trace insn */
         te->trace_next_insn = true;
@@ -314,6 +333,7 @@ static void trencoder_reset(DeviceState *dev)
     te->enabled = false;
     te->trace_running = false;
     te->trace_next_insn = false;
+    te->ntrace = false;
     env->trace_running = false;
 
     te->branch_map = 0;
diff --git a/hw/riscv/trace-encoder.h b/hw/riscv/trace-encoder.h
index 48cf8366ee..fed0ef9a48 100644
--- a/hw/riscv/trace-encoder.h
+++ b/hw/riscv/trace-encoder.h
@@ -44,6 +44,8 @@ struct TraceEncoder {
     bool enabled;
     bool trace_running;
     bool trace_next_insn;
+
+    bool ntrace;
 };
 
 #define TYPE_TRACE_ENCODER "trace-encoder"

-- 
2.43.0


