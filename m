Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldxzH-0001CK-Rp
	for mharc-qemu-riscv@gnu.org; Tue, 04 May 2021 12:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ldx5C-0008La-9z; Tue, 04 May 2021 11:35:34 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:43514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ldx50-0004J1-0H; Tue, 04 May 2021 11:35:33 -0400
Received: from cygnus.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E90FC21C37;
 Tue,  4 May 2021 15:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620142517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NBerd48pjI7AvwzVHQrr5j0DWevNMGw0mFbGgXAnKkw=;
 b=yUeF6PoiKljlBXONmCmiARrku2EcuLaCnA+3CIACQlIQsS8qqRA6C6n10pRixypRg5NCgU
 adZPRjuWcmUtlz0Cfycm0QeZ3K4vPKSBkSszd7uP1nVf7eXF+LbWljHWR6Z7QrrQ5PDSN6
 rIgXyfC70oHvw3ZADEDt+BLViliDba8=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 luc.michel@greensocs.com, mark.burton@greensocs.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
Subject: [PATCH 0/2] QOMify Sifive UART model
Date: Tue,  4 May 2021 17:34:54 +0200
Message-Id: <20210504153456.927083-1-lukas.juenger@greensocs.com>
X-Mailer: git-send-email 2.30.2
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
X-Mailman-Approved-At: Tue, 04 May 2021 12:33:01 -0400
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
X-List-Received-Date: Tue, 04 May 2021 15:35:35 -0000

Hello,

This patch QOMifies the Sifive UART model.
It is split into two commits.
The first commit makes the sifive uart read and write function names
more consistent.
The second commit QOMifies the model.

Looking forward to hear from you,
Lukas

Lukas Jünger (2):
  Consistent function names for sifive uart read and write function
  QOMify sifive_uart model

 include/hw/char/sifive_uart.h |  6 +--
 hw/char/sifive_uart.c         | 84 ++++++++++++++++++++++++++++-------
 2 files changed, 71 insertions(+), 19 deletions(-)

-- 
2.30.2


