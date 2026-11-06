Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61CA606A326
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VXTuNPaC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPMwt-0005tf-3D; Fri, 06 Nov 2026 11:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw5-0005pS-Ub
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 11:37:11 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw2-0006PP-Sj
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 11:37:04 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-490c1d337d8so575956f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 08:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793983021; x=1794587821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EQXaPCL/hDktSfe0rSeHbVLMMpwdPDgo7ErChtSxbYs=;
 b=VXTuNPaCr13DtuSMx8npEYqyToLalDK6Y7ZCg2ysJqKWJX7dKo9o+YdW8g8uuYgMYN
 +4m4BwKm7p+xerMJINB9232/5Iua3EPVgstmmPgbpuQCcl0XMJw0UYTka++2laNDAE6U
 T6CkfumWA+Zl+CuP/rN4OGOJSyz/zDK1fYwgYc5sxGiZ8LJ6Rob/kT+TAipttmLz5+Vh
 RGVEt2vPnsjdyj/K/CsQRSubDOPcfb59b2fZF46t0/QNqQ0xGmw010gHuNDjF3O2HIIN
 1PB7YPIh9tWSfdcXeesYBKA1mdSn+TxsVUaJL6tTGhCReFG8BDyuC65wSeO1h2jYwrUS
 hp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793983021; x=1794587821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EQXaPCL/hDktSfe0rSeHbVLMMpwdPDgo7ErChtSxbYs=;
 b=Lg9ZcKxIV/z0ZCbnpI5TXCKJyDh2Omlz10zFxnKFU3sjCE7XttM7tTJ2h1ppd4qCAn
 XnIXF1vJhB7AZ7SXcrxxbIn9CRA9O1NZvWx/WDoWAnZCo2tRvrx9XzxLvGG8pJgWqsnz
 JtY2rBiDWxh06QZkUWwtw0vGik5JzEzv/Vn0nvRPrdv4vNq3sEbW3SjrRdqffsFZrD1R
 QF5TdCuCSYGdmsuOPRzpbboedaVFIXhixzY9vF3rAHR0b7eIjeLWCGdJPn/b9/vF2yqf
 pzdhBbOsBjQo5u0CMwGz5Hzmjo6wdmxXfXieC/d7AIAn0N2cXoGG/L44LskdHIope2KD
 sOSA==
X-Gm-Message-State: APuU4Z/EsBTl+UT8oh3lI6k5I7rMbJBEJgkw+tdiOTblZhjj4OjksyRz
 u09sC1nQkcdQrhQ4fWbu+jSWCgNsryGv2BZ5id8ERAIdAZw0n6cECVJ7al5MrelppF5Vj08R+Qz
 I0KOAjlQ=
X-Gm-Gg: AYBFou2zkWY9wbSAgAkFBy5LKW4wnpZDi3oa53jOwd0CS+h8yaG9w/yAR2AU1f6IzwB
 r+gGwkmzDMSfuLk82URKyVr7br2UOL9ptSzUFN9pCDjzCF1/s/tQQpnz7Kp6hFynn9fJpMLDNPl
 eVTmYfkWe1DlMzynnnL5b/7yOml9/q+JMvNiq0HAB0zNO1jEkHjY0a1ySW9tdqDd7zhRTboOZw5
 +Qih4qXxPgHinX0Y2xubm6Pxs0YOF/SItT4tQReLCuuxCxmO+k9n/ZfUjSDYzAa4uiY7qu/ihIG
 Lsz6OpNm8uloxMERI44Uak4DDontgaD2ksA9AWmIdaNbIWPYFpsm5jJScYApO5zyfx4izLFf3xI
 Th5eONZ9drSOVdO2PPxzeRp2SVyUP4W2pkJfXBb6LK/mPmSQHSNbbcmeSxDR9h7Rzpa43fLjtKD
 sATaGtsKrOc2JUzMk+uf4F5vHg+YLRB/QSpr9B7o2aOturrILm6SznxYVfaJwhJXw0BPk2lwmpk
 /eVLpT6hpUKR7UE+o3DFGheIEfBbtdcmiIQ1PobRBR0iLzgwgfpwBnYWhyeNEQSIrBwR1Hv5ivI
 LHQnlEZBZ+GWNbTd6BPJ2kwoxIv1I6fqe86Urg+oYkUBDpKERFqkfktvXdKGvYNhV3RP5EB8tnN
 g0Q4sSYw6r4+F9Mlu1VYqRDXWlTdcyCviKA==
X-Received: by 2002:a5d:5e8e:0:b0:48c:5304:5e50 with SMTP id
 ffacd0b85a97d-49278174682mr5505960f8f.0.1793983021083; 
 Fri, 06 Nov 2026 08:37:01 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d60e78sm4517912f8f.1.2026.11.06.08.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:37:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 for-11.2 2/2] include/hw/core/ptimer.h: Fix 'version'
 argument of VMSTATE_PTIMER
Date: Fri,  6 Nov 2026 16:36:57 +0000
Message-ID: <20261106163657.3825938-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106163657.3825938-1-peter.maydell@linaro.org>
References: <20261106163657.3825938-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VMSTATE_PTIMER macro is defined to pass a 'version' argument of 1
to VMSTATE_STRUCT_POINTER_TEST_V.  This means that the field will
only be used in migration when the vmstate struct that uses
VMSTATE_PTIMER has a version_id of at least 1.  This doesn't match
how we define other VMSTATE_FOO which don't take an explicit
version_id, which is to use a version argument of 0 (e.g. all the
common macros like VMSTATE_UINT32 are written to pass 0 to their
VMSTATE_UINT32_V counterparts, and so on). It also doesn't match
how we define VMSTATE_PTIMER_ARRAY.

The practical effect of this is that users of VMSTATE_PTIMER in
vmstate structs which explicitly or implicitly have a version_id of 0
were actually not getting their ptimers migrated.

This affects:
 vmstate_xlnx_csu_dma in wh/dma/xlnx_csu_dma.c
 vmstate_k230_wdt in hw/watchdog/k230_wdt.c

which are used in:
 * Arm Xilinx versal and zynq machines
 * RISC-V K230 machine

Most ptimer users are unaffected because they took the usual approach
of explicitly setting their starting version_id to 1.

Fix the version_id in this field.  This is a migration compatibility
break for all the above listed devices/machines.  Since the timers
involved are in devices where the timer is usually stopped (e.g.  the
watchdogs only have the timer active when the watchdog is enabled and
counting down), the consequences of the bug are likely not visible to
most users.

We could perhaps attempt to preserve migration compatibility here,
but none of the affected machine types are versioned and so we do not
promise cross-version compatibility, so do the simple thing.  Bump
the version_id and version_id on the two affected vmstate structs so
that attempted migration between old and new QEMU fails cleanly.

Fixes: 852f771ec9e5c ("vmstate: port pmtimer")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4705
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not cc: stable because it's a migration format change and we
don't generally backport those
---
 include/hw/core/ptimer.h | 2 +-
 hw/dma/xlnx_csu_dma.c    | 4 ++--
 hw/watchdog/k230_wdt.c   | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/ptimer.h b/include/hw/core/ptimer.h
index 4dc02b0de47..8513f8917e3 100644
--- a/include/hw/core/ptimer.h
+++ b/include/hw/core/ptimer.h
@@ -300,7 +300,7 @@ void ptimer_stop(ptimer_state *s);
 extern const VMStateDescription vmstate_ptimer;
 
 #define VMSTATE_PTIMER(_field, _state) \
-    VMSTATE_STRUCT_POINTER_V(_field, _state, 1, vmstate_ptimer, ptimer_state)
+    VMSTATE_STRUCT_POINTER_V(_field, _state, 0, vmstate_ptimer, ptimer_state)
 
 #define VMSTATE_PTIMER_ARRAY(_f, _s, _n)                                \
     VMSTATE_ARRAY_OF_POINTER_TO_STRUCT(_f, _s, _n, 0,                   \
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 436f9915e02..ea703dc00ce 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -679,8 +679,8 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_xlnx_csu_dma = {
     .name = TYPE_XLNX_CSU_DMA,
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_PTIMER(src_timer, XlnxCSUDMA),
         VMSTATE_UINT16(width, XlnxCSUDMA),
diff --git a/hw/watchdog/k230_wdt.c b/hw/watchdog/k230_wdt.c
index 1f83b499e82..fba2013b8f3 100644
--- a/hw/watchdog/k230_wdt.c
+++ b/hw/watchdog/k230_wdt.c
@@ -234,6 +234,8 @@ static const MemoryRegionOps k230_wdt_ops = {
 
 static const VMStateDescription vmstate_k230_wdt = {
     .name = "k230.wdt",
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_PTIMER(timer, K230WdtState),
         VMSTATE_UINT32(cr, K230WdtState),
-- 
2.43.0


