Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPPBQ-0002mc-7V
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 09:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBO-0002hU-01
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 09:06:06 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPPBM-0005Kl-CA
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 09:06:05 -0400
Received: by mail-pg1-x531.google.com with SMTP id k24so6713452pgh.8
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A35TlHj6NvQvQf11SU5kwz38uLXbFwsaunOnRixnHzE=;
 b=VuF7NmB3Q38fy7Hbke4C8NBnoJlSIDFO2U4tlXnt3L/VybWmN2rxhqzqt9veyVD4BP
 9l/FdM04NBYX5+29wWeNmrjWNxUwlGX2ckMm8bbVa59bc32IlkBj+yWM7Dc/smox8iK6
 BilVJGvZMBAvKyE2FDsfxWmaltT35Tw70CERsSaYKO3mubOn2xY88Ud60/hrHOT4x0YV
 tKJO8AJdoO43DtQkeenXDisTAfKnUFJKlTymg5SZFGJ2QtpvpLawXd6DJFHVua9d8r4x
 Yo0O7rsOl/+/9A2ivJjyKoFJGqZOl5ppUXIasWRukeqeCsS7tIwsV97M3d/pg2rufvRl
 0fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A35TlHj6NvQvQf11SU5kwz38uLXbFwsaunOnRixnHzE=;
 b=Ic2aAiIbnryneYB63VcRQLu+LKVikHxyWJ82hj6GuWkMI//EnPPmaqPCI5LDZat1iq
 P3RFukiEQx8lNMMSHgsXBGl31Jd/yKW9+lyl7VfWVvHnjgPXf+1tdf863ykveJvMkzD7
 Zl/sWO6EkU+ViS/yKe5j+TrpE/5y0g+Tlc0oBHlVeoseC6x5+mNDR2CUtVhSQSJ9jGkR
 byY+6SiHFKvaQt0LRJPPZv8NLx63HVnxBtgZq4DNCI+NtaUonycKfzwGATxmi/5paWW3
 zjtd7Edo/d3XPXdMolde6kUOcK4nfHlBd1GeGprRUPEQE3kmo8VvRJ1SvkLxY2wiQQV3
 dm6w==
X-Gm-Message-State: AOAM533jzbi+O+OFE5GkW9F6kIv6xjFremvAZfn25eNTRVFF91dvsgfw
 vXlRONEBxJQp6Qr2ntk3oCIBJA==
X-Google-Smtp-Source: ABdhPJwScHgpZW2d1uzi87BwayuQDeC4sWeyByu7L1zLShqa5PVDz2rXPD/FxqfkYhA3T6q+D22VhQ==
X-Received: by 2002:a65:408c:: with SMTP id t12mr6528776pgp.229.1631451963101; 
 Sun, 12 Sep 2021 06:06:03 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id qe17sm3849565pjb.39.2021.09.12.06.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 06:06:02 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH RESEND v2 0/4] hw/dma: Align SiFive PDMA behavior with real
 hardware
Date: Sun, 12 Sep 2021 21:05:44 +0800
Message-Id: <20210912130553.179501-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Sun, 12 Sep 2021 13:06:06 -0000

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


