Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A43CD1292
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 10:47:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rurvG-0003Yv-4D; Thu, 11 Apr 2024 06:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurv6-0003RB-DH
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:44:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurv4-0004T8-UJ
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:44:40 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-417e327773cso1604895e9.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2024 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832277; x=1713437077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EwoYTZWhIpfsU+7LZSduNtPHyEqtMdnhAHnqEMdyEo=;
 b=pjFWku9GGDFunh+xiDJKrJoNwOncYxEhPgPFW/6HAh1FpE4veygPGMaolH95MWsOdY
 dczW0gxf+aC/ehQ5YloRE2RUJWyh46d/9UpShf6BuxEf7HIqFJ0oGhsGPAf0AgVZV+EP
 7A1+y+HE8226hc/bGkex6Secn1oUCs25GtxtHG5r2ByGpoYVkVaKlvHHZZa+/7Gq+hkY
 Q+1egHchIQuxqETlCUcHYS6sTOzTMDMHCZKvPSZepPJ5By5GzlNpAEgwR4Gzuoboa8EH
 Wogdb1GFU+NR6pY/oD1Fuo66eJcXz0WU+EExULLUXiVxiHJKtkp59KKA0deTKBv0dx3k
 5DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832277; x=1713437077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7EwoYTZWhIpfsU+7LZSduNtPHyEqtMdnhAHnqEMdyEo=;
 b=ZDwWtiM5at9L8JPgIn0qOLeri/LklVMe7TmN8Adh1P4SEIb0x6CliBhIaXNMaWUpAQ
 5kjhWCWN2He0XqpQ6qXhsrAlpBWAm6YlyOqxgrM/tLKjspgef+lZi0fycAzEIovZJsN5
 ueU6WsCXrSmxoZZVO/wVDq5V0vG470Bk1xFhXOSuDx4V6UmiBiyhZbUp3//QcLF60ZI9
 M0YZdL268UwMM/ptP5acqkbSeqfWnJuam3e0koZe/LuQdv78PU+6+iLI8BtFid+LDuJq
 9AfQiaDLzNQtjtI3zifQ32sLHTs2V9+wC6bXNJ+5Gg6Zodxq7XVyqlu3wbNvzneQimTr
 bUgw==
X-Gm-Message-State: AOJu0YylJmuAhifJndFao9/O56RbXuD7U8YGYCUqcQO22lINZiw8VXei
 +9D/DjmBXqMprimkwLzHz1K1MCdCDabUslFWBGQirI9rtTP43IaLIjOPtu0KiPCBCgmz50igT/u
 TlNM=
X-Google-Smtp-Source: AGHT+IF4EhEoIekMENdgzJsSeEXW3/EuiiQkTJ312xa/cjAXW8GfW5oIS0aYD5Qkz9X2dhicVf5IRg==
X-Received: by 2002:a5d:644e:0:b0:33e:6ef3:b68e with SMTP id
 d14-20020a5d644e000000b0033e6ef3b68emr1785788wrw.34.1712832277566; 
 Thu, 11 Apr 2024 03:44:37 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a5d61c9000000b00343d840b3f8sm1463776wrv.33.2024.04.11.03.44.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:44:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org
Subject: [PATCH 9/9] target/i386: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:40 +0200
Message-ID: <20240411104340.6617-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/kvm/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e68cbe9293..a46d1426bf 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5335,7 +5335,8 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     case KVM_EXIT_NOTIFY:
         ctx_invalid = !!(run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID);
         state = KVM_STATE(current_accel());
-        sprintf(str, "Encounter a notify exit with %svalid context in"
+        snprintf(str, sizeof(str),
+                     "Encounter a notify exit with %svalid context in"
                      " guest. There can be possible misbehaves in guest."
                      " Please have a look.", ctx_invalid ? "in" : "");
         if (ctx_invalid ||
-- 
2.41.0


