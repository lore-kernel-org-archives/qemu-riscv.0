Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CBFC3601E
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:18:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2ubX-0005rU-Oy; Thu, 10 Apr 2025 12:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u2ubR-0005qn-Mz
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 12:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u2ubM-0004Qn-Sp
 for qemu-riscv@nongnu.org; Thu, 10 Apr 2025 12:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744301882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PGaRO9Gso5IOJbzbhgahH7LW5DO1lAZOAyvH8PRaixU=;
 b=afWKTmZtJUcVvrKcfPGbohKIUlw9asKmwTFHN57Ktgu69Bu/c525sfQQ6/bDXschwVZb+o
 x0h9LEA31zN0sdcJeEyOiK0+wpOcZz+rVu7r23fXGZ7YhX51SCVAdxy1M54jDRBe0DAUTQ
 G9bO3xXQUVgB+qwD0IzuUeFYpgB+R5w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-CUHBz6AzPpm8jNyoCg742w-1; Thu, 10 Apr 2025 12:17:54 -0400
X-MC-Unique: CUHBz6AzPpm8jNyoCg742w-1
X-Mimecast-MFC-AGG-ID: CUHBz6AzPpm8jNyoCg742w_1744301873
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ac28f255a36so86784566b.3
 for <qemu-riscv@nongnu.org>; Thu, 10 Apr 2025 09:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744301873; x=1744906673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PGaRO9Gso5IOJbzbhgahH7LW5DO1lAZOAyvH8PRaixU=;
 b=bFhrkhfZoNus/c8+q3czDsWe+4A8ijY46Bg6+SjAMBOsqPUoOZ31LAAjdYjfdl3C5h
 A1p3JMa+LA8RQcsa6LHZwAafFg1rGtnD72FUCGJgZ2rg9jRE34GviHn8pEkc/BpKbRL7
 taQqBLTWkYlXBta+va2JzUNN8P/xb26zs4fwffT2l7tMjrQm2LnQpEIK+qa7BSTND4JH
 WVdTDtFjzEUnVsrTNOv8wQUikKnM7RHm78ggX/s4WcEs+asUpkM2mzgIBPiCWx0oVU3S
 5HPvCVT9f5lHC9rRLF1zL1aQTm6KN3bajCf0LgyhuQCbo8O3QxybtYJjbKRmCXr95NLK
 gZhA==
X-Gm-Message-State: AOJu0YzhwdApIC3sl246Qen/9TTKucmKkvHqCY0epYIabTFIXS0kBDum
 qn8fVP0Y4AF3DQ2kSD8KCIzhsXNSmgz+cx6hl/g+NnusAMoKi3f57j/nIo2HQsHv79zNAflL2Rh
 3yuadLsOoBpgSYABgqYaSFNY63l/2b6yEAFi6tVfbhyb16EE+z72G
X-Gm-Gg: ASbGncujvYcPj6GnaJ3FXBWRIqosJcQPDk9BaGEoOoxu9xWpOLF8HYJKJYREXYltaYq
 mj0MNkfmIKZaJphT+ktcsHirdhihbo8V1HVEWqFEwbMIQ8hqBv6dSw1fdPKEx87H22XbTeO7ukw
 7g84Gi3Q8C9nRNvUixP4VwOOvE5EO+ewAex4tFNXJutg2LZ4/kJWQ4KEVW/jG9K64aybMbMh9NP
 1f1Agk60EKMD/B3GZPYySKwTmL8+/XPc1kfkC60Po9WEzoT1QTY1cSk8WSUAKmwA67ma2P6Wi+1
 ot4bPQSc5CoqFjZELRAuograHkiCJj0D6gihN5uwOWCz64c=
X-Received: by 2002:a17:906:810:b0:aca:cac7:28e2 with SMTP id
 a640c23a62f3a-acacac730eemr64167366b.40.1744301873264; 
 Thu, 10 Apr 2025 09:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuy+hmNY0hAj1kZ4fphrFraCC87pbQ/rA9UohsR0Ctza6IfAwBH2xIjesdM1h+xDkIm5dOvw==
X-Received: by 2002:a17:906:810:b0:aca:cac7:28e2 with SMTP id
 a640c23a62f3a-acacac730eemr64164966b.40.1744301872825; 
 Thu, 10 Apr 2025 09:17:52 -0700 (PDT)
Received: from [192.168.122.1] (93-33-70-196.ip43.fastwebnet.it.
 [93.33.70.196]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd1c4sm300863066b.148.2025.04.10.09.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 09:17:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>
Subject: [PATCH] hw/riscv: Fix type conflict of GLib function pointers
Date: Thu, 10 Apr 2025 18:17:22 +0200
Message-ID: <20250410161722.595634-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KDRFgMFDKKRyqVX5kCBd1WiDxAK5eznzzyPdmQFtY9s_1744301873
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.593,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

qtest_set_command_cb passed to g_once should match GThreadFunc,
which it does not.  But using g_once is actually unnecessary,
because the function is called by riscv_harts_realize() under
the Big QEMU Lock.

Reported-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/riscv/riscv_hart.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index a55d1566687..bb9104bae0b 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -104,8 +104,11 @@ static bool csr_qtest_callback(CharBackend *chr, gchar **words)
 
 static void riscv_cpu_register_csr_qtest_callback(void)
 {
-    static GOnce once;
-    g_once(&once, (GThreadFunc)qtest_set_command_cb, csr_qtest_callback);
+    static bool first = true;
+    if (first) {
+        first = false;
+        qtest_set_command_cb(csr_qtest_callback);
+    }
 }
 #endif
 
-- 
2.49.0


