Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8A2D637CF
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBORz-0000XN-5s; Wed, 13 Nov 2024 20:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBORw-0000Q2-OZ
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:15:08 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBORm-0002Bc-5v
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 20:15:08 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d4ba20075so85296f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 17:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731546895; x=1732151695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bnHexH62EqsPqSCCVFJiR18Ut4gF1uO3ZfHgDoJH6Vo=;
 b=Vtgnp2ZhmF8mbg8qcgqwNbIlVSIJ0JROwNloGWHWPg7UWDMJs6uZCmiVhPCoeeHtku
 ZCjoIx7hOCx6TStfaK2xNsTFWDEM4Bhew9q4lgs24CrOsy/P6DGVnvPaNLVXX8APvhXS
 3zqeQ3MXverlCxA7KjiZC1uTHmB/TZZgDd1n7A2Jic1s8A0mTKXdjGfDtZytdBcKv/JG
 7pjwhy80jqUiF6VnKmywe60hTKFDjq7Kf9hDym7kSS8BOKUNVJrs1NpE9WfCOS5h3Mfz
 vucWTsYldH5hha835pGsissDbCA+C+AUeBAnxnYlscb5D4OcWXgCYr8A+PXtLUrFxYAi
 gnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731546895; x=1732151695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bnHexH62EqsPqSCCVFJiR18Ut4gF1uO3ZfHgDoJH6Vo=;
 b=GjieeniJP2PMR/t6J4uBs0pmakHVctdsq6eip546t/9rC5lMt0gc4tAwtfq+u67hVN
 hUfg1x1N++GYoeQooKCd3plyxqYaNbE1gnXdKirOpe2NMlqpprwki1OOIxqm5fINlL5c
 2pUBO33f2V0AO0I/lf+NNpQddXkL3U4JwnInjux49S8KN3X4pGnVnPhpkpa7NYHUHZX3
 1wOZlD/QWSHIRSoT7H4BP2mxIzdkFYpSutb0PzoLNeGfd7Ly2TukK4ySaTJ9zR4HYPjz
 Mwk+xksi8WrTi+KCusiwz4xQUTvdZ9zt6j/RI8QlcME3ngQjUFBWfe3BiV6dqBPBB47X
 XABw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd/xeeRmuzLkAbqUsxHKXQd0kenJD62WC58/ucO3FMDZtEBzZqAGHLiAVYuZNKf47zFbsJPasXZDdl@nongnu.org
X-Gm-Message-State: AOJu0YyexRrPHgp8wj3KIXJcPfbOEIN40X/MLOMyF2EB6NJIXgsSLRAS
 UwGUri7PguXkoOglZUPI1l/MHOzZwmJRBTOjoftRwQx38pab96oz0VjKZnmKLHI=
X-Google-Smtp-Source: AGHT+IGRRIBLDqHxwGvygVd7DolZQGg3AA35b02RB8xxCyDjdgNLnjdc3+2vgRQgLmodm+ip4IylVg==
X-Received: by 2002:a05:6000:18a3:b0:381:f443:21bf with SMTP id
 ffacd0b85a97d-3820df5bcafmr3699799f8f.2.1731546895166; 
 Wed, 13 Nov 2024 17:14:55 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab80869sm1502515e9.22.2024.11.13.17.14.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 17:14:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/24] accel/tcg: Have tlb_vaddr_to_host() use vaddr type
Date: Thu, 14 Nov 2024 02:12:57 +0100
Message-ID: <20241114011310.3615-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

abi_ptr is expected to be used in user emulation.
tlb_vaddr_to_host() uses it, but can be used in
system emulation. Replace the type by 'vaddr' which
is equivalent on user emulation but also works on
system.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 3 ++-
 accel/tcg/cputlb.c      | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a26ab49b0b..769e9fc440 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -67,6 +67,7 @@
 #endif
 
 #include "exec/memopidx.h"
+#include "exec/vaddr.h"
 #include "exec/abi_ptr.h"
 #include "exec/mmu-access-type.h"
 #include "qemu/int128.h"
@@ -330,7 +331,7 @@ static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
     return g2h(env_cpu(env), addr);
 }
 #else
-void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+void *tlb_vaddr_to_host(CPUArchState *env, vaddr addr,
                         MMUAccessType access_type, int mmu_idx);
 #endif
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b76a4eac4e..080cbcb34d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1504,7 +1504,7 @@ void *probe_access(CPUArchState *env, vaddr addr, int size,
     return host;
 }
 
-void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+void *tlb_vaddr_to_host(CPUArchState *env, vaddr addr,
                         MMUAccessType access_type, int mmu_idx)
 {
     CPUTLBEntryFull *full;
-- 
2.45.2


