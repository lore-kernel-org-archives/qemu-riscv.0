Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB332CCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:05:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL1y-0000zi-9S; Mon, 27 Oct 2025 07:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1O-0000d1-V1
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:19 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1I-0005fl-96
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:17 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b6d5b756284so954295866b.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563036; x=1762167836; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MFngHGehXpgcde25fEDm3yIeCRkA5CYGfoJypWa7UA=;
 b=A3HiKZAag/VDzVesdW8W4BzzVnQ9fQelHdrZha6zAdsN1IhDvaYM2QqkLblgo+w/iT
 7R/T3T++7LRK1JI5crVUUJjbBEkpr3kcNrG7MKXLZ3bQPlOdt9HfI5xeHNEU08V+fpdd
 F5PG0wV/GbyLLi/DOIJZlyQzgvvtPaX3q7s8U07RdZQbMZJgTw0hNxcpaisRyYaUtg8S
 1dep6JMdfEVtdrkF4t7c3POCAcD6/FURfCIya/d68TKwB6ZDCFM5BArqbLkGtG2yFDJf
 cEbyrhPA2MOiTVusla+TOMrJaTnwBhep5J4p62h0JrxCU1cKxygllqgOrvCjf8dnXewB
 N74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563036; x=1762167836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MFngHGehXpgcde25fEDm3yIeCRkA5CYGfoJypWa7UA=;
 b=TkADaZP54sCRodhfxtTiP2LC6fHa5hLKA0lyC6qy08laG4znnCShY753GCneZU9Amc
 KwlE+lNyBqlVVqvSFtXA3JVFPIlxmCm2BccSFmPCT/lvzZNO+oNil5vLSLHOgSxxPHIN
 Tgd4dQlpqklEPadW1GiB+EQfGU9QGyMqTjJr2KBwsZ8mPmmTt9CLimviToVFkdBQBHAd
 Ydk2C2NaXCgD50EbaiZ7oSaJ2yaN5nueBNKCOl1gOGDZa31+khmFmzD+jp63iDhBgCOT
 Akm8yNunqpYgMiRUxNmEnHFufELQMnO9S74KRtPWcRBdZOa1KXQ5rMNbDzNjCWCR7ZgQ
 B4Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtn6FZNv9OjCTEkTDpWQ/ENx1isnj6KhU8+retPY6Fgj5/eo22UiH/vT2diYBI56wRQnUki0+okTYg@nongnu.org
X-Gm-Message-State: AOJu0YyYh678GYJjiglmYfAH7A66N6VCa2bBTacxl6pUMNVP3tQemWMp
 aFdbKQ1TenkvJ8erSLokZSc2qHy7FeWfCPnMe+KZgyRA8gMPGUVt+w+rsAYLp34c1ho=
X-Gm-Gg: ASbGnctdb7b1mrD5w8JL9NrT3HBNudxpdhrMdBoXCiaCIzAcAfMWDVQq0tq2zLtyI9y
 MP65mqHv6CQuYN3sq0mEryHv/eEAu1S/d51vuZ0nzrTbPPgnpPwpXMW3yhDdYRASlqAkwr5U3CQ
 wi6hBOnTRfSXEB7UbcoNr161N0yOKtrrjr+kXIbMdpCkXA11gXNrAnHV+vmVcsmrvi86K6xbxbC
 8uwn8LaUc8NNDYLWMgQ479M5k7YVCq9nZB+IJKtKkdTQ2N/7MEkz9Z+lboFwkdJxhbsFvk5/0gS
 kBxZ7FeZ+O93ARcgfC7YZAPeLgn9i02e7uM49YsMusGvyGfc0PNC4tczK5zlPQ7qTEVnPQ1/puc
 HsI9xrVnZkscOW9CmU+H0Ur5H4AUQfLhyuEusZ1FSXRwSRezb3rcj5Xx2qggCfpCE6ilQ9ZxrKT
 kcjt5srYvxO0Q=
X-Google-Smtp-Source: AGHT+IH3tkpPI8qkMNzSSKaTH+LGz+PSEOooZ0h8e2NnoKxhhJh8kTHLf7OwlNmHT6Lz3ZHEnK/s9A==
X-Received: by 2002:a17:907:7254:b0:b6d:6955:aaff with SMTP id
 a640c23a62f3a-b6d6955aeeamr1290331366b.63.1761563035774; 
 Mon, 27 Oct 2025 04:03:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85369697sm757955266b.26.2025.10.27.04.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 528BB60A0F;
 Mon, 27 Oct 2025 11:03:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 13/35] target/avr: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:20 +0000
Message-ID: <20251027110344.2289945-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places the hook for AVR targets. That architecture appears
to only know interrupts.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/avr/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 4b29ab35263..365c8c60e19 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -28,6 +28,7 @@
 #include "exec/target_page.h"
 #include "accel/tcg/cpu-ldst.h"
 #include "exec/helper-proto.h"
+#include "qemu/plugin.h"
 
 bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -102,6 +103,8 @@ void avr_cpu_do_interrupt(CPUState *cs)
     env->sregI = 0; /* clear Global Interrupt Flag */
 
     cs->exception_index = -1;
+
+    qemu_plugin_vcpu_interrupt_cb(cs, ret);
 }
 
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-- 
2.47.3


