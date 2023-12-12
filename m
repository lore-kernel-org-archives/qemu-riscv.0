Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2274BC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:40:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1yy-00008x-Q4; Tue, 12 Dec 2023 07:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1yq-0008PY-CM
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1ya-0006o2-EF
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so65379285e9.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384502; x=1702989302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
 b=LCWjlppoJDWo0gfsxvpcK90lyyPmjphMYVK+VJnrA0buSOwAaiMo5W4wunwDf4ueNF
 GCKjvxiduvYJl/qEgtujAVjBmGwsjHWGgbXWEVNby1GQZd4A2jTdWtHMFwKKqg05M1yc
 NuvtBTiF1ELofOOL1SXrDmKMRh6HccDPzaBt5wA0Gn0K2xMXQ+ti0X+Xz/COldVtnMwP
 QCijq4FmKwq5jWUjragRp+zBAFljcSK06iSojaC4YyE5hCkxRAgPc+uvSoOWBr6rtoRZ
 gRgg1On5SpHYjbnWokl1k7vWXbMAVW7nqy4Bagc7jIueYQE7s2ayqRSatXCH635O/V3l
 yKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384502; x=1702989302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
 b=Hzmf6kxfI5X2kV3uPCIWadlivjYLbhj1yo+w8DrsTQ5jNl7wwU91dvDUSH6x5HJNML
 vpkJAFPjI0cwCkHCKqIGLHSjIa/bVpqbNvubI6oJFc+8L58m8vNog3zWtwDQeEbLcj+i
 t2Ay6ReuyxAxSPsHC0iwfgiFVsxfSK+W0mIVaXwdBWRjpWSbx58MoimBuDbcnFoIMaIh
 NM94euig01GVoPlTVY9MtSDIAq6EcnQbej0RMFO9nDd0UpxU11a7CPT6k8DL4yBBtCPR
 4gwaNzXJtee5atjxoB1KwC/WDASo31DDWiY4+YOSectDQervkFz3d7EidulHmGg5V/+K
 jVUg==
X-Gm-Message-State: AOJu0YxYTuxlG/7bLAL4hp8eA/WUgZt8rrCn1h1GhnNDUmN7PLR4+X5m
 Rq3TPnevb7xmuxle3UFU2xGMQQ==
X-Google-Smtp-Source: AGHT+IGAESSZtH6ln3MK23t1PKoi3W/qmoRgb3hb0VMjf3EB3hN4oQZHMKkiXJGz/0Uo3HbdxEGPqQ==
X-Received: by 2002:a05:600c:141:b0:40c:3667:9e89 with SMTP id
 w1-20020a05600c014100b0040c36679e89mr2486829wmm.85.1702384502203; 
 Tue, 12 Dec 2023 04:35:02 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 hu19-20020a170907a09300b00a0ad580e1b6sm6140865ejc.48.2023.12.12.04.35.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:35:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/23] host/load-extract: Include missing 'qemu/atomic.h'
 and 'qemu/int128.h'
Date: Tue, 12 Dec 2023 13:33:44 +0100
Message-ID: <20231212123401.37493-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

int128_make128(), int128_getlo() and int128_urshift() are
declared in "qemu/int128.h". qatomic_read__nocheck() is
declared in "qemu/atomic.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 host/include/generic/host/load-extract-al16-al8.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/host/include/generic/host/load-extract-al16-al8.h b/host/include/generic/host/load-extract-al16-al8.h
index d95556130f..6b47339b57 100644
--- a/host/include/generic/host/load-extract-al16-al8.h
+++ b/host/include/generic/host/load-extract-al16-al8.h
@@ -8,6 +8,9 @@
 #ifndef HOST_LOAD_EXTRACT_AL16_AL8_H
 #define HOST_LOAD_EXTRACT_AL16_AL8_H
 
+#include "qemu/atomic.h"
+#include "qemu/int128.h"
+
 /**
  * load_atom_extract_al16_or_al8:
  * @pv: host address
-- 
2.41.0


