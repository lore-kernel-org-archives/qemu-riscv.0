Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPOqs-0004dt-NP
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 08:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqn-0004ZT-Gi
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:44:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOql-00059g-DJ
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 08:44:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso4662949pjh.5
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oHlfkVnmB566xqPvLmY6le/BJxWxcQU2xChDQj5zOog=;
 b=fpBbi3kbhA3qr/TfGWiWjIvssQUAyCN8JEL21lGXRiomvYA/5uQV5ym6MMLKmzVrtP
 Yo1snI0P4Ljplox8uBVyxgsc+tCveSrfQaM5RBPHfTUg4vp4K4oozZpflcZGxlLY6na5
 1roGSn2wrq7zKbz9BsyQm2z/VauON9HJ6ZWO4WwC/6Xv8tJodOL6KWnYr7f4dPbeR5O2
 NMH0eg0eOmv75j77lHCLeAXc9gJs9pY2obD0LEhcIdQa+/HJyw3olTxrnT3UqJhO5D9b
 qAqjUzqQhnL8Mrkm6oFcIOY7MT9qMD8JhwD8E/Gemezn0d1iH9AmT+E5hmPEC/awZdOs
 WHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oHlfkVnmB566xqPvLmY6le/BJxWxcQU2xChDQj5zOog=;
 b=HuE1EMGGfdKbAQqzz8WNKKJdGwvXu2r8lbhA2pPLV/4ER/yjxI8mNM8Byf9axEt1pY
 ZyuqMi+mGb7SnKOpFC/Zc6L8oYTMqRCeye1bsYEIaoXfuhTtrGDxsZ76upjBSGDfxHqR
 eu18uyf4VGnuSP+6O/2R7OMLyjvdY0QopkYtAEt9rwDRC26mWNLla4l+VdD3JP+qKCMv
 lKsg2E5ekUMCK8X+B2D/lzNvlzdEeVNLrCCbhV64Mrwijjo3gdjETlLkKVeGA2FV9dIi
 XIOf91BVf+h44fjxun628lguHsxi3lnTW6gxe8YH39DtVbwD10fLSBrpVSk4ck4+gOEY
 e0Lw==
X-Gm-Message-State: AOAM530n6CsJ7nh8NGWneVvyGYB5pXu/zdJPpRoEMuCDsyknm0z83MZd
 C4MuEVzf7N9DTuvb+WrjSQnWug==
X-Google-Smtp-Source: ABdhPJxkBE7NvZrtiI20t3+lk3LYCuSq4Gv81xiYTP/vRey5rT9OQDKAUzNxI2GbDi+3eXVQzr5Gfw==
X-Received: by 2002:a17:90b:3145:: with SMTP id
 ip5mr1509086pjb.161.1631450685835; 
 Sun, 12 Sep 2021 05:44:45 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k3sm3807043pjs.11.2021.09.12.05.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:44:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 2/4] hw/dma: sifive_pdma: claim bit must be set before DMA
 transactions
Date: Sun, 12 Sep 2021 20:44:18 +0800
Message-Id: <20210912124425.166071-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912124425.166071-2-frank.chang@sifive.com>
References: <20210912124425.166071-2-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Sun, 12 Sep 2021 12:44:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Real PDMA must have Control.claim bit to be set before
Control.run bit is set to start any DMA transactions.
Otherwise nothing will be transferred.

The following result is PDMA tested in U-Boot on Unmatched board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
                                              (Channel 0 is not claimed)
=> mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
=> mw.q 0x3000008 0x2                      <= NextBytes = 2
=> mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
=> mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
=> mw.l 0x84000000 0x87654321              <= Fill test data to dst
=> mw.l 0x84001000 0x12345678              <= Fill test data to src
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000000 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 66000000 00000000 00000000    .......f........
03000010: 00000000 00000000 00000000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index d92e27dfdc4..a8ce3e6699a 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -252,6 +252,15 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
 
         s->chan[ch].control = value;
 
+        /*
+         * If channel was not claimed before run bit is set,
+         * DMA won't run.
+         */
+        if (!claimed) {
+            s->chan[ch].control &= ~CONTROL_RUN;
+            return;
+        }
+
         if (value & CONTROL_RUN) {
             sifive_pdma_run(s, ch);
         }
-- 
2.25.1


