Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CE7CA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:08:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHd3-0007V6-6I; Mon, 12 Oct 2026 11:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHd0-0007UJ-U1
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:07:50 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHcy-0007Ek-KP
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:07:50 -0400
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48c6f764f82so602644f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817667; x=1792422467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8pehCOpu14U96pPALBKxZw+FwtcRSZWqcNAlSAWQxRQ=;
 b=spMwakr4ANSCA0qEIChgedRzvvr2xMAmxN4n7I3VY+TwnGcKbgyXesorO+iiT8VmI5
 WCMwcMLcb3u17ruHPJVulEcTVbrtgGAkGSH85MhfAQniKutQE/x5s3cb4CqDZY0ERMyt
 0t1NE7+Z6zy4Tt1MohaathqCgNU2i9lo7jDm78SkVQbaRGmbzIIruZ1k3p8gfYs181Xz
 uQVuqnfoUvP2Ca03i9vKX0SUiX8CJtvu/Nhotft4lBV16B1IsGKKI/avlZ6FF2FblNTc
 6jaLd5NIU6vpnVhno+FUBobL6I2rwBqGxTT++2qPV217e3HpfdX3uWL9jpndhbCrtDEV
 vfdw==
X-Forwarded-Encrypted: i=1;
 AKwUvBygNqhoO9hJ3eBoWXRtA/IDxlrR3qfxyecsIrSJe1iVr9jiA9C5jVkxSf6Xg/q+XmC1FMxn1QBgBTuC@nongnu.org
X-Gm-Message-State: AFq9FYKUv39YjZBcSLJqjeNDr1+myS+AWPCRmeqoQwNXEL0b3dvOTcsm
 wBrMBfV+uNaOI9PACnkWbui3J6Du6m4IIHEgkqDQBNZw328Leg4vS8A6
X-Gm-Gg: AYBFou0kLAtaOE2juF+BBctptM7n65Inv5jYkRTtQHbd9ZRpONNNjz+CGfdwrew6F0t
 UFXnBo6p/aNMTZAwyLEK33OMb7U+a2nqnSy92WI97QhGhjYagyMRPnUtV6D9nm4rrEp4zPbfXzi
 3U5C0ZzVYIqCOoFpem2UV8jMoENmCnXrlSlI8g3buyhxuOFsIhYRYbB6i/N0e627uWuTyE6B3P4
 TicfKHPFs22iFHLYOMvSOx2npNBB1CnKB0Fy0QAJym+v+A7S+t8BWyWWnfYTkq2z1m4KCkYsDrO
 lJu65h9Ltfry0De2d8SpG4HnvY9rO3wcOcpHWsMXwhj1w2OZyosuPLMhK1yZxSW06zYDtY0R8eB
 /OZ9Nin0Npq8xu7FblEdPZu5EvjTiZ3DKe3KgfByLAHwRPdLPg7QI+dnS+Tiy/Wt/RxO8CcK9Vh
 uHS091lVazO5hUlWT2fOcUjjYkqQqhWGyJNOh8yCXt576HXovTn1q9KNEOCYKPHnVkUn1AI/Kp2
 H6cdAa+Wpu7niYexHspTqIA27Jso8RTXiUNdK0EWRYG3g==
X-Received: by 2002:a5d:4748:0:b0:488:8111:6f4e with SMTP id
 ffacd0b85a97d-48dbaaddd64mr13130331f8f.9.1791817666529; 
 Mon, 12 Oct 2026 08:07:46 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db98c2800sm19908900f8f.26.2026.10.12.08.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:07:46 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:08 +0200
Subject: [PATCH v2 15/50] hw/rtc: ds1338: refresh the user registers on a
 read rollover only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-15-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=1980;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=/o1Te60tyzFbC8yX3wDit9+fgGxpiXPXZOuAAft1sW4=;
 b=kyaQZtTIK81J5Ez4N+xGy9A27RRMagoh+yw19yATn0YTxSbtB3kAAMavF4+UJ9yRUSNDUzf+V
 d+tLPpQKZTtDcej5Ds+OaWkbILkMZQN/yVYOSVz3/C9IrvJvEyjeirA
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f50.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Synchronising the user buffers when the register pointer rolls over to
zero is a property of reading them; hardware routes a write to the
counters themselves. Doing it from the shared pointer increment meant a
write transfer long enough to wrap overwrote the bytes the guest had
just sent with the current time.

Move the refresh to the read path.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 79bcff4599..c5fc74e6ca 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -12,6 +12,8 @@
  * Limitations:
  * - Writing the seconds register does not reset the internal countdown chain,
  *   so the sub-second phase of the clock is not modelled.
+ * - The user registers are refreshed on a START and on a read that wraps the
+ *   register pointer, but not on a STOP.
  * - Leap years follow the Gregorian rule, where the parts stop at 2100: they
  *   derive the leap year from the two-digit year alone.
  * - The model comes up with the clock running; real hardware comes up halted.
@@ -157,15 +159,7 @@ static void ds1338_inc_regptr(DS1338State *s)
 {
     DS1338Class *k = DS1338_GET_CLASS(s);
 
-    /*
-     * The register pointer wraps around after the last register; wraparound
-     * causes the current time/date to be retransferred into the secondary
-     * registers.
-     */
     s->ptr = (s->ptr + 1) % k->num_regs;
-    if (!s->ptr) {
-        ds1338_capture_current_time(s);
-    }
 }
 
 static int ds1338_event(I2CSlave *i2c, enum i2c_event event)
@@ -201,6 +195,10 @@ static uint8_t ds1338_recv(I2CSlave *i2c)
     trace_ds1338_recv(s->ptr, res);
 
     ds1338_inc_regptr(s);
+    if (!s->ptr) {
+        /* Read-only: a wrapping write must keep the bytes it just sent. */
+        ds1338_capture_current_time(s);
+    }
     return res;
 }
 

-- 
2.50.1


