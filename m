Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBhc5-0007gP-IH
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 13:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBhc4-0007e9-4i; Thu, 05 Aug 2021 13:57:00 -0400
Received: from exmail.andestech.com ([60.248.187.195]:13049
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBhbz-0007p6-VK; Thu, 05 Aug 2021 13:56:59 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 175HuPF5055921;
 Fri, 6 Aug 2021 01:56:25 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Fri, 6 Aug 2021 01:56:26 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <ruinland@andestech.com>, <wangjunqiang@iscas.ac.cn>,
 <bin.meng@windriver.com>
Subject: [RFC PATCH v4 0/4] Add basic support for custom CSR
Date: Fri, 6 Aug 2021 01:56:22 +0800
Message-ID: <20210805175626.11573-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 175HuPF5055921
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
X-List-Received-Date: Thu, 05 Aug 2021 17:57:00 -0000

From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>

Dear all,

In this patch, the implementation of custom CSR handling logic is introduced.

If --enable-riscv-custom is set during configuration, custom CSR logic will be
turned on. During CPU model initialization, setup_custom_csr() is invoked to
register vendor-provided custom CSR opsets into a hash table.
When accessing a CSR, in riscv_csrrw(), is_custom_csr() will be called to check
whether the encountering csrno is a custom CSR. If that's a custom one, a
struct riscv_csr_operations will be returned and such CSR will be served
accordingly.

The performance slowdown could be easily tested with a simple program running
on linux-user mode.

/* test_csr.c */
#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>

int main (int ac, char *av[]) {
   struct  timeval start;
   struct  timeval end;
   gettimeofday(&start,NULL);
   unsigned int loop_n = 999999 ;
   unsigned char i;
   unsigned char o;
   do {
       for(i=0; i<32; i++) { 
       #if defined(FCSR)
       __asm__("csrw fcsr, %0;"::"r"(i));
       __asm__("csrr %0, fcsr;":"=r"(o));
       #elif defined(UITB)
       __asm__("csrw 0x800, %0;"::"r"(i));
       __asm__("csrr %0, 0x800;":"=r"(o));
       #endif
       }
       --loop_n;
   } while (loop_n > 0);
   gettimeofday(&end,NULL);
   unsigned long diff = 1000000 * (end.tv_sec-start.tv_sec)+end.tv_usec-start.tv_usec;
   printf("%f\n", (double)(diff)/1000000);
   return 0;
}

$ riscv64-linux-gnu-gcc -static -DUITB ./test_csr.c -o ./u
$ riscv64-linux-gnu-gcc -static -DFCSR ./test_csr.c -o ./f

For a custom CSR, uitb, being accessed on andes-ax25 :
$ ./build/qemu-riscv64 -cpu andes-ax25 ./u
4.283091

For a stock CSR, fcsr, being accessed on andes-ax25:
$ ./build/qemu-riscv64 ./f
3.875519

For a custom CSR being accessed on stock rv64:
$ ./build/qemu-riscv64 -cpu rv64 ./u
Illegal instruction (core dumped)
# This is expected to fail.

Currently, the statics on my hands shows that :
When the custom CSR handling mechanism is activated, we will suffer a 17% slow-
down on stock CSRs and the penalty of accessing to a custom CSR will be another
7% more.

Cordially yours,
Ruinland ChuanTzu Tsai

Changes from v3 :
* Adding options in configure and meson files to turn on/off custom CSR logic.
* Adding unlikely() to check if custom_csr_map is set.
* Moving any32 and any out of !(CONFIG_USER_ONLY) for enabling linux-user mode.
* Fix comment style, add missing license boilerplate.


Ruinalnd ChuanTzu Tsai (4):
  Adding basic custom/vendor CSR handling mechanism
  Adding Andes AX25 and A25 CPU model
  Enable custom CSR logic for Andes AX25 and A25
  Add options to config/meson files for custom CSR

 configure                      |   6 ++
 meson.build                    |   2 +
 meson_options.txt              |   2 +
 target/riscv/andes_cpu_bits.h  | 124 +++++++++++++++++++++++++
 target/riscv/cpu.c             |  51 +++++++++++
 target/riscv/cpu.h             |  33 ++++++-
 target/riscv/cpu_bits.h        |   4 +
 target/riscv/csr.c             |  83 ++++++++++++++---
 target/riscv/csr_andes.inc.c   | 160 +++++++++++++++++++++++++++++++++
 target/riscv/custom_cpu_bits.h |  12 +++
 10 files changed, 462 insertions(+), 15 deletions(-)
 create mode 100644 target/riscv/andes_cpu_bits.h
 create mode 100644 target/riscv/csr_andes.inc.c
 create mode 100644 target/riscv/custom_cpu_bits.h

-- 
2.32.0


