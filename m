Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8414DC02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:27:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFAn-0000T5-0l; Tue, 21 Jan 2025 09:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAk-0000S5-Uq
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:07 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAi-00031X-6z
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436202dd730so41437215e9.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469442; x=1738074242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFAdNtSt1Vac9l1lQj/iEUHKax6ecgV2tBSS3BkOMOM=;
 b=N6xlUVlRKXXUos8vRWessYSLKiRPyVgDGQHbzJiWtrBb4LBkrhBlXMGryOlk1vUTkF
 8ppmQfGS892h44LbQyfIRmjcheQef3tzyUYQOGa4EB6Ds++/7yiZADy/XM89mNzDOVLJ
 vvnzhjyCRqelph58deXNTWvgdsiFrSjSww1qxHEVXwM+ZAxcy7jka8rw/k9gbGvlXCVJ
 cFii7ao+Up/9Lz4iica1u8LoAUlLYQid/cHibmTdR8nKj47q9a6MzVD8P8yL45tiB1CM
 jubUqoPuSx4sAHa2F9kJEA+PXM6rJwJKnLEX0L/Xkz/nT0+D6hS1dBYirZH4l0twNtDG
 kUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469442; x=1738074242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFAdNtSt1Vac9l1lQj/iEUHKax6ecgV2tBSS3BkOMOM=;
 b=l7kLaWLJ3z41hUig4Qgu3V4vi927z/h1QkkzIgQ6rWhMZdcdcrWl7IGdqM2AWHPeID
 HH/7UbScDIlnp8o7Ft+Y+VDcG5FYlbtGOYo3T1YoBAbEWwaRKENE3ENlM9HYE2eeWwXr
 sd2zT7zdWK2tiIvBL+a3H3ElkONQTbgww9TZzV1l3NyDpmm9/y09/25cNNyhYZiXn1Qy
 7+fM9fykixm3tfT7t1yT72m1opkYYQ5gcBLt2ledPsYDl74OghRZOBk2ELUYLJzXo3un
 bRJ+P+eb9e/mhRIJgdo6EQeTzvuNohJZHrUBisgDhoPLD7/sqgZ6XIZerbBn+g/16yd1
 rq0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf/X30LwLvMQd/Uy70nPiQNQPeQqYV6tJXWwy96x/QmFBENo0BoFxC4chlH9VFIK97mpKXjiTQqY2t@nongnu.org
X-Gm-Message-State: AOJu0YzZRHDw0kIOKdWxlv2cxK+RE/3SYzFmorfNwI1+ae8PQ7pwPWFq
 fUWX+EpXH/JDnRmz9BLO/voeicM1uQBB0ImrfoV/NDqW1fvmnzh3ILoWWNDEFLM=
X-Gm-Gg: ASbGncv6++IEEgt9pu6vm6FWaUkvznOFZEuISeoQnrTGG19rpKl2dPiVcf9JuRIKw+B
 X0DBHuT217NbakKrLzqRftrASO9UxwnFRDPzm8lHw0ko6HCHXry9dBwY2JO94jlNHr5Pv9/esDQ
 WuNOj6NV0fL7LK7WvWg9rMXmwADnbKT6347MkOTiqT25yvsbGQZZVQ+2xNTJfBfhaMdR+t8EgGi
 D3Hf+GKozWppt0D50tE0hAOx4Og7+dfOnY2WKZhXbVbMgVLS2DN6F+aMNORCwcwMfnARDRVGVLt
 LfEJdwJnn+dGr8FMHofgEtc0Sr4hYhdtZCStCs9GA6js
X-Google-Smtp-Source: AGHT+IF8EkOmZIKsyhJCbT2LadC5Giexa7uQORK2zEjITVG/7BmaMjTO6X83J1cyu1fKyFMtZq8hwA==
X-Received: by 2002:a05:600c:34cf:b0:434:fdbc:5ce5 with SMTP id
 5b1f17b1804b1-4389145288emr173734005e9.29.1737469442591; 
 Tue, 21 Jan 2025 06:24:02 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890367b48sm180702695e9.0.2025.01.21.06.24.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/28] cpus: Restrict cpu_get_memory_mapping() to system
 emulation
Date: Tue, 21 Jan 2025 15:23:17 +0100
Message-ID: <20250121142341.17001-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b7367f6d808..2402706c7d9 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -614,6 +614,8 @@ extern bool mttcg_enabled;
  */
 bool cpu_paging_enabled(const CPUState *cpu);
 
+#if !defined(CONFIG_USER_ONLY)
+
 /**
  * cpu_get_memory_mapping:
  * @cpu: The CPU whose memory mappings are to be obtained.
@@ -625,8 +627,6 @@ bool cpu_paging_enabled(const CPUState *cpu);
 bool cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp);
 
-#if !defined(CONFIG_USER_ONLY)
-
 /**
  * cpu_write_elf64_note:
  * @f: pointer to a function that writes memory to a file
-- 
2.47.1


