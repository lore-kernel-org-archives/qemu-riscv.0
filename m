Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ltRls-0000jF-MA
	for mharc-qemu-riscv@gnu.org; Wed, 16 Jun 2021 05:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ltRlq-0000hf-9k; Wed, 16 Jun 2021 05:23:38 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:33632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ltRlm-0001mc-EU; Wed, 16 Jun 2021 05:23:37 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 6331E20787;
 Wed, 16 Jun 2021 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1623835411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OnQkOCbs55PDpO8L88JTI2Yox8lvnzqpgPL9VgZAz/Y=;
 b=LnL8F0GEaRWOhxukHWHkcRRITJewJknHm3ucAKLbf2dDNxMS7vzBu2DJwp6jsio7swV43j
 bNdHWEC/jpdNB/9HRmPw16tNkO4UVIGjF+52LhHqFrhHMcsef2mX5jZxfXbpn1eWlvcURs
 CjyJS8WgiA2UsWD/NYwHF7xbXailAH8=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 luc.michel@greensocs.com, mark.burton@greensocs.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
Subject: [PATCH v5 0/2] QOMify Sifive UART Model
Date: Wed, 16 Jun 2021 11:23:24 +0200
Message-Id: <20210616092326.59639-1-lukas.juenger@greensocs.com>
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
X-List-Received-Date: Wed, 16 Jun 2021 09:23:39 -0000

Hello,

I cleaned up the commit message as requested by Bin.

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


