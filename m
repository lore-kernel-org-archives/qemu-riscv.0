Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF34C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 09:15:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPImr-00074v-SJ; Fri, 28 Jul 2023 04:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qPImq-00074W-2X
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 04:25:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qPIml-0001uY-VT
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 04:25:23 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b9cdef8619so11706655ad.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Jul 2023 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690532716; x=1691137516;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3AdS9NXM222FBUduvUiiAtTxQ7n/dHZHyFBNOJ6HoxQ=;
 b=C6KCEsuXfmmklDwXGy1lC8g58w2+i6hzL+oeoIq5G2h4H6sdSrEBsmpLHTUSxAb41+
 5Gi4gIkuclkPd8mLFVGsykQal85xsIC/nGYq8dV3Ie4pAgdIGt0OjEzPCQlDUdrIyuKF
 KRt8mf4PhCEk6LUDj7wnQIA5Z/udHqtKYxoMjgv4ke6mDgkUmfh3Uz8fFxahYRFYErZx
 W24P46PLeVOTpBifPJ3WscYH9CebwQdTMIxc2mn/y06w1Uxs0nLNIkUcJIApSl4uRe8C
 u6HQPV+OA9QWpqIjAIHaC4NyJALAtYJX1VHPoTv6gxaA7/zeAVyOybdsgoOmFBPr71CB
 s/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690532716; x=1691137516;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3AdS9NXM222FBUduvUiiAtTxQ7n/dHZHyFBNOJ6HoxQ=;
 b=D5jxQeIGlwUkivyupRef6OyBwU8FW5XaKYasPxTe8HDdisPlAntLGfetSpixlhqn+l
 NvBdfMQBnOl3L1n6k5Gt9tzMSGUICtZ21CkTPSRBZ5mUgFgxDW8gdTZ/HLgWRCz7nDhG
 nWkvkK1YEs6iaZ9YD0DBuNpLdLHZ1ia7yoow251IUs59Oj3nUtNXbdPDTf2+QRiVgWot
 J61EUBazBm1tsjhfMbzFN82VkE427AqHbQ598ZVU6X6SII2qTBQE4gA/1XzotfDzLriN
 o79HOzKR+OvNcb7DzhnJX0nQwYJ+/6zShiStwY565VFuS2o07lzDBizwXpSDCC6A0w0d
 sobA==
X-Gm-Message-State: ABy/qLZ9MHFFVeC6f0tgV537NT3uAXYvIg7N83lcmljLKFTMi8wxenz5
 4aUQmQXrN4disLCkhNrjDdkDvQ==
X-Google-Smtp-Source: APBJJlGZnTcBCu9+ITWQpWVr7FNZFTG5o175JB7q6qDcZItNKjT9ZIf3KgYWbtq323s2aAdNBPdfaw==
X-Received: by 2002:a17:902:a40d:b0:1bb:20ee:e29e with SMTP id
 p13-20020a170902a40d00b001bb20eee29emr865157plq.1.1690532715826; 
 Fri, 28 Jul 2023 01:25:15 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a170902e88800b001b53be3d956sm2985213plg.167.2023.07.28.01.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 01:25:15 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/2] hw/intc: Fix upper/lower mtime write calculation
Date: Fri, 28 Jul 2023 08:24:38 +0000
Message-Id: <20230728082502.26439-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

When writing the upper mtime, we should keep the original lower mtime
whose value is given by cpu_riscv_read_rtc() instead of
cpu_riscv_read_rtc_raw(). The same logic applies to writes to lower mtime.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/intc/riscv_aclint.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index b466a6abaf..bf77e29a70 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -208,11 +208,12 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         return;
     } else if (addr == mtimer->time_base || addr == mtimer->time_base + 4) {
         uint64_t rtc_r = cpu_riscv_read_rtc_raw(mtimer->timebase_freq);
+        uint64_t rtc = cpu_riscv_read_rtc(mtimer);
 
         if (addr == mtimer->time_base) {
             if (size == 4) {
                 /* time_lo for RV32/RV64 */
-                mtimer->time_delta = ((rtc_r & ~0xFFFFFFFFULL) | value) - rtc_r;
+                mtimer->time_delta = ((rtc & ~0xFFFFFFFFULL) | value) - rtc_r;
             } else {
                 /* time for RV64 */
                 mtimer->time_delta = value - rtc_r;
@@ -220,7 +221,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         } else {
             if (size == 4) {
                 /* time_hi for RV32/RV64 */
-                mtimer->time_delta = (value << 32 | (rtc_r & 0xFFFFFFFF)) - rtc_r;
+                mtimer->time_delta = (value << 32 | (rtc & 0xFFFFFFFF)) - rtc_r;
             } else {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "aclint-mtimer: invalid time_hi write: %08x",
-- 
2.17.1


