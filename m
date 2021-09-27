Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUgGm-0006TY-ET
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 22:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUgGk-0006SL-4Z; Sun, 26 Sep 2021 22:21:26 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUgGh-0007UM-Gn; Sun, 26 Sep 2021 22:21:25 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e7so16374619pgk.2;
 Sun, 26 Sep 2021 19:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fn+zHqm1rcWfRfRJmNI0dFH6AD7orjwMEqRhRDMLsW0=;
 b=VrfyCw2S8WYxmDtGEGVkPFVNnGo+6Lx83gLKw0SaisFkgJE47N/e7wA47YNmZSUp+z
 vQoBde3wj3evsWvzOF17NnVzQCBSmWzex/DO6hiFZMlEoMt6jGAHDX/bs+lQV3mMmqIN
 Bfu/NXul6CzVphp84aMT62uYJtXt2A6vCkqdWoNMl4+pSYg2YSkolS8qCvRLMlofbEaa
 GW0PYhCMnaZEF9WpXwapX6HtGRpKLIiUiQEIm4fyoWyPEtMJcqqko5qiSRbu5DBtHCLy
 nZlIjn0Sp5yoUfLAUaJ2kWQvgFJatfoRH/v2CH+Oi1d6y/1bfSiUxHtnc3trIkcIH2i/
 K9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fn+zHqm1rcWfRfRJmNI0dFH6AD7orjwMEqRhRDMLsW0=;
 b=Tq9DhS47psFkmMfys1cWjmBtSHxJys3kF5C5YLKnI/8hOXS9yCheM7SuQ/P105g8A6
 4Ss5qgw3SZ3QeosuduwlRIfYCwSFFDimvu5/0mjlxcXeUMeTV9NJsZSGa2bflFA6R8r9
 kGwry2LzdADyuaFdxZ+WF0zq/P7SDKrdBQF3sn0UXH0dvzj8dZ3Smljc3lGVW/+TKmIR
 QswPHTkcvrZUrI2vvmcDUFq2n/hvHeLPy20fpheldnunGQNe4wXOzcxlpE+zSLIxQ0bC
 OtPsfRoUowKXJACk/gf+7tnyMrMS0Uzavxn/dWygWSlY6xaLh8UY211XFZ6HozeFVahS
 2vSQ==
X-Gm-Message-State: AOAM533so+78vWv+ZuTmelhaC818tvjK6Yuk7MoY2AU2YM/T3gAzPOtI
 FLfKoJ5sIrhBYJcqtbhU85s=
X-Google-Smtp-Source: ABdhPJz/rGYy+1gbsYabMVFNA0E2jcEu0H1mmRw6rxIWAYX1EwvGnm5vfpKK80RrpKzFOgexud4luQ==
X-Received: by 2002:a63:f346:: with SMTP id t6mr14430877pgj.345.1632709281611; 
 Sun, 26 Sep 2021 19:21:21 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id qe17sm14660222pjb.39.2021.09.26.19.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 19:21:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 1/2] hw/dma: sifive_pdma: Improve code readability for "!!foo
 & bar"
Date: Mon, 27 Sep 2021 10:21:12 +0800
Message-Id: <20210927022113.1518559-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Mon, 27 Sep 2021 02:21:26 -0000

GCC seems to be strict about processing pattern like "!!for & bar".
When 'bar' is not 0 or 1, it complains with -Werror=parentheses:

  suggest parentheses around operand of ‘!’ or change ‘&’ to ‘&&’ or ‘!’ to ‘~’ [-Werror=parentheses]

Add a () around "foo && bar", which also improves code readability.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

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


