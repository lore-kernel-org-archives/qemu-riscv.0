Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD75CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:45:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7DQT-0003C0-Ui; Fri, 10 Oct 2025 09:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DQF-0002rz-H9
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:44:39 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPK-0008FW-Kv
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:44:38 -0400
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so19915145e9.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103814; x=1760708614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sslmAmFx5Cxrr/elCIaZt4ybkrnljBL49HYxD0V3YF0=;
 b=b5IKHz2fhYGFR5V+3HM5k3w4Tvaa4FVLVfGYQ9F7dUhBkGD5V+pbMcB8gMr14iVQPn
 06MXvUSkGnorJMC3XPHFzWzWE13+9al2p9/zV7vRakbMae20878f89U2Pt3wQ4CHYNZM
 EhDZQxzq3BhJIdxBN0i6jzPmAWN9WMIKk4ih9jHwdGHMV0VZbnmF8Vm+zJ0kcAtEDYjY
 Of14SZ1KkrNIXnL5E6Cwn54kKvZJE7FzwdOhfP7uAjJMFvQq3lY08beTJtmU89ufa6mq
 HB+ksh3rEyTMccSRz9Xa9SuiqkLSS9edl/QcK05i3zQZ73UERF+Z8pqg9bjsGzdK22jW
 /BdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103814; x=1760708614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sslmAmFx5Cxrr/elCIaZt4ybkrnljBL49HYxD0V3YF0=;
 b=IW5uaVZv1YB906uCE9ikcyoVWePxS1Id543Lohx2YHp2QbPlTui2IHrOJ516weUAby
 UIv0t5eztIytI6CUc3qrvMLUAgU6gtwpSvTxHXCco51D+ND2G+P1lpVsdsWBVrNG8Ofj
 1DiexfdyByBFReFaeBKOwxIpiFAKClHpYiKaW8Asva4WuWBPrymic7aHtW2jTVpxUqBp
 awg9JEePauC1bWQJXxJjxVguZtMyxvLFuTu1Z7DPA/oyqJQP9MIDWYxSV15MZN4OSSqE
 53fdBG39mTkEzqQ0cUz822s9pSdV4bgRGntGM1V5JLVW8Oxvw5mE5dLYB0yr9Xg/y8zq
 9l6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7i7vXLQenzFdfkHa6H4OnLQSf7FWwOvRUGXRdqNZucNGxa/5DX5mClEJfMpu4OxvMsbkjPuD2CsMI@nongnu.org
X-Gm-Message-State: AOJu0YzK7QWxrrP7XdVE9Vlw6mZgrnlewMGsl4yrJohowbRTUwRcp6hp
 RE3PXs5AVGQ8bnNEEid3Ixd8shXe9QPnS+Z8s2h3RpM3HucPnTbOStxvmU3VMFnegI8=
X-Gm-Gg: ASbGncvqoVmAGq6WA2z1uJxvjVisdRQ6VznoUQA17eGBMpeMBbQzLT8DinPclIF5IFB
 zUgZcrheALYFakY72Q2aCCWAfGPx6CO04Ij24a5mL/fmJ7+UDom3xZK0tIY2d1LzlPuuhDfJzPv
 myVEVgIqejVcO9M+hEp1OQ+Omg+n2sXkk0rJrwLaRZWqscmkLe1Q5EyzQHZZdvC+HTRsj82g8fo
 R9IywJvobzkogUFZJEcFtC1V87+u+KHmpGHT06hBliJvX/TSeybPQ1fBKrunWZCUmhIwoxtRJnZ
 DaetwbkNoiYqnkXxzrqCZ6N0YaVhpt4PLNjcJopZ9hueyW/9rgBbE4ld8x/ArH26yHWkUFpD/jM
 onsDIdorAMOW7zLIWLXmFYjwoW0JNpVVe0/zyxu0wsLk+s9BiQFCcokfl4yJYCiNP1uIuNk6EoH
 G3M0CM1owQWAbB2TcvPSg=
X-Google-Smtp-Source: AGHT+IEq7PwzNWupra1NG1OBtrWiBM/xZ8ZbE2ssL1sNC/gPpkHqvpUEmnX8rktwHeIqbswn441T9g==
X-Received: by 2002:a05:600c:a341:b0:46e:39da:1195 with SMTP id
 5b1f17b1804b1-46fa9a8b3a9mr84537105e9.3.1760103813909; 
 Fri, 10 Oct 2025 06:43:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3cd658sm62396535e9.1.2025.10.10.06.43.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org
Subject: [PATCH 12/16] target/ppc: Replace HOST_BIG_ENDIAN #ifdef with runtime
 if() check
Date: Fri, 10 Oct 2025 15:42:21 +0200
Message-ID: <20251010134226.72221-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/arch_dump.c              |  9 ++-------
 target/ppc/int_helper.c             | 28 ++++++++++++++--------------
 target/ppc/kvm.c                    | 25 +++++++++----------------
 target/ppc/translate/vmx-impl.c.inc | 14 +++++++-------
 target/ppc/translate/vsx-impl.c.inc |  6 +++---
 tcg/ppc/tcg-target.c.inc            | 24 ++++++++++++------------
 6 files changed, 47 insertions(+), 59 deletions(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 80ac6c3e320..5cb8dbe9a6a 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -158,21 +158,16 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
     struct PPCElfVmxregset *vmxregset;
     Note *note = &arg->note;
     DumpState *s = arg->state;
+    const int host_data_order = HOST_BIG_ENDIAN ? ELFDATA2MSB : ELFDATA2LSB;
+    const bool needs_byteswap = s->dump_info.d_endian == host_data_order;
 
     note->hdr.n_type = cpu_to_dump32(s, NT_PPC_VMX);
     vmxregset = &note->contents.vmxregset;
     memset(vmxregset, 0, sizeof(*vmxregset));
 
     for (i = 0; i < 32; i++) {
-        bool needs_byteswap;
         ppc_avr_t *avr = cpu_avr_ptr(&cpu->env, i);
 
-#if HOST_BIG_ENDIAN
-        needs_byteswap = s->dump_info.d_endian == ELFDATA2LSB;
-#else
-        needs_byteswap = s->dump_info.d_endian == ELFDATA2MSB;
-#endif
-
         if (needs_byteswap) {
             vmxregset->avr[i].u64[0] = bswap64(avr->u64[1]);
             vmxregset->avr[i].u64[1] = bswap64(avr->u64[0]);
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index ef4b2e75d60..0c6f5b2e519 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1678,13 +1678,13 @@ void helper_vslo(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int sh = (b->VsrB(0xf) >> 3) & 0xf;
 
-#if HOST_BIG_ENDIAN
-    memmove(&r->u8[0], &a->u8[sh], 16 - sh);
-    memset(&r->u8[16 - sh], 0, sh);
-#else
-    memmove(&r->u8[sh], &a->u8[0], 16 - sh);
-    memset(&r->u8[0], 0, sh);
-#endif
+    if (HOST_BIG_ENDIAN) {
+        memmove(&r->u8[0], &a->u8[sh], 16 - sh);
+        memset(&r->u8[16 - sh], 0, sh);
+    } else {
+        memmove(&r->u8[sh], &a->u8[0], 16 - sh);
+        memset(&r->u8[0], 0, sh);
+    }
 }
 
 #if HOST_BIG_ENDIAN
@@ -1898,13 +1898,13 @@ void helper_vsro(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int sh = (b->VsrB(0xf) >> 3) & 0xf;
 
-#if HOST_BIG_ENDIAN
-    memmove(&r->u8[sh], &a->u8[0], 16 - sh);
-    memset(&r->u8[0], 0, sh);
-#else
-    memmove(&r->u8[0], &a->u8[sh], 16 - sh);
-    memset(&r->u8[16 - sh], 0, sh);
-#endif
+    if (HOST_BIG_ENDIAN) {
+        memmove(&r->u8[sh], &a->u8[0], 16 - sh);
+        memset(&r->u8[0], 0, sh);
+    } else {
+        memmove(&r->u8[0], &a->u8[sh], 16 - sh);
+        memset(&r->u8[16 - sh], 0, sh);
+    }
 }
 
 void helper_vsumsws(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 2521ff65c6c..c00d29ce2c8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -651,13 +651,13 @@ static int kvm_put_fp(CPUState *cs)
             uint64_t *fpr = cpu_fpr_ptr(env, i);
             uint64_t *vsrl = cpu_vsrl_ptr(env, i);
 
-#if HOST_BIG_ENDIAN
-            vsr[0] = float64_val(*fpr);
-            vsr[1] = *vsrl;
-#else
-            vsr[0] = *vsrl;
-            vsr[1] = float64_val(*fpr);
-#endif
+            if (HOST_BIG_ENDIAN) {
+                vsr[0] = float64_val(*fpr);
+                vsr[1] = *vsrl;
+            } else {
+                vsr[0] = *vsrl;
+                vsr[1] = float64_val(*fpr);
+            }
             reg.addr = (uintptr_t) &vsr;
             reg.id = vsx ? KVM_REG_PPC_VSR(i) : KVM_REG_PPC_FPR(i);
 
@@ -728,17 +728,10 @@ static int kvm_get_fp(CPUState *cs)
                                         strerror(errno));
                 return ret;
             } else {
-#if HOST_BIG_ENDIAN
-                *fpr = vsr[0];
+                *fpr = vsr[!HOST_BIG_ENDIAN];
                 if (vsx) {
-                    *vsrl = vsr[1];
+                    *vsrl = vsr[HOST_BIG_ENDIAN];
                 }
-#else
-                *fpr = vsr[1];
-                if (vsx) {
-                    *vsrl = vsr[0];
-                }
-#endif
             }
         }
     }
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 92d6e8c6032..ca9cf1823d4 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -134,9 +134,9 @@ static void gen_mtvscr(DisasContext *ctx)
 
     val = tcg_temp_new_i32();
     bofs = avr_full_offset(rB(ctx->opcode));
-#if HOST_BIG_ENDIAN
-    bofs += 3 * 4;
-#endif
+    if (HOST_BIG_ENDIAN) {
+        bofs += 3 * 4;
+    }
 
     tcg_gen_ld_i32(val, tcg_env, bofs);
     gen_helper_mtvscr(tcg_env, val);
@@ -1528,10 +1528,10 @@ static void gen_vsplt(DisasContext *ctx, int vece)
 
     /* Experimental testing shows that hardware masks the immediate.  */
     bofs += (uimm << vece) & 15;
-#if !HOST_BIG_ENDIAN
-    bofs ^= 15;
-    bofs &= ~((1 << vece) - 1);
-#endif
+    if (!HOST_BIG_ENDIAN) {
+        bofs ^= 15;
+        bofs &= ~((1 << vece) - 1);
+    }
 
     tcg_gen_gvec_dup_mem(vece, dofs, bofs, 16, 16);
 }
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 00ad57c6282..8e5c75961f4 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1642,9 +1642,9 @@ static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2_uim *a)
     tofs = vsr_full_offset(a->xt);
     bofs = vsr_full_offset(a->xb);
     bofs += a->uim << MO_32;
-#if !HOST_BIG_ENDIAN
-    bofs ^= 8 | 4;
-#endif
+    if (!HOST_BIG_ENDIAN) {
+        bofs ^= 8 | 4;
+    }
 
     tcg_gen_gvec_dup_mem(MO_32, tofs, bofs, 16, 16);
     return true;
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index b8b23d44d5e..61aa77f5454 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3951,9 +3951,9 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
             tcg_out_mem_long(s, 0, LVEBX, out, base, offset);
         }
         elt = extract32(offset, 0, 4);
-#if !HOST_BIG_ENDIAN
-        elt ^= 15;
-#endif
+        if (!HOST_BIG_ENDIAN) {
+            elt ^= 15;
+        }
         tcg_out32(s, VSPLTB | VRT(out) | VRB(out) | (elt << 16));
         break;
     case MO_16:
@@ -3964,9 +3964,9 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
             tcg_out_mem_long(s, 0, LVEHX, out, base, offset);
         }
         elt = extract32(offset, 1, 3);
-#if !HOST_BIG_ENDIAN
-        elt ^= 7;
-#endif
+        if (!HOST_BIG_ENDIAN) {
+            elt ^= 7;
+        }
         tcg_out32(s, VSPLTH | VRT(out) | VRB(out) | (elt << 16));
         break;
     case MO_32:
@@ -3977,9 +3977,9 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
         tcg_debug_assert((offset & 3) == 0);
         tcg_out_mem_long(s, 0, LVEWX, out, base, offset);
         elt = extract32(offset, 2, 2);
-#if !HOST_BIG_ENDIAN
-        elt ^= 3;
-#endif
+        if (!HOST_BIG_ENDIAN) {
+            elt ^= 3;
+        }
         tcg_out32(s, VSPLTW | VRT(out) | VRB(out) | (elt << 16));
         break;
     case MO_64:
@@ -3991,9 +3991,9 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
         tcg_out_mem_long(s, 0, LVX, out, base, offset & -16);
         tcg_out_vsldoi(s, TCG_VEC_TMP1, out, out, 8);
         elt = extract32(offset, 3, 1);
-#if !HOST_BIG_ENDIAN
-        elt = !elt;
-#endif
+        if (!HOST_BIG_ENDIAN) {
+            elt = !elt;
+        }
         if (elt) {
             tcg_out_vsldoi(s, out, out, TCG_VEC_TMP1, 8);
         } else {
-- 
2.51.0


