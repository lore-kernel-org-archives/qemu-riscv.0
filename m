Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C136FC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:26:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnk5-0005If-1L; Mon, 11 Dec 2023 16:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnk2-0005CH-MR
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:23:06 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnk0-0005po-HE
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:23:06 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bf2d9b3fdso6529840e87.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329780; x=1702934580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IVD0fP181N6yKPURwFJTLnTnzSvk7D9idiGLSO6/Cw=;
 b=j2dxbNdV6HhJOO/qnq5xW1LOo6MzI1uHNTaURVb7sOkMF/zhyaoqvzfOXw4LbZTHwF
 lipBpHTtTzmvcIlcesyEDh+6s9m1I8GdAjXvlNgoyhFq5ZE9MBw0/KSaamtKzJ24tEWM
 iMPX1QUntrll0LtwiPuIOBa1OrIH+Ze/QWS8tHBaOQMSp8nKd5/CN0mkjaHzo2DtoQgj
 zbK1ethi7tHQLgvXIgtYK/7k6i94yeGJvd9P1CIIPUTdPZMotk+mpFEqElUsAJl0hcok
 ZpLzB2E/seuHDmCc3ZdAzwUNAeGMp5NUSZmyNSe/uqzg2GFObsZufqruvUArRCN9XDvK
 AQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329780; x=1702934580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6IVD0fP181N6yKPURwFJTLnTnzSvk7D9idiGLSO6/Cw=;
 b=fFPXaOPdnJBwTwQpjbRvBECpJ/jLfsBlVLFNLxXRvlSZJ65S7jbJC5sBaA32K5tJim
 SLRsnIDKy4DhsWbMWbpC4bklJ8yXp0pPnunDWFJCpNq714mj+n4dd4zBzLFC1Ql0YLTf
 ygor7hQIQNIX8o5XL+yWPxxAaBoBtxyDPkwEbJPrqFcStYCbMdHgAecgBLkay7/LSlH3
 Fl8rJABW3udr1V1xj9rtco/nReil3D/1pGQ+7r8+xH2zmq9kripV8Ba0nbtOZAtgWNeJ
 EPUce0JSeMW1VQttpXlG2qeWJQF1QQe375bSPUGj4T9GjXId/dAMzPe1U1nlVdV+qHW9
 mhJg==
X-Gm-Message-State: AOJu0Yz9hNDnev4NOgRPc/k7CYtV9YSD6hkZ+kabreBqO8rnC8C2G71S
 7kUEUlU1Z1R1Bpl9evbDJHRmBA==
X-Google-Smtp-Source: AGHT+IGImOxVOWgtEtRNbTpMP3VyoEVtcVk7T/kTyJSDnJhEjGlDz85TYtGNSnv9pwyCRPaMJL33wQ==
X-Received: by 2002:a05:6512:610:b0:50b:fbbb:2035 with SMTP id
 b16-20020a056512061000b0050bfbbb2035mr2542678lfe.97.1702329779237; 
 Mon, 11 Dec 2023 13:22:59 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 vb5-20020a170907d04500b00a1d885359d6sm5283778ejc.46.2023.12.11.13.22.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:22:58 -0800 (PST)
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
Subject: [PATCH 21/24] exec/cpu_ldst: Avoid including 'cpu.h'
Date: Mon, 11 Dec 2023 22:19:58 +0100
Message-ID: <20231211212003.21686-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
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

"exec/cpu_ldst.h" doesn't need to huge "cpu.h" header,
but simply:

 - exec/cpu-defs.h
 - exec/tlb-common.h
 - exec/user/abitypes.h
 - exec/user/guest-base.h

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index c69f02b699..a115553ee8 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -64,11 +64,15 @@
 
 #include "exec/memopidx.h"
 #include "qemu/int128.h"
-#include "cpu.h"
+#include "exec/cpu-defs.h"
+#include "exec/tlb-common.h"
 #include "tcg/abi_ptr.h"
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "exec/user/abitypes.h"
+#include "exec/user/guest-base.h"
+
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 {
-- 
2.41.0


