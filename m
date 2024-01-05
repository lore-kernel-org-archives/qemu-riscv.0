Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EADDC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmRT-0005eZ-MK; Fri, 05 Jan 2024 10:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQf-0000Wy-Uf
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:14 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQc-00052G-EV
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:48:13 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1227765f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469688; x=1705074488; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwNOMMIAYzGSLWabz4mQJXWqt1PJzQTuexNMmuOK734=;
 b=zTpWELjazCjgv0efnlE4zgCZ6HMfKPlhg7nalHCtNUcEufcNlCWuRjuP6LJ9uo75Ur
 +ULrhv/L//U7gescR667EK9aNhCAPgAS8DWNrKeVSbPTXSLugeLAee/nUj3nl4cEBez/
 F331TfRBGXG4m0zMU6p+k6Nh0HmUpU0NP91eJFH1AGeyRcyX2GNwnhPpWO9ksIBaZlps
 eR+BMefEpXYEBfigksRECRFsDbzf+JDqMOeGJVmHb+MRGf37TATqYwxecIizGM5M+ZD3
 7TxuOS9ny3tgcLdMuthxk+SbODKAIGH7osJoZBxrlUBgL/0xxDSVgVPbryjwvtywRgcy
 kFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469688; x=1705074488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwNOMMIAYzGSLWabz4mQJXWqt1PJzQTuexNMmuOK734=;
 b=JmSg7ZGlfN1wmiiMP3Qrw4V5L5wHloA5OSSZfWaQ1Q7k3hLeGt07d/3Uxp3QBSgOyR
 vqC2g6h+3hGrwu+AmTOGZQpiQFncZw3oYUIO4+tg6LsLVNKNyzaNSRpX1WgQ1zNImVjD
 6eLtUSrnKsiU8xpddurQa+Ca1ex/gDDuQaD2XPmotBsCeMQN6x9ATcGaq4jr0y6HDfto
 OvQFlopcG+Vfzd6PxqlEvwwp5m+/6Rsi4VwmlrhllD4KTYObRwVaRjNIccIU7Y6VfU/+
 E0E9OgdL1NnVO5mNYdR9o3QahN0GAvPqDObUT1c6Ftj41RzMUVclvxFDvTTS1dSAiU9i
 c6eA==
X-Gm-Message-State: AOJu0YwggQ7vv0qKqq9h5Ii852sH86Bs/5hdOiYV9dZMiYqyYhEnYOK4
 1i8QknJ0Z0VgS/FGhLJ8mMhXYYZAKuBnYQ==
X-Google-Smtp-Source: AGHT+IE3AwHJlxhlvMqgvF8M8h0KfKHRXRjT1nqeu0wbgl9Vs7yTQ8aq+uC0QVut0myi6CcQGNipwQ==
X-Received: by 2002:adf:e0d0:0:b0:336:e366:471 with SMTP id
 m16-20020adfe0d0000000b00336e3660471mr1336264wri.58.1704469688486; 
 Fri, 05 Jan 2024 07:48:08 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 o5-20020adfca05000000b00336ee9edbb3sm1605985wrh.94.2024.01.05.07.48.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 47/71] memory: Simplify memory_region_init_rom_nomigrate() calls
Date: Fri,  5 Jan 2024 16:42:40 +0100
Message-ID: <20240105154307.21385-48-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
expression mr, owner, arg3, arg4, errp;
@@
-   memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp);
    if (
-       errp
+       !memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-5-philmd@linaro.org>
---
 system/memory.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/system/memory.c b/system/memory.c
index 72c6441e20..3997ac5928 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3601,11 +3601,8 @@ void memory_region_init_rom(MemoryRegion *mr,
                             Error **errp)
 {
     DeviceState *owner_dev;
-    Error *err = NULL;
 
-    memory_region_init_rom_nomigrate(mr, owner, name, size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom_nomigrate(mr, owner, name, size, errp)) {
         return;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
-- 
2.41.0


