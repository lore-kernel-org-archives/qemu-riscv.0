Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAz-0008Tf-HE
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAx-0008Og-H8; Thu, 31 Dec 2020 06:31:27 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAv-0007Qz-1J; Thu, 31 Dec 2020 06:31:27 -0500
Received: by mail-pg1-x535.google.com with SMTP id i7so12955354pgc.8;
 Thu, 31 Dec 2020 03:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWM+kTYjj9Bpljg79k7k668oCfycu7Qc997VeKfS2hw=;
 b=OilKDSvmHFw7CJOIQGGaWwf7EE53Cny9C2j58ozoR1HUNhtZ6Wq5XQXfGElAmj47X6
 Gxpsd6+eRQNK/0VPhzsde3B21A5jCJnYEtT54TbWyJ+Q+u69MWJZ3zhNo5KhH/Jhxfiu
 llPzHtSKHvL3wYC3p7EntHZ63JCjSpcZuSLxfMbd7sBJCFPEMz5PyqzrQKjRRiwIe6sz
 zXHBtVvUM84lKnlNUXsGSDKbWKt7qGq0nsb1O1uqkZQPJjjs6y+df/fR1CXG8c6obD3T
 rcw+cIVfpUL8YzOsXBnbxrqEOwt3ok2L7URPN6u0JRuYqIMKTGnzhFEEMDhKCjJ9w+Op
 RgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWM+kTYjj9Bpljg79k7k668oCfycu7Qc997VeKfS2hw=;
 b=tj7ibC8Xapv01kr7BhYfuiYuKBNFOupu6Ct0IlZ4WLSS8Qj6i6TkknTnjJO+gPQsFB
 nL9G+sFVhakkc9N33lL9HqayP8WVAotqzmb09wq2IiLwK3c7bqIuAePaJKObQSO9hGNq
 8bdnvp8RCL/JvOmsVcGOn6bny7Uwq2KvSiDtmULp70RuIcby9s6FPxjLs1bOBO72EK4e
 s5tNFB0T/hNDyQD3ekivrLDPFM4Qu05ovVyfncePm9xz2/nVTn2LWHAZNiJuBSJ7g9oE
 RHmFTrP6sSGSXKOPhduqS1fv/X9O8FBdqtfr2NKKvkYDMRx2UGg9kHHIDYLgDzrChU+6
 Smrg==
X-Gm-Message-State: AOAM531n8FZOB9dlTGJkP9Tt7ewwGJPN0b+16dHDy5EzFC20QcQnpwTL
 z9YxW7r8r2rQO2ZWksWl5WI4CKJfnRo=
X-Google-Smtp-Source: ABdhPJyxYU6clzd5LRZpAwC1wsOXm5cB9TGOY1O2BojzmigilAYq+SoBn9xiQ+MIsuyY2Ob73U5RgQ==
X-Received: by 2002:a62:7c01:0:b029:19e:1e23:1821 with SMTP id
 x1-20020a627c010000b029019e1e231821mr52728938pfc.72.1609414282965; 
 Thu, 31 Dec 2020 03:31:22 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:31:22 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 19/22] hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal
 value
Date: Thu, 31 Dec 2020 19:30:07 +0800
Message-Id: <20201231113010.27108-20-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:28 -0000

From: Bin Meng <bin.meng@windriver.com>

All other peripherals' IRQs are in the format of decimal value.
Change SIFIVE_U_GEM_IRQ to be consistent.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

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


