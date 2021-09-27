Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUkxF-0000lj-Db
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 03:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUkxE-0000lU-L8; Mon, 27 Sep 2021 03:21:36 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUkxD-0002wB-59; Mon, 27 Sep 2021 03:21:36 -0400
Received: by mail-il1-x12e.google.com with SMTP id a11so6828223ilk.9;
 Mon, 27 Sep 2021 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jlcQJCPKpQJRcDfqYwaSe8gSDTqdpHYYvS/Ki1xz180=;
 b=P8ZcGfOB3lNo7XrUWQGal/2mvIl+6MfoF/xeP7Y57/h088JOS1gvJb7KNdC8XrLWhg
 UogVqLH7y0rVryOyyDhO0mIqNsaeSwmv2wWDWIEMVaFRDA0o+zjyDq3CJfLSLWa80nGl
 LPCkg27YSo+PS6hhoEmHEpCq4KXOPxaGc5s0fmrrWBgQFthwv0Uxs8pysk9WQX4p8mDR
 1e3R/ij5LBHM/puyNfmpe/aEmLIONoOt0u59nl6F5PHpxgyBYcZU4l8M6HC60cBh0K44
 3mILb+M47MU6NPwE2gm+gr51RyLlvrpBHWBhWMDoHmmx/PInfB2hR4hVXiL21x4qamKc
 VuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jlcQJCPKpQJRcDfqYwaSe8gSDTqdpHYYvS/Ki1xz180=;
 b=abORhG00Sb0mXfh/3OpQxoAYZ5/RHykpg95rEc7OQmIMlqHm+Z7J031LF03B24ArnN
 /HAW08FnN4Rpokh7YGJOjgNN+YHhn8//LEyxnyVa1+yLBFFvSVsbqZWplh2ZJxScxLj9
 ZxZaQNBQuW3Qn89GRLtGiaJqXNQ5UDkR7XJNiKOA+BuzKAHBgZBI0LO9/O8csGzfwuvU
 /pY6AkmbzI2ft0JaEjUew+tGix1zxoMxc1kx7N3gBdQBU7AZoBaQsvoYVrcBJ9hyezbo
 nqaXzzYZWWureUXKQ1t8GK7bwfFSTct9SaF6oWUfygR6RGCX2FmTXVDMcLQ1OLix3Fl5
 ifNg==
X-Gm-Message-State: AOAM532Lq1q3WqrzJumVZ9upUjF+GMaSryR5OEbO7Nor9WoDu/POPryo
 z9bTwFBChcGwn+FcIkjUJ68=
X-Google-Smtp-Source: ABdhPJxRozvSVf2xSfO4BXgbcZCJeJzKwtHLVyk94XPuuRrJhpHbTcp45r+t7BxqHnaywWtC/ayxLQ==
X-Received: by 2002:a05:6e02:1c2e:: with SMTP id
 m14mr18927228ilh.23.1632727293632; 
 Mon, 27 Sep 2021 00:21:33 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id b12sm8690641ilv.46.2021.09.27.00.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 00:21:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 1/2] hw/dma: sifive_pdma: Fix Control.claim bit detection
Date: Mon, 27 Sep 2021 15:21:23 +0800
Message-Id: <20210927072124.1564129-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Mon, 27 Sep 2021 07:21:37 -0000

At present the codes detect whether the DMA channel is claimed by:

  claimed = !!s->chan[ch].control & CONTROL_CLAIM;

As ! has higher precedence over & (bitwise and), this is essentially

  claimed = (!!s->chan[ch].control) & CONTROL_CLAIM;

which is wrong, as any non-zero bit set in the control register will
produce a result of a claimed channel.

Fixes: de7c7988d25d ("hw/dma: sifive_pdma: reset Next* registers when Control.claim is set")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- reword the commit message

 hw/dma/sifive_pdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index b4fd40573a..b8ec7621f3 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -243,7 +243,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
     offset &= 0xfff;
     switch (offset) {
     case DMA_CONTROL:
-        claimed = !!s->chan[ch].control & CONTROL_CLAIM;
+        claimed = !!(s->chan[ch].control & CONTROL_CLAIM);
 
         if (!claimed && (value & CONTROL_CLAIM)) {
             /* reset Next* registers */
-- 
2.25.1


