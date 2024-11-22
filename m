Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B415E65D19
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 03:23:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEKFs-0005Zy-Ic; Thu, 21 Nov 2024 22:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFl-0005YH-KH
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:42 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFj-0003yD-Vd
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:41 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-724d8422f37so893886b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 19:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732245758; x=1732850558; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ziiRgdmp8/djQe/OUBTNWsmMki7f4gTCJYiLTqE+tsI=;
 b=nrEOSj34AwGeGhQTKJm8SdtItppW7xri/R+l3eQBAIrI1DPrmWnBSoTQxuOmRG3mzM
 CKNUhxk1g1XDkYi+y17P467FfWhc7Y8IWm3gwwNrm2b0m/cVXWsmu/3D9rX/aDKxLbuy
 lIrSIIuJq21ETprpC0nLmSqDIIJO7nE62HXqH4qx7TGp6oNNjcTteoDckyemhH8soMw6
 43eipkIiBkT043R1/yxdycfcP3r4a25C8n7B4xJrGGo+jX0kwCcf5vqySsaVSTeEfFbS
 yzUH81iqG0Lu1FP3aaHWX36TRuz+LfAyab2wcMFqlsC6hTK//hwEj/jRjBicHk4TkoUu
 rAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732245758; x=1732850558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ziiRgdmp8/djQe/OUBTNWsmMki7f4gTCJYiLTqE+tsI=;
 b=iq9UP44Q89UV2qKIP1G1Ki6hYYh0n3KGv0leZDdl14A3KxIEHnxWPtm0I/kM45I5vR
 jnfR7ZsiaJWg9f+KAPouo5DVq5EhIA7mJZKLg+WUkQrHtJISY/Mjr18y/Dj2fYHcj2p8
 ++6ZFmMEV13KCZ/GTBzgTnircn13IrA8rWybOT3vze1O5O1PIfvjiwBEaanG5P1I0Rjm
 LhLYChyBSXKXV27ysEJ83KC69QZV2eLKj8tbwtrmqVZjpvlftyz+yV3p4Slp0WhqriUT
 FJ6CMap5Ls/CcKFXseWoeBJopiP5fMU4Qd4DyEy7eDrP/XZ3Jh4+ywHhJ8QGg1L+KmRS
 v77g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC5teEAwLzz9aasu62S8yYOpiVw1z/YNwMsWWXnRY8PMbn5+1lyRZ5+TQGehUMrJ8oLvz+SGGQjB/B@nongnu.org
X-Gm-Message-State: AOJu0YwejdPvNbH9q/kWf8KUqPsh8FBkhP4gPJ5KSr0bB1Ln8G+v3P4I
 d5b1DVTJgs4hlIapgE/qDJcXPFuG5cW2oMsmelaFFAuZdnvdSBaf2lxEdp2d/c0=
X-Gm-Gg: ASbGncsU8gwhtjhhi9ff7y623WYRABNLbYa9QNXHfBLBZNSyGNBfEAPQ3UWppAGCUTU
 twyUjyc2lXhT+XSe9tKExD4qpT/gKXdWFzehNGSzBZNBbWkM5u3Vii0IRCHF3guAI75kBxTvOW6
 AAOm3eRpB3Li9KYIy0LmdFiDXo9WwWziA9bHUE8SW9GFr+nomSy+lMENiTXltVyIBBagQ4awv+u
 /6YYrDWUz7gs3tmJd7ORiIQDS3IxkgTgSfe8ypzHBcKmXjgTAM3NUTXfhTORcUoRAharvIqh5sY
 yEXY0Q==
X-Google-Smtp-Source: AGHT+IFZYVmDYfhXQLuGHV+w2uZrMzWRR21YsjcvW60NmTvIH/kA5RVeCpSqQwwT0f5aRNMmiMBoeg==
X-Received: by 2002:a17:902:e84f:b0:212:514:b30a with SMTP id
 d9443c01a7336-2129f72fa48mr22064765ad.12.1732245758605; 
 Thu, 21 Nov 2024 19:22:38 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([136.226.240.187])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc157f3sm5506905ad.203.2024.11.21.19.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 19:22:38 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 6/6] target/riscv: Add Zicfilp support for Smrnmi
Date: Fri, 22 Nov 2024 11:22:17 +0800
Message-Id: <20241122032217.3816540-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122032217.3816540-1-frank.chang@sifive.com>
References: <20241122032217.3816540-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Frank Chang <frank.chang@sifive.com>

Zicfilp extension introduces the MNPELP (bit 9) in mnstatus.
The MNPELP field holds the previous ELP.

When a RNMI trap is delivered, the MNPELP is set to ELP and ELP set
to NO_LP_EXPECTED. Upon a mnret, if the mnstatus.MNPP holds the
value y, then ELP is set to the value of MNPELP if yLPE is 1;
otherwise, it is set to NO_LP_EXPECTED.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 11 ++++++++++-
 target/riscv/op_helper.c  |  9 +++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 01e279dc25..f31735d15b 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -642,6 +642,7 @@ typedef enum {
 /* RNMI mnstatus CSR mask */
 #define MNSTATUS_NMIE       0x00000008
 #define MNSTATUS_MNPV       0x00000080
+#define MNSTATUS_MNPELP     0x00000200
 #define MNSTATUS_MNPP       0x00001800
 
 /* VM modes (satp.mode) privileged ISA 1.10 */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 828b6a1003..d53ddc384f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1863,6 +1863,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mnepc = env->pc;
         env->pc = env->rnmi_irqvec;
 
+        if (cpu_get_fcfien(env)) {
+            env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPELP, env->elp);
+        }
+
         /* Trapping to M mode, virt is disabled */
         riscv_cpu_set_mode(env, PRV_M, false);
 
@@ -2030,7 +2034,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         /* handle the trap in M-mode */
         /* save elp status */
         if (cpu_get_fcfien(env)) {
-            env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
+            if (nnmi_excep) {
+                env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPELP,
+                                          env->elp);
+            } else {
+                env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
+            }
         }
 
         if (riscv_has_ext(env, RVH)) {
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 63ec53e992..a4b625fcd9 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -402,6 +402,15 @@ target_ulong helper_mnret(CPURISCVState *env)
 
     riscv_cpu_set_mode(env, prev_priv, prev_virt);
 
+    /*
+     * If forward cfi enabled for new priv, restore elp status
+     * and clear mnpelp in mnstatus
+     */
+    if (cpu_get_fcfien(env)) {
+        env->elp = get_field(env->mnstatus, MNSTATUS_MNPELP);
+    }
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPELP, 0);
+
     return retpc;
 }
 
-- 
2.34.1


