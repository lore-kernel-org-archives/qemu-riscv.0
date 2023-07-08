Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26160EB64DD
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 05:44:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qI0k0-00030R-BX; Sat, 08 Jul 2023 01:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reaperlu@hust.edu.cn>)
 id 1qI0ju-0002Jb-2M; Sat, 08 Jul 2023 01:44:14 -0400
Received: from [202.114.0.240] (helo=hust.edu.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reaperlu@hust.edu.cn>)
 id 1qI0jr-0002Ed-EX; Sat, 08 Jul 2023 01:44:13 -0400
Received: from localhost.localdomain ([10.12.190.169])
 (user=reaperlu@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 3685giX2008244-3685giX4008244
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 8 Jul 2023 13:43:10 +0800
From: Ruibo Lu <reaperlu@hust.edu.cn>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, luruibo2000@163.com, alistair.francis@wdc.com,
 liweiwei@iscas.ac.cn,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/2] target/riscv: Optimize ambiguous local variable in
 pmp_hart_has_privs
Date: Sat,  8 Jul 2023 13:36:31 +0800
Message-ID: <20230708054236.18353-2-reaperlu@hust.edu.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230708054236.18353-1-reaperlu@hust.edu.cn>
References: <20230708054236.18353-1-reaperlu@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: reaperlu@hust.edu.cn
X-Host-Lookup-Failed: Reverse DNS lookup failed for 202.114.0.240 (deferred)
Received-SPF: pass client-ip=202.114.0.240; envelope-from=reaperlu@hust.edu.cn;
 helo=hust.edu.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

These two values represents whether start/end address is in pmp_range.
However, the type and name of them is ambiguous. This commit change the
name and type of them to improve code readability and accuracy.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1735
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org> 
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Ruibo Lu <reaperlu@hust.edu.cn>
---
 target/riscv/pmp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 1a9279ba88..ea3d29217a 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -203,16 +203,16 @@ void pmp_update_rule_nums(CPURISCVState *env)
     }
 }
 
-static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
-                           target_ulong addr)
+static bool pmp_is_in_range(CPURISCVState *env, int pmp_index,
+                            target_ulong addr)
 {
-    int result = 0;
+    bool result = false;
 
     if ((addr >= env->pmp_state.addr[pmp_index].sa) &&
         (addr <= env->pmp_state.addr[pmp_index].ea)) {
-        result = 1;
+        result = true;
     } else {
-        result = 0;
+        result = false;
     }
 
     return result;
@@ -287,8 +287,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 {
     int i = 0;
     int pmp_size = 0;
-    target_ulong s = 0;
-    target_ulong e = 0;
+    bool sa_in = false;
+    bool ea_in = false;
 
     /* Short cut if no rules */
     if (0 == pmp_get_num_rules(env)) {
@@ -314,11 +314,11 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
      * from low to high
      */
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
-        s = pmp_is_in_range(env, i, addr);
-        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
+        sa_in = pmp_is_in_range(env, i, addr);
+        ea_in = pmp_is_in_range(env, i, addr + pmp_size - 1);
 
         /* partially inside */
-        if ((s + e) == 1) {
+        if (sa_in ^ ea_in) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "pmp violation - access is partially inside\n");
             *allowed_privs = 0;
@@ -339,7 +339,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
             (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
             ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
 
-        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
+        if (sa_in && ea_in && (PMP_AMATCH_OFF != a_field)) {
             /*
              * If the PMP entry is not off and the address is in range,
              * do the priv check
-- 
2.41.0


