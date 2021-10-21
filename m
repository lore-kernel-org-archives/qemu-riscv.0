Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdZlp-0007x6-1p
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 11:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZll-0007tQ-9f; Thu, 21 Oct 2021 11:14:13 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:24332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZli-0007Cj-77; Thu, 21 Oct 2021 11:14:12 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19LFD7lT088675;
 Thu, 21 Oct 2021 23:13:07 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Oct 2021
 23:13:07 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <ycliang@andestech.com>, 
 <alankao@andestech.com>, <dylan@andestech.com>, Ruinland Chuan-Tzu Tsai
 <ruinland@andestech.com>
Subject: [RFC PATCH v5 0/3] riscv: Add preliminary custom CSR support
Date: Thu, 21 Oct 2021 23:09:18 +0800
Message-ID: <20211021150921.721630-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19LFD7lT088675
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
X-List-Received-Date: Thu, 21 Oct 2021 15:14:13 -0000

Hi Alistair, Bin and all :

Sorry for bumping this stale topic.
As our last discussion, I have removed Kconfigs and meson options.
The custom CSR logic is in-built by default and whether a custom CSR
is presented on the accessing hart will be checked at runtime.

Changes from V4 :
Remove Kconfigs and meson options.
Make custom CSR handling logic self-contained.
Use g_hash_table_new instead of g_hash_table_new_full.

The performance slowdown could be easily tested with a simple program
running on linux-user mode :

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
   unsigned long diff = 1000000 * 
(end.tv_sec-start.tv_sec)+end.tv_usec-start.tv_usec;
   printf("%f\n", (double)(diff)/1000000);
   return 0;
}

$ riscv64-linux-gnu-gcc -static -DUITB ./test_csr.c -o ./u
$ riscv64-linux-gnu-gcc -static -DFCSR ./test_csr.c -o ./f
$ qemu-riscv64 ./{u,f}

Cordially yours,
Ruinland Chuan-Tzu Tsai

Ruinland Chuan-Tzu Tsai (3):
  riscv: Adding Andes A25 and AX25 cpu models
  riscv: Introduce custom CSR hooks to riscv_csrrw()
  riscv: Enable custom CSR support for Andes AX25 and A25 CPUs

 target/riscv/andes_cpu_bits.h  | 129 +++++++++++++++++++++++
 target/riscv/cpu.c             |  39 +++++++
 target/riscv/cpu.h             |  15 ++-
 target/riscv/csr.c             |  38 +++++--
 target/riscv/csr_andes.c       | 183 +++++++++++++++++++++++++++++++++
 target/riscv/custom_csr_defs.h |   8 ++
 target/riscv/meson.build       |   1 +
 7 files changed, 404 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/andes_cpu_bits.h
 create mode 100644 target/riscv/csr_andes.c
 create mode 100644 target/riscv/custom_csr_defs.h

-- 
2.25.1


