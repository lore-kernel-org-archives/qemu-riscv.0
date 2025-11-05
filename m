Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FA4CCFA04
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 07:04:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGXYs-0005cw-LR; Wed, 05 Nov 2025 02:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1vGXYq-0005cU-7r
 for qemu-riscv@nongnu.org; Wed, 05 Nov 2025 02:04:04 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1vGXYn-0003rf-VA
 for qemu-riscv@nongnu.org; Wed, 05 Nov 2025 02:04:03 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-295ceaf8dacso29944695ad.0
 for <qemu-riscv@nongnu.org>; Tue, 04 Nov 2025 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1762326240; x=1762931040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PslxH34VRyt9U/kQBE87KNhYHXS6tZsHOtci+Xo2x+Q=;
 b=bnpTHXxRAeegAG3aNcYOs2wWSh/tOSWc0bzY8BNqbv6JiZpVyroJRlUlYh4WkbWpmP
 o73Ftf3dzo0YwiV09lF7HYeTmRxJdTYsOxtaUmDY7yLfcbAHBV/UHzvhCOE1DGWZY0j/
 hYKgawg3jVdp2ANl7YIMuDTgm72OPL5zOZEt3kXVAOgm/4fviOD/pRBX7XaQa/S7B6Fw
 iMBaaeyMX7+jYGevoHiwHQi1+VGsNIGH7ZjazZvlf9dDHS1tL/YdgvicioO7H1x9GvfY
 n6+Rz8sd/cGVmA79TXYTzM9m7GWY4hMuoRm6ziH+So3ZLcI/SrdTPZdrj4vG6c/YMc8R
 3DPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762326240; x=1762931040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PslxH34VRyt9U/kQBE87KNhYHXS6tZsHOtci+Xo2x+Q=;
 b=C2V7alNQjs3iOAYhxM4SRsWdua7eNbJdXk//Sp7MC+PmA+8V6MFD83QjFr+x61uYs7
 UZoBwDj0BrTehzzjM8HvRCMZsdKC6HROQ+riijr0IC3AV1qbDMCtBHxtYhT2RspmNZbQ
 v106pEJ95+oOuQz/+64J8K12iFpAtLAS9f08WrGmJXIUli6AWVtdOfjrRWG9N2UVSxLe
 fMqsmjsX4eR/CvC+Od+ntcwsF430P/2QJ0CHcEdK1vXwSwgQtBueL9IRjfyy+GLzdxT9
 qOQ3mORSoxAd4e1MIjbyFouAuTLjQyngzGBwSDhQ6zo34BFQf+416TsvOtPjsXaAPVv0
 yRDA==
X-Gm-Message-State: AOJu0Yx64g5B2tY/WugLxQN5V6LNEL3IRacNlI2pvkCmQcKcbITRHJvK
 0qhe2Xu6o4pdlSzvFKdyx8UCZuHUQVgWGnsx+inHkEOx9XvXLdCZv56UFpYbqg0UEVM=
X-Gm-Gg: ASbGncszZSDsegCU/1GwluwGwZAhIL8w04kDpjud5+zm/apFv98fcIIAs0BbzwBwQeq
 30mGP1YIukjPKB30jJgcTEuPPnbzEtfb67amJjMYNPn0Djp5N7vIj8TmhVhByVKaNM33/9nD1oh
 w31Ko+X9FlzhNN1gQjaiBsVsMR49of8giTRgQl/923lh7wWFB7Fw9L/G9iiUzzmXTGAs32OXvey
 eCADhoHptkl4zNzXy8zCY0uMQwr/pxGp5NXDJ+NzgKhMO5yqcqWWlhCb7ZbrhlOLzESa24urxfY
 6HpgU71BO0CHsYZgK3whEnpjPbIYu2tyKl6NjImk1vySdSU3YhMAAsMEdVOIexcuxK0jNF9EoK8
 SAOAdkIsJP7rr9B/YGbTLvCbofRQSENU2pkqY1XcnYlODCaikMvraEjOKhNlDuJBNH9T8WQNBBB
 GIwXzeRGv3w6DhNp7UpwfhiKE=
X-Google-Smtp-Source: AGHT+IFvx4nMjyEt7CrC47T4NQ1KMNsAPY9RyiVsYiMPY+QUCWHpGVEOMwORectsP73zI4GdT1quLw==
X-Received: by 2002:a17:903:b07:b0:28e:ccd7:dd61 with SMTP id
 d9443c01a7336-2962adedf4dmr32616505ad.57.1762326239868; 
 Tue, 04 Nov 2025 23:03:59 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7acd32462d2sm5332964b3a.4.2025.11.04.23.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 23:03:59 -0800 (PST)
From: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
To: jerry0715no14@gmail.com
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 alex.bennee@linaro.org, philmd@linaro.org, kito.cheng@gmail.com,
 frank.chang@sifive.com, Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Subject: [PATCH] target/riscv: Add bfloat16 and half-float support to GDB stub
Date: Tue,  4 Nov 2025 23:03:58 -0800
Message-ID: <20251105070358.940188-1-jerry.zhangjian@sifive.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=jerry.zhangjian@sifive.com; helo=mail-pl1-x631.google.com
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

Add bfloat16 and ieee_half fields to the RISC-V FPU register unions
in the GDB target description XML files. This allows GDB to access
FPU registers as BFloat16 or IEEE half-precision floating-point values
in addition to the existing single and double precision formats.

For 64-bit FPU (riscv-64bit-fpu.xml):
- Add bfloat16 field to riscv_double union
- Add half (ieee_half) field to riscv_double union

For 32-bit FPU (riscv-32bit-fpu.xml):
- Create new riscv_single union with bfloat16, half, and float fields
- Update all 32 FPU registers to use riscv_single type instead of
  ieee_single

This enables GDB users to inspect and modify FPU registers using
different floating-point formats:
  (gdb) print $ft0.bfloat16
  (gdb) print $ft0.half
  (gdb) print $ft0.float
  (gdb) print $ft0.double

This change corresponds to the GDB-side support for these formats:
https://sourceware.org/pipermail/gdb-patches/2025-November/222353.html

Signed-off-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
---
 gdb-xml/riscv-32bit-fpu.xml | 70 ++++++++++++++++++++-----------------
 gdb-xml/riscv-64bit-fpu.xml |  2 ++
 2 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
index 24aa087031..f0439c626e 100644
--- a/gdb-xml/riscv-32bit-fpu.xml
+++ b/gdb-xml/riscv-32bit-fpu.xml
@@ -7,36 +7,42 @@
 
 <\!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.riscv.fpu">
-  <reg name="ft0" bitsize="32" type="ieee_single"/>
-  <reg name="ft1" bitsize="32" type="ieee_single"/>
-  <reg name="ft2" bitsize="32" type="ieee_single"/>
-  <reg name="ft3" bitsize="32" type="ieee_single"/>
-  <reg name="ft4" bitsize="32" type="ieee_single"/>
-  <reg name="ft5" bitsize="32" type="ieee_single"/>
-  <reg name="ft6" bitsize="32" type="ieee_single"/>
-  <reg name="ft7" bitsize="32" type="ieee_single"/>
-  <reg name="fs0" bitsize="32" type="ieee_single"/>
-  <reg name="fs1" bitsize="32" type="ieee_single"/>
-  <reg name="fa0" bitsize="32" type="ieee_single"/>
-  <reg name="fa1" bitsize="32" type="ieee_single"/>
-  <reg name="fa2" bitsize="32" type="ieee_single"/>
-  <reg name="fa3" bitsize="32" type="ieee_single"/>
-  <reg name="fa4" bitsize="32" type="ieee_single"/>
-  <reg name="fa5" bitsize="32" type="ieee_single"/>
-  <reg name="fa6" bitsize="32" type="ieee_single"/>
-  <reg name="fa7" bitsize="32" type="ieee_single"/>
-  <reg name="fs2" bitsize="32" type="ieee_single"/>
-  <reg name="fs3" bitsize="32" type="ieee_single"/>
-  <reg name="fs4" bitsize="32" type="ieee_single"/>
-  <reg name="fs5" bitsize="32" type="ieee_single"/>
-  <reg name="fs6" bitsize="32" type="ieee_single"/>
-  <reg name="fs7" bitsize="32" type="ieee_single"/>
-  <reg name="fs8" bitsize="32" type="ieee_single"/>
-  <reg name="fs9" bitsize="32" type="ieee_single"/>
-  <reg name="fs10" bitsize="32" type="ieee_single"/>
-  <reg name="fs11" bitsize="32" type="ieee_single"/>
-  <reg name="ft8" bitsize="32" type="ieee_single"/>
-  <reg name="ft9" bitsize="32" type="ieee_single"/>
-  <reg name="ft10" bitsize="32" type="ieee_single"/>
-  <reg name="ft11" bitsize="32" type="ieee_single"/>
+  <union id="riscv_single">
+    <field name="bfloat16" type="bfloat16"/>
+    <field name="half" type="ieee_half"/>
+    <field name="float" type="ieee_single"/>
+  </union>
+
+  <reg name="ft0" bitsize="32" type="riscv_single"/>
+  <reg name="ft1" bitsize="32" type="riscv_single"/>
+  <reg name="ft2" bitsize="32" type="riscv_single"/>
+  <reg name="ft3" bitsize="32" type="riscv_single"/>
+  <reg name="ft4" bitsize="32" type="riscv_single"/>
+  <reg name="ft5" bitsize="32" type="riscv_single"/>
+  <reg name="ft6" bitsize="32" type="riscv_single"/>
+  <reg name="ft7" bitsize="32" type="riscv_single"/>
+  <reg name="fs0" bitsize="32" type="riscv_single"/>
+  <reg name="fs1" bitsize="32" type="riscv_single"/>
+  <reg name="fa0" bitsize="32" type="riscv_single"/>
+  <reg name="fa1" bitsize="32" type="riscv_single"/>
+  <reg name="fa2" bitsize="32" type="riscv_single"/>
+  <reg name="fa3" bitsize="32" type="riscv_single"/>
+  <reg name="fa4" bitsize="32" type="riscv_single"/>
+  <reg name="fa5" bitsize="32" type="riscv_single"/>
+  <reg name="fa6" bitsize="32" type="riscv_single"/>
+  <reg name="fa7" bitsize="32" type="riscv_single"/>
+  <reg name="fs2" bitsize="32" type="riscv_single"/>
+  <reg name="fs3" bitsize="32" type="riscv_single"/>
+  <reg name="fs4" bitsize="32" type="riscv_single"/>
+  <reg name="fs5" bitsize="32" type="riscv_single"/>
+  <reg name="fs6" bitsize="32" type="riscv_single"/>
+  <reg name="fs7" bitsize="32" type="riscv_single"/>
+  <reg name="fs8" bitsize="32" type="riscv_single"/>
+  <reg name="fs9" bitsize="32" type="riscv_single"/>
+  <reg name="fs10" bitsize="32" type="riscv_single"/>
+  <reg name="fs11" bitsize="32" type="riscv_single"/>
+  <reg name="ft8" bitsize="32" type="riscv_single"/>
+  <reg name="ft9" bitsize="32" type="riscv_single"/>
+  <reg name="ft10" bitsize="32" type="riscv_single"/>
+  <reg name="ft11" bitsize="32" type="riscv_single"/>
 </feature>
diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-64bit-fpu.xml
index d0f17f9984..7d6a44e145 100644
--- a/gdb-xml/riscv-64bit-fpu.xml
+++ b/gdb-xml/riscv-64bit-fpu.xml
@@ -9,6 +9,8 @@
 <feature name="org.gnu.gdb.riscv.fpu">
 
   <union id="riscv_double">
+    <field name="bfloat16" type="bfloat16"/>
+    <field name="half" type="ieee_half"/>
     <field name="float" type="ieee_single"/>
     <field name="double" type="ieee_double"/>
   </union>
-- 
2.51.0


