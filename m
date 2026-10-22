Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C367606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=theorem-dev.20251104.gappssmtp.com header.i=@theorem-dev.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=UjCdbaIS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJsue-0002nN-Rq; Thu, 22 Oct 2026 09:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xJksC-0005Nh-HJ
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:57:52 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xJksA-0002OZ-JD
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:57:52 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c263415982eso191284066b.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 21:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792645069; cv=none;
 d=google.com; s=arc-20260327;
 b=hA9AwctqTZjueK0V7NZvnb79YWos3pB5QcVmf3OoO8hGPT1mak787h2ln276dZDMgN
 u2p9PCBNzi52noq4EnYL7F4L6WSK6hkEuuL+APCvmnZ3yoaL4embEVT0ApNhTW2n3+q/
 JuC3bqCy/rS4VcVnlq6Aa7qw3dhuqa9nvsaQ9JQQRK83YUcNd4LDqfpmwpu1rZpRAStQ
 PyHaoP2wjbdIPnL1EFEBkr4y/f4W65XIuUUGoCYR8dA/C9ut6zf9dof1c1Jj2ffKJMR/
 I7LnASQJkuOwmZSakdTn5WeMQBLXqId825bfUvDdvbkcSEzIXg7qVGe5WezC6pLYoUZ+
 2P7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:dkim-signature;
 bh=j/IQYjLHdjCF1gb4GVDkIzT4OQ7lR/A43Idw83O4mwc=;
 fh=KzEVRCrhke8VK+WFAq+Dy0o38BVLmA8ww6Zm36tVw6w=;
 b=XYl6Yt6uxKsTfyPd3S21pstRm06RwADAVzDiKnKS7BTwL4Kt0e1ol9qd1LhdR79PIA
 I3jlb6vJ+TSXQKzTQUun8QMxwEpWCggxIgVrSOOQ2CChGgb8ceVf15XclxkBYGfnNUH1
 IV50mmvS3TuicUFQ8X6npUJ53rxZo0N3LQyCl7vdzZARtD1xC/5wcfpyAk29baupJ/xp
 yiSeNVH2zjI9M5Hv4Vy0lx730tmf4stvMBeL8RMK325jps5LXlfG1oaTjsQxS10xeGh5
 697f7R9sbXProwKZhjMCRqFSOswHyMcMj47amzvHqOfF0+E4rv2LBPN0aVCnBIJgNHVF
 9vEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theorem-dev.20251104.gappssmtp.com; s=20251104; t=1792645069; x=1793249869;
 darn=nongnu.org; 
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=j/IQYjLHdjCF1gb4GVDkIzT4OQ7lR/A43Idw83O4mwc=;
 b=UjCdbaISZm00LAXurOIXnFWXVlYLyq9NEjk1Sv9p7ZL1W3Gte8soQQE1bR3XsZhux0
 CyAfg2C8y7fOJp129gornv3cJgDIsZvOKkgtlCQ6/3wKhi+MR2E/mCXj7WkHue8Eczez
 NG9DWEBiqROxzM/JnKkjNmqASaPbkQJC1UE3s+5tn5NV8VXQt3OL5MuhvmmwqJiiwRJ+
 lBN7TJQDklmRHeAHFPeSH/jgliPIfHaK4K98CfWC7od8rdex7BjnT7zqCwlj8VDMYeIV
 QhIK70KxFOnA+Tj84X0BtFgbfjYL/q9rxap2n6w39mScxAZK02Euky/Cn7EvapvDbO40
 xK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792645069; x=1793249869;
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j/IQYjLHdjCF1gb4GVDkIzT4OQ7lR/A43Idw83O4mwc=;
 b=dnjUxl9Jpi5dK2sRbX6O/tj6EP8TNg19k+SbJGRLMlHBFLZbF4aXIQ8t6UKM4qI6W0
 HvdXor/eMKWPlDxnOTnM53xkVeJJek5HS2tf+PqkLLdkhw3tJ8w29Lw5Po3W1xrYuE2C
 5qJM0/xbs+ZZEZREoNJGlVJAKqrQ2P7KxO0btJ4MyrvB+7iGvgct7aQybeNPowkSaBKk
 b3t2zKSuFJE0kf4wgARcLDTI50SQN9gswPD7yRAG7mNYEO5d2WK19VhfRfyy3rNBUges
 qyNEY+IjKeheap8t2wR2pjX6qKpuF+BTkGqXuLQ/a0DHckCNG8rhRzUBD1QXsMyttVfy
 y0SA==
X-Gm-Message-State: AFq9FYKtgJmqrXTdTdeYl8aCXPG1WJ1jfHhDOcfL1rqUuM/nSyq95f1l
 bU9w3PJsHo1ta2nc6oW4ffLCk/Jp1XW6r9iPB+nxKrhjZgVLNvUh2Vk2MxCtSnF5Is+WckgSy1c
 gj9rBnxYSdvLe6uIJz1MmzavTcmBzjytG4cpTAygljlK8c8upqDZBlgN/Nw==
X-Gm-Gg: AYBFou1cAIytURn2IQ7eMp8vLsoqgOoKuf5nSM9Y8utLs9I3Ki0yt5KNE86aHzUT8Ff
 n238WgBAZnoJwJ6UVncwDwliFv/puvS1FVnXiFOyqGRBP6ahWVkekob6KQOJEmavPzSEvF2adem
 TxBW9ZIy8mYuocxb2/jGHJnrEQtxgwIVi49GDcEQrZTP1HoQJ0vwBqVko00Ns/frikMnjrixrPq
 PiIO2H+Ke9Jry6ooIPZXlBw/cIiT3paf9f6GTp1BCDODk7B196QZkiK/6Mo57qCfZMV9kDYZI88
 X6VSBpBQvHhl2GzrRVZALh/6gQqyjDKtg1R273mw/eLthOAQTp+w5V6IL1rSjDsifVUaOLLr90/
 4lV7Mm3y2XSY5RHUQl1DQMSOBJnELjY4iSIVrjeQQ0zOOPw96NMeIkN3FzGg=
X-Received: by 2002:a17:907:6e8e:b0:c40:5de7:33d3 with SMTP id
 a640c23a62f3a-c467975dfeemr366448066b.35.1792645068984; Wed, 21 Oct 2026
 21:57:48 -0700 (PDT)
Received: from 428534693058 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:57:47 -0400
Received: from 428534693058 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:57:47 -0400
From: tewaro <tewaro@theorem.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022045737.67060-1-tewaro@theorem.dev>
References: <20261022045737.67060-1-tewaro@theorem.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 00:57:47 -0400
X-Gm-Features: AclHuK9Q6bzEfzTCX8xnUe3RGN8yhRG6E1lHVF1o5FSe0Y_wTZckkQ7DvnaWOQw
Message-ID: <CAEq2Q90Lvd4PMtxhj=2B-v5BiOdgBsgo2q5sFV-B4UcRFdEHkA@mail.gmail.com>
Subject: [PATCH 1/2] target/riscv: do not raise the no-PMP-rule access fault
 from mret
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, disclosures@theorem.dev, tewaro <tewaro@tewaro.org>,
 tewaro <tewaro@theorem.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=tewaro@theorem.dev; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Oct 2026 09:32:31 -0400
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

Fixes: d102f19a2085 ("target/riscv/pmp: Raise exception if no PMP
entry is configured")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2074
Signed-off-by: tewaro <tewaro@theorem.dev>
---
 target/riscv/tcg/op_helper.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index b67c7718db..a355d28f4b 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -423,7 +423,6 @@ target_ulong helper_sret(CPURISCVState *env)
 }

 static void check_ret_from_m_mode(CPURISCVState *env, target_ulong retpc,
-                                  privilege_mode_t prev_priv,
                                   uintptr_t ra)
 {
     if (!(env->priv >= PRV_M)) {
@@ -435,11 +434,6 @@ static void check_ret_from_m_mode(CPURISCVState
*env, target_ulong retpc,
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
@@ -465,7 +459,7 @@ target_ulong helper_mret(CPURISCVState *env)
     privilege_mode_t prev_priv = get_field(mstatus, MSTATUS_MPP);
     uintptr_t ra = GETPC();

-    check_ret_from_m_mode(env, retpc, prev_priv, ra);
+    check_ret_from_m_mode(env, retpc, ra);

     bool prev_virt = !!(get_field(env->mstatus, MSTATUS_MPV) &&
                      (prev_priv != PRV_M));
@@ -515,7 +509,7 @@ target_ulong helper_mnret(CPURISCVState *env)
     bool prev_virt;
     uintptr_t ra = GETPC();

-    check_ret_from_m_mode(env, retpc, prev_priv, ra);
+    check_ret_from_m_mode(env, retpc, ra);

     prev_virt = !!(get_field(env->mnstatus, MNSTATUS_MNPV) &&
                 (prev_priv != PRV_M));
-- 
2.47.3

