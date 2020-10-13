Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSO8j-0002iF-Qx
	for mharc-qemu-riscv@gnu.org; Tue, 13 Oct 2020 13:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1kSO8e-0002gB-Lk; Tue, 13 Oct 2020 13:31:05 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:43311
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1kSO8c-0002S3-Ni; Tue, 13 Oct 2020 13:31:04 -0400
Received: from [86.56.119.37] (helo=george-laptop.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1kSO8Y-0000P0-Tb; Tue, 13 Oct 2020 19:30:58 +0200
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH] target/riscv: Fix update of hstatus.GVA in
 riscv_cpu_do_interrupt
Date: Tue, 13 Oct 2020 19:30:54 +0200
Message-Id: <20201013173054.451135-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 13 Oct 2020 17:31:06 -0000

The hstatus.GVA bit was not set if the faulting guest virtual address
was zero.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 target/riscv/cpu_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 904899054d..c5852ce1b7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -852,6 +852,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     target_ulong deleg = async ? env->mideleg : env->medeleg;
+    bool write_tval = false;
     target_ulong tval = 0;
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
@@ -873,6 +874,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
+            write_tval  = true;
             tval = env->badaddr;
             break;
         default:
@@ -904,7 +906,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
 
             if ((riscv_cpu_virt_enabled(env) ||
-                 riscv_cpu_two_stage_lookup(env)) && tval) {
+                 riscv_cpu_two_stage_lookup(env)) && write_tval) {
                 /*
                  * If we are writing a guest virtual address to stval, set
                  * this to 1. If we are trapping to VS we will set this to 0
-- 
2.25.1


