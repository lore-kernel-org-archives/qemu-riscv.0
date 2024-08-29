Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728C8C7EE3A
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 08:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjahP-0000SJ-E2; Thu, 29 Aug 2024 04:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sjahM-0000KX-9Z
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 04:40:08 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sjahK-0008Vs-JW
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 04:40:08 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff443so368443a12.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Aug 2024 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1724920804; x=1725525604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mbWbqYoyluppncMW0T7AjEVIwxQPlFi/vO8bJwXgZ6c=;
 b=fjZJ+RIFMe1XbnO+EUD+VCwg3d2XLjxxAbbbbbG3W8JL20YlihCvFsxJpwVTReueHz
 VybLMzST4ccQuuaCWFMr0BLn6Hh09z2bv9ELcIsgovl4oT/fniQNo16CedlDVblGdx0V
 oy9wDlKK6Ko2Q+lXJscK8gd0uT0yQfJIHvJt3a2kX2Oeau60KclWslrMb/2P3iHYxo/o
 TAgm2sk086HcVOM2ruJ89vRA96KBagVGdHSp5AXph5PYiOAw8FLmoMVhM+TJJmYUWAp+
 R6ZGGfU7m1kvUFEjxsJTtV3akr8GXpDb6YG6W4XHnMw00YNuScTQx3vXv+PfJ3iGyIfG
 VrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724920804; x=1725525604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mbWbqYoyluppncMW0T7AjEVIwxQPlFi/vO8bJwXgZ6c=;
 b=tpkWKbe+OZ6VIIdeJVITyNxwPCMnkze4TbJh0HRQA6ah5d36HwyrPqNIoJEHQ7F47V
 ZWOVkf5pVDNiT2UmNhrHrWr/QbdFD67jNBcJUY66SR3zVkCBRdfLR5GfdPNU3QXnSRVE
 11zSMT1h3zrodXNvr0b7PtNRqPeWMt5M4hm8Bd7ExKrGj/PQb1bcYwtgDAmPtx0xXnX6
 dV4vDIAc9WOD9F42KtZK53wYck8hvBz25FeFnBR87u/F+pIERyHxbPWjFYVdmp3LuoDU
 CWK8ahmZDi8ABNR88Nw6pCYCAFFBBHjha/8iVn4tpPaMnFh5QNL05+pjO+EebmoQ+tAI
 66dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqJqJPZYiUUpjFcWTZbUNYS1XPNdUieEFtvWcUu4v0TgW+eR+NI5P6QPyb1cLYpBQ6ngd/0t87C0iD@nongnu.org
X-Gm-Message-State: AOJu0YyaulpyuQ+5JA4rBZyYOKF/38lzCj6iitAXhEHXRlUasP86sKLz
 0lFxQQWfydOMNQsm+V89+2UOCl82iuUkrS6noy1vGVuURxRDs0NC0gjZVY76qdw=
X-Google-Smtp-Source: AGHT+IFnKVvj42PDH+02HJVgSs1VoNY05sXS7V13QqM9xpi37TZ3/5lYeh8H+bOXJM0eMyi2QdW0Dw==
X-Received: by 2002:a17:907:2ce5:b0:a7a:9f0f:ab26 with SMTP id
 a640c23a62f3a-a897f83b149mr134684666b.23.1724920803893; 
 Thu, 29 Aug 2024 01:40:03 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb580sm48789866b.37.2024.08.29.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 01:40:03 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Anup Patel <apatel@ventanamicro.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, atishp@rivosinc.com
Subject: [PATCH] target/riscv: Stop timer with infinite timecmp
Date: Thu, 29 Aug 2024 10:40:03 +0200
Message-ID: <20240829084002.1805006-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

While the spec doesn't state it, setting timecmp to UINT64_MAX is
another way to stop a timer, as it's considered setting the next
timer event to occur at infinity. And, even if the time CSR does
eventually reach UINT64_MAX, the very next tick will bring it back to
zero, once again less than timecmp. For this reason
riscv_timer_write_timecmp() special cases UINT64_MAX. However, if a
previously set timecmp has not yet expired, then setting timecmp to
UINT64_MAX to disable / stop it would not work, as the special case
left the previous QEMU timer active, which would then still deliver
an interrupt at that previous timecmp time. Ensure the stopped timer
will not still deliver an interrupt by also deleting the QEMU timer
in the UINT64_MAX special case.

Fixes: ae0edf2188b3 ("target/riscv: No need to re-start QEMU timer when timecmp == UINT64_MAX")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/time_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 8d245bed3ae3..bc0d9a0c4c35 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -92,6 +92,7 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
      * equals UINT64_MAX.
      */
     if (timecmp == UINT64_MAX) {
+        timer_del(timer);
         return;
     }
 
-- 
2.45.2


