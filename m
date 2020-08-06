Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSl-0003x4-A4
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSh-0003uG-2l
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSe-000811-S6
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id mw10so2578797pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gATifW08Q1iWD9fEU6clkKUOIggBsmvVgd7EsV7dSlM=;
 b=BM8HU9qBqUJ1fH32y55/z5WQ+sVr+2wTzycMADfz234/ht3U+dFULL1amcIb8UBwUp
 MiJHvX9wxCcKrYxI3U/WWTzo8oVYo8fO1tF+U05G/wSRY+D2RsEUNEQ0Y/sudE+Y9CKU
 jpVSfRNFoD4Z8PjuToIKTnqn4oRax3nEfLta1mcsEVnCIRBpp1FZLwQ3GWKjXEaZgIBg
 FBO9nS8tRCcFdrokTT0AKouwXUop+7Vs15QvIhdbt/9+inkErIXulRMC55X45HtB54qD
 03W6pZvR1PPnOElhTYnCcbva6xHSk6qt7QKfabs8HKe9QkxjqFiKrCTvq5LFKBqZil3N
 GP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gATifW08Q1iWD9fEU6clkKUOIggBsmvVgd7EsV7dSlM=;
 b=NrdhbTEeagbLM42jZarc4JbPTSauXGaLDnNS1xd3J0+Nuc97iaQRAEJNT2ekpcXMOY
 2hQd0uXReLY0HYlSDqnsaUb0Grymei5WEfkYWbPoJTpe0xspppr0ZDQDOMw+akjMsz7B
 zcQjAMCw6Hn00fIQSQT5jmp9GnYaUvg6Kh0ECRLP/K6v7J8pIUbyiPKx/k7vrTA/nr+9
 4HaRSDe3sdkL4GwoX9XsOW0mV3+2aEnlrUQPhZvf0FX90yOtu1zMK4cOPgZxCSzlV8Si
 EBZ9+QL4e47kFzRcJM0ckKrdksmvqIo8I8W/GNbo91By675J4xeT8FIqNeCPGrhZNe+C
 mafw==
X-Gm-Message-State: AOAM530Qk37YTcEGevIkMbBZ4fO8jK7L5Pf469lpPMVdNiDAdR1FBibr
 iZV+VEjWbYYE5wN7i1vDUbk0RA==
X-Google-Smtp-Source: ABdhPJxObvVv1qd2bS5NyyLkxJsdIAPBcs3Tj2kivW6dABiWlldL28WW+4jjrl+r7skOaWibgr3r5A==
X-Received: by 2002:a17:90a:d904:: with SMTP id
 c4mr7553318pjv.145.1596710963105; 
 Thu, 06 Aug 2020 03:49:23 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:22 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 50/71] target/riscv: rvv-1.0: integer comparison instructions
Date: Thu,  6 Aug 2020 18:46:47 +0800
Message-Id: <20200806104709.13235-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:27 -0000

From: Frank Chang <frank.chang@sifive.com>

* Sign-extend vmselu.vi and vmsgtu.vi immediate values.
* Remove "set tail elements to zeros" as tail elements can be unchanged
  for either VTA to have undisturbed or agnostic setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
 target/riscv/vector_helper.c            | 8 --------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index c2eda17c0ce..0a86d41b0a4 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2075,9 +2075,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
 GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, IMM_SX, vmsleu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, IMM_SX, vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
 
 /* Vector Integer Min/Max Instructions */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5add464933c..32bcee0f380 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1421,7 +1421,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1432,9 +1431,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1473,7 +1469,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -1484,9 +1479,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
-- 
2.17.1


