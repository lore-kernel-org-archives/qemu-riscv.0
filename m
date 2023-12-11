Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05870C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:22:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnhz-0000zY-8C; Mon, 11 Dec 2023 16:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnhw-0000tQ-Pm
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:20:57 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnhv-0005Le-3q
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:20:56 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a1f33c13ff2so424217666b.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329654; x=1702934454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hdtduscqdl7lWoQvL5DT94RvR1c94dCnz5Zm14mzbGM=;
 b=HvI+Lbt0OMGxncTXfmCtUxEpk7DXjvqW4bWkxcD6aBPgh/7lafhBDKlqq2D83UUWBH
 MijxmKUwMrc/qcAvLr+04pocp7Q22lcmY0HQJARZJEnPFqxDkirBiIQWCvNWfEJCLQG+
 NkiYpS0fvA+lNDPjfsXLWXVXq1+8XPtEY/hg1mYzDLHdNTjs6bX/eEqqt9ZxQK1zEyu9
 olwSxOboJxM4WH6Bt+fKSaE3E477ZVBL5tRvDVmOjPzRfg/JPyQnaYVMnCR4ZA7SU0ms
 XPNnoi7pn5eheOTCBCQ+d0242nMvenjyoUttoTspvrsUL6xv/Jp79bFsRiuDPBGZv5e+
 lFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329654; x=1702934454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hdtduscqdl7lWoQvL5DT94RvR1c94dCnz5Zm14mzbGM=;
 b=RdlJPFCOkqPJ+xGnv3mulrQ3jcd0t6jaAD9L3D4alWhdK1ju5AFHp4gYJopWsMw7lW
 UtPqWpWTII1c8ky//7F1Hzhv/xBQM7lquPX5nMLaDPNu0vYogO3jauvPuszpfBRcJaYH
 tzWeLUpTXMtiNf5zv3Xdx/v2hnoZ2QWQ6Cw6gHK0dLwB8Zps0RnISplR7l67MKdQAxxD
 GbtJUaAyKTaq1Y0bLlhtlh0QoBcAJUGYh58/ZgVwrZZqWQ0Chr9h/zyt5Nlh0odpDFPU
 qi9M63kMHa2ZDvkFT9cAa/ea8YrQfXzivr5xXGGxl0YczfkgEyXPwL4j9+6U8BPlHu7J
 bNew==
X-Gm-Message-State: AOJu0Yz4cnSTsnQPH0DaCRBeV2xGhBSzqqKxKZIcbGq97XAaI2uJGrJm
 A/1oeYATwN5026YgTchTJ6RZ5Q==
X-Google-Smtp-Source: AGHT+IGSU6orrfEyQw8281nABb2ziCc9amYnSK9sAmfW+hjeDzK/Oj1EjnbDpucqQCNSeee/4ucj7Q==
X-Received: by 2002:a17:906:2207:b0:a1f:9f16:2cfd with SMTP id
 s7-20020a170906220700b00a1f9f162cfdmr1332861ejs.63.1702329653881; 
 Mon, 11 Dec 2023 13:20:53 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 tm6-20020a170907c38600b00a1db955c809sm5304903ejc.73.2023.12.11.13.20.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:20:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/24] semihosting/uaccess: Avoid including 'cpu.h'
Date: Mon, 11 Dec 2023 22:19:42 +0100
Message-ID: <20231211212003.21686-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

"semihosting/uaccess.h" only requires declarations
from "exec/cpu-defs.h". Avoid including the huge "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/semihosting/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/semihosting/uaccess.h b/include/semihosting/uaccess.h
index 3963eafc3e..6c8835fbcb 100644
--- a/include/semihosting/uaccess.h
+++ b/include/semihosting/uaccess.h
@@ -14,7 +14,7 @@
 #error Cannot include semihosting/uaccess.h from user emulation
 #endif
 
-#include "cpu.h"
+#include "exec/cpu-defs.h"
 
 #define get_user_u64(val, addr)                                         \
     ({ uint64_t val_ = 0;                                               \
-- 
2.41.0


