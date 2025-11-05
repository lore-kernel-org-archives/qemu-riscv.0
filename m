Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D032CCF9F8
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 07:19:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGXnC-0002WF-Dc; Wed, 05 Nov 2025 02:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1vGXn5-0002Tq-7X
 for qemu-riscv@nongnu.org; Wed, 05 Nov 2025 02:18:47 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1vGXn3-0000dB-6K
 for qemu-riscv@nongnu.org; Wed, 05 Nov 2025 02:18:46 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2951a817541so72419125ad.2
 for <qemu-riscv@nongnu.org>; Tue, 04 Nov 2025 23:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1762327123; x=1762931923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MlG5rnOvUQA75NWfv4D3M3eKo3Ku1ZTp/yqLDnLUGQA=;
 b=Q4lKJAScPO10oN4jIfLuCvfthxrwMnIEdl5vcT6I0N1ErhIlpKRJBcMMM2INung5k8
 tP2TCNvM9lgFIzyVLDCQmUC33lTfk4t5mpQFRvpZI/HyV5onjk/YWTGFO9GCp/GQv97p
 VW4Ao2cj+lpd27PL9Obd/h8MHz/aFi3DApyx+T6RtINCG5pKnqPdtlcC9Q+6ypud/VR8
 1REjZfJFjHKb8yUdsswnwEP7eAlpdtNiUgRvQVAsygtV8qArJMfzgQo4PPoojCHB/dJ/
 x2wa6FiHlBGbyQRMz2VXr5Aly2gZJGD5gBbS/mROPK3d7pmceseDM3y2EGrPxuxQ6U21
 586g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762327123; x=1762931923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MlG5rnOvUQA75NWfv4D3M3eKo3Ku1ZTp/yqLDnLUGQA=;
 b=RPX2zkhI7sarS7aqMTa5NxUXw0/OwDQPURQ5uIXdrfvbKnEo1VkMA2BYwzgugNU+ky
 fojxdw/SmeqEc+jNP6EbvL9BC2EmGXiWWf60+9EOBA+AJ8cDGCJgyVO6aHNh7QsjmgmZ
 6f0u9eSde4Reh8V/jEMmHZ8iZydCqKSVOCGUP8U8GX+tPuNPbuMaHzbr8ss3u9HkaZqy
 2yJXi7Xp4NfDeTculR+JMZVjAOLQSWe8FgDlc9B2Ae8Qvzpf0Eu/NIY6IcZsvv0yTgV9
 Xy69wn7/1PMOUyMzFcMhwIC7xwXgRR6kLPDJObRIzPE6qDrve48qj6a5d33xwi7cy55v
 bEGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuUKmwI/tx5AZnLf0Js4JlhnFhy/1boGD7bsr+C6OBKVtLTRwqOR0peDLBZaeacoeLN3x1FRK9RSXP@nongnu.org
X-Gm-Message-State: AOJu0YwGCDxXmMNFYA10IBBsUY2qi7UAdPrRytRRFMbQmfdyCDAHHTe1
 fbQMK74IDOv3Ruk64cbYoHACV1AMG6lKr8rZlxS0bpCKkLdtZ6zzz5SJEpPWlfkNFVk=
X-Gm-Gg: ASbGncvkJjk/k4c1WoTHXa1WjqIEvzybLD01hn+ZUpBxdeCf570FyV/s4hBhqIf0wQM
 P4bdQRWijpsUHVVmUZJeYjdUuGekCkaS6Am+e49ELLUQilME7Ckz9NR+T/Se8plkGefVUA/jDks
 5SflA8TOGp2BPD4QMi2BL2d4zmEkLzCfd8jOnrL/F7dfJ8n8CGZv0hWiN7UPOQn7Jm5dsSqv0GL
 lxp2E+/7gBP7KCOvg5nWer+BWTyCO7Ge64wArSJBJuM5nHd7hL1+BvE3khqRGpHNoerk3cU4d4J
 AtEMtJRm7pHAi47KAH2Iv9NouJapq5KtfEcSxVUddWYaKcdVekSrU2REmjfHjxQEHLRQWdzaTLm
 QIa+4FwecoUSvImlieH2kKUABT/dayMYHsal0hJ5zQZbLJZgAba9WFVZgl29OooxeUwa1ebr5Kw
 Yh4p7LT9kNRIeYX6l+1071G3I=
X-Google-Smtp-Source: AGHT+IHJntEwTcX6/7fTPo2BtkxbxCQp100jH5FoEsAJ52HMWGiy3hcrGH656V5IZaBl/ivf08qIUQ==
X-Received: by 2002:a17:902:d505:b0:290:c0ed:de42 with SMTP id
 d9443c01a7336-2962ada2117mr35771225ad.36.1762327122701; 
 Tue, 04 Nov 2025 23:18:42 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29601a741e3sm49708465ad.98.2025.11.04.23.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 23:18:42 -0800 (PST)
From: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, qemu-riscv@nongnu.org, kito.cheng@gmail.com,
 frank.chang@sifive.com, Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Subject: [PATCH] target/riscv: Add bfloat16 and half-float support to GDB stub
Date: Tue,  4 Nov 2025 23:18:30 -0800
Message-ID: <20251105071830.946163-1-jerry.zhangjian@sifive.com>
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
  (gdb) print \.bfloat16
  (gdb) print \.half
  (gdb) print \.float
  (gdb) print \.double

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
 
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
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


