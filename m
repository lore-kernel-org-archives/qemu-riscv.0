Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPOpy-0003Aj-1z
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 08:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOpu-00039H-Tn
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:43:56 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOps-0004pN-NI
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:43:53 -0400
Received: by mail-pl1-x62e.google.com with SMTP id bb10so4082749plb.2
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A35TlHj6NvQvQf11SU5kwz38uLXbFwsaunOnRixnHzE=;
 b=HFItM+JtLq4vc1boKfIjB2likrCmbSl4biAdSwFP8XM32Q7Gg3UJzJ5ujp+DPaPug5
 qkDEaS5BfBi9SkFZVI1m2w8+vpFJaCmRQRi1Go2pRU1xqPe0/Zd5bmiJBtW/Hopi+Jwt
 tpSRXTfEa0g6FzGG9DTAlVLa/tDaL1SQA9IA9ji4k3rPEWWMQcIXjWCUrtvHxx3TEELn
 pN0qyBxULCagNefQBqeW5aBr1qk7C7BrfkLEcfqtH7lIIEFICPG5LZ7gQTbK2mu2rVu3
 RctjdpTZ5PuFNKk1oTdscFbkBb2ECWor4rbYEANifkUEuToNHo5YV/rnDaIS28x1x85h
 dBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A35TlHj6NvQvQf11SU5kwz38uLXbFwsaunOnRixnHzE=;
 b=WDtRFKMoOe5DQRrcWloApeFSmauKQiYiz6jPjj44NDZWS0PUzFJ8iU228wC2yqlO68
 TKHSlREjPaqeivvKjJJ3XtWBXMPW8i9CE9l2LGRRnPNK1dg/j/F1IOE9bjFf/fSI8xOr
 rvhjBrhZ8xel/dGzkmjDWLfduGhGzXAf3Mv7Gi69gLYQfvqVfKJDRp4r4l4UOsRP3vVh
 KurhpJUfYWA9GAmgEBQxlb8oEm4pmWl353wYnlnOgiq0Ot1sNBW8/4FAIV2NKGR8flJ/
 Ta1OgwG6y2DKKQL11zShFldSV07eIrNMAMfGLSrssfAd1x2/nKjrCbcgVDn0onbKtFk0
 XbOA==
X-Gm-Message-State: AOAM530s9aTK9YTnw8314XCCQxeLShhApdFir7lFdPoPgsO3QzlP9b12
 UNnoV8URpQHBcWjoNP/jqln6kwL8EBkfZg==
X-Google-Smtp-Source: ABdhPJwUmiYZwz8f2Uy7Xdl82Gwr4trPHG1HQYrK/QnX6zfoJxspXl3x2JIVri9H6Lkr5vxlmIJdGw==
X-Received: by 2002:a17:902:710d:b0:139:4c7d:8c7b with SMTP id
 a13-20020a170902710d00b001394c7d8c7bmr6022675pll.59.1631450631406; 
 Sun, 12 Sep 2021 05:43:51 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id i22sm3473443pjv.47.2021.09.12.05.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:43:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 0/4] hw/dma: Align SiFive PDMA behavior with real hardware
Date: Sun, 12 Sep 2021 20:43:38 +0800
Message-Id: <20210912124346.165540-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Sun, 12 Sep 2021 12:43:56 -0000

From: Frank Chang <frank.chang@sifive.com>

Current QEMU PDMA doesn't align with real PDMA's behavior. This would
result in Linux dmatest failed. This patchest aligns with real PDMA's
behavior we tested on the real board. The golden results are performed
in U-Boot on the Unmatched board with PDMA supported.

Changelog:

v2:
  * Add comment to describe document errors.

Frank Chang (3):
  hw/dma: sifive_pdma: reset Next* registers when Control.claim is set
  hw/dma: sifive_pdma: claim bit must be set before DMA transactions
  hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer

Green Wan (1):
  hw/dma: sifive_pdma: allow non-multiple transaction size transactions

 hw/dma/sifive_pdma.c | 54 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 11 deletions(-)

--
2.25.1


