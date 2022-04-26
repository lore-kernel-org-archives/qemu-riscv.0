Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njUIy-0005aN-Ps
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 19:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIv-0005Pf-Qb
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 19:09:09 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIs-0000Iv-TQ
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 19:09:09 -0400
Received: by mail-pf1-x431.google.com with SMTP id p8so102846pfh.8
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 16:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIhJjvdtwMf9fN0VbwYUd2bh1ZEqi1po1uEJD0OKMqY=;
 b=4CPZjG6ELymxTy9E41J/GxO1lqUzuZOPoFXZPEcueFcW3NnmQQGsIYoh4X551oUYQS
 AtLy0A6S1P8F6mcbwBuE7+9E7A/etQOK5+6sxhfn2rskYAIIQAXsJo9O12S8o6EXJnv3
 D8J+YPGnU3ncZF/1optWDlokLrQ37vxrOVHzR6s7pA/bCBta5rSncnCvjF34mL2puVjw
 o6G2N5ZwepKd9oOGoWEap6ZvK3LonJdsfk2V5JDdS+61IpOT+QQnmUW69MhAHdLR7txx
 6jfKSDRMOd9vuR/wBKphOu5+FmyhStqykJYZxBOOer1w9S+JzHMUherNzj1ZMt9LuTkk
 rQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lIhJjvdtwMf9fN0VbwYUd2bh1ZEqi1po1uEJD0OKMqY=;
 b=sC4xHtFYM/6TiMe0Et+WIx3416kMY4e+bV8frEhWKYPhmOs6v+y4lfW8L2II8JQcZK
 0UX0Ut2iFB1WNlpK9VM92HSyYTEQy3a1fU+vq71YDLvB1d0lnXQq8TeaMyIXL+z5F7Fs
 wKvre5z8mPCbp/XQ9AtH1DqXnTfdN+mE2JBiYnj9jj1zVp74iSFAlsmS93pD9QvZhe0A
 FLpJoLgLVwYoWaGO5UvyXPGp4G96D0WWV/t/D2rmKq93cRIfb49AtHR4qo37hjbOi4/m
 uhZKX4lJJj7ZhD7zpnPH2jmq/6H1u5Ae+4bh4vsUjp1w3iWfaZ/FmJ+O4t93Jotq7mO3
 OuuA==
X-Gm-Message-State: AOAM531RJOolZFr8mBjaDcEqxOMs9ML3tTTM6EfpKWmadi62dYDFwHWI
 wIFh+2pMyJ0HlGYUPI5c3EMZ6w==
X-Google-Smtp-Source: ABdhPJyDiM4WqaCNdplSxJUfza3RDrKlWx1WtnnlF5sCZQ4Khk+grWaMxtZ8EFvmKiJFvWfNqqZYWQ==
X-Received: by 2002:a05:6a00:238b:b0:50d:7e99:86d4 with SMTP id
 f11-20020a056a00238b00b0050d7e9986d4mr929143pfc.8.1651014545460; 
 Tue, 26 Apr 2022 16:09:05 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 t29-20020a62d15d000000b0050d42864753sm7856490pfl.49.2022.04.26.16.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:09:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2  3/5] hw/intc: Support migration of aclint device
Date: Tue, 26 Apr 2022 16:08:52 -0700
Message-Id: <20220426230855.336292-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426230855.336292-1-atishp@rivosinc.com>
References: <20220426230855.336292-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Apr 2022 23:09:10 -0000

mtimecmp is part of ACLINT device now. This needs to preserved across
migration.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/intc/riscv_aclint.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 1bddb99bda47..0bbc5e65737e 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -32,6 +32,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "qemu/timer.h"
 #include "hw/irq.h"
+#include "migration/vmstate.h"
 
 typedef struct riscv_aclint_mtimer_callback {
     RISCVAclintMTimerState *s;
@@ -311,6 +312,18 @@ static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
     riscv_aclint_mtimer_write(mtimer, mtimer->time_base, 0, 8);
 }
 
+static const VMStateDescription vmstate_riscv_mtimer = {
+    .name = "riscv_mtimer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+            VMSTATE_VARRAY_UINT64(timecmp, RISCVAclintMTimerState,
+                                  num_harts, 0,
+                                  vmstate_info_uint64, uint64_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
 static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -318,6 +331,7 @@ static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, riscv_aclint_mtimer_properties);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
     rc->phases.enter = riscv_aclint_mtimer_reset_enter;
+    dc->vmsd = &vmstate_riscv_mtimer;
 }
 
 static const TypeInfo riscv_aclint_mtimer_info = {
-- 
2.25.1


