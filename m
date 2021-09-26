Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mURjf-000740-WD
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 06:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mURjb-00072b-KR; Sun, 26 Sep 2021 06:50:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mURja-0004jc-0c; Sun, 26 Sep 2021 06:50:15 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so13105219pjc.3; 
 Sun, 26 Sep 2021 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cp2Xa9FQk3XPNpvwE8mKpZGb0OfWyrPKmp8k3Iir4hA=;
 b=n3djnrMBRl+ayWDyKpU1J4/W+p0j2xu3ivVEr9HMPIa11JWb4oP9fW2jGJwvYPUFoK
 xiu9WlI6XoeQcpiB/mYKJUk0KK34PPn1RQNmutGEmtr9xMblszQ9VfilX4WO4eUtGfAm
 4dUilG64cO/wqxG2TXzOURX1nufmUjbQNRcJ9MWLMzFG+ZblSE94fNUrWNbcPZGu0znM
 kVDpH7g2XdEsN6tbE5JXHCOnHoaPtsKbgw/+RNaiFlj+uSqeaZ+G8ipbWxKSDtE9o1Pw
 0j1zWFvgRCT8KGAE0kqrnNDraFTVaI5/Pl5UPO/Vjz5Moqv7yxbNd99h5c0zxj8ARKFS
 ulRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cp2Xa9FQk3XPNpvwE8mKpZGb0OfWyrPKmp8k3Iir4hA=;
 b=c7SRj2r/+XXslIY2myPeXAA9iMEk1yuz871NbE3dji9kF0fjHr9r4/p+y+GUWlvCYi
 ffeF21jqFumPm4lqu5X1uykp9ip3fSOZquys6c86eKjJ6SqO8pxWJlKOoeC0PhuMcHOr
 XHi6EYUgkKv2476c9eoC45tZ2UD/eMZ6WQdwRgCitUZqYvAyOtHI/bcG9tu3biNktvpt
 s+m5ZRC6jQxN6RZHUizCkXyJYUazA6z0A4wkXPcgbehWOmjsFa+RwSnBjSKeEMhmsufn
 ts0xr5VbG0xDZV/GKHuDrzpwO8cZ4vBzjCMBncw7LcKd+CzOI6jZuI4FB3qL3B5hiSNH
 +Vqw==
X-Gm-Message-State: AOAM532Cf6urJ9jfavghQ00erF0+EWWY/6Kbonr8qCwgt6I8V8Abg/li
 5/beSOk30RMuv0FiK3BYKh4=
X-Google-Smtp-Source: ABdhPJzujw6nsjx4h+X+fTsArCmFhm0XIJZLsf2b1CjwdFmFoHvWjxp1XIhWDwk+YjMZyvZ2rcnqvA==
X-Received: by 2002:a17:90a:4290:: with SMTP id
 p16mr12918500pjg.112.1632653412227; 
 Sun, 26 Sep 2021 03:50:12 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y13sm16190562pjr.1.2021.09.26.03.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 03:50:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/3] hw/char: ibex_uart: Register device in 'input' category
Date: Sun, 26 Sep 2021 18:50:01 +0800
Message-Id: <20210926105003.2716-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Sun, 26 Sep 2021 10:50:16 -0000

The category of ibex_uart device is not set. Put it into the
'input' category.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/char/ibex_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 9b0a817713..e58181fcf4 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -550,6 +550,7 @@ static void ibex_uart_class_init(ObjectClass *klass, void *data)
     dc->realize = ibex_uart_realize;
     dc->vmsd = &vmstate_ibex_uart;
     device_class_set_props(dc, ibex_uart_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo ibex_uart_info = {
-- 
2.25.1


