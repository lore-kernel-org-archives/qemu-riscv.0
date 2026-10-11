Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BC8CA9EC7
	for <qemu-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 04:06:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFkpT-0007lL-Tn; Sun, 11 Oct 2026 00:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebasjosue84@gmail.com>)
 id 1xFkpR-0007l4-Ta
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 00:06:30 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sebasjosue84@gmail.com>)
 id 1xFkpQ-0002Yz-6K
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 00:06:29 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-5e4d95e3e55so327740e0c.2
 for <qemu-riscv@nongnu.org>; Sat, 10 Oct 2026 21:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791691586; x=1792296386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D14PHYKTzv+vsB1RTM6RUy2ukdlwKgLV0dDbuBxWFyc=;
 b=jNtd6WH8mVpf2Qeicn70JRnl03gZi4ljrOWMuQ6bAxD1CaFm4okvuO2cp/hGs3uWGp
 G7+fPcc8A9OvsOc9gAqqnxttTElMxtP0EPs+mjTsVFKbEitsQB1wztLYavSr8gI5aT7a
 UsahzkKUxcWvfYhk9dXh3HR6oFjRGQ0uRlaKHur+XNsl8emS6ispuYK3/t+f73ZnbdBK
 u4Q+df4eFeGNDqTHAe+oPo/g9iajDsbBRoRm9b2Y2xAbaSnCJkCkF44+us8yQo6WinCT
 u5Cujy+RrNYgzJS7/fC2zPHwASgNTwT/YfFpk2z2mtG66KiYjklbs7rq9do/0kLfm+Gh
 1HsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791691586; x=1792296386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D14PHYKTzv+vsB1RTM6RUy2ukdlwKgLV0dDbuBxWFyc=;
 b=fwar/GMhblCBm8pNwBJJro7WJp7btr/MtBlpKC7IiMwq+PjpbdRTEyENtq9+KxQXdr
 j5H/H64mMVM/kTHxUNgE1l27JGIW5EyogYfXWQtLN+5HgKHeYvk1+8ZstVFgpE6ZN/Rx
 dDPFGFZEqxRhNMMp84e0ynSh/Xk48apXfoMH5qeUCcRyrlwi4zbZN2OEMpjcxBkIf8EK
 TvdEtkim0DCd4l95O/JtrOb23tgnKfuAXvIjHCK63ftKQHyUzubyf2n68h+hOCkRnb4q
 rlfyfCV35QJSBenX/ZxsBsTyqHxaBx0DWmYWgY4B+rz9CmCzG6uxUuKmH6lyGkBuVCYv
 AMdQ==
X-Gm-Message-State: AFq9FYIb8/3zC07rPRemT61zE/Z0sH57vy4ZDRlDKhj0RwKaJGJgGTsN
 w81Hq/zDuHp1q1dpnKzoUO+s3yaVZ8zJnUt46EQGYZk1QL4QwKv0DVfF
X-Gm-Gg: AYBFou3fxL8uT63rSxaUF4MAWa+H4VHD6agTi1Cv7LK3g8I0U3I3G24MqWaL3tT97aV
 w6EkD/rSXkH8M6ATFs97WmTD5KobfzZo1WwxY7PnVbVPUE2xilVKKFgPj3SWp3FWfX8w6k0LU0u
 kxrSFwiPzUAijBhFOZGfbDgyeQqxFPEghVvZJDhuW5/eTwfVYjfKj06nZJymHLdb38drirpwhUj
 Hs4F7XZZ0rJtpLbaj3r/FlNyPlZsSfIgJ5xhfXcJipQ0ngKskP7LbHlPUkFYtCCk4AaUZW0iJ8N
 zYjm82zRKXIziJ79p0CVvd56xUcsgjkiQkiMUrWrLAoqPNWD56s+eA+6MWb/IfiEMGM6iEE5JIO
 zKAyEKX6zauux4eTaD/aC/rJB5keuu5CUkgqOWP2ChVXcwZzHNBVR0Ecex79atk3PZEm6K2AkN9
 jwU5cJ1DDtEzYYvec1fRK4hOrVebKG3sD31qk7FXDM4AOalPZnYalMgLiV/jVHQ87swC7qES2zL
 7Emfwe/SNVanzgAiOQFr5GGGr5Dy7uNYxymNt0997ThctWsSB9wkfZWno7Eg8g=
X-Received: by 2002:a05:6102:5cca:b0:7c4:a0e4:1a79 with SMTP id
 ada2fe7eead31-7cb37317ab0mr1312754137.19.1791691586437; 
 Sat, 10 Oct 2026 21:06:26 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7cb354016d6sm4743918137.8.2026.10.10.21.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 21:06:24 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 richard.henderson@linaro.org, Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH v2] target/riscv: pmp: clear the entire PMP state on reset
Date: Sat, 10 Oct 2026 22:06:17 -0600
Message-ID: <20261011040617.807504-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916034331.2390427-1-sebasjosue84@gmail.com>
References: <20260916034331.2390427-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=sebasjosue84@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

pmp_unlock_entries() bounded its loop with pmp_get_num_rules(), which
returns the number of entries whose A field is not OFF rather than the
number of implemented entries. With a sparse configuration the loop
stops early: with entries 0 and 1 OFF and entries 2 and 3 locked,
num_rules is 2, the loop covers i = 0 and i = 1, and entries 2 and 3
keep their lock and address-match bits across reset.

riscv_cpu_reset_hold() clears mseccfg, and with it RLB, before calling
this, so pmp_is_readonly() then silently discards every subsequent
pmpcfg write to those entries. The stale rules survive for the
lifetime of the machine.

Clearing only PMP_LOCK and PMP_AMATCH is not enough either. The priv
spec only mandates that the A and L fields be reset, but QEMU keeps
derived state next to the architectural registers: pmp_state.addr[]
and pmp_state.num_rules are recomputed from the pmpaddr and pmpcfg
write paths only, never at reset. pmp_is_in_range() compares against
addr[].sa and addr[].ea without consulting the A field, and the
partially-inside check in pmp_hart_has_privs() runs before the A
field is tested, so a range left over from before the reset can still
deny an access that straddles its boundary once the guest configures
any entry again.

Zero the whole structure instead. Zero is the correct reset value for
every field: a cfg_reg of 0 is A=OFF with no permissions, and a
num_rules of 0 restores the no-rules short cut. Rename the function
since it no longer only unlocks entries.

Fixes: 4bf501dc0118 ("target/riscv: pmp: Clear pmp/smepmp bits on reset")
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
---
Changes in v2:
- Zero the whole env->pmp_state instead of masking PMP_LOCK and
  PMP_AMATCH over a bounded set of entries, as suggested by Richard.
  v1 also left pmp_state.addr[] and pmp_state.num_rules stale across
  reset, which the memset covers as well.

v1: https://lore.kernel.org/qemu-devel/20260916034331.2390427-1-sebasjosue84@gmail.com/

 target/riscv/cpu.c     | 4 ++--
 target/riscv/tcg/pmp.c | 9 ++-------
 target/riscv/tcg/pmp.h | 2 +-
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index da4c1a090b..0b71196507 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1048,7 +1048,7 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     }
 
     /*
-     * Clear mseccfg and unlock all the PMP entries upon reset.
+     * Clear mseccfg and the PMP state upon reset.
      * This is required as per the priv, smepmp, and other security
      * extension specifications that share this CSR, and is needed
      * to clear stale entries across reboots.
@@ -1060,7 +1060,7 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
         env->mseccfg = 0;
     }
 
-    pmp_unlock_entries(env);
+    pmp_reset(env);
 #endif /* ifdef CONFIG_TCG */
 #else
     env->priv = PRV_U;
diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 41b55519a8..437e0ff2af 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -199,14 +199,9 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
     return false;
 }
 
-void pmp_unlock_entries(CPURISCVState *env)
+void pmp_reset(CPURISCVState *env)
 {
-    uint32_t pmp_num = pmp_get_num_rules(env);
-    int i;
-
-    for (i = 0; i < pmp_num; i++) {
-        env->pmp_state.pmp[i].cfg_reg &= ~(PMP_LOCK | PMP_AMATCH);
-    }
+    memset(&env->pmp_state, 0, sizeof(env->pmp_state));
 }
 
 static void pmp_decode_napot(hwaddr a, hwaddr *sa, hwaddr *ea)
diff --git a/target/riscv/tcg/pmp.h b/target/riscv/tcg/pmp.h
index 4c95c2767a..99546934fc 100644
--- a/target/riscv/tcg/pmp.h
+++ b/target/riscv/tcg/pmp.h
@@ -79,7 +79,7 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
 int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
-void pmp_unlock_entries(CPURISCVState *env);
+void pmp_reset(CPURISCVState *env);
 
 #define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
 #define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
-- 
2.43.0


