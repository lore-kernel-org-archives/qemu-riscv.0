Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DD9C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:14:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctz-00027j-G1; Mon, 07 Sep 2026 13:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cTI-0004nP-CB
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:45:29 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cTG-0003U1-IT
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:45:28 -0400
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so36172515e9.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799525; x=1789404325;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8pehCOpu14U96pPALBKxZw+FwtcRSZWqcNAlSAWQxRQ=;
 b=LN/p9syC+ao+i0fceMBYJ1BAtRXxSEtGMXoFlsgiU8F40X+oDC2qlFQgdQj6yQr7ER
 yBed67h/aM7gw0QbfY/I1qaEmqCzWawSvjhXAKlbVaKNfwrhu/yX5hhsAXMPthVFMXhR
 Ha5rjkH2qpgfdV1FgbnoluL9PsnoeNvQldT1bpXwEmvo3ScGDr3fBwRrYAYt/bianZzg
 9dBneBkMf0JLIddgfcXRATa1PtoVBmYiJePFMqHygYNmjcuto9+WjRK49qwADPsWF45J
 /ltNbJqpPh9uTj2fywDY5rGs7B3+/AI7O8Sku5dQRvApbLL/p4xrkPBZy+0V77wiJt6S
 D2Nw==
X-Forwarded-Encrypted: i=1;
 AKwUvByqRm719DDjAgUhKIMUGphgKKxQocRgNpbchOMqxbOghrwBQf/4FdPCouhE5i0vQgylfbKL03up8Pj9@nongnu.org
X-Gm-Message-State: AFuF++mrUwBbxfjX+F0J16iuaB/KiuLGlcTsd0I3mE4t7dBYYTyEq48h
 xDd3Z9Q0tnyX0fNB50uXL9TLHo2ruQSbIxF57NmxX+idKuXRtY1sZDuW
X-Gm-Gg: AYBFou2oaksJLAZbC3vhvj8+m96GPVfYQRbY19BL5wZD28arQnnKHbqkmp/yCWTiLQd
 LDO0Uw6b4z8qfDT9pj00RkITErgiH+vTTb25RkXW2IGQSTqS+pNP3H7ZrICS2FxGjIaxWTvQrTi
 fOIxkncaqzDyoXGD32q6pJAc0kMjkLcsJKhoyPl4Fqd8/5QS9wQk+9DAcLsjqSoyckB79YeF/gt
 RpHN1by8CFN0/LY5fSXrOcopg+TehRJM38WFnOpiDqJukqvxOCb6rAZC1BTWqlYigQs3KuiWHQ1
 6J4SinRF5nK8Nn3+0RO7/zyCF4pr6ppKA5UnQyJ1pBQDN88pScrZ5mDSuF6spMgPAEnF3t2p6mf
 a3g4NDpu4IWiDF0ebQL1PvKaFkmpbKsfI/n8is3J1TuTZKpVvSLDLUBGA0YKdI05vrjnydOqb6T
 Kty4Og9412ETyKBP6knDU/8Qv+01lGLLZBP5cwXDv6WkdJRTD3uxx6YFWNuANyfjwNqKi1p5tvu
 E9/36I+8X2FqkoYRSO68ksHlAEbyer+hks=
X-Received: by 2002:a05:600c:4e51:b0:49c:ff8d:b548 with SMTP id
 5b1f17b1804b1-49cff8db5demr407389125e9.11.1788799525075; 
 Mon, 07 Sep 2026 09:45:25 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf75cd8d0sm301952595e9.2.2026.09.07.09.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:45:24 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:05 +0200
Subject: [PATCH 15/50] hw/rtc: ds1338: refresh the user registers on a read
 rollover only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-15-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799320; l=1980;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=/o1Te60tyzFbC8yX3wDit9+fgGxpiXPXZOuAAft1sW4=;
 b=f15x0jIyNuUi46sinkjJoM/PZjrjJ1fBNnM59WzMt4MJyhcmPGIhJW7FaJ+g7uJabYF5Gv9sB
 +ENB4W4OukIBNZ+DoUx6z94x3yDlmjzu2SBCOytGMpQFt9PpDVNu10w
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f43.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Sep 2026 13:12:51 -0400
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


