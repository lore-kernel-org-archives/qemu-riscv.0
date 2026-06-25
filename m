Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF0DCDE000
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 12:09:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcitX-0008Uw-6u; Thu, 25 Jun 2026 08:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thecharlesjenkins@gmail.com>)
 id 1wcdYG-0008Ee-15
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 02:27:04 -0400
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thecharlesjenkins@gmail.com>)
 id 1wcdYE-0004VD-8s
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 02:27:03 -0400
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-30bf132969bso2671486eec.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 23:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782368820; x=1782973620; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GDLRd59EivhJ7a5tzoHgjhFn4U57GcbQRG1nCQC98KA=;
 b=kdNIBUaDDrwpyBiELhxfhYKbm1qlc42Gwzm4YlORIRSOxWHfgGFe8nGLQMioludJi0
 k6K0v8nlAqHhK5XpnXYiwqS+qgJm3Shye+e4Ri5vD6T9NfqfpP0tza1UdQpXo2y/H/x2
 5M2vVIubyaARZ4KrRtEdFBRAUp1q66PLDPEIblcT0DkFP7iQpp9YTvEjVVZvhW/4x+TK
 XVkix176Lpz8VrVy/sqWmFb26bgcmDkKU4Y4NPBha2K2KX1EIuKQbEbO72muVvj+TYm0
 u+iNtewjUWt/wguIkP00dK7qv4ujgHaFxhexUH7LjmI6cU0KWuGbdMGt2qVkMUmhR7NN
 T8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782368820; x=1782973620;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDLRd59EivhJ7a5tzoHgjhFn4U57GcbQRG1nCQC98KA=;
 b=kwBLg6aVCNAhdNwBzzp/4kc7upPjbzpUfOPuSFrM8BGp0WMwSeDtoLDmW7+Jgjanwy
 p6pjudyinbKObdvKpxxLxYo6yYJnJcDCFpbHFfl7qF8BitpM1Z6BD5xRP416v2D1/I8f
 fWj5pVGxfeY4gY5NzrTWEB40NPjacU5LUYnYke1SILcFQU/Xr5IYGPFX7+4g2isSmUP8
 /hVNxTgEZKu7nBby9t+dz2crA820golKbE9Tu7/MtQCO5HPKP4+4a1e5DlxmYZbAmRA1
 lZCInzMDY8B94SrdA/HIkvsGkGko3DFxAarP8jXEhZbYlAqti7jTkLxC5lKhjsw87RXD
 q9gQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqUoVYL/3BCKiraV2sFNIZR2OhgBkJaMMnWPqC8OZaAVi07boZisZevt4Ylon+bBP+9rrDlr9h8feI5@nongnu.org
X-Gm-Message-State: AOJu0Yz/LMQpywu4mmYLrYVfHNZF4yjScbNAM/m9DHJvKRL65wTH+BEy
 jxOCdCt8VsGsk+uYyJiwGYPzsJRObQRscAZeKjxSWd/NWzJa5ekK1c3F
X-Gm-Gg: AfdE7cm4ETNHzYbny4DQ7z3aMhBzJibLuEi9q/ZElPCeEh2g01eH4tilzEMtfo7cTdW
 jvSMYOKQxS2pLsFAjYYUSC0Du/AKGrgUIToidvZ1tMiDbSmX+5xDimLLkrf99R2x7+G2Yf4/OAB
 k8GO4YCyzjs0ESS7d6fQwBzC+u1I3OVd/juwjsLQ0k8j6zhEDMEfOmG+7p0hWWOoiTGo5vQUNWz
 qtYWmkk0DCoEKJWHbQDFmCieNIbLwMYEjObt/58ea4PdYAse1iRPrbR19lkqCtwSdot+3odMysg
 Vk+84/A6KMOiPuvkh6IRzgaStD0WXL0YaWcnwunqIg7XqZKFas1PTOPmDPNzzGaznNAc3/lAwj2
 juAy6ol0MeC5UDbljrEz5UdLDPGYsY+rPtIMN0EKuH8Se3k6tyGcVhI4o1Ijbd8xRhbIbAzjFVa
 2A0z8ur38=
X-Received: by 2002:a05:7301:4e8a:b0:30c:2432:7d7d with SMTP id
 5a478bee46e88-30c84d9e222mr1450798eec.23.1782368820205; 
 Wed, 24 Jun 2026 23:27:00 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::1947])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c8b1ab6sm7682972eec.15.2026.06.24.23.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 23:26:59 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 24 Jun 2026 23:26:58 -0700
Subject: [PATCH] target/riscv: Report QEMU CPU archid as 42
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-marchid-v1-1-a0af7997071f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMT3dzEouSMzBRdC4MUQ3OzJAtz4xQLJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tABrpk5VrAAAA
X-Change-ID: 20260624-marchid-80d176b873d8
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
 qemu-riscv@nongnu.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782368818; l=2894;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=i3lugvgwi4wk/h5CJjNv2v/O9jMvaAK6shErITKU7Lk=;
 b=RfzL0vuvstQgO+amSp4BL4Fia7lFf5SqiWBTSGxmDs1jLIdkmkqKiWSnPpZT6+4Q5BEyt012Q
 ELmvACAMwueC2ynddlhTMQR5laeoxUQ6kwZbXx2qrCcFGmCsn28q1vp
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=thecharlesjenkins@gmail.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 25 Jun 2026 08:09:22 -0400
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

When a non-vendor CPU is used, report the archid as 42 which has been
allocated for QEMU in the riscv isa manual [1]. This can help software
check if it is running in QEMU.

[1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
This series was original proposed by Palmer Dabbelt [1] with a follow up
by Daniel Henrique Barboza. This patch implement's Daniel's suggestion.

When booting with a non-vendor CPU such as with the qemu arg "-cpu rv64"
marchid will now be reported as 42.

> qemu-system-riscv64 ... -cpu rv64

processor       : 0
hart            : 0
isa             : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
mmu             : sv57
mvendorid       : 0x0
marchid         : 0x2a
mimpid          : 0x0
hart isa        : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc

When booting with a vendor CPU like veyron-v1, the proper marchid will
still appear.

> qemu-system-riscv64 ... -cpu veyron-v1

processor       : 0
hart            : 0
isa             : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
mmu             : sv48
mvendorid       : 0x61f
marchid         : 0x8000000000010000
mimpid          : 0x111
hart isa        : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt

[1] https://lore.kernel.org/all/20240131182430.20174-1-palmer@rivosinc.com/
---
 target/riscv/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fa497e5e8a..59d63f82c2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -44,6 +44,9 @@
 #endif
 
 /* RISC-V CPU definitions */
+#define RISCV_CPU_MVENDORID 0
+#define RISCV_CPU_MARCHID 42
+#define RISCV_CPU_MIMPID 0
 static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
 const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
                               RVC, RVS, RVU, RVH, RVG, RVB, 0};
@@ -1198,6 +1201,12 @@ static void riscv_cpu_init(Object *obj)
     }
 #endif
 
+    if (!riscv_cpu_is_vendor(obj)) {
+        RISCV_CPU(obj)->cfg.mvendorid = RISCV_CPU_MVENDORID;
+        RISCV_CPU(obj)->cfg.marchid = RISCV_CPU_MARCHID;
+        RISCV_CPU(obj)->cfg.mimpid = RISCV_CPU_MIMPID;
+    }
+
     accel_cpu_instance_init(CPU(obj));
 }
 

---
base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
change-id: 20260624-marchid-80d176b873d8

Best regards,
--  
- Charlie


