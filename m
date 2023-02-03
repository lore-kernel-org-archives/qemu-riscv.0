Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0WK-00027Q-ME
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WJ-00023Q-Ob
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WH-0000gA-Ds
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so6598203wmb.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8ALrbnz1qXI5HffWq09XMPgoWQJ0GtQQ757vbcP15I=;
 b=HNjQLyreQEHxmL4W5YYy8YHCmF9c03nB90ylx3Gfz/8BOXXhldHAP1r5R++XmzSCNl
 rFWWJv66Vr/SdTWnMscDKkdJ9tbO1E57TdJ+AA7ZNi8Xeg07whxkgN7lx/oLZednUAt7
 4yytnpoGSzrqy6a5UBBVj3SDHzmUyWuEkvejlSFB0HZEjbng9Ba6MjHOOvylEHOOWSgA
 K/b0ntaL861gYFFNwWi8qz9uDJSPe3ibknBqJlsnN+tiCWEY59OKNCYfnu+RAI50FkZT
 oGBLQi8f0LH/L8re9+heWSbcjX1jF3Sc5cqmoBUEE56NOafMiGzr3LQ4q+EIEA4/67sR
 m5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g8ALrbnz1qXI5HffWq09XMPgoWQJ0GtQQ757vbcP15I=;
 b=uq5Vv7reRlKvKZs8HdsMYvySb/qkPbySSpUN8ZQquzWgEZzBfJ+j6pea8u4PS8fyEW
 SOpQ24m8gpohGp2A1lUgTSpf5LQ/PIrIgZKqT2SzN7AzAkQjseOebhERvan+fHU+cz+r
 KFFLUABL489V3tCPjv8Sr7wW2j4IGyp/70NVl5WveOmWUj7vvyFHhiGBLUZDxc9VYbUK
 hR35coUMxzhK9lUCfsVyGH3LZsXP1zEDhziKRXuU6bdXNx8n97hcKsJGngADatpACaJi
 hTGze07apQGDbj5qbi1r8K5ufU65RppUZYjFKTgq0NXBp6/J/rF9ZzHeB2oK3x8NRKQs
 byNg==
X-Gm-Message-State: AO0yUKXeXhC+r698/jbRKfUSZ7EBdEPbggITBik9h8KG5Fxw3BkQzhKU
 ZRQuB27gCZmk2vkr43OI60acm2Y8C1mBlU29
X-Google-Smtp-Source: AK7set8PG6IaDQpUtiEDX8RAZ/u184k4sdrgwwTIbRLe5eDLtSWr7xojt9fSXQWnjl5g/d6qANkxrg==
X-Received: by 2002:a05:600c:1c0e:b0:3df:ee44:e45a with SMTP id
 j14-20020a05600c1c0e00b003dfee44e45amr1344963wms.15.1675447840235; 
 Fri, 03 Feb 2023 10:10:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0ac700b003d1d5a83b2esm8154958wmr.35.2023.02.03.10.10.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH 16/19] hw/nios2: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:11 +0100
Message-Id: <20230203180914.49112-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 18:10:44 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nios2/10m50_devboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 91383fb097..01f6d5c84c 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -102,7 +102,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
         MemoryRegion *dev_mr;
         qemu_irq cpu_irq;
 
-        object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_fatal);
+        qdev_prop_set_link(dev, "cpu", OBJECT(cpu));
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
         cpu_irq = qdev_get_gpio_in_named(DEVICE(cpu), "EIC", 0);
-- 
2.38.1


