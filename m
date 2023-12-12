Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E883C4167D
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1z0-00009W-1y; Tue, 12 Dec 2023 07:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1yq-0008PX-8z
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:22 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1yh-0006px-3P
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:18 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54c5ed26cf6so7251115a12.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384508; x=1702989308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
 b=zwHbRq2awpGt5JlyY4dKfQyVMATxJjwGo5yHedO62OqPLt1NnnPFBpuY3utoy8ts7m
 FoL1xP+8BS2vEd2RxtLiGLaYbfK0I4meFcOY7wy8L5CTyxXEa54wnn62SujcXNthYIz7
 XYaaq9GLC//gVVzAA9SCfdXfUACS/vOiFXjdOLW3qzMzJM7hQr673DP1dgsB2jevmsl1
 Qb0sYw11KV8XVOwMuQ/5mEaxtProPlnZEMC50+GwfpYJV+b84UMqQ/yzEbEgQ0mxWlOe
 iMyLiz9t9MjiwRmIf+FjsOSm3W+qbpmuqKnXFLzYrAW88t2S/mKN7eSc3Rh7qZavKk6u
 mARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384508; x=1702989308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
 b=YQnzviCE6ZB/PAnv/hfyhQYtX9oTC0VJgReam/3dob0h+Bg8ZNpx6bzi2rVCsWcws3
 gXBPjKq7rc7OlhR9D4cgEbVfnekeSeOxrzXKPQBOhjaqj1w0ph1OAw/rWyb4eA3WXG7X
 1I+B2BlkW4UjF6f1aivLwevaEHfPfNrE45nXcxVMtWx+xrX5WUnrnR305c/XwxNS37pA
 nlGVzwiaBONF0x/PEnUV6EMpmqNnZAbmMOQn2tQO+22gxd7tGRo5Zzt7S8wt6CLwFpGE
 KSzEPcV+evoX/xhqa4ENoCigrDCmwIAdJyzUCUwONkTrcTJaFR3k9qsdcCYOv6d23auS
 e6Bg==
X-Gm-Message-State: AOJu0YxZiSJ0owAlIofHRXIOnZAx7g0TWF84M4q/mthxbX0XuvmIMbfF
 /Uf+OvSlgH6UPtz0JpzjnLqmPA==
X-Google-Smtp-Source: AGHT+IEt16zUWRyTHtNuGb/0o+4ATMzXgBovHPXmuXe8Ekl+s1pTnuW+RElZyl/OHB8C6idjWqn2/A==
X-Received: by 2002:a17:906:51ca:b0:a19:a19b:55db with SMTP id
 v10-20020a17090651ca00b00a19a19b55dbmr2697065ejk.107.1702384508710; 
 Tue, 12 Dec 2023 04:35:08 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 wb8-20020a170907d50800b00a1cb351dd4fsm6233385ejc.9.2023.12.12.04.35.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:35:08 -0800 (PST)
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
Subject: [PATCH v2 09/23] host/atomic128: Include missing 'qemu/atomic.h'
 header
Date: Tue, 12 Dec 2023 13:33:45 +0100
Message-ID: <20231212123401.37493-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


