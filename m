Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449CBC04FF8
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:29:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxXRL-0003zD-Ps; Thu, 18 Apr 2024 15:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXOa-0007m0-4r
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:11 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXOY-0007Lj-K3
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:26:07 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56fe7dc7f58so1266560a12.2
 for <qemu-riscv@nongnu.org>; Thu, 18 Apr 2024 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713468365; x=1714073165; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMOTCzZ8G1QDoqpRuDm+110xUKe36YwlxUEiY1YFvik=;
 b=Q7WYsWSZ+N9wV4Y81fNy5BB3MIr7PNKoUY0ZECRnyrkpvvL9iBKP71IYNc3o9FYV/S
 fqsnn/qte7tZgNO8cVtB7BOdeNSZpy3VXmpzKubQtcGPaeQni7nhCQncwybTRquoo3TU
 vhqc0IXMvMeeMOoNxsc+yTBcI1AeyzJdFivQh9gBBozbHzDwiEGPNKGZ97rg2GeoH8Nx
 cKPkJ8aefyE+g7KjVC/2Nftx0pX7T/HNtAzKZ8p89HeX0D7QUtP7iErq+6NQBR47T3f0
 2UWThA3ztsI7N6OES/CGSf+0ZN/0aSJjDVUPYq+EDXivRGBkdpOOJJfpShhgmIZxC5YH
 /HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713468365; x=1714073165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMOTCzZ8G1QDoqpRuDm+110xUKe36YwlxUEiY1YFvik=;
 b=d/rS4lqONnABRsd0vVgBslY3hL+SztrUCScqfIa9EurDnKEWOIAHdgw6Fr0EnD2nW9
 C7b91OE5QJAUlzByIHog823ZfdOobEvSvoL0QdgknXjx575PHhX2+K8xtVCIBU1PwsbR
 wjouvckdS609Z5Ds7iMFEUmAhkPX4olcRU6SiC5cLb00M8973dY6B2DUKBldqyg62TpY
 +i2TJzk4mW92FkRZPs7dfQ6Hv+O1eMQ0A9jK5oBXG0sCgu0uACKqUsBnxGFz877J9Woc
 0syZ8hrTJLT+eYby657PkAM4rIDkreclynpg+qPf+UQE4wSwQ1CY3AWeBGoFN7KaBY/o
 1xYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlNhxHT0NCxpwtvGJm2konvevdYCVoH4/LiMpY/MM28wsMmn64TBO1qBbP20It46z9cq1UU0MeVcDg6rEOdyVSRUb4VLc=
X-Gm-Message-State: AOJu0YwmEFEQwxJs0XhwR1m/bzdIZX8Wzt0E0AM6+eygAfvahvcr6bJJ
 XPqPatQo0groGqc822ZgoVjAptnSIrZBTij1ZkS8KxLkkSr2co7FLPF0xJwp2Zs=
X-Google-Smtp-Source: AGHT+IGauXFub4OFdy7tZBt9c2yQKaEln2/oxE9Uk8pxg4A6jmXoRy5XQ4BNQTCVjKmFKW2y4HZUKg==
X-Received: by 2002:a50:951a:0:b0:56e:2fb9:66d6 with SMTP id
 u26-20020a50951a000000b0056e2fb966d6mr107290eda.27.1713468365147; 
 Thu, 18 Apr 2024 12:26:05 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 fj17-20020a0564022b9100b0056fe8f3eec6sm1194542edb.62.2024.04.18.12.26.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Apr 2024 12:26:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/24] exec: Have guest_addr_valid() methods take
 abi_ptr/size_t arguments
Date: Thu, 18 Apr 2024 21:25:05 +0200
Message-ID: <20240418192525.97451-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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

abi_ulong is target specific, replace by abi_ptr which isn't.
Use size_t for the @len type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index f3c2a3ca74..63186b07e4 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -92,12 +92,12 @@ static inline void *g2h(CPUState *cs, abi_ptr x)
     return g2h_untagged(cpu_untagged_addr(cs, x));
 }
 
-static inline bool guest_addr_valid_untagged(abi_ulong x)
+static inline bool guest_addr_valid_untagged(abi_ptr x)
 {
     return x <= GUEST_ADDR_MAX;
 }
 
-static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
+static inline bool guest_range_valid_untagged(abi_ptr start, size_t len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.41.0


