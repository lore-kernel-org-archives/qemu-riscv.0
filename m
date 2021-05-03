Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldfR9-0007GQ-2E
	for mharc-qemu-riscv@gnu.org; Mon, 03 May 2021 16:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1ldfR7-0007Dx-GT; Mon, 03 May 2021 16:45:01 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1ldfR4-0008K9-84; Mon, 03 May 2021 16:45:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n2so7021207wrm.0;
 Mon, 03 May 2021 13:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SV1ZOnE6lj13CJJbhYDEk/s0OMmCaGgLXzaCQlq+Xcg=;
 b=K82Qd/ltEYSPNxI3FOrCFdI/oLluk2k7CQaFPparnwh40hOZOCmPZAtqloaTYS4t1L
 v2rZy3GMDcym1d3X1qDKqGfiIhpygLhgC4XdGs+kNj/VilDnmx3lGaK55eJ2KsnGpoyQ
 LJLw62t6Td6cB2wt1PBGQhNF4sQbTT0u2pdP/zGXM+qdoEKwGDoxoRcqO2OTkMt3PGbv
 tE+lA9Sr9ok4OBNfb6Fn/RC7XqqkGS/Wz3oTfyB5lpHDbhVebaFKh/hOCMUGYaLL/tre
 sSVe3rgshUbEirzvV66u+UTdvuDskXwan5NaIO/nvsTkKt4zXjD2t075BE8scaOXfvep
 Qr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SV1ZOnE6lj13CJJbhYDEk/s0OMmCaGgLXzaCQlq+Xcg=;
 b=OEAWANuhGUHyl4JYVmIXsjHBLmddUdVNqMmDbEkrMZ39pR2uVfuGPk3K33Jy6XHNEk
 1ths0ZgNQxbV0Z0ULYR3brVlrRHhf7QjDt1EECTuSl+HYTpwmhJMpEGLDXI3djdk2S44
 xxoeVV4mE6oM/cPjHV0gsAyx17LJAcffl2T4Pm0ixDTAFDSTHCuXDPJRvUJ10UJnQrvh
 /acpSGhJnmSV7LNwAcDcgSJ0xJOupU+DgnKK3diVTjEHKyrnVIr0hZNgZ0KlyPuMOZG2
 widY8oWWGL+5hNz5kNjKjjw465Mcbfpsa7WWH340MAQ2cV4JHuOWBf5+HjLYfN5cPg6y
 t3YA==
X-Gm-Message-State: AOAM532IiMkTjiwnNFXjuYZI0sldYJt1oDI42wD8jZuT5gQA5N4ZCAH7
 SDNrA78rYSGlxyoZRPexZmK2Zo5h0DzM0dDB
X-Google-Smtp-Source: ABdhPJzaYjQfmLj5BzhmF62jRzyTV5LCQNZbTXPixoThSbrccAs+wUXH0oSuq0UHB6aELPw/n2+PEA==
X-Received: by 2002:adf:f74d:: with SMTP id z13mr27339310wrp.147.1620074695158; 
 Mon, 03 May 2021 13:44:55 -0700 (PDT)
Received: from localhost.localdomain (a89-152-76-22.cpe.netcabo.pt.
 [89.152.76.22])
 by smtp.gmail.com with ESMTPSA id l22sm457353wmq.28.2021.05.03.13.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 13:44:54 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2] target/riscv: fix VS interrupts forwarding to HS
Date: Mon,  3 May 2021 21:44:48 +0100
Message-Id: <20210503204448.127412-1-josemartins90@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=josemartins90@gmail.com; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Mon, 03 May 2021 20:45:01 -0000

VS interrupts (2, 6, 10) were not correctly forwarded to hs-mode when
not delegated in hideleg (which was not being taken into account). This
was mainly because hs level sie was not always considered enabled when
it should. The spec states that "Interrupts for higher-privilege modes,
y>x, are always globally enabled regardless of the setting of the global
yIE bit for the higher-privilege mode." and also "For purposes of
interrupt global enables, HS-mode is considered more privileged than
VS-mode, and VS-mode is considered more privileged than VU-mode".

These interrupts should be treated the same as any other kind of
exception. Therefore, there is no need to "force an hs exception" as the
current privilege level, the state of the global ie and of the
delegation registers should be enough to route the interrupt to the
appropriate privilege level in riscv_cpu_do_interrupt. Also, these
interrupts never target m-mode, which is  guaranteed by the hardwiring
of the corresponding bits in mideleg.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
---
Alistair, I sent the previous version of this patch a year ago (!).        
After our brief exchange on wether we should considered HS a higher        
privilege mode than VS (the spec was updated to clarify this in the        
meantime) you asked me for a small last tweak  before accepting            
the patch. This completely slipped my mind, and I only noticed I hadn't    
submitted the final version of the patch a few weeks ago. For this, my     
apologies. When I took a deeper look at it again, I found some other issues
with the patch so I decided to go for a deeper refactoring.                                                        

 target/riscv/cpu_helper.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..592d4642be 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -38,36 +38,24 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
-    target_ulong irqs;
+    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
 
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
 
-    target_ulong pending = env->mip & env->mie &
-                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vspending = (env->mip & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
+    target_ulong pending = env->mip & env->mie;
 
     target_ulong mie    = env->priv < PRV_M ||
                           (env->priv == PRV_M && mstatus_mie);
     target_ulong sie    = env->priv < PRV_S ||
                           (env->priv == PRV_S && mstatus_sie);
-    target_ulong hs_sie = env->priv < PRV_S ||
-                          (env->priv == PRV_S && hs_mstatus_sie);
+    target_ulong hsie   = virt_enabled || sie;
+    target_ulong vsie   = virt_enabled && sie;
 
-    if (riscv_cpu_virt_enabled(env)) {
-        target_ulong pending_hs_irq = pending & -hs_sie;
-
-        if (pending_hs_irq) {
-            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
-            return ctz64(pending_hs_irq);
-        }
-
-        pending = vspending;
-    }
-
-    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
+    target_ulong irqs =
+            (pending & ~env->mideleg & -mie) |
+            (pending &  env->mideleg & ~env->hideleg & -hsie) |
+            (pending &  env->mideleg &  env->hideleg & -vsie);
 
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
-- 
2.25.1


