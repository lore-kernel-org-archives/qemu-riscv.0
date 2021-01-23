Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GNM-0003rq-99
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GMT-0003Ua-5Y; Sat, 23 Jan 2021 05:41:45 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:32948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GMC-0003GR-Fs; Sat, 23 Jan 2021 05:41:42 -0500
Received: by mail-pl1-x632.google.com with SMTP id b8so4748725plx.0;
 Sat, 23 Jan 2021 02:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XV11gAa0FiYpl9jGReeHl+vRsCJUXpPRsTFXVz7CXvo=;
 b=QwTY8Ad5O/zS8wQdKHR/N+7oA7I8mFomf2xaVS8qBUHQ9rBQVoXQ+rgGVW21IG1+XU
 LtNpTKh/kQkjOBL9gKSMxmikqdMT6OUfoiYKNyVAL83OLm618w9sl0MgvRW5RP0goKsi
 LhYuKnPToEbyA71xhml9rAovLHX7RPDZAiDSebb3hAbeI4PoualqTqINgZD9WPCrJD5t
 VaxvGVpTofZNgns0LEgLgyfvxn2bYo3cG9cR8DHkbYOqs1864PSbvef0n4KwgPfkco2S
 c2RRwXLdK9qQSBgXRjgdTeM7G8+Vb4kJZ4DpxQQZp/EW6XzA3Zq/Up35bQpi8FPTqpiZ
 nsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XV11gAa0FiYpl9jGReeHl+vRsCJUXpPRsTFXVz7CXvo=;
 b=QmHBOOfdDloNsFBvy//vL7XdF6Mll4Bh6zCZ/sYxOGpIrZ9+OFGCD6+SawsQCt6OE5
 MnLgQmPHQYvihAAyVNyGheksIT84BagfhkVoeJ0U50m4oruhGNcusGKnNZjDaIQ73aki
 0N6zvLQUDfiJSec3F5QCCdVoMFNfN28MxMJ6/hjPbiEkSbk0FoVfnvogZT2QPLNY2hk0
 v3Y5ufnmkvNPepL2ehHvKj0LpuWm7GGUhM8ZuiPDqg3SZiL8E3m7XOMDYH9P0U4IjP6X
 TXS1vRZReYU+/1+EktVlJu9WeHjSa1ltYJuTDQBcXAVUFn1lZ9UJttce31nbU7+zenPN
 slEQ==
X-Gm-Message-State: AOAM532s4nUc8VOXj46w9fitBVYehFtlQsvBNFD0GYqFB6VVa/x1m3FF
 uFxft0glKluQbzJI1uWJ73o=
X-Google-Smtp-Source: ABdhPJziT0EZAq03NnMq6ZjN7KRaYxg9QP8bL5mJzV2BgKsnmWZCTKyt/Z9zihITDFpBh5NqHqKpxA==
X-Received: by 2002:a17:90a:c291:: with SMTP id
 f17mr10553810pjt.62.1611398481546; 
 Sat, 23 Jan 2021 02:41:21 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:21 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 22/25] hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to
 decimal value
Date: Sat, 23 Jan 2021 18:40:13 +0800
Message-Id: <20210123104016.17485-23-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Jan 2021 10:41:57 -0000

From: Bin Meng <bin.meng@windriver.com>

All other peripherals' IRQs are in the format of decimal value.
Change SIFIVE_U_GEM_IRQ to be consistent.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/riscv/sifive_u.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index de1464a2ce..2656b39808 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -127,7 +127,7 @@ enum {
     SIFIVE_U_PDMA_IRQ6 = 29,
     SIFIVE_U_PDMA_IRQ7 = 30,
     SIFIVE_U_QSPI0_IRQ = 51,
-    SIFIVE_U_GEM_IRQ = 0x35
+    SIFIVE_U_GEM_IRQ = 53
 };
 
 enum {
-- 
2.25.1


