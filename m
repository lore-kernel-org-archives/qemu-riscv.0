Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98A9C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:31:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxS2-0004E2-6b; Mon, 06 Nov 2023 06:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxRn-00038T-UK
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:14 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxRc-0004Yq-Pm
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so31041415e9.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268819; x=1699873619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+HrE2ba95t1ooYtGszc36ebWNEUF8WT6p6gpPtPmuY=;
 b=fzyOWbWY4jWCN7g0/rvVI8g/5Bdjd6C5sfGtpBo/b4HDMBPNSbN+I0q3U5SmnDKOFm
 RSfHuPhVQ9qSx8MSx95bl+TmJxflc6R3FBPfFrorOvuFrSvicXZZyUpqqPPzl8+wSJ47
 LSS9+0YSDoBP+F01JqXyjat5RH4mttoGI7v1mL0cTamr5ZulXm8ImneBoyyC/Tsywgam
 EBFVVneKcbLCwgUxYSevWFrGQCMT4prfZUTTSBFoPeGAueCw866Uc0L4M/PstYnNWhl6
 ft3Jai5zmbtvGtiOFIbWAuS1MLpe0NapWdeMyjaBmVbwUdQ+2wETErOhwqtmF49RFCTW
 pLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268819; x=1699873619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+HrE2ba95t1ooYtGszc36ebWNEUF8WT6p6gpPtPmuY=;
 b=wHwYXPkjr4uFTgnCB6z3WfFWgMTwabw1CKUuMdYURssmHRD0aJTCO60j1El9Usd+P9
 UyrHzR48YWECSuP6kAi53/66VeQe7/wl6vYNDykp8ovr1hg5WCq4hAztkmYKMZOU9qFn
 k7paC/8Hh4qKIc0FCc8LUFXgLu4IESt5uULnia0uc54vz7enYMTIAowynHy7htezYMTr
 VTFrxo7OdA2JAz6m84W7JBfx/fpOaDcC+5+0V40nVRGrnXKZEhg1a6xKZCIQlk0fjm1j
 O4Ej6HoYsigVo8E4H/dX0G60SXI5Q5y3U9f4xC18uZTBsXXHWhPBxf0nJyO74mug1ujZ
 zQ5g==
X-Gm-Message-State: AOJu0Yx6f//k41bP3hoYnixz0nQRcfPyoVvLay6H6vxTfYXRm/mVs+qR
 08ZIGuITN05pl2hiEtAxDz+zBQ==
X-Google-Smtp-Source: AGHT+IEt4PrEy7npLJh89eCdwNzRVAyjkPfVkzj/Lltpi44y5ZAeM5YDAM8Cq8QFxZb/uU2kaiqCHg==
X-Received: by 2002:a05:6000:12ca:b0:32f:76a0:a99b with SMTP id
 l10-20020a05600012ca00b0032f76a0a99bmr8610843wrx.19.1699268819099; 
 Mon, 06 Nov 2023 03:06:59 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a5d6644000000b0032da49e18fasm9178802wrw.23.2023.11.06.03.06.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:06:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Dongli Zhang <dongli.zhang@oracle.com>, Joe Jin <joe.jin@oracle.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 29/60] target/i386/monitor: synchronize cpu state for lapic info
Date: Mon,  6 Nov 2023 12:03:01 +0100
Message-ID: <20231106110336.358-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Dongli Zhang <dongli.zhang@oracle.com>

While the default "info lapic" always synchronizes cpu state ...

mon_get_cpu()
-> mon_get_cpu_sync(mon, true)
   -> cpu_synchronize_state(cpu)
      -> ioctl KVM_GET_LAPIC (taking KVM as example)

... the cpu state is not synchronized when the apic-id is available as
argument.

The cpu state should be synchronized when apic-id is available. Otherwise
the "info lapic <apic-id>" always returns stale data.

Reference:
https://lore.kernel.org/all/20211028155457.967291-19-berrange@redhat.com/

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-ID: <20231030085336.2681386-1-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231026211938.162815-1-dongli.zhang@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 6512846327..950ff9ccbc 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,6 +28,7 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
+#include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
@@ -654,7 +655,11 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
 
     if (qdict_haskey(qdict, "apic-id")) {
         int id = qdict_get_try_int(qdict, "apic-id", 0);
+
         cs = cpu_by_arch_id(id);
+        if (cs) {
+            cpu_synchronize_state(cs);
+        }
     } else {
         cs = mon_get_cpu(mon);
     }
-- 
2.41.0


