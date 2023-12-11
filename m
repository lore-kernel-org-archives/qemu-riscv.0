Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37068C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:29:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnis-0002oC-Ml; Mon, 11 Dec 2023 16:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnir-0002iI-Dx
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:53 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnip-0005dZ-Bp
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:53 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55114c073b8so2373871a12.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329710; x=1702934510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctY48Y/OwHlinQy0HeLOez7IoCqO19a0AzhAC5KFtJo=;
 b=D5pE47HhTN4G+oeoW2jLbaubLUYS85QF0ZLMYIPk91EJKHyIIy3Et77wqQM0im4W0z
 +n7H8VSwDCw+oAarXXatujVm9LQQbQ90gVcntBnMmlW5NO9yir+xEmFktDOLJMBZjSvS
 xJb0gDioMCCuBbAsqjtQoAShTPms2G35OPtOcjDvMmjHb07KuGpg+W9H46se9EeitnAM
 M0gcTBMB6FOk0o6woN2nLUK7Flf1xyzK5p+awdC3/kKGZFXMRnzF8+UXXTrrRzFAvbAV
 6fPJ+qeL453oZzdSKbl+IWridNcZVtOWGsSHotAGP2EilF1LbJGvGBYfIvFZ3bXeTUZo
 ofaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329710; x=1702934510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctY48Y/OwHlinQy0HeLOez7IoCqO19a0AzhAC5KFtJo=;
 b=rb9oajcfoZtMPm1C6BWxHwCca6w22Xx5SBjqPIl7oQ64bZZ9IRGV46JYFnM1aMJR0T
 pQXHeU2mJhg7s8TLSYtLtAJYqn6ApLCRkyFBYy1/3CdcLwsaiVwkZsa4jXtR/8yXAFA6
 /a2sc5BAddZA3PJmZWpkmT3l0NK3hmq1VflQGFcLeQEI/4B2u/1VHL11Wikcd6OB9bE3
 kl/Ob9RuKECpKEnYjmeeaQZhKIa2dcIO639YFUVGXSHJ+M611QPuCP4ThOfIgNm6ljjE
 /V0STLxJHcbz+h9uBmWJoRMh5qqiZHLWRBBBBpy+5G/EvqP0IVXTGftdCY8joZr7DWhj
 f61Q==
X-Gm-Message-State: AOJu0YwirU12DK8l4UXNs5sMAVDYva5rli7fXhM3UeswPuqpW0FjAB+E
 ipHV1Tfh19jPOm7z1WXWVeC+kg==
X-Google-Smtp-Source: AGHT+IGCuHPmu7XBcoyZGbS/1vv337vHf9v2rTtqCVC+z2TYZobgtGzbWjHW3TEMn/IMi+AiZLh79Q==
X-Received: by 2002:a17:907:94d4:b0:a1a:8399:e12d with SMTP id
 dn20-20020a17090794d400b00a1a8399e12dmr1806037ejc.64.1702329710085; 
 Mon, 11 Dec 2023 13:21:50 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 wb8-20020a170907d50800b00a1cb351dd4fsm5350843ejc.9.2023.12.11.13.21.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:21:49 -0800 (PST)
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
Subject: [PATCH 12/24] target/i386: Include missing 'exec/exec-all.h' header
Date: Mon, 11 Dec 2023 22:19:49 +0100
Message-ID: <20231211212003.21686-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
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

The XRSTOR instruction ends calling tlb_flush(), declared
in "exec/exec-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 4430d3d380..3bb018fbae 100644
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


