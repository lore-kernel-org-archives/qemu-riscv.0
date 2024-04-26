Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8045C4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:49:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RUa-00049v-HO; Fri, 26 Apr 2024 15:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUA-0002XR-EE
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:43:56 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTw-0003D8-Ca
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:43:54 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57225322312so3650634a12.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160618; x=1714765418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nS9nr2d38U1wk5zUyYU/3btoMDNoRWUI74KASdsEvA=;
 b=g+Tkf84zsikpdMkMbE1hkX2lh2LBPmBiUoxePt0vAu4H3hyEJSkFWmMuxgt/baL1qI
 C1jWSFh0DEAU0/DHBV5XRYVo7eoL/emcw7cvaJhusHjEoM7NgzunVTn9w5mQHbOCRZPb
 9Fx6YQ1gjviUPG0yY84MdMxWwLXZsN3lJTm56eykf89e/Fx4aIPAhze+h7dfDrUQzwYe
 JYJDPh8ERMp1SykfA7eXkoZi8ERWdrTDdGwYScDRKEwQ5jcGa80Kq+VzO85tztFKkTSM
 OwucoPCEpVV78CZFbiSmiii9IkJT4rttSOWzKzF/QGLed+us+ohgd7j0W+rVfayB4rht
 20Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160618; x=1714765418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nS9nr2d38U1wk5zUyYU/3btoMDNoRWUI74KASdsEvA=;
 b=cDfFk72kj9nF0cWwVDzA7fo6/JQFEB1zy7Q7H49MS7HUES4Agl1zyeXrlc07ApSNPw
 qBcOM+/RGJgCxqRJ6WYLGs/RfWCyJyNHOI4NT72v+Kf+o1rmZPL7z90E+lCwTPMaMmF9
 G8ZhYC7LqH09KfNBKaNcHSpM12+iDvTEt/SCn+9nK1tXXGk7BWDl0ThsBlxsv2pSl9yu
 eA9GwZvG0WAi+jR8v9oeKtWd6TAOOng9lZ7rQddPpzvw6jgX5Oe1Zlikgwd0Mzq54hHU
 TpoNIFdkG5uvefQfBDGc6ObIwUGIlE13OUhEZzjnX7tvEswB1Owt61v5CXy+7zj8vluS
 HnCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBnhhUWXMVz68NaY4pnc0K7Eird9A7D1uyce/zcSNlMdFeS26hb59w4wPIJcvbbl1NTBE+H4ALGHJ0ycqclCr0ZTI8UoM=
X-Gm-Message-State: AOJu0YywWPmkmkVp4ykjfq6+QNEWmtWjCKY6POSSu0uKp0y5OCgDgjcS
 pcWSyRJhg96/uuddzr64zVp7brD+vYOiGHaA9zebJSUexIVzjm9wn78xsWWpHbM=
X-Google-Smtp-Source: AGHT+IFkkgLcEqcDSW0Ui8ShcNFYSkrX4TLF0fM4+LetiD/lRYegGF5SHEkan4MHfprzwRiXv0dvyg==
X-Received: by 2002:a17:906:f292:b0:a55:90c8:774f with SMTP id
 gu18-20020a170906f29200b00a5590c8774fmr2654479ejb.16.1714160617899; 
 Fri, 26 Apr 2024 12:43:37 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709060e0200b00a4da28f42f1sm11065387eji.177.2024.04.26.12.43.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:43:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 16/38] accel/tcg: Include missing 'hw/core/cpu.h' header
Date: Fri, 26 Apr 2024 21:41:36 +0200
Message-ID: <20240426194200.43723-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
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

tcg_cpu_init_cflags() accesses CPUState fields, so requires
"hw/core/cpu.h" to get its structure definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20231212123401.37493-12-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 9c957f421c..2c7b0cc09e 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -37,6 +37,8 @@
 #include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
 
+#include "hw/core/cpu.h"
+
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 #include "tcg-accel-ops-rr.h"
-- 
2.41.0


