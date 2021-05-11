Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgPIu-0008FA-5S
	for mharc-qemu-riscv@gnu.org; Tue, 11 May 2021 06:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lgPIr-000897-2w
 for qemu-riscv@nongnu.org; Tue, 11 May 2021 06:07:49 -0400
Received: from exmail.andestech.com ([60.248.187.195]:25118
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lgPIn-0007d2-8t
 for qemu-riscv@nongnu.org; Tue, 11 May 2021 06:07:48 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 14BA7ORl076935;
 Tue, 11 May 2021 18:07:24 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 11 May 2021
 18:07:24 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-riscv@nongnu.org>, <alistair23@gmail.com>
CC: <dylan@andestech.com>, <alankao@andestech.com>, Ruinland Chuan-Tzu Tsai
 <ruinland@andestech.com>
Subject: [PATCH V2 0/2] Proposing custom CSR handling logic
Date: Tue, 11 May 2021 18:07:20 +0800
Message-ID: <20210511100722.18065-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 14BA7ORl076935
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 11 May 2021 10:07:50 -0000

Hi all,

My sincere apology that I missed the patch to include our own CSR table
into the patch series and there were plenty of typos.
Thus I'm sending out V2 of these tiny patches.

I agree with Alistair's comment on not introducing intrusive code which
will interfere the generic code structure. Yet since there are
possibilities that some custom CSRs/instructions could be once drafted/
proposed by vendors at first, and made themselves into the standard
as the implementation become widely adopted.

So in this patch set, we humbly utilzed a glib hash table for inserting
the `struct riscv_custom_csr_operations`, check if the CSR is a non
standard one, and then proceed the desired behavior.

Once the non-standard CSRs make themselves into the specification,
people could easily plug-and-use the code into CSR operation table
inside `csr.c`.

Ones may have concerns regarding the check code would introduce
further overhead. For those considerations, I guess it could be solved
by introducing a build option such as '--enable-riscv-vendor-features'
to toggle the code.

Cordially yours,
Ruinland ChuanTzu Tsai

Ruinland Chuan-Tzu Tsai (2):
  Adding premliminary support for custom CSR handling mechanism
  Adding custom Andes CSR table.

 target/riscv/cpu.c           |  28 ++++++++
 target/riscv/cpu.h           |  12 +++-
 target/riscv/cpu_bits.h      | 115 ++++++++++++++++++++++++++++++++
 target/riscv/csr.c           | 107 ++++++++++++++++++++++++++++--
 target/riscv/csr_andes.inc.c | 125 +++++++++++++++++++++++++++++++++++
 5 files changed, 381 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/csr_andes.inc.c

-- 
2.17.1


