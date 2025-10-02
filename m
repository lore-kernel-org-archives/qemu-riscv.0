Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7253BCAC5B0
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 15:00:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4Kle-0007Rm-Lt; Thu, 02 Oct 2025 10:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4KlY-0007QA-Ih
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4KlD-0000Ra-77
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso668315f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759417093; x=1760021893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7o+nv06XBHGB51yxt1OEKJBgV9gHbisZFhpgcb1BqQ=;
 b=ILNAH/N+eJ89W46LJ28mzXRPxBkiTvXQehJSLabJj5HB8cvGREYVBhvBh0w+KekHnw
 atQCJvwjLiqXxgrdRdhZ9PnslbbIkS482Eph/aYSyOG/idDCRTj3gQLfLXan0guX2ymf
 yQK+N1va+aGRuKEuYWoVGxvY4K4CbsrM2ah/jYG0Wpwf5WXUcdP5Z13pSy6XfceerhbL
 ZcCuyFVhEczLY7Gv5riRB88ZVdjlWZaeslnCBaBiEQJTgWJej2lPVhWIZ4qM6WHqsWOv
 IUvDcXlHp0g3e8XcA9UmbBFC8hiaSF7j0Jc+uWZTB+4Uq2aQDnNq43t1OJxWDoZ2brL4
 PbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759417093; x=1760021893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7o+nv06XBHGB51yxt1OEKJBgV9gHbisZFhpgcb1BqQ=;
 b=SXQcEra65zAmM3hS7ebJT3ZtlyZ+p2tP62ldeTn7L1lxNBvNypoqHAMxTNBbrJHces
 Cm4eCZEVMFabh26yPA3zoGTMZZZK7y5aCyJLfArvQcf+dXJqIa72uJKfnIZOxUJUdKse
 v9Qcw60eNN5YkFJsoFuEKihmI2ZTW9b00ejrybsTpTOcssM6vfvKJy7bBJHl17+gBnrI
 dfTtlj7vvZ89VbzOmel2q6Te2mqa57GYpHfv7RDm8MBYIpcXyeFIoplGpISKqzYNcx3L
 inX55htBbdnfuptb0sqjp7K13iCJyMjZ5UvoZrIfCZZJaSO0DumK0riqpLHDG23QiQcu
 /CqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUII+iaOcVx+zDOql25Sz0qZgw2u9Ld+Rz9e73Kw7dYld1EZMRl4+3lrxO34pN2aStz6U+sPStPqOso@nongnu.org
X-Gm-Message-State: AOJu0YwEdyWNpcIl8hMYw0mueYAp8OBfNL+F3af/K2lFZyUS/jJYQLdg
 syDLn7mOK4/kbBch4pSiToS9fEJLCn901YhkFKsUVLFOxKQd13WxPv+yN+iUtOGsWUk=
X-Gm-Gg: ASbGncsyVl1vgzHVtrKLcFjX50IR/vFo3QyTzULXRkqPSvv6vG0QJ4njiJ3hT0ojhih
 bGiZfug97VWcZ41MCdMQy7zPB7B+2d7EYt5MT9ZgO+P7DXpdWp9+sc+p40y/PyUs7YKb/hNdmc0
 dwM297BYIGQAAvN22Kw/IlSHt8RTo/KNVqT0SJPd5qyzpR46PYn9KX5aJkLVmCiJDBuJOU+cNjy
 0D4odz6Hn5kM+97Sn7i1aOjc4et+L/E2pAG9O3PqCG1Dj/BkxbXlKy7mjI5qXhWr2/pU9SJvCJQ
 Ip9OLYxzGWUyuJanXx3BHfl2moTcIhQWNX8dCQB4ShsypKpzOpcTHEwwL3+RFqcFRcMkAlJbRKS
 nC/lCliICYCGTjVFqmnsfg+yh0ZzMzbUyvJ12U2i6M1rrzCSsVrxqWL2cJOFiieLKep8Icel6EU
 cImgSOpB6cUZ9bO7MX/ormFzJz
X-Google-Smtp-Source: AGHT+IGgcSiU0b9GBRqG6rfyaSqarD8ZqVsR1xf3ArEYrltLFBpTzsVHviFtOEZ6iKGZLx6xGRRuDw==
X-Received: by 2002:a05:6000:2c10:b0:3e9:ee54:af54 with SMTP id
 ffacd0b85a97d-425577f51f7mr5180357f8f.21.1759417093270; 
 Thu, 02 Oct 2025 07:58:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6b23d4c5sm30631055e9.17.2025.10.02.07.58.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 07:58:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/6] target/sparc: Reduce inclusions of 'exec/cpu-common.h'
Date: Thu,  2 Oct 2025 16:57:41 +0200
Message-ID: <20251002145742.75624-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002145742.75624-1-philmd@linaro.org>
References: <20251002145742.75624-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Only 2 files require declarations from "exec/cpu-common.h".
Include it there once, instead than polluting all files
including "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.h          | 1 -
 target/sparc/helper.c       | 1 +
 target/sparc/int64_helper.c | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 31cb3d97eb1..7169a502432 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -3,7 +3,6 @@
 
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
-#include "exec/cpu-common.h"
 #include "exec/cpu-defs.h"
 #include "exec/cpu-interrupt.h"
 #include "qemu/cpu-float.h"
diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index 9163b9d46ad..c5d88de37c9 100644
--- a/target/sparc/helper.c
+++ b/target/sparc/helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "qemu/timer.h"
 #include "qemu/host-utils.h"
+#include "exec/cpu-common.h"
 #include "exec/helper-proto.h"
 
 void cpu_raise_exception_ra(CPUSPARCState *env, int tt, uintptr_t ra)
diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
index 23adda4cad7..96ef81c26cd 100644
--- a/target/sparc/int64_helper.c
+++ b/target/sparc/int64_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "exec/cpu-common.h"
 #include "exec/helper-proto.h"
 #include "exec/log.h"
 #include "trace.h"
-- 
2.51.0


