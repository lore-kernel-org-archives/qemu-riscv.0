Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199F0C4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:45:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RUT-0003Mn-Hw; Fri, 26 Apr 2024 15:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTn-0001jb-Lv
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:43:31 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTk-00037b-36
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:43:31 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a556d22fa93so297623666b.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160606; x=1714765406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImXEe3AsI+IkHscdZF2OSgUHx6phFwxkW/+zKfz8Om4=;
 b=BSLu+ROaLKnJztDBtlI+JzJ7mc05sfBehSZB4Rnj19t/cPvC/New8fvqtT0NfEKOx1
 QJEmbqVi0EdWKTIVdXlXMHwJpoQM7M3OAE6k5inlK7anaubCg29UqHOl+YrmLeGfZiJ+
 TINyT4bq1yqxWgfgNE8bOzWH7IXcEIE577txzp/Hac6Cdk5Zq/9TGluo7gEOuh3mnPYb
 JpHh6amhV4Qno4Ul4gOX/WOSP8hBAvRRj78+BanHaUd3NGnW9rzEOgtTuvju6BYgqqPH
 VXYpYcYckoqSa/A+/+7bsaWzD94JgaqpajdDqtGp/kbXmtbyQ/ZFSuBxuSNWTiB5N41I
 O1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160606; x=1714765406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImXEe3AsI+IkHscdZF2OSgUHx6phFwxkW/+zKfz8Om4=;
 b=KV9crzlvjuDMzhDyR4xeG42+YB0KpeMpxk87T5Gpx52GbnMnoAOrCWsufGexQEGuUY
 p5VaS7S4OZ8bkpPWC+1QD066n7bHEiInoApi231qdq1cTrOaZ5wP/ae86ZrUfxhmcpbq
 JbrMS+sriAVti8W0FHrA+Bb6fFJFewbyjjGK/9gaeSDYqRSkTpkZ2S+qCHTcr7KIHaxc
 OiKBeHshtb+TRYKKsdkm6w/nj8MNb3erUKlIHAjdA5zPVjDe42w1qrlzf17CS2whKK6a
 GihAfwuRB0FFENZY+GUNpcuAH/odRomnqgN1dIlFQfQO6uCLUcoBUj6GTbS4W353G5tS
 PhUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbQZABcXYp2J4jeVHlpAcSrZKx2uIqGdGRDYJ14g1xAfMowmmlu8OdXNc+zKtlFnGtV027uI1ppFXAQEcFRdrFNtPb/nQ=
X-Gm-Message-State: AOJu0YxX1kt1anVNm/j5MMoU0m9CZI75PYnNj98vEhCq4AGxnQlQlM/w
 7V19IFO7QZNCKTlE6XSD5yMqxF3xr4d9CPcVFVQQE3mvoNm4jpjjnNSzmY7sS0k=
X-Google-Smtp-Source: AGHT+IETZwTb4a/21u+upB/lEy3ej/85A0BRlZkCkWx2rxIQGoA88FAGDYQsdKXyNU7INJJuCiipQw==
X-Received: by 2002:a17:906:af19:b0:a58:d757:66bb with SMTP id
 lx25-20020a170906af1900b00a58d75766bbmr1292294ejb.14.1714160606653; 
 Fri, 26 Apr 2024 12:43:26 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 bi14-20020a170907368e00b00a5588ed8fa2sm9358983ejc.113.2024.04.26.12.43.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:43:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 14/38] target/i386: Include missing 'exec/exec-all.h' header
Date: Fri, 26 Apr 2024 21:41:34 +0200
Message-ID: <20240426194200.43723-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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

The XRSTOR instruction ends calling tlb_flush(), declared
in "exec/exec-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-13-philmd@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 4b965a5d6c..ece22a3553 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,7 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
-- 
2.41.0


