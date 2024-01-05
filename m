Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69381C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTq-0004qW-RT; Fri, 05 Jan 2024 10:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSK-0008PO-Vu
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:59 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSI-0000zJ-78
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:56 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33677fb38a3so1538912f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469791; x=1705074591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5/v+dvKjgkiKWiEWELJXJdh6CxKEAYCa0IE+244Hh8=;
 b=QGmMTmsPzG09YP9RTv3wX7hL7BH1ePk48LweT5ro7lTtu1EO15dnbc0Z7nwii5Uxlv
 gAW8H1cVZTlXlUlS+OxOd+rST3K69Lolv8+WWSp2MLaik+gKY0wkGMOaSnad4wKvOwaY
 wbSeFAQWo/UyO2VJ0uxalm2g6PT1ouLlhmkAdqCjMfVnxOq8wODyPkFXzSUNMSEWhuzG
 C9NYGv5GTiIkFuNPID2YoDeML53hhQRqvubhLYm5Es18EQyRCbEUR8bcbSDT014IfI4V
 HvbV6s43a0bbTa/59PAjyk8xD3Nn0gw0cbe58Nf0eksTU3spwYiD0joNdjXsVmIMmveD
 rDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469791; x=1705074591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z5/v+dvKjgkiKWiEWELJXJdh6CxKEAYCa0IE+244Hh8=;
 b=FT8N/675HL6tIbACDz4Dplp0mDi6sJsA5dlKP5Y9iy+apgvA4q+ZDFM6Eiy8sZmxnM
 DZ6SVAC151bKR264dmjaKuFS04SRlx/tY/1RqpYKpkXeADuDZqHF2qpVXMzO4mxqjh+v
 cOXXhEgme8UTd56WKHGFRGmR6Em0+j7DB94mjkDu9QpOSW3JXvyz6lSQV4LVsX9wsJUo
 VLZNtuvWOAeVgtd9b8/9VjqzI2vsHrCaJWYKZEYfnc/V9XpfxKMG99w7dTdGzhLhxraM
 tyDeQJLvdgHkQ6vFNiK3O54EGAQ6rsvEEAmrSi4lLV7mHHgwUoJWNrr/dsgkz7/2oPae
 8TSA==
X-Gm-Message-State: AOJu0Ywq+IcPsCSHaMhXOSf7gdjDPLUwI/w8c3cpHleW2WAfxXqrk35p
 JAKiL5YfFlRQrY+WRap0upeDfPlLZtJb0Q==
X-Google-Smtp-Source: AGHT+IEC9VUr/PXB0Hf7LPxeqrhHmLHyX3P5rGzjminRYbjRgLPZ92Ef9i/1SP3FQVsoFVvgOjt4pA==
X-Received: by 2002:a05:600c:3488:b0:40d:8514:fb5 with SMTP id
 a8-20020a05600c348800b0040d85140fb5mr1225021wmq.21.1704469791170; 
 Fri, 05 Jan 2024 07:49:51 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 hn3-20020a05600ca38300b0040e398f8cafsm1647488wmb.31.2024.01.05.07.49.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PULL 66/71] hw/misc: Simplify memory_region_init_ram_from_fd() calls
Date: Fri,  5 Jan 2024 16:42:59 +0100
Message-ID: <20240105154307.21385-67-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, arg5, arg6, arg7, errp;
@@
-   memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp);
    if (
-       errp
+       !memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-24-philmd@linaro.org>
---
 hw/misc/ivshmem.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 62af75e862..a2fd0bc365 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -476,7 +476,6 @@ static void setup_interrupt(IVShmemState *s, int vector, Error **errp)
 
 static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
 {
-    Error *local_err = NULL;
     struct stat buf;
     size_t size;
 
@@ -496,10 +495,9 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
     size = buf.st_size;
 
     /* mmap the region and map into the BAR2 */
-    memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s), "ivshmem.bar2",
-                                   size, RAM_SHARED, fd, 0, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
+                                        "ivshmem.bar2", size, RAM_SHARED,
+                                        fd, 0, errp)) {
         return;
     }
 
-- 
2.41.0


