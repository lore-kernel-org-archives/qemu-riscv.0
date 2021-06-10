Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrLvb-0004t2-A2
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 10:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lrLvZ-0004lB-Ac; Thu, 10 Jun 2021 10:45:01 -0400
Received: from exmail.andestech.com ([60.248.187.195]:42444
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lrLvT-0000Bk-Tw; Thu, 10 Jun 2021 10:45:01 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 15AEiQit035876;
 Thu, 10 Jun 2021 22:44:26 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 10 Jun 2021
 22:44:25 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>,
 <bin.meng@windriver.com>, <alankao@andestech.com>,
 <dylan@andestech.com>, Ruinaldn ChuanTzu Tsai <ruinland@andestech.com>
Subject: [RFC PATCH v3 0/2] Proposing custom CSR handling logic
Date: Thu, 10 Jun 2021 22:44:22 +0800
Message-ID: <20210610144424.8658-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 15AEiQit035876
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
X-List-Received-Date: Thu, 10 Jun 2021 14:45:01 -0000

From: Ruinaldn ChuanTzu Tsai <ruinland@andestech.com>

The changes from V2 :
* Making custom CSR operation table become registerable.
* Re-use the riscv_csrrw() code instead of ducplication.
* Splitting custom CPU bits into seperated files.
* Splitting the AX25 CPU from the feature patch
* Adding custom/vendor value "holder."
    In previous patche

- - - -

Sorry for the late update. COVID really hit us hard lately.

I really appreciate the comments and suggestions from Bin and Alistair, and I
am very willing to answer the doubts.

For the questions regarding the hash table for CSR operations, that is because
we might have heterogeneous architecture with harts having diffrent CSR
extensions/features.
For instance, there are FLUSH32 and FLUSH64 CSR on the application cores
on the U54-MC and U74-MC series from SiFive, yet for the monitor cores (S51 and
S7), there are no such custom/vendor CSRs. Though I cannot disclose too much
for the time being, we Andes Technology have similar design choice on our
platforms; and thus, a mechanism for dynamically registering CSR operation
functions will become a substrate for further extension.

And one day if those CSRs become standardized, ones can easily pull-and-plug
the structures into `csr_ops` table.

The write_stub() is useful and necessary if such a CSR conducts some hardware 
behaviors which are hard to implement in QEMU's world view, such as cache
policies or something would fail-over in user's code, for instance, the
I/O feature probing code. And that's why we keep it inside our toolbox.

Adding TINFO is a bit in the twilight zone. It's officially documented in the
RISC-V Debug Spec, yet we Andes has our own customization (which might
come out of the shadow one day) on it and thus we decice to add the csrno in
the general parts (cpu_bits.h) and add the handling function in csr_andes.inc.c
for our further development.

For now, this patch with previously submitted Andes AE350 board support 
https://mail.gnu.org/archive/html/qemu-riscv/2021-03/msg00096.html 
could execute mainline U-boot (proper) and OpenSBI (with test payload)
successfully.


Cordially yours,
Ruinland ChuanTzu Tsai


Ruinaldn ChuanTzu Tsai (2):
  Adding Andes AX25 CPU model
  Adding preliminary custom/vendor CSR handling mechanism

 target/riscv/andes_cpu_bits.h  | 113 ++++++++++++++++++++++++
 target/riscv/cpu.c             |  37 ++++++++
 target/riscv/cpu.h             |  29 ++++++-
 target/riscv/cpu_bits.h        |   3 +
 target/riscv/csr.c             |  46 ++++++++--
 target/riscv/csr_andes.inc.c   | 153 +++++++++++++++++++++++++++++++++
 target/riscv/custom_cpu_bits.h |   3 +
 7 files changed, 375 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/andes_cpu_bits.h
 create mode 100644 target/riscv/csr_andes.inc.c
 create mode 100644 target/riscv/custom_cpu_bits.h

-- 
2.31.1


