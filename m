Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F54C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:01:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyNhV-0000p7-2j; Mon, 24 Aug 2026 01:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgY-00007b-7w
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:32 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgV-0004HY-Qy
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:29 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so3377178b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787551046; x=1788155846; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xOKtZQG0hnTTR9GYt3EONXbWo75FyZ9WOPDuoAjiEYU=;
 b=lUIqycGs/vL2DIKJdH5FGo0KYOM8JRJNJGCIYA2Vsectedvz9az727j4uOWVcZJW0+
 uo/7XJMEdktyCaLyno08MxC+nZ4KeTqXncIkn2/kgK20jSONDZxbr0zlr82+UkeXMup6
 JbalU3Rhcpf0rQ+3+BYhoOC0mWlbOr0aThSVkJbkjBpeIPI4V4KuvAEvbLlr8ht7EssO
 Y3Zc5Yxo6m/ngjhe9Shx0HOxt9WEH/QoB8xKc0IudaLG4cs+yn0Wx7FDYpGQ9tk57v9Q
 VAGS2ita89/X8hNZtZQvI0I3tcKAGVgnrQnwONlRKeEM4BlfdKDumk8srjOLOVpz1uDM
 v8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787551046; x=1788155846;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xOKtZQG0hnTTR9GYt3EONXbWo75FyZ9WOPDuoAjiEYU=;
 b=qN/xHLNTAhXCjmBJUNkyHkLSJ8zdWDZ5inO6ZtFpQt6FJROfTA5CTi5V1GMVl3kp8J
 ANiclqVwYlPSfHIgmySdE+TQ4sls1yPJZyDPOtYQl5NlbnZKZ+Rj27NeIdHdED5yVsn2
 P3L3JxCK8Gsl2Ru5rZZYNmi4AuJ7ybt9+pW+ezL8ktgarGRxevwHJcBbIYogY/OONkjS
 pntb+iq0RKdblRlcwQIy9FqaVU7xg3U3XUrxCx3sIQ8JrPJta+yfd0/ISvv8APRhgU1T
 1kd8RrMrw9TkfAjEHqzZvufXfnUF5fc+T6x79Al2YroXR8cCdBacCS5HBHBQfzbJz2tZ
 65hA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpgBFmzNUbImeayegeJBTy21cy2tVrmaZUFQCPWFyuchJLMWTZ9ZMn4XCl6nLH6MXa3+VALtXrzUjdb@nongnu.org
X-Gm-Message-State: AFuF++mz2HZ50ZE2Lq3xBKCcN7nfY6VjgroeEQaqzTRm7d2t/pBpeqEx
 x5CEMJqkwlhF33W88nNxWiQDXpGhKfA4QKhl+qPSsj58+OSU8kYP9mU1
X-Gm-Gg: AR+sD12j6s/zSCeAL75QUFDtK1eoJp8MK2NSMa4ulOAcm5AFkGbCoBQbXVROOXRDzVv
 6wawfPfqxbFqdI/M5vlFdX2tJES6RXazKwkM1foSdfLM4fwI5fVDOVd81WRS1nmQhv8NvdwA/i2
 +YlGicN4hjCksPFrTqS1RC+n9DCKyn1rGPT2ciTUjcr8PN+F7PXvzYNrozVBG5mH1t6/aBlbwY/
 mETfe/CzKLWwPImojlH6dkd7HRQfuDhnZcS4lvb3oel7fR7gtScU0oO5l4uBRnLvAAOM6owpcEr
 DUkagDxUo96Sc/RYPoDq1oeqXxQmUtdBRX1LBd/xBhejfRfLZhHR49UJVvjEFU+VN4zp7akmlbw
 iuvfsQUTFne066hkx/mzi03CQogBMGisbV4EntCvwJ0ppGiN4p6pVVWq39IFS6G7SZUgHXTgFxi
 M1je4yOZRgmQ1EFtXpM4ukkD1qcD19vZsd2OCDQ/0iXvp4weRcBUU6Em/6kqGIeYH9ZqijaFPC2
 YZegZPkAa/UaSB1NKfvgjOSc5xt4z/h1hWIgcbCeOPhB9VrfRus2RQv2xxk8+CCyRgvIhhFuRGb
 cHyznAAvkrr7YRN6j8uApQ==
X-Received: by 2002:a05:6a00:6ca2:b0:845:e7ee:eae7 with SMTP id
 d2e1a72fcca58-851f9a2f1edmr43185672b3a.5.1787551045688; 
 Sun, 23 Aug 2026 22:57:25 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8520f03b494sm1583474b3a.33.2026.08.23.22.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 22:57:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/riscv/atlantis: Document QEMU-only I2C device tree
 nodes
Date: Mon, 24 Aug 2026 15:26:40 +0930
Message-ID: <20260824055642.41098-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824055642.41098-1-joel@jms.id.au>
References: <20260824055642.41098-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The QEMU only I2C devices have a comment next to them, do the same for
the corresponding device tree entries.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/tt_atlantis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index d808bcc11c34..82f087c836da 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -356,6 +356,7 @@ static void finalize_fdt(TTAtlantisState *s)
                        aplic_s_phandle, periph_clk_phandle);
     }
 
+    /* I2C peripherals: qemu specific */
     create_fdt_i2c_device(s, 0, "dallas,ds1338", 0x6f);
     create_fdt_i2c_device(s, 4, "ti,tmp105", 0x48);
 }
-- 
2.47.3


