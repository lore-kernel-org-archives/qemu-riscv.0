Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofCrA-0003ad-SJ
	for mharc-qemu-riscv@gnu.org; Mon, 03 Oct 2022 00:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr5-0003Xl-24
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 00:15:03 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr3-0006TO-Is
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 00:14:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id u24so1672299plq.12
 for <qemu-riscv@nongnu.org>; Sun, 02 Oct 2022 21:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=ZHwJ7nmSA/HhiRQZq0meor3/TLygrMmciw6ONBwKishhaJTkeuqYbK2J2lcW2SSPRd
 JEZl3pnCZJSlnSFqFi2Ga/CrGVZZUE60nalxHOQzlNcLaXny7GMZiFmr9IqRTlM7i5J5
 aUkqsLm23rHIQMjzjoxUUDfqQcLZkd1B1g+DcBUH3S50ReHY5NNYnVKYVVaP5Pln27oN
 zSvMdeHB0Iw5d3p/kDASy3HubSYE/YsqIo5eNeRWD41jtaAdBj3f77OvlwG6bWSP4F9W
 +HzL+cASZ3fUuiPwaVe5NeBvG13jPbGGJu+Ewa54Mmo7Gk3wjffnn+EEAP/STQMtQ0xB
 2XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=bUX0iLhd/mNytTUHHQCElMB4eRb9YDmbg0Jxw+RYenZMbV0bPuFnnaZV1+8AaLWCLb
 Tcnjaoaps4uCo4tTBmQtKs8dvzF4ZAXvbQatZyX0cGukaSU/Q+B3tz37fzEM3UX2O6A6
 24DPOKuF1b9aLxOA5bCUCT0AfLgpjzuVDG91mDikgCLvUxN7+aWNsvdsNRcnorYLEzg3
 ZD6RCOQ434lJR9aEaUbvuG3uH9jx5BsxEQmZ0npX6wrdgELtpc3J3O77K3S/1m9OIDpH
 +3HOHKfP6koq7KpUrR9T7mrFQlj7V6vKioSAif/hJ0qvV91JcDRPFty1D/9h5b+aSyOY
 RxdA==
X-Gm-Message-State: ACrzQf03JYlB1nMFPE8wktqY+dB2fFQ5y5XcfmzXacjus6DapMB4qCUt
 Pb+4uc0X85+XXVRJvCrXX4c/dg==
X-Google-Smtp-Source: AMsMyM5C7v5e7Vq+P9HStNYrUbEzAsgAD/JLSNB+ubeDAn4BIcg5ZlFLau3xkHncfaNlC+cHa+5F4Q==
X-Received: by 2002:a17:90b:33c9:b0:200:a0ca:e6c8 with SMTP id
 lk9-20020a17090b33c900b00200a0cae6c8mr10176264pjb.147.1664770495169; 
 Sun, 02 Oct 2022 21:14:55 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b0017732e4003bsm6108596plg.141.2022.10.02.21.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 21:14:54 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>,
 Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH v3 1/2] hw/intc: sifive_plic: fix hard-coded max priority level
Date: Mon,  3 Oct 2022 04:14:39 +0000
Message-Id: <20221003041440.2320-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003041440.2320-1-jim.shu@sifive.com>
References: <20221003041440.2320-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 03 Oct 2022 04:15:04 -0000

The maximum priority level is hard-coded when writing to interrupt
priority register. However, when writing to priority threshold register,
the maximum priority level is from num_priorities Property which is
configured by platform.

Also change interrupt priority register to use num_priorities Property
in maximum priority level.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/sifive_plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index af4ae3630e..f864efa761 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,8 +180,10 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
         uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
 
-        plic->source_priority[irq] = value & 7;
-        sifive_plic_update(plic);
+        if (value <= plic->num_priorities) {
+            plic->source_priority[irq] = value;
+            sifive_plic_update(plic);
+        }
     } else if (addr_between(addr, plic->pending_base,
                             plic->num_sources >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.17.1


