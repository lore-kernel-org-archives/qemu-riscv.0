Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F49C19F53
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 19:29:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s1Wfq-0001P9-S2; Mon, 29 Apr 2024 15:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1s1Wfi-0001MO-4n
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 15:28:18 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1s1Wfe-0007bu-OA
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 15:28:17 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5aa3f0fcd46so3193297eaf.1
 for <qemu-riscv@nongnu.org>; Mon, 29 Apr 2024 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714418890; x=1715023690;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SWkUI25HSMpKrt4/gZiXxUlGt2r+TGYzYTJUn3m6V1Q=;
 b=TuIvoha7/oks/XdMLNSmlq1Bb5vIHbjjMFo3pXkspa3Fww/GUOLEXxpu6x+X0sEibH
 heU9XbAQqQedPQ23jAlZIEJo5ocfVHFWKc/dgxm5ouaA2Dzc38XsYHKEb53fNdwHmmMV
 oR7iV1XfUkB1OTXx8EXQqJw2JNezCP/LHgKjTcqRQmpsRmtLgc39p7V+cc6M52R56lFn
 7ZqeGUSksfLw8dwX+0TY9HEsrmaOqGGHd7E3O8GBy6grmHmE4gqu+0p3wWuCcJ4MhwaU
 ecbpn87n05L23Sn1GIL2RovOYCYiR4jzWpC0h3Fr+tVw5G41k9zbYaxw+GmbRlIz53eH
 nItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714418890; x=1715023690;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SWkUI25HSMpKrt4/gZiXxUlGt2r+TGYzYTJUn3m6V1Q=;
 b=eZrPDUwZW1raWZy72TWElR968qpt7cFvF73epxClJEt6c4DpdNIzBH0m8WqsCiHvKe
 4yjPeUqf8tG9BM/abuZZA55wXAR5V3/jLWvyNn3cGL5ypJYIV1k9et8kuddukuaWwqMg
 Tv6jbFOA4R3lyOJXbjiom/f6nOQq/oHGxFpqDYWSGdQhQsVi8uF3l78KuKXcfHklJdtY
 GKzYENHyJFEviUADcf5NPOtHsiqFZvjwRiLKJc2ojOn++2fVBU8UYkObBzEwb3Twuwdq
 wtP5DaEr72sRdYBdlwFsEEn60Kx6yWtnvUlCXfaH6P8bVZTAjWm8rDocwETPfuTqiYoX
 kj+Q==
X-Gm-Message-State: AOJu0YyE1RTTmxTN8UL7/Af5qRrKdYMAdJGPs+Cs0GmA9V4mAeQaarIs
 Izt8m6uWL5v8PdOo6IsPCKFg8qm2TQzvF55F4GacMa5hWUpV+4nlfEq8mW3u2/heTRfmqtqVpDE
 d
X-Google-Smtp-Source: AGHT+IFY3dOV2+3XGVYKja5LJ+HSGfxEjArpk/Vhp3I4XwIlJI1gAse+dr7i8zy+ngulHlSsc/l2jg==
X-Received: by 2002:a05:6358:7252:b0:186:40c3:e495 with SMTP id
 i18-20020a056358725200b0018640c3e495mr9368903rwa.23.1714418890148; 
 Mon, 29 Apr 2024 12:28:10 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a63e44d000000b005d8b89bbf20sm19293887pgk.63.2024.04.29.12.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:28:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 29 Apr 2024 12:28:04 -0700
Subject: [PATCH 1/3] target/riscv: Save counter values during countinhibit
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-countinhibit_fix-v1-1-802ec1e99133@rivosinc.com>
References: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
In-Reply-To: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, palmer@dabbelt.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.13-dev-f0463
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Currently, if a counter monitoring cycle/instret is stopped via
mcountinhibit we just update the state while the value is saved
during the next read. This is not accurate as the read may happen
many cycles after the counter is stopped. Ideally, the read should
return the value saved when the counter is stopped.

Thus, save the value of the counter during the inhibit update
operation and return that value during the read if corresponding bit
in mcountihibit is set.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h     |  1 -
 target/riscv/csr.c     | 32 ++++++++++++++++++++------------
 target/riscv/machine.c |  1 -
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3b1a02b9449a..09bbf7ce9880 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -153,7 +153,6 @@ typedef struct PMUCTRState {
     target_ulong mhpmcounter_prev;
     /* Snapshort value of a counter in RV32 */
     target_ulong mhpmcounterh_prev;
-    bool started;
     /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt trigger */
     target_ulong irq_overflow_left;
 } PMUCTRState;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 726096444fae..68ca31aff47d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -929,17 +929,11 @@ static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
 
     if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
         /*
-         * Counter should not increment if inhibit bit is set. We can't really
-         * stop the icount counting. Just return the counter value written by
-         * the supervisor to indicate that counter was not incremented.
+         * Counter should not increment if inhibit bit is set. Just return the
+         * current counter value.
          */
-        if (!counter->started) {
-            *val = ctr_val;
-            return RISCV_EXCP_NONE;
-        } else {
-            /* Mark that the counter has been stopped */
-            counter->started = false;
-        }
+         *val = ctr_val;
+         return RISCV_EXCP_NONE;
     }
 
     /*
@@ -1973,9 +1967,23 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
 
     /* Check if any other counter is also monitoring cycles/instructions */
     for (cidx = 0; cidx < RV_MAX_MHPMCOUNTERS; cidx++) {
-        if (!get_field(env->mcountinhibit, BIT(cidx))) {
             counter = &env->pmu_ctrs[cidx];
-            counter->started = true;
+        if (get_field(env->mcountinhibit, BIT(cidx)) && (val & BIT(cidx))) {
+	    /*
+             * Update the counter value for cycle/instret as we can't stop the
+             * host ticks. But we should show the current value at this moment.
+             */
+            if (riscv_pmu_ctr_monitor_cycles(env, cidx) ||
+                riscv_pmu_ctr_monitor_instructions(env, cidx)) {
+                counter->mhpmcounter_val = get_ticks(false) -
+                                           counter->mhpmcounter_prev +
+                                           counter->mhpmcounter_val;
+                if (riscv_cpu_mxl(env) == MXL_RV32) {
+                    counter->mhpmcounterh_val = get_ticks(false) -
+                                                counter->mhpmcounterh_prev +
+                                                counter->mhpmcounterh_val;
+		}
+            }
         }
     }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 76f2150f78b5..3e0f2dd2ce2a 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -328,7 +328,6 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
         VMSTATE_UINTTL(mhpmcounterh_val, PMUCTRState),
         VMSTATE_UINTTL(mhpmcounter_prev, PMUCTRState),
         VMSTATE_UINTTL(mhpmcounterh_prev, PMUCTRState),
-        VMSTATE_BOOL(started, PMUCTRState),
         VMSTATE_END_OF_LIST()
     }
 };

-- 
2.34.1


