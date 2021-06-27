Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxVlw-0006eK-KL
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 10:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lxVlu-0006a0-AB; Sun, 27 Jun 2021 10:28:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lxVls-0000fA-RP; Sun, 27 Jun 2021 10:28:30 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so8628218pjo.3; 
 Sun, 27 Jun 2021 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nJ8okdn4yZ1H+QzKxNolB4CD8gqFF7YvEPDBSmhtxk=;
 b=RemscgltLCfN78wwfFJWmepjlskgnIUX7N8LWSTosQpkErCWajm/mP5cP5hzyoZ7DM
 JPlyZnTFoMyfFGxIDvguCtj1O/ZE5EGn9DXk0wKKm/gOW+LU6GqDAjk0ENo+jo6xcC1L
 2FXrX05FBLlg4cG8ObnAc+c8EsIW+lzyRQHqOi/bX1K24cFMkx8JaE+Nn/VOInosOWWy
 n67JSkgEwt4a8CRGXw0hb6KTV0xLhQmYNYE4wYhPTuUhYfM+sB3ffNEkvWPXCnpxdCOF
 qLC4bICjoanIHcKGOn0RSxLt4Y6qOGHpaITPBhZW0uSGv7u5TwJJ//Z/CNqXoQVX2EP5
 UfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nJ8okdn4yZ1H+QzKxNolB4CD8gqFF7YvEPDBSmhtxk=;
 b=cYkWmtD2u0rbOQrPXlu43KGD8i9hqJAw+s8Hq5XW6EQ4cizxcXYrfWk/G5d5ZZDdTs
 hByNyeIICUdiDNq+9BqVLW9kPL+HaBrn3NRdvWgWagBitofWMH+hMwQsE4vzcPkEBKb3
 /lqeSneZ1duxzmPjhQevAUcryl4Ef/gUB2Fkb1ra374hu3y+IRV9EDAkzUQq0/NLllPd
 DAc1fWN72NpSahw1M30KzdzvOY2s8jxrOYOooifIp10VGZ3PlnpiQembR6Qzq5KKoqFC
 Ye0Mkdk9pP4kxwOlULW1Lo+Kk/tcxQfFk0ZCFdM6pAAJIOzSZkUzZxM5K2sthBYZLZwW
 NYyA==
X-Gm-Message-State: AOAM533Wm+3dwAilv0552rlZC/zbkV9Iwgr3hFWY5v42teT6maD7z2zV
 mE9VW9FWKXUlQ0stUPKXY9I=
X-Google-Smtp-Source: ABdhPJzQi9nJIrKtU5rCeMySwM8c8/vxUEwnIYfR5CN+niYshivBXQZfNZyZnPWc8J1iirUYdY0LJA==
X-Received: by 2002:a17:90b:3a91:: with SMTP id
 om17mr23042649pjb.50.1624804107106; 
 Sun, 27 Jun 2021 07:28:27 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 27sm7222223pgr.31.2021.06.27.07.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 07:28:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 1/2] docs/system: riscv: Fix CLINT name in the sifive_u doc
Date: Sun, 27 Jun 2021 22:28:15 +0800
Message-Id: <20210627142816.19789-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Sun, 27 Jun 2021 14:28:30 -0000

It's Core *Local* Interruptor, not 'Level'.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 docs/system/riscv/sifive_u.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index 32d0a1b85d..01108b5ecc 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -11,7 +11,7 @@ The ``sifive_u`` machine supports the following devices:
 
 * 1 E51 / E31 core
 * Up to 4 U54 / U34 cores
-* Core Level Interruptor (CLINT)
+* Core Local Interruptor (CLINT)
 * Platform-Level Interrupt Controller (PLIC)
 * Power, Reset, Clock, Interrupt (PRCI)
 * L2 Loosely Integrated Memory (L2-LIM)
-- 
2.25.1


