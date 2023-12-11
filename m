Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097C7C4167D
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:28:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCniQ-0001qs-K8; Mon, 11 Dec 2023 16:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCniK-0001Pb-FV
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:23 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCniI-0005Vf-NX
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:20 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1c8512349dso660351566b.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329677; x=1702934477; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
 b=TFOOUYjN78GL+LGHhaxOShD1D6B3VHtjt19UEUabJdYdDe+FABS2z2c49Kubc0aJZM
 +XeCyNXMGrcmW8T2akELE2WQz8R+SQKxPn7s9N7IHgACW9We52O3fk64pIwqsMM0bZRL
 Zi7DezW4rsTqQNj66POZs/C9mPRo2r4Be0YOIsbpa1/4mqYXdB9l66izTXeg6jFzRDhq
 yOUZum7T4HiG6ce4kKp3P2ZnuPOLK4UruFBVoR5Aoz1z181Vq8GbRPbBldWV9KA75gPN
 427i5oFhSUxOvCelOulwZAiT7BhZTJPttFOCQFVcBE9uIrratD4eg/WvlyId8WyVhUpe
 33qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329677; x=1702934477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
 b=ccA8zqh0yBhAp+bFU6UvPo3m3lajOspb74V6OnR0iLlFox2iXDjSVbTqzaYeTHqnao
 d6+Ou/J6d1r0MUcMcGIt0ME8yvInXxynnjjtefEC6u9iONJzguRUCd1qX5vqwv6iYswr
 YZuLbEADvFmq7g2eyxKmlTq2sRxEe35E884X1Ior28egOLn0AoOeI+yUnwmxBbl3h+ub
 6CNweyKNqgzZXDx3OXunEk2uoZQii/ZOnCTWqPwkeO0TYpYqkgU/qMqP9BWo8H/tbsrZ
 jwfWYSbEBAebQo58aLnqTVR5BBmLkkhFEcPuP0162v99V8ic8YhB6La+nPyHZldeBX6z
 ySdA==
X-Gm-Message-State: AOJu0Yz6MdgXQFlF2aq4+IJDguVuJl7OvxjrZTCew+sW3v5xaYf7UYDB
 IOOSo43NnIYRo2deiYE8jYEzRg==
X-Google-Smtp-Source: AGHT+IE7u8ErDB3qbkoxcWJBZGHg9TNyGS0VK2dx6Y5oKzk/mTl8UNR2B14GFHxyP9kq57rEnK1Ndw==
X-Received: by 2002:a17:906:738b:b0:a1f:84ea:d8da with SMTP id
 f11-20020a170906738b00b00a1f84ead8damr2472617ejl.45.1702329677390; 
 Mon, 11 Dec 2023 13:21:17 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 tk3-20020a170907c28300b00a1cd54ec021sm5361923ejc.57.2023.12.11.13.21.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:21:17 -0800 (PST)
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
Subject: [PATCH 08/24] host/atomic128: Include missing 'qemu/atomic.h' header
Date: Mon, 11 Dec 2023 22:19:45 +0100
Message-ID: <20231211212003.21686-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

qatomic_cmpxchg__nocheck(), qatomic_read__nocheck(),
qatomic_set__nocheck() are defined in "qemu/atomic.h".
Include it in order to avoid:

  In file included from include/exec/helper-proto.h:10:
  In file included from include/exec/helper-proto-common.h:10:
  In file included from include/qemu/atomic128.h:61:
  In file included from host/include/aarch64/host/atomic128-cas.h:16:
  host/include/generic/host/atomic128-cas.h:23:11: error: call to undeclared function 'qatomic_cmpxchg__nocheck'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    r.i = qatomic_cmpxchg__nocheck(ptr_align, c.i, n.i);
          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 host/include/generic/host/atomic128-cas.h  | 2 ++
 host/include/generic/host/atomic128-ldst.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/host/include/generic/host/atomic128-cas.h b/host/include/generic/host/atomic128-cas.h
index 6b40cc2271..4824f14659 100644
--- a/host/include/generic/host/atomic128-cas.h
+++ b/host/include/generic/host/atomic128-cas.h
@@ -11,6 +11,8 @@
 #ifndef HOST_ATOMIC128_CAS_H
 #define HOST_ATOMIC128_CAS_H
 
+#include "qemu/atomic.h"
+
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 ATTRIBUTE_ATOMIC128_OPT
 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
diff --git a/host/include/generic/host/atomic128-ldst.h b/host/include/generic/host/atomic128-ldst.h
index 691e6a8531..12e4aca2da 100644
--- a/host/include/generic/host/atomic128-ldst.h
+++ b/host/include/generic/host/atomic128-ldst.h
@@ -11,6 +11,8 @@
 #ifndef HOST_ATOMIC128_LDST_H
 #define HOST_ATOMIC128_LDST_H
 
+#include "qemu/atomic.h"
+
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_ATOMIC128_RO 1
 # define HAVE_ATOMIC128_RW 1
-- 
2.41.0


