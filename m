Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mJH7e-0002tf-Ip
	for mharc-qemu-riscv@gnu.org; Thu, 26 Aug 2021 11:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mJH7c-0002nW-Bl; Thu, 26 Aug 2021 11:16:52 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:22682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mJH7X-0002GW-Hk; Thu, 26 Aug 2021 11:16:52 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17QFDUZ1021710;
 Thu, 26 Aug 2021 23:13:30 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 26 Aug 2021 23:13:33 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <alistair23@gmail.com>, 
 <wangjunqiang@iscas.ac.cn>, <bin.meng@windriver.com>
CC: <alankao@andestech.com>, <dylan@andestech.com>,
 <imruinland.cs00@g2.nctu.edu.tw>, Ruinland ChuanTzu Tsai
 <ruinland@andestech.com>
Subject: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
Date: Thu, 26 Aug 2021 23:13:30 +0800
Message-ID: <20210826151332.32753-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17QFDUZ1021710
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
X-List-Received-Date: Thu, 26 Aug 2021 15:16:52 -0000

From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>

During my modification on my previous patch series for custom CSR support, I
believe this issue deserves its own discussion (or debate) because it's _not_
as simple as "just put those options in Kconfig".

The obstables I've encountered and the kluges I came up is listed as follow :

(1) Due to the design of top-level meson.build, all Kconfig options will land
into `*-config-devices.h` since minikconf will be only used after config_target
being processed. This will let to the fact that linux-users won't be able to
use custom CSR code properly becuase they only includes `*-config-devices.h`.
And that is reasonble due to the fact that changes on cpu.c and csr.c is a 
target-related matter and linux-user mode shouldn't include device related 
headers in most of cases.

So, modify meson.build to parse target/riscv/Kconfig during config_target phase
is without doubts necessary.

(2) Kconfig option `RISCV_CUSTOM_CSR` is introduced for RISC-V cpu models to 
toggle it at its will. Yet due to the fact that csr.o and cpu.o are linked
altogether for all CPU models, the suffer will be shared without option.
The only reasonable way to seperate build the fire lane which seperates vendor
flavored cpu and spec-conformed ones, is to build them seperately with options
toggled diffrently, just like RV32 and RV64 shares almost the same source base,
yet the sources are compiled with differnt flags/definitions.

To achieve that, miraculously, we can just put *.mak files into `target`
directoy, because that's how `configure` enumerates what targets are supported.

(3) The longest days are not over yet, if we take a good look at how the minikconf
is invoked during config_devices and in what way *.mak presented its options
inside `default-configs/devices`, we can see that *.mak files there is formated
in `CONFIG_*` style and the minikconf is reading directly during config_device
phase. That's totally different from *.mak files presented in
`default-configs/targets`. To make the parsing logic consistent, I
introduce a rv_custom directory inside which contains minikconf-parsable
mak files.

With this patches, ones can build a A25/AX25 linux-user platform by :
$ ./configure --target-list=riscv64-andes-linux-user,riscv32-andes-linux-user
$ make

P.S. The pacthes from :
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00913.html
is needed. A clean-up and modified version will be sent out soon.

P.P.S.
I know these parts won't be easy to digest, and the further iterations will be
needed, so I didn't ask my colleagues to sign-off for now.

Cordially yours,
Ruinland ChuanTzu Tsai

Ruinland ChuanTzu Tsai (2):
  Adding Kconfig options for custom CSR support and Andes CPU model
  Adding necessary files for Andes platforms, cores to enable custom CSR
    support

 Kconfig                                       |  1 +
 .../devices/riscv32-andes-softmmu.mak         | 17 ++++++++++++
 .../devices/riscv64-andes-softmmu.mak         | 17 ++++++++++++
 .../targets/riscv32-andes-linux-user.mak      |  1 +
 .../targets/riscv32-andes-softmmu.mak         |  1 +
 .../targets/riscv64-andes-linux-user.mak      |  1 +
 .../targets/riscv64-andes-softmmu.mak         |  1 +
 .../targets/rv_custom/no_custom.mak           |  0
 .../rv_custom/riscv32-andes-linux-user.mak    |  1 +
 .../rv_custom/riscv32-andes-softmmu.mak       |  1 +
 .../targets/rv_custom/riscv32-linux-user.mak  |  1 +
 .../targets/rv_custom/riscv32-softmmu.mak     |  1 +
 .../rv_custom/riscv64-andes-linux-user.mak    |  1 +
 .../rv_custom/riscv64-andes-softmmu.mak       |  1 +
 .../targets/rv_custom/riscv64-linux-user.mak  |  1 +
 .../targets/rv_custom/riscv64-softmmu.mak     |  1 +
 meson.build                                   | 26 +++++++++++++++++++
 target/riscv/Kconfig                          |  6 +++++
 18 files changed, 79 insertions(+)
 create mode 100644 default-configs/devices/riscv32-andes-softmmu.mak
 create mode 100644 default-configs/devices/riscv64-andes-softmmu.mak
 create mode 120000 default-configs/targets/riscv32-andes-linux-user.mak
 create mode 120000 default-configs/targets/riscv32-andes-softmmu.mak
 create mode 120000 default-configs/targets/riscv64-andes-linux-user.mak
 create mode 120000 default-configs/targets/riscv64-andes-softmmu.mak
 create mode 100644 default-configs/targets/rv_custom/no_custom.mak
 create mode 100644 default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
 create mode 100644 default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
 create mode 120000 default-configs/targets/rv_custom/riscv32-linux-user.mak
 create mode 120000 default-configs/targets/rv_custom/riscv32-softmmu.mak
 create mode 100644 default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
 create mode 100644 default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
 create mode 120000 default-configs/targets/rv_custom/riscv64-linux-user.mak
 create mode 120000 default-configs/targets/rv_custom/riscv64-softmmu.mak
 create mode 100644 target/riscv/Kconfig

-- 
2.32.0


