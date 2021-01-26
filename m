Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4HPI-00012u-Ii
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 01:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HPG-0000zB-O3; Tue, 26 Jan 2021 01:00:50 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HPF-0001WG-1X; Tue, 26 Jan 2021 01:00:50 -0500
Received: by mail-pg1-x52c.google.com with SMTP id p18so10840366pgm.11;
 Mon, 25 Jan 2021 22:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XV11gAa0FiYpl9jGReeHl+vRsCJUXpPRsTFXVz7CXvo=;
 b=U8Ll4M4mJOcw1i1JgfNbOQgYOm7Qhh/q9gVhkSO+7CdaTzVQGgYApisorJ+clT3FIB
 G9+TY3pvz6MZVDLrmyj6oxQTV/VvRGtRJq0ggC+zcI992sUwi9QFTCobaC7uiKG5we0P
 cffcTM5UDmilaMi9YzabSpU08JhtUCtqrNocaBldt209RlUeIGPF8zZY3sPB3RnGu8ww
 +5wpsT7vrSOcRKk7Iud4Ezlp+4iD3YJ93+tzFDLe8V+mdUyoeuBTh+4Njltlx1sfWuag
 hI9kDOlBO95CtMdlajyk0xZpkZeQgBhKFwFZg1fFE/eLr1YUUAwksHmjMvKuWrce6oVL
 ve9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XV11gAa0FiYpl9jGReeHl+vRsCJUXpPRsTFXVz7CXvo=;
 b=N2364GH0EpJ5SB01pj7Uu5uXwi8oq0dOK+N1J4fnarVSFNkuH8K13apZs9sjwmp1El
 76lRbTc15JOdyiM7cHp+TqcoQUf+IGK6Uc0lMqCUUq2p3/b3kXENt07ATM0GZftin+df
 F7o1aW2Ym+dBLU7YXIfMkigNQGvE/Bmtgd2NisKzhFhA0dS/E/EhSAiTOOSPsVsEUwBz
 GfjHl0c6VPqINaslRg10oIVo5nry9tgcaa9S8F8fKEPYF//QRnhDK5O4134We5qp2F+I
 cvQVljf3CTsoYUcjJVj1BTIyHu55gCD9wIXwpamLumdNureiTXYM9c+dQvQ8TYIPzY7K
 Re/Q==
X-Gm-Message-State: AOAM533xu+Os+1Kq78lXHE6rbXZSDQbe0e7iJRye2t4PkFTmS6ZhAlAV
 cs0Umc6okpZ/pUpoMcpXd8o=
X-Google-Smtp-Source: ABdhPJw7YtXZJQGuhsln+ZVLvD8AohW6CcIFd9ylAIafy5JAncyibKtvHsqL1CCW7FpuOgwdDaX/MA==
X-Received: by 2002:aa7:87d9:0:b029:1b7:1c6c:56e0 with SMTP id
 i25-20020aa787d90000b02901b71c6c56e0mr3822495pfo.25.1611640847405; 
 Mon, 25 Jan 2021 22:00:47 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id k10sm12471076pfk.0.2021.01.25.22.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 22:00:46 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 6/9] hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal
 value
Date: Tue, 26 Jan 2021 14:00:04 +0800
Message-Id: <20210126060007.12904-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126060007.12904-1-bmeng.cn@gmail.com>
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Tue, 26 Jan 2021 06:00:51 -0000

From: Bin Meng <bin.meng@windriver.com>

All other peripherals' IRQs are in the format of decimal value.
Change SIFIVE_U_GEM_IRQ to be consistent.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

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


