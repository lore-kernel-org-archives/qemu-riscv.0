Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B1BC4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:48:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RVp-0002C9-1T; Fri, 26 Apr 2024 15:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVh-0001Uu-Cm
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:45:29 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVd-0004e4-7M
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:45:28 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a58772187d8so303594166b.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160723; x=1714765523; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzDVxW+21MsfKgGbGkgEmh47Dcww+z+68N+3YiFHARY=;
 b=aU4oToG0tAKSlN1+wZj99F14T0UuHK/yWR7XAFa62V361kLivQda8O27WUvOBjfgie
 /NEsG/Z2/grqaAOXrldw0OEeePly8aGT9iMAaJk8M2zo491DkWF7CaLU5iHok8VWxmxo
 14PDybByztY+HS8CGK8RlYh1QBEKHkRq+/h5soBfUbHJ9hcVeZP323W+SHFrUZmi+e1I
 eeAbcnpuApqtGZKJe17oi43Cxh/I5wrQYywtfevvT3DJwN8Kj2Z5C9T4jHsnjs3HhT+X
 VHrYhbEh3d+BYYw3abcy7fJ0MOqleYy4FkEYiqgzSXNPAWrIsolB86PmyEy+WoMAndX4
 WT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160723; x=1714765523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzDVxW+21MsfKgGbGkgEmh47Dcww+z+68N+3YiFHARY=;
 b=wcDgWLuikaDumoO391TNJsT7I0cofTIwcbhUQ7HAAQEBEun1AFQEvTww2cUOG58tDp
 pPZWS/+2lS4rge3rsJKd0xJ4/VgP3eIM9hhXufrrKu8gs8ZTqYO/pOusWWu9bVUqZzai
 dX8q1ZxkEitMilKLKKvIp/aVSrnEXvNY5vEW3i9FPfZ4tyEV8a/D1YY75ziMxtA9Lm+a
 Mp87BzN8L1ZlSqeSVQiT2eBaeptfDZmNUM9AXE5wsCM6VuhWxP9KQqcMw28uuuxR8Mfn
 OHK3WZkn/55KIAx854HLIPFs+rsTeOXctFMtLF/oqsuO9ANTyGgjoa6XL0hP3H7QkrxW
 l5uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOS1l8D1NBiUsZNB2L4PmMLTdys1uyWRco5hFCNGljfXdmkonotzGue3jgogKN3cRmsuCtwEdDwbB6CZ7oVj736FujKqs=
X-Gm-Message-State: AOJu0Yzgn1D1PoWbGaFCRx0oi5sJH0yv7xR60uprPebfJYm7bZXfnVpa
 t/1CxX5ROBM1tSB7mIIM+PzBnaXGwW460dytskzk91gmgqW/mD6wiyy/7aIh7EI=
X-Google-Smtp-Source: AGHT+IFbjzomzyAy10P5S8LAPy9pwi6u7Ad9NMmFM9toKajkmNMRwzbdJvq5YSQfLVs84Je6MszNjA==
X-Received: by 2002:a17:906:459:b0:a58:7ea5:c49b with SMTP id
 e25-20020a170906045900b00a587ea5c49bmr3257788eja.42.1714160723638; 
 Fri, 26 Apr 2024 12:45:23 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 z2-20020a1709063ac200b00a4e1a9e1ab4sm10875255ejd.157.2024.04.26.12.45.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:45:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Subject: [PULL 34/38] exec: Rename 'exec/user/guest-base.h' as
 'user/guest-base.h'
Date: Fri, 26 Apr 2024 21:41:54 +0200
Message-ID: <20240426194200.43723-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
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

The include/user/ directory contains the user-emulation
specific headers. Move guest-base.h there too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20240418192525.97451-15-philmd@linaro.org>
---
 include/exec/cpu-all.h               | 2 +-
 include/{exec => }/user/guest-base.h | 4 ++--
 tcg/tcg.c                            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename include/{exec => }/user/guest-base.h (72%)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 78848f018c..027f19e052 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -65,7 +65,7 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "exec/user/guest-base.h"
+#include "user/guest-base.h"
 
 extern bool have_guest_base;
 
diff --git a/include/exec/user/guest-base.h b/include/user/guest-base.h
similarity index 72%
rename from include/exec/user/guest-base.h
rename to include/user/guest-base.h
index afe2ab7fbb..1e42bca5db 100644
--- a/include/exec/user/guest-base.h
+++ b/include/user/guest-base.h
@@ -4,8 +4,8 @@
  *  Copyright (c) 2003 Fabrice Bellard
  */
 
-#ifndef EXEC_USER_GUEST_BASE_H
-#define EXEC_USER_GUEST_BASE_H
+#ifndef USER_GUEST_BASE_H
+#define USER_GUEST_BASE_H
 
 extern uintptr_t guest_base;
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0c0bb9d169..6a32656cd4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -57,7 +57,7 @@
 #include "tcg-internal.h"
 #include "tcg/perf.h"
 #ifdef CONFIG_USER_ONLY
-#include "exec/user/guest-base.h"
+#include "user/guest-base.h"
 #endif
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
-- 
2.41.0


