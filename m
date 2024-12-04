Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBFCE77171
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:31:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvyc-0001sy-O4; Wed, 04 Dec 2024 15:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyW-0001FR-QW
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:27:56 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyU-0001VP-7l
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:27:56 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a736518eso2228265e9.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344073; x=1733948873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GnnholsvXz5CZtkYpeYGZkC8DvPWibSAfIk7aKacnw=;
 b=uYyGvG58JlzTGx5rVpLPfZ2LrWGD8dsWbtsIn9C26NLQW1zvSJnEDYLmlzbE7oEpOc
 5likb0GTJmdyxL/fyZw0+CXdL4HUE779RK9SPI2v+3hX18U0sGnmHhrYPsSnPD0z48gO
 CPqp9oPbSsYLmLy+CM3EXvDQJK1tCRoMf6ov+OPavCnDsQ/66A2OG8FWqcSt2+ApJBQo
 nbR5eq7qh/X1Twzxb8ABqe2WmEYPCz291Egwp/QPyoF2JYeaHbEWKBtFrp28O0A7IXd3
 xRcu6EAlp8e44cVJ4HRC4zFEBJrPVfocg8RKlxRdXSzWyJHt9nny8stR1aj5lj0C11rv
 xKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344073; x=1733948873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GnnholsvXz5CZtkYpeYGZkC8DvPWibSAfIk7aKacnw=;
 b=LLNGR4cvvsx+feud2davOE9ZgnES43mUB/SN0rIFogYVLE7jaw4Sp22W+4ZZUI7Kbq
 f7Xza36aaNVRlU5qDj55AwaefZ4L2L5Fb+qY3LgSqAQiUlRUFEQQQ21+7sxS5Zw5RehO
 Bo9hRSBp9mEvzImXQdlX7fKATsMSTq0D/65R/kvjy0x7lwN6nH4mUmQbHGCqIiF6/Jfr
 LlwoW4a5KQ/F3/8KggdmDY3cKjHG527rTLASSuZnxV1j4Vm6I1bgi5PSwIEfJx1SKHN/
 DoScla4UeZje2sETmFtcz91XmFA6yfdW3Fid++KaJ1sKDKILj72BBb0LbRSkEjj/TA2R
 GMCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7GR95y8lFUaDoOWkeXG4tzDQr70WdAqrWg6N6SeDrvkhBAF3bX8e7B2IHHS7dr3iEdZr6/LG/VW4S@nongnu.org
X-Gm-Message-State: AOJu0YzeN/YW7XCilOtnO2xzfr73cDKN9/PjMGkr0+YPz5Wx6iUZuzFk
 28NGE9L2MmH1u6pqVmJ6162/aBCHiqq2uJybvIgK+G8ecRiAtHb4FZdx/n6oSZ4=
X-Gm-Gg: ASbGnctD+QUZPcZzES9WyB0q3767DLCKrRn1XLlQnQRCK2ro8SQQ9jstDIyiFavBN4p
 RNzhosoVGRtVWTnYTjptBSUmnGhHq9oHRhJZVKKSzLiWC7Lvz/1UJmaVaWbttD6atndCEHOFG9Q
 VgiNJW1/w/0ft1plGXJfiY0sdYUO4gYkfAGcx7CxqI16scwsmHinMCP7XxJ+VoqJsMdpzFEvM9W
 a6NV9beGmZW51T/OwWyeZA+sdW0dHqBAAeYxy+CmJSIK+fLRiH+7/CEzuARdcLARF5C0SwU15Ju
 WyB+ktA62L7mlUEaD+IqNNI1
X-Google-Smtp-Source: AGHT+IH75Gz0sW3RwRPCapXCchZl0B/o8f7tlDV3JT97opLeAMC3ypqemf6zEKrUgpubXhMZp4xpbQ==
X-Received: by 2002:a05:600c:138a:b0:434:a684:984 with SMTP id
 5b1f17b1804b1-434d09b2f31mr80379895e9.4.1733344072767; 
 Wed, 04 Dec 2024 12:27:52 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e4617a61sm13704523f8f.3.2024.12.04.12.27.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/20] target/xtensa: Implement
 CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:55 +0100
Message-ID: <20241204202602.58083-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Implement Xtensa datapath_is_big_endian() helper via libisa.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Other accesses to xtensa_isa_internal fields don't
call cpu_synchronize_state(), and the libisa doesn't
provide a way to switch endianness from translation
code. Should we add a sync just in case?
---
 target/xtensa/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 6f9039abaee..7bf792fd0f4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -40,6 +40,13 @@
 #endif
 
 
+static bool xtensa_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    CPUXtensaState *env = cpu_env(cs);
+
+    return xtensa_isa_is_big_endian(env->config->isa);
+}
+
 static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
@@ -256,6 +263,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
                                        &xcc->parent_phases);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
+    cc->datapath_is_big_endian = xtensa_cpu_datapath_is_big_endian;
     cc->has_work = xtensa_cpu_has_work;
     cc->mmu_index = xtensa_cpu_mmu_index;
     cc->dump_state = xtensa_cpu_dump_state;
-- 
2.45.2


