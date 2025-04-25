Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD16C369D5
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 11:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8HNO-0001ET-CP; Fri, 25 Apr 2025 07:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8HNL-0001DW-Pd
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:37:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8HNJ-0006Ym-3p
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:37:47 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22c33677183so22085945ad.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745581063; x=1746185863; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WoRag7nHgN6HPhipqYLKSstdosBjYUjBOszLpVa5YAo=;
 b=frwCENk51s0nOwStwB9AH88MiaTIUjd7naY6ZpxaQvJg469inO/QiKUNdB2OxdEizf
 Vfiu8RRQU5lIaZaKGiMl4cEyjzqv4dWVo6KUhbLLJVnNj+Z4CazjjChXtAW3/dkdNFoK
 0UuyNyJE2/AweNjlGNfFMnW5ZcfbItqlmYCSDO2Ux+WKfHOAKn50b3clA4mdD5uNm6yj
 Msh+1Pgx9GVve6CiUElut7QJM90euwZYhYhotFrvHRCZ+MUoeU163ZwSMrGASebVP5k5
 XM3lrso0RXvDhhhSaRWvkUcn3Opiz45wVyCqQjI5n6+LMxjPn4elhOslqv1dnjacSkAS
 oSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745581063; x=1746185863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WoRag7nHgN6HPhipqYLKSstdosBjYUjBOszLpVa5YAo=;
 b=GzXKOoqW+GJJWBgRK/82KsU1w9PvbWWHewoHDnIJ64MyWxWYIC9w1x77YUp13P3yc/
 RWCaNWXw98acTt63RJrorjhCdzN0WP454J2umLybYBZqZK4deVsNShb2TWuyO+Zu6Kvl
 oxIla6cUWq9il7UItk5jOgO+CjTfF2MydNfK3idtuo4ov2COFAxgfSOaBxfO/23n51I2
 SV9zy/uyhzSsbI3aeNVaOW6TfsTXH8L38FcMaAFx88NTxkpO19IUArx2G9i3MSC13/pw
 gc1tsEiSa0Cgkp5pX6IQ4mHcPAMyZcnrbs83L/Lp4qCB8u5j6yQWtFHhVa14qBLHfoaw
 9K8Q==
X-Gm-Message-State: AOJu0YxctlS5eS25o8xfwlMr/KmLMpWN7V+m9S5vWus5cw6sBVerKidp
 xVZ5+lpkIbp1upcX8eM2imD28G9njFYNfPqkfSMYhXLuP/z7u6SjA6H3NCTUdpk=
X-Gm-Gg: ASbGncvsjb+2a/Qd5Dz1JNNFrFR2dH/HEdnUYhCLcWdEvx5wg7pjx+00KKfexfvvdmf
 fOlXCvqNcpEDmudSXtiTSG2Yw2/Qvy+ETCbAAu+dxv377oyvflRcOLTcdvNX9PrugUokBPBcugT
 ezmefIjo6+G2mkarFMM7fSsgEule5MjIB7Ed5hwJGC3Bae5mJk0R2YLhoPriQz+DdN8USQ6iyWS
 j/ykRIlc5lmmZg/OsiyiJO2zRYXhevlM6sn6SQfCRj8mPXqNCezvcWJl9gI0tbNwfVoBRvOXleO
 ySfju7oni9Uhi19oCTxYoHL81euWINPqrATZpyCaP1gIkobe6Jlb+YJsCmeX2R9NyvCA
X-Google-Smtp-Source: AGHT+IEuuSoPuA9ZS0PqoVEM1Eey5FOz5LPQrkKDRsuJUQT+WWahTLJ3htSKSK3IUGJMdSeqYiSOXg==
X-Received: by 2002:a17:903:1a23:b0:220:e924:99dd with SMTP id
 d9443c01a7336-22dbf6335a1mr33578015ad.34.1745581063237; 
 Fri, 25 Apr 2025 04:37:43 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7a40sm29881055ad.147.2025.04.25.04.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:37:42 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 8/9] target/riscv: widen (m|s)counteren to target_ulong
Date: Fri, 25 Apr 2025 08:37:04 -0300
Message-ID: <20250425113705.2741457-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
References: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

We want to support scounteren as a KVM CSR. The KVM UAPI defines every
CSR size as target_ulong, and our env->scounteren is fixed at 32 bits.

The other existing cases where the property size does not match the KVM
reg size happens with uint64_t properties, like 'mstatus'. When running
a 32 bit CPU we'll write a 32 bit 'sstatus' KVM reg into the 64 bit
'mstatus' field. As long as we're consistent, i.e. we're always
reading/writing the same words, this is ok.

For scounteren, a KVM guest running in a 64 bit CPU will end up writing
a 64 bit reg in a 32 bit field. This will have all sort of funny side
effects in the KVM guest that we would rather avoid.

Increase scounteren to target_ulong to allow KVM to read/write the
scounteren CSR without any surprises. 'mcounteren' is being changed to
target_ulong for consistency.

Aside from bumping the version of the RISCVCPU vmstate no other
behavioral changes are expected.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h     | 4 ++--
 target/riscv/machine.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5a60d0c52..0623c3187b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -400,8 +400,8 @@ struct CPUArchState {
      */
     bool two_stage_indirect_lookup;
 
-    uint32_t scounteren;
-    uint32_t mcounteren;
+    target_ulong scounteren;
+    target_ulong mcounteren;
 
     uint32_t scountinhibit;
     uint32_t mcountinhibit;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index df2d5bad8d..4b11b203fb 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -401,8 +401,8 @@ static const VMStateDescription vmstate_ssp = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 10,
-    .minimum_version_id = 10,
+    .version_id = 11,
+    .minimum_version_id = 11,
     .post_load = riscv_cpu_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -445,8 +445,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
         VMSTATE_UINTTL(env.miselect, RISCVCPU),
         VMSTATE_UINTTL(env.siselect, RISCVCPU),
-        VMSTATE_UINT32(env.scounteren, RISCVCPU),
-        VMSTATE_UINT32(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.scounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINT32(env.scountinhibit, RISCVCPU),
         VMSTATE_UINT32(env.mcountinhibit, RISCVCPU),
         VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS, 0,
-- 
2.49.0


