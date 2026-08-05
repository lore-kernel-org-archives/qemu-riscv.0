Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84BDC55174
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 16:44:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wreim-0008Hn-UH; Wed, 05 Aug 2026 12:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreil-0008HS-P1
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:43:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreik-0001vt-4V
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:43:59 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-384930ca5e2so1358256a91.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 09:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1785948237; x=1786553037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZpEZ+qwUWzKX/pdopbU/v27JKSx+5w4HgXw/8RsqiZk=;
 b=QJ5DqNqLgNejK8+G0tfozXLapG8MxUjKNQ0AxzAuMnnH+pApTj8tAm4wQWByGc6/A4
 GlHYPqfx+h/i+1G4zhDqNu1pbztls4vOo9IRhxo7t2ye6PZAJO4UsW7hMlQ/zXzdUEVe
 bM/Rk/X2j4IkGbG10HVf4LD2dcCbMHmajAotj0XhtYSxk+ENPHv+4uvCErT63SZjvCn3
 hKItCYcURE2KVnA3/RaffpACqU5k5xFSvm0P5o6bqnQvkityY8yCOHLfDRbLAj8sqK//
 bXlJg0Rh9If+OSGl/f6SbTOxRH779hs4IJ7n0UU/Egt0okdPEiTb0/5J/l88+WBypLtC
 Mo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785948237; x=1786553037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZpEZ+qwUWzKX/pdopbU/v27JKSx+5w4HgXw/8RsqiZk=;
 b=oVUJpp8ZnmPFwM3s/ssTZv1Lelnp5xb23CMkaOnLgXeHFC7Fvk1xlFAkuOaEa8ihqG
 EZNjLLxAdUuWjea+RoFLbv62YKSebIk6z6apMccqcjaexO/+CtqvX3E9Hbye4Ubg/sF0
 hUVN2bpMBtMqtJj6D7sC6oJklcxdXJDt4VfKey5uSyh2CkxuciAImCjELogfIn9YK/MY
 4CfYZXvXqe7LQALDCSKNvLwPc8KZ/zDmxIGHISnFuw0MMmmRWxd/aPyLMHF3T22BnQFo
 XZgsx4ZmmiJ/JCmk006AclWKP5tQ3LxZKO9grKiWVy79VwQXExqxSXSRMyUSvC8ad3fX
 MK9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRQ6dFUq0AB+Bh8k/0qC11FzP7L/T4PB9h4AOQy9YiewN7+LCmfnFisqFFL8SYZifkK8D/q9EwYJAN@nongnu.org
X-Gm-Message-State: AOJu0YwDSFDdyNLf8WjZu6Kl0IWzXBRvRP1o3gInTyzDq2iipqGVmGwZ
 W72S9jiKaU1wQ3oJVDCpGLZpw91UcFg1Jsg1Ged+uzF4ydhCzOYVm2GpXhTkK5qPN5EZcEqHll0
 1LV6mZ+4HOg==
X-Gm-Gg: AR+sD12yHIfM/raOQltfVmrC0W6bPxaW7S30Gf6pHKg7TuICcjKZShCG5lBubD6dGsg
 8hXtqbVk60lIj1FRkXLMThAWAaO2aLN0dancb6ukCJ2irKo/pytGh+kfwglCzs9iP80vK38Q7u1
 CLMHsGgM/UB6baXVJZ5VYA7fDEjGnH+n/H8pV8VfCwA2nJrxm3MP860XaF5cCwrkSI3Zkk3YrGE
 l+ww4abfOjFZbjK3d495QsIXkaMW0xpdZCAB8aq2F0K4Z9ot2CCPCF2yFvLYYAc9jF+gZJ2Yij1
 mZ7N88BgSqvU51tbum3MZjPDf7WCGtYInt0mwOdKseX32iycax8k6wkWGcJGlhUwx91e3slTZe5
 9729Jwzqu49xSR0JbiuX17PemrEreuIKTr8zrRa4li7UPQtX6uUfMzcJ0JwaIGNngC2v92gcTFh
 VGtdOUwQVrg++OIG9IWCUn+ObTq+++3zp167cFlw1/AWfRDjpgOM2bk5ddD7M0+j625+EuSJ98s
 QjYzuwOU9eJdbo=
X-Received: by 2002:a17:90b:53cf:b0:38e:5964:97a8 with SMTP id
 98e67ed59e1d1-3903c5bf453mr9300636a91.16.1785948236783; 
 Wed, 05 Aug 2026 09:43:56 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3158644a195sm16719065eec.13.2026.08.05.09.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 09:43:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 2/8] target/riscv: Enable Zicclsm for the compatible CPUs
Date: Thu,  6 Aug 2026 00:43:39 +0800
Message-ID: <20260805164345.698208-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805164345.698208-1-frank.chang@sifive.com>
References: <20260805164345.698208-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
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

To support Zicclsm, let's enable Zicclsm for the following compatible
CPUs:

- Base 32 CPU (to be backward compatible)
- Base 64 CPU (to be backward compatible)
- XuanTie (T-Head) C908
- Tenstorrent Ascalon
- Ventana Veyron V1
- XiangShan Kunminghu
- MIPS P8700 (ISA doesn't include Zicclsm, but their datasheet claims that
  it has unaligned load/store support in hardware)

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5a82e6563bf..7ee89f6fc4b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3268,6 +3268,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
@@ -3340,6 +3341,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
@@ -3426,6 +3428,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zbs = true,
         .cfg.ext_zkt = true,
         .cfg.ext_zbkc = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zihintpause = true,
@@ -3469,6 +3472,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicond = true,
         .cfg.ext_zicsr = true,
@@ -3518,6 +3522,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 
         /* ISA extensions */
         .cfg.mmu = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zicsr = true,
         .cfg.pmp = true,
@@ -3577,6 +3582,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
      * The RISC-V Instruction Set Manual: Volume I
      * Unprivileged Architecture
      */
+    .cfg.ext_zicclsm = true,
     .cfg.ext_zicntr = true,
     .cfg.ext_zihpm = true,
     .cfg.ext_zihintntl = true,
@@ -3633,6 +3639,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
         .priv_spec = PRIV_VERSION_1_12_0,
         .cfg.max_satp_mode = VM_1_10_SV48,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zicsr = true,
         .cfg.mmu = true,
-- 
2.43.0


