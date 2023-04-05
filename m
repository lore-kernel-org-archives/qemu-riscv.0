Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pk5dI-0005to-8Q
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 12:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dD-0005s7-7k
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 12:05:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dB-0007ee-73
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 12:05:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l12so36706382wrm.10
 for <qemu-riscv@nongnu.org>; Wed, 05 Apr 2023 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxoSzGepGv7BmEwhIUriUkTSi2iiaajTQsAiWFvibwk=;
 b=DQmQx5IbN6E4g6+BkWxA6gztVY7c/sHCIzd5stHTLyHiWOEkRlEtrivX3vqbDbGjL7
 XxhqdFKDllanEdiwIR+2geFMKUEf51/bjTU6C1eN4FPCiqJiX82RtiNDDdUc4v8TZMlS
 hfE9xJx7iUvpEr/MKnWta3hPHTH4tZxYVjBbZjbRVHV9SQjjE7MOqQkE5Vx8Ki+X5wTp
 c5TkfIiumSxeeb7KERAMfNwXTLH281hiqor5R3BeKHaP0CWh9xqCJFkqSyE1Ryn0CRfG
 Wa9APsQXMmO/K9sEl+9/eYdh12Me4fUTC8mQAdjssj9vMZeCKSBjNoCuzIYv3M364S11
 1Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxoSzGepGv7BmEwhIUriUkTSi2iiaajTQsAiWFvibwk=;
 b=iooiQ+1iEa7s7aUbmO2OO10rLooJwJpkgMdxQ8CE5yTA3Mwwn6/DcXAvv+i56NNM89
 vI6CsHPEBdTI2nxOnSo0PXlceNe666g7X/XJyh8DS60FMohsN74aj95RYuIDZkNZTqka
 8UjcRc8L+xnkdbYkIMhUyQ4CSgXRGPoJ0/F6xN9IJGqgCXfFa0nZdzoZgb6H2UJks3GB
 5J2P4lleU1F7vQFHBjup0L+hk5juXhvzlutn+UwbVpa2KiNK5+Hi+mfKsanSjGfNkDga
 4cbfAVXhDEu7NleBYmDJI7R1UUDgXTD16kagl70N9nXJhGhsBFFQxx14b/uCeVnbhn1G
 EFjg==
X-Gm-Message-State: AAQBX9eCx0cW8oAIDbOfZvsXovpov/FifjaVOrU08VbboLZgS+/8HlP9
 LxPbLBoNE/yvwak/Mi+xs56ECg==
X-Google-Smtp-Source: AKy350bS4fbO2z32Jbhpsnm4njKJVeihL7eN5HhQ5ZKA2WfgsKUiX7r37OaZuRjkvBKDgyCpYJKbBg==
X-Received: by 2002:adf:de8f:0:b0:2dc:c0da:409 with SMTP id
 w15-20020adfde8f000000b002dcc0da0409mr3979004wrl.27.1680710703263; 
 Wed, 05 Apr 2023 09:05:03 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002e116cbe24esm15293404wrx.32.2023.04.05.09.05.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/10] sysemu/kvm: Remove unused headers
Date: Wed,  5 Apr 2023 18:04:45 +0200
Message-Id: <20230405160454.97436-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 05 Apr 2023 16:05:08 -0000

All types used are forward-declared in "qemu/typedefs.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/kvm.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index cc6c678ed8..7902acdfd9 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -16,9 +16,6 @@
 #ifndef QEMU_KVM_H
 #define QEMU_KVM_H
 
-#include "qemu/queue.h"
-#include "hw/core/cpu.h"
-#include "exec/memattrs.h"
 #include "qemu/accel.h"
 #include "qom/object.h"
 
-- 
2.38.1


