Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu39J-0001hq-Us
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 18:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39H-0001dr-8o
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39F-0004qg-Nm
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:31 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42437)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iu39D-0004oG-W7
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:29 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 4so2312050pfz.9
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2020 15:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to:in-reply-to:references;
 bh=zNvv3+MlZ3Fav7KlqKl3zpomZ1Z/uG7eGTPl6IdDto8=;
 b=dmwiOCQ62e8BvwK1Jq6te9pTXiNhaiy/hl1NCvMsj1lpvgVnaF3b25bVSkY5s+I5ol
 vV8tDCHxTikDL8aPGAjtHCVExCE7e9xM/E+qP8K5l5FOxVva8lol+ugziqfJ+ljcSE6o
 iOxHa/4kp+BPqVkjHQ0pnD0/rAl65U7H/klQIZyXCyftdBvD5NT2rj0ggJ9cpB/oWJJa
 nBxyFGwgLK2K+4kefyGyw8YuceSDnl8ftyl/9wf8kfFJMLC3du1kTN5A0efdcOnq/YWv
 TZ+29VlDHTL/dTn8Eotxz/Q6RBbJ5nfwPLsxSPx+b3kLXWRphOUl4Wp+4E0+FglQ3hlz
 628A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to:in-reply-to:references;
 bh=zNvv3+MlZ3Fav7KlqKl3zpomZ1Z/uG7eGTPl6IdDto8=;
 b=NYJRrP+S5VLxgA4htz2JOxcOU4YV2Eeos0/GaL+tYtlB/fK3M0Q6tUyIOMYUDGawBt
 OnAJfT5g4yvT9efs6cSLKyIcCApKo1qxQNtGZl5oaJ5/Lxf21nwtGWaySpZ2ZWMfb3en
 qnTi1L5HrwSbHdp8xweUud7ODctttd/Rv6VF3msiCmkrInXENReCA6Q1Oy+XTO94/fuR
 H+Gq0ivKlHXhmezxoECF7N+fUdNAYVt2zlRZ3j+FCMvL7junrrln0Ku85T0Js4V+i7IZ
 87fy0mgPtrnm/omvq1F0zf8nvmu1qN/VviPTLj5HU4nngRa2dAfJh/zn2hf6uul/DIZS
 E22w==
X-Gm-Message-State: APjAAAXCUdTHaCMuS7z0wHVM6KmWPH9dvRPoDSsPNZbe5KtrEObkns6o
 a2i142xsvlXFFNwbi0MYprd89F4P+Vc=
X-Google-Smtp-Source: APXvYqz5ouoNx0M14zjlB899VEb0XMfoiZrs6JA2EYVdSk5PriCygAT0uZAWW5BlqefFmmqJaJTOtg==
X-Received: by 2002:a62:e509:: with SMTP id n9mr6672365pff.159.1579650084493; 
 Tue, 21 Jan 2020 15:41:24 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id a195sm45123929pfa.120.2020.01.21.15.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 15:41:24 -0800 (PST)
Subject: [PULL 1/5] riscv/sifive_u: fix a memory leak in soc_realize()
Date: Tue, 21 Jan 2020 14:56:58 -0800
Message-Id: <20200121225703.148465-2-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20200121225703.148465-1-palmerdabbelt@google.com>
References: <20200121225703.148465-1-palmerdabbelt@google.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42b
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
X-List-Received-Date: Tue, 21 Jan 2020 23:41:32 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

Fix a minor memory leak in riscv_sifive_u_soc_realize()

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/sifive_u.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0140e95732..0e12b3ccef 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -542,6 +542,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         SIFIVE_U_PLIC_CONTEXT_BASE,
         SIFIVE_U_PLIC_CONTEXT_STRIDE,
         memmap[SIFIVE_U_PLIC].size);
+    g_free(plic_hart_config);
     sifive_uart_create(system_memory, memmap[SIFIVE_U_UART0].base,
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_IRQ));
     sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
-- 
2.25.0.341.g760bfbb309-goog


