Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jwb35-0003oS-P8
	for mharc-qemu-riscv@gnu.org; Fri, 17 Jul 2020 20:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1jwb32-0003mg-9N
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2020 20:49:52 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1jwb30-0007yW-Ks
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2020 20:49:52 -0400
Received: by mail-wr1-x444.google.com with SMTP id a6so12892326wrm.4
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2020 17:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fqBCBS62eAiIHBQ8oDcPQjPZk4ppcTPbbJjLbaTWGgU=;
 b=EN10eEUxR7zeBEnLnDYuKJckFivLmkmG5aWTo9hZXez/UGyBTsprDQGs/FS8AHWVbN
 oekTT8QJbl+LkLEgc8y4VyQRNbNQ7MAcoWgDUjEXI0J9ByZx5kkU+VBrIBBJpo6U/y+q
 Gy5VOB5s+atyPj3RvPSFNWiOUIUuNLN5DNVF2wzS4cG1iGz5A8FmjSHWPq31dWaZ06Tc
 r2jDiFb0lc0Pqa4D4jtLqJ62XsN4MaefODniYBgw6YghS0E8Ds5iSiqpf2EIk87LoYsy
 tPOtJ/pe9kXJY/31BfwwBew+WX0wsLytUR7jHJ4q8zUcp0wLL7+ffI/oUBkX5RBJBij9
 u3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fqBCBS62eAiIHBQ8oDcPQjPZk4ppcTPbbJjLbaTWGgU=;
 b=sD7h8tSusQTlfW3/xok3CZncqViyQ16daek3kHJlTJG3T//JAGOC61My89GaMGKTAb
 ur+R6PUP2eWiF5gGfsFxXMvEtAi2NahFXcGqPfRNELnlEmtB1e9HHBw48mpIjkSK2Kum
 70sYXAsm0qNbKCsx1U9ajMzRFd0MHiZ7n/G1VGDxfnBF3Y//9M5qch9LljuhuSRXhjyl
 fLM/ZDQtVe5x9AmoAGKZ4TwTf3Gmx0MddOc0XfRy5jb9Q++3EWp79dpYW5y/vEiCSkaI
 5+I/KHxhsIQFYAdvDBd45XnXK001VxhdMlW3Zaq/xcvFEwCHvwGoCqpfDx0NqDJTqLMT
 Yl7w==
X-Gm-Message-State: AOAM533hnONR8c+82GnRronG5XRewqoopJybM3TIMFIeei/had67nT8y
 qIVWcZOCQue9+BQGj0rlEpbceg==
X-Google-Smtp-Source: ABdhPJw6Ddrsbhz0r2ea5C1Q1dB7kO9bgEx3lEGBFOpPoE7Fr6CTZ81pHG96wLjWk3+9xnqO4VwYzw==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr7267766wrj.5.1595033388927;
 Fri, 17 Jul 2020 17:49:48 -0700 (PDT)
Received: from Jessicas-MacBook.local (trinity-students-nat.trin.cam.ac.uk.
 [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id t4sm17508546wmf.4.2020.07.17.17.49.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Jul 2020 17:49:48 -0700 (PDT)
Received: by Jessicas-MacBook.local (Postfix, from userid 501)
 id 51B71207A351F2; Sat, 18 Jul 2020 01:49:47 +0100 (BST)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-riscv@nongnu.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2] goldfish_rtc: Fix non-atomic read behaviour of
 TIME_LOW/TIME_HIGH
Date: Sat, 18 Jul 2020 01:49:34 +0100
Message-Id: <20200718004934.83174-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200718002027.82300-1-jrtc27@jrtc27.com>
References: <20200718002027.82300-1-jrtc27@jrtc27.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jul 2020 00:49:53 -0000

The specification says:

   0x00  TIME_LOW   R: Get current time, then return low-order 32-bits.
   0x04  TIME_HIGH  R: Return high 32-bits from previous TIME_LOW read.

   ...

   To read the value, the kernel must perform an IO_READ(TIME_LOW),
   which returns an unsigned 32-bit value, before an IO_READ(TIME_HIGH),
   which returns a signed 32-bit value, corresponding to the higher half
   of the full value.

However, we were just returning the current time for both. If the guest
is unlucky enough to read TIME_LOW and TIME_HIGH either side of an
overflow of the lower half, it will see time be in the future, before
jumping backwards on the next read, and Linux currently relies on the
atomicity guaranteed by the spec so is affected by this. Fix this
violation of the spec by caching the correct value for TIME_HIGH
whenever TIME_LOW is read, and returning that value for any TIME_HIGH
read.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
Changes since v1:

 * Add time_high to goldfish_rtc_vmstate and increment version.

 hw/rtc/goldfish_rtc.c         | 17 ++++++++++++++---
 include/hw/rtc/goldfish_rtc.h |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 01e9d2b083..6ddd45cce0 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -94,12 +94,22 @@ static uint64_t goldfish_rtc_read(void *opaque, hwaddr offset,
     GoldfishRTCState *s = opaque;
     uint64_t r = 0;

+    /*
+     * From the documentation linked at the top of the file:
+     *
+     *   To read the value, the kernel must perform an IO_READ(TIME_LOW), which
+     *   returns an unsigned 32-bit value, before an IO_READ(TIME_HIGH), which
+     *   returns a signed 32-bit value, corresponding to the higher half of the
+     *   full value.
+     */
     switch (offset) {
     case RTC_TIME_LOW:
-        r = goldfish_rtc_get_count(s) & 0xffffffff;
+        r = goldfish_rtc_get_count(s);
+        s->time_high = r >> 32;
+        r &= 0xffffffff;
         break;
     case RTC_TIME_HIGH:
-        r = goldfish_rtc_get_count(s) >> 32;
+        r = s->time_high;
         break;
     case RTC_ALARM_LOW:
         r = s->alarm_next & 0xffffffff;
@@ -216,7 +226,7 @@ static const MemoryRegionOps goldfish_rtc_ops = {

 static const VMStateDescription goldfish_rtc_vmstate = {
     .name = TYPE_GOLDFISH_RTC,
-    .version_id = 1,
+    .version_id = 2,
     .pre_save = goldfish_rtc_pre_save,
     .post_load = goldfish_rtc_post_load,
     .fields = (VMStateField[]) {
@@ -225,6 +235,7 @@ static const VMStateDescription goldfish_rtc_vmstate = {
         VMSTATE_UINT32(alarm_running, GoldfishRTCState),
         VMSTATE_UINT32(irq_pending, GoldfishRTCState),
         VMSTATE_UINT32(irq_enabled, GoldfishRTCState),
+        VMSTATE_UINT32(time_high, GoldfishRTCState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/rtc/goldfish_rtc.h b/include/hw/rtc/goldfish_rtc.h
index 16f9f9e29d..9bd8924f5f 100644
--- a/include/hw/rtc/goldfish_rtc.h
+++ b/include/hw/rtc/goldfish_rtc.h
@@ -41,6 +41,7 @@ typedef struct GoldfishRTCState {
     uint32_t alarm_running;
     uint32_t irq_pending;
     uint32_t irq_enabled;
+    uint32_t time_high;
 } GoldfishRTCState;

 #endif
--
2.20.1


