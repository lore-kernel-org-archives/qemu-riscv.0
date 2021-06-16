Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ltPHJ-0004ah-Eq
	for mharc-qemu-riscv@gnu.org; Wed, 16 Jun 2021 02:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ltPHE-0004ZQ-CY; Wed, 16 Jun 2021 02:43:52 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:60596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ltPHC-0004KJ-0E; Wed, 16 Jun 2021 02:43:51 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9B75620787;
 Wed, 16 Jun 2021 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1623825826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iP9tK8dO4mRbNr1fNZi4HGivr3n1eiDiZCD3l0YudKQ=;
 b=T0C0BSDxhQKJq7gTxEmfzk72mMz40bJ4gl8CCs29ZeUNo3zk58feNkrSQkh2ysA89piVaD
 pH3uYTWf6is7Q7q7TBJkuLw7OkreYND+is5jOn44KS8hX2CHYuSeWt0Uz5Er86fXaBj1G/
 Clq23PdxVJqJHuFMxOwlPEHnA3XEkCc=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 luc.michel@greensocs.com, mark.burton@greensocs.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
Subject: [PATCH v4 0/2] QOMify Sifive UART Model
Date: Wed, 16 Jun 2021 08:43:32 +0200
Message-Id: <20210616064334.53398-1-lukas.juenger@greensocs.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.juenger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 16 Jun 2021 06:43:55 -0000

Hello,

I have updated the commit message as requested by Bin.

Best regards,
Lukas

Lukas Jünger (2):
  hw/char: Consistent function names for sifive_uart
  hw/char: QOMify sifive_uart

 include/hw/char/sifive_uart.h |  11 ++-
 hw/char/sifive_uart.c         | 152 +++++++++++++++++++++++++++-------
 2 files changed, 129 insertions(+), 34 deletions(-)

-- 
2.31.1


