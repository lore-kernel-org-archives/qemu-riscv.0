Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOZWZ-0007G4-VX
	for mharc-qemu-riscv@gnu.org; Fri, 10 Sep 2021 01:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWY-0007Fl-JI
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWW-0002Aq-PP
 for qemu-riscv@nongnu.org; Fri, 10 Sep 2021 01:56:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id k23so676971pji.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 22:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DDyJdm6ecbaUrCvR4xtBAx8JjQqR3bPgB3rRz2IrFc=;
 b=OepKyoxmwdheuKQwpBpkQnk7Ls2P65kU741KeH0b/fk/X5kCQSARqcFbaFEGkfiPbs
 4vm7i+qFarYTdtzxpvzb37H5ZDeMjt9pC7e2VYaz6HmAn6pSf2v4kbOw/C+Qe7ItAFJi
 vEDtFE/S4AUrJsJU8AGdF77+JaHhCM4XPWfiTI4GwULcGbD5s7wzFntNRvQBwYqiX6bt
 uFdAuZmy37cuan50jg7bLIt3ac/7/H2rB2WCsDfUyqsrPl9/oG8bWAIOTbAl3khUJ1qt
 lUeliCglkIfbSzY65jFY1tP/op0nZow3TZMo8gvmxJiJRwMtC3jPEDqvBg1s/5EgfxmS
 zZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DDyJdm6ecbaUrCvR4xtBAx8JjQqR3bPgB3rRz2IrFc=;
 b=nC5csrNreE9WbBABwMtLhYEp8GysNaahgUsAYahMN0JtriXFulzhWOOCmUehoA6vTs
 76mNIofl2h3zaoTEGys76/U5tbBeCByac7iI35O5CMt2v0LspvUp0maG338GkqbuOjpn
 W9xGLAsJbYSdXhGTJdSdgaRpmEpoHbrHQDTPFXdzvNygKTYBHbtO2nfppCJARqHNtlpr
 3Q01DA50T7ww1GNmFfByCXjsciHldpqmr3zbQYUFE/+JbDzLoQN3KzC0yzdttpwkFRmz
 kJltlkpD25sex6uCP4IWr4QRwzxcDm2MdaQsMzLqkJR4U7digFpPWf/AiTrD43c7NXpL
 S77A==
X-Gm-Message-State: AOAM533HOK37I/QuuuhXkgpEAt7Bh1YH1X23ghl7+ubxA+QDT+5eDsdu
 q8o1VG5v0as2tPDEmQmm2FX4Jg==
X-Google-Smtp-Source: ABdhPJzYYkCtaDZH8ShjXaH+A5rhRDTQy971dwKLKJZHcKT7CUZKjtSTltLTyrge/sJdQBJwWOaHSA==
X-Received: by 2002:a17:90b:1c10:: with SMTP id
 oc16mr7799527pjb.1.1631253386816; 
 Thu, 09 Sep 2021 22:56:26 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id v17sm3739101pff.6.2021.09.09.22.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 22:56:26 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 0/4] hw/dma: Align SiFive PDMA behavior with real hardware
Date: Fri, 10 Sep 2021 13:56:12 +0800
Message-Id: <20210910055620.946625-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 10 Sep 2021 05:56:30 -0000

From: Frank Chang <frank.chang@sifive.com>

Current QEMU PDMA doesn't align with real PDMA's behavior. This would
result in Linux dmatest failed. This patchest aligns with real PDMA's
behavior we tested on the real board. The golden results are performed
in U-boot on the Unmatched board with PDMA supported.

Frank Chang (3):
  hw/dma: sifive_pdma: reset Next* registers when Control.claim is set
  hw/dma: sifive_pdma: claim bit must be set before DMA transactions
  hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer

Green Wan (1):
  hw/dma: sifive_pdma: allow non-multiple transaction size transactions

 hw/dma/sifive_pdma.c | 50 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 11 deletions(-)

--
2.25.1


