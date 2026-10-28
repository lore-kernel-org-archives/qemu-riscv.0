Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E1A606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=theorem-dev.20260707.gappssmtp.com header.i=@theorem-dev.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=X0Dxfv1B
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM9qa-0001cw-Tt; Wed, 28 Oct 2026 16:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xM9qE-0001Yb-I9
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 16:01:46 -0400
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xM9qA-0000q3-JS
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 16:01:45 -0400
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-1931ff67a29so358303c88.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 13:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theorem-dev.20260707.gappssmtp.com; s=20260707; t=1793217700; x=1793822500;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ayXbsNeWp2Luf8HW8I6Rc7+K+FZ7MWfouohP7qjFe2Q=;
 b=X0Dxfv1Bnemo+1d8A+Wh5uUSRmHAk0tjxNg812X/Z0HHkwM3h1qhydjjSkX4wdAEN+
 ZFzsBmZXy8FaPxGorOvL49nX6yjVdcskdzLoTKFQVae6l0Sp2aIEAVa/1mu9kZC5DqPp
 v2QnjMkqa9bIGeIZjpn/PTWvf54X4qu1J8YCQ0gsLU6YbcA4Lq/rnBBJKAN4lIpV+vfx
 suZsqENWxojWP9jtTGSjuJE2S4bd1ZmSoPeQ4JMaCqbjWaJdxqKqA4pFOmJyx+P4AF0d
 CORhM6YAfa8EDDrz6gG9ZAS08V5A4m0u88CtnSHgcvuAoxJnwG4hWsu8WyJop1/kUmrI
 fBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793217700; x=1793822500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ayXbsNeWp2Luf8HW8I6Rc7+K+FZ7MWfouohP7qjFe2Q=;
 b=gh81eBAUzypU8BFgQ9kidoNQ8gaSGzBvuKaGGryZki1iLo54FxWMDSNjdswLZiOD/6
 XNY5PWHkhKfDyvSAqr/VSF3OdomDR/fh4m8vywhkqktOQ1LdqruvmyGpk8D6A4bAmO6Z
 r8mKj+BP57H1x74wRwXZVOquhd01mf5F3X3mruJH5/hjWzY73t1kan7Ik/MLOnRooQQk
 +QngBxGmAYgUM+Ke4B/NrUM2e7UF5084D7pQQC4fW6fDOIbBYRJ+h57BBF+OLny9ZQ1h
 0DdSmbRkvss8sK4a7YzXxJjuB4ourbghxfNTe+Kd+GpTvGzVtcL2YAopQWTZ/cKiWbPH
 Ietg==
X-Gm-Message-State: AFq9FYI3na5kfp5GimlgHPwj6o44+fAlAwHR+SdOHWiGTwJjtYUwnI67
 FU6R4G7PZopEUt5CQ3VslKwd8m1Hkr5hi/nMcYnCpfhOPYPvmgT3W9HQGvQK7n+sWRU=
X-Gm-Gg: AYBFou1Cc6QqMiE418M3/1J8wjcAq50V8PelL1B7ttun4V5iU/DL8YEi8Bpe7oOGcqY
 fB+MZgZe8qfK62BJ+lEpZrU63MHvP1Ye/u6XBUM7gAhkRdhJIxa+TGZb7DE1SmlP+56KDI+zpIm
 C44BVeWwE4IdsKjowfvk+DZ7EwxvvciA8kKQQyYqSAZrI0v2mJMyFMMre73GBUs0IfrbgChS8W0
 i/Whmh3eRfj8u442knqykykQz3UvIjqCCsAPLiaKpKgYleS31MsaUYsSEwDsBSes6qN5LoU4WBn
 4oHMtfea+g3VlLfDQ/Z6TWhrtnOmFDitBh1IStaeyjrmuBCVZr7nqCik0x3UU9BXyUai0HxF5sN
 xPTBbpBy3gCRMLsLoQ44FaSHb0Kl8P5//XmdGcqG7Wkwzmfj6fkIpmytxkYaWhoWaETYhRcn80s
 I60iRcKL12/uXwHzetoHYZ1Z588FtEJmIRHLL4xfHThVd3wOASFZNCjHQHNXcU/HiUl4gYzoRN5
 hdui7kulnNyCVC3+Ue1LnYiXkV6CwiddGj0wthL4fKfCCP0nhqoEpNSM7fv7skWW77INXeKPmzY
 coIjNjFQ+w4yBX4uVj7Tiqecwp/fgH8rTZ9ORZQ5HHgu8n7c/4MjnPPhj0m5
X-Received: by 2002:a05:701b:2803:b0:1a7:979f:ecc0 with SMTP id
 a92af1059eb24-1a7979fecd8mr2710784c88.27.1793217699795; 
 Wed, 28 Oct 2026 13:01:39 -0700 (PDT)
Received: from tewaros-mbp.localdomain ([209.249.241.138])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1a75fdc1031sm8026427c88.19.2026.10.28.13.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:01:38 -0700 (PDT)
From: tewaro <tewaro@theorem.dev>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 disclosures@theorem.dev, tewaro@tewaro.org, tewaro <tewaro@theorem.dev>
Subject: [PATCH v2 1/2] target/riscv: do not raise the no-PMP-rule access
 fault from mret
Date: Wed, 28 Oct 2026 13:01:22 -0700
Message-ID: <fbeadd5b2fe5ccfd20b52dbccd4e5856f215ede0.1793217528.git.tewaro@theorem.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793217528.git.tewaro@theorem.dev>
References: <cover.1793217528.git.tewaro@theorem.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1229;
 envelope-from=tewaro@theorem.dev; helo=mail-dl1-x1229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Consider a CPU that implements PMP but has no PMP entry configured.
If M-mode executes mret with MPP set to S or U, QEMU raises an
instruction access fault on the mret. The trap is taken in M-mode,
with mepc pointing at the mret, mtval zero and MPP equal to M.

The spec says the mret succeeds and the first S/U-mode fetch fails
[1][2]. The trap should therefore be taken from S/U-mode, with mepc
and mtval equal to the mret target [3][4] and MPP equal to S/U [5].

The early check in check_ret_from_m_mode() is what moves the fault
onto the mret. Without it, the fetch at the target misses the TB and
TLB caches, which are keyed by privilege level, and reaches
pmp_hart_has_privs_default() through riscv_cpu_tlb_fill(). That
function already denies S/U-mode when no rule matches. Nothing
executes between the privilege switch and that fetch, so no other
behaviour changes.

As it stands, S/U-mode can never be entered on such a configuration,
and a handler that steps mepc past the apparent fault resumes in
M-mode at the S-mode entry point (GitLab issue #2074).

The check was added by commit d102f19a208 alongside the pmp.c change
that makes the no-rule path M-mode-only, and I believe it was already
redundant then. Building v6.0.0 and v7.2.0 with only the check removed
confirms the fetch faults as expected. Later commits (0fbb5d2d3c9,
4c48aad1, 3157a553, 16aa7771) changed its gating, cause and location
but not the normal path. Remove it and the now unused prev_priv
parameter.

The bug was found and debugged with the help of Claude (Anthropic),
used as a research and debugging aid; the patch was written by hand.

[1] Privileged ISA v1.12, 3.7.1 "Physical Memory Protection CSRs",
    Priority and Matching Logic
[2] Privileged ISA v1.12, 3.3.2 "Trap-Return Instructions"
[3] Privileged ISA v1.12, 3.1.14 "Machine Exception Program Counter"
[4] Privileged ISA v1.12, 3.1.16 "Machine Trap Value Register"
[5] Privileged ISA v1.12, 3.1.6.1 "Privilege and Global
    Interrupt-Enable Stack in mstatus register"

Privileged ISA v1.12 (ratified, 2021-12-03):
https://github.com/riscv/riscv-isa-manual/releases/tag/Priv-v1.12
Current source, same wording:
https://github.com/riscv/riscv-isa-manual/blob/4877e41a/src/priv/machine.adoc

Fixes: d102f19a2085 ("target/riscv/pmp: Raise exception if no PMP entry is configured")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2074
Signed-off-by: tewaro <tewaro@theorem.dev>
---
v2: rebased onto current master; no change.

 target/riscv/tcg/op_helper.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index f9c79fe6b9..e46190079a 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -388,7 +388,6 @@ target_ulong HELPER(sret)(CPURISCVState *env)
 }
 
 static void check_ret_from_m_mode(CPURISCVState *env, target_ulong retpc,
-                                  privilege_mode_t prev_priv,
                                   uintptr_t ra)
 {
     if (!(env->priv >= PRV_M)) {
@@ -400,11 +399,6 @@ static void check_ret_from_m_mode(CPURISCVState *env, target_ulong retpc,
                                     env->misa_ext) && (retpc & 0x3)) {
         riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, ra);
     }
-
-    if (riscv_cpu_cfg(env)->pmp &&
-        !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
-        riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, ra);
-    }
 }
 static target_ulong ssdbltrp_mxret(CPURISCVState *env, target_ulong mstatus,
                                    privilege_mode_t prev_priv,
@@ -430,7 +424,7 @@ target_ulong HELPER(mret)(CPURISCVState *env)
     privilege_mode_t prev_priv = get_field(mstatus, MSTATUS_MPP);
     uintptr_t ra = GETPC();
 
-    check_ret_from_m_mode(env, retpc, prev_priv, ra);
+    check_ret_from_m_mode(env, retpc, ra);
 
     bool prev_virt = !!(get_field(env->mstatus, MSTATUS_MPV) &&
                      (prev_priv != PRV_M));
@@ -548,7 +542,7 @@ target_ulong HELPER(mnret)(CPURISCVState *env)
     bool prev_virt;
     uintptr_t ra = GETPC();
 
-    check_ret_from_m_mode(env, retpc, prev_priv, ra);
+    check_ret_from_m_mode(env, retpc, ra);
 
     prev_virt = !!(get_field(env->mnstatus, MNSTATUS_MNPV) &&
                 (prev_priv != PRV_M));
-- 
2.54.0 (Apple Git-157)


