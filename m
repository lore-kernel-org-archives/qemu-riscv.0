Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgLYq-0000vV-Ce
	for mharc-qemu-riscv@gnu.org; Tue, 11 May 2021 02:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lgLYo-0000pp-Aw
 for qemu-riscv@nongnu.org; Tue, 11 May 2021 02:08:02 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:60589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lgLYj-0002Bv-Ka
 for qemu-riscv@nongnu.org; Tue, 11 May 2021 02:08:01 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 14B677xS006419;
 Tue, 11 May 2021 14:07:07 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 11 May 2021
 14:07:07 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-riscv@nongnu.org>, <alistair23@gmail.com>
CC: <dylan@andestech.com>, <imruinland.cs00@g2.nctu.edu.tw>,
 <alan@andestech.com>, Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Subject: [PATCH 0/1] Proposing custom CSR handling logic
Date: Tue, 11 May 2021 14:07:03 +0800
Message-ID: <20210511060704.10675-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 14B677xS006419
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
X-List-Received-Date: Tue, 11 May 2021 06:08:02 -0000

Hi all,

It seesm that Nuclei System Technology has sent out their platform 
support patches and there are concern regarding introducing intrusive
non-standard code into QEMU base. Since we have been discussed with
Nuclei couples of months ago, and thus we decide it's time for us to
join the party.

As we discussed with Nuclei privately, we basically borrows the idea
from Renode's own QEMU/TCG fork - - introducing extralogic on
riscv_csrrw().

Just for the show start, we have been ported our custom instruction
handling code and testing internally quite a while. Currently we can
boot Linux with OpenSBI succcesfully, and we will upstrean the code
as soon as possible.

Cordially yours,
Ruinland

Ruinland Chuan-Tzu Tsai (1):
  Adding premliminary support for custom CSR handling mechanism

 target/riscv/cpu.c      |  28 ++++++++++
 target/riscv/cpu.h      |  12 ++++-
 target/riscv/cpu_bits.h | 115 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/csr.c      | 107 +++++++++++++++++++++++++++++++++++--
 4 files changed, 256 insertions(+), 6 deletions(-)

-- 
2.17.1


