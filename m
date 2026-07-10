Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8519C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 06:10:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wi4R2-0001DL-7B; Fri, 10 Jul 2026 02:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4Qj-00018B-7J
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4Qh-0001uA-Op
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-37df72c9984so948385a91.3
 for <qemu-riscv@nongnu.org>; Thu, 09 Jul 2026 23:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783663782; x=1784268582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Qi3Cab8K1e60CRoLYMLAsESl91lzJkvRFZK117KQQXA=;
 b=WqqV0+ESnkEL25enTzLdQRTP3e2WuIb+9lKlhyGyNvzxePNy4XtgUFs9H0S5wZHxIe
 wyzki12+Lq7ZxNdiBNBUzKv6VuATc9JzRNhfVCfER84jXCfZ//zyHB/5r7wAajEETFG5
 rxmxbQsCwF8UrvhVkRYXZP3JTF1zpxfeeomZ4GrWfEVAgrsTJer2rbqaN1/PqvQ+lzXk
 SY+aQG+68/i2P7CxjK1c7IOX40ITQx5CBiOrxBeoINvD2KskcqhHNcw7b2HTomj/t5ty
 R7fiFPFkNq9Y8yh1/jW9wcGAZe2BYV1XFXwl3FcKDZXKxDRA1/3UgvG53efOzWNA1+99
 J2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783663782; x=1784268582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Qi3Cab8K1e60CRoLYMLAsESl91lzJkvRFZK117KQQXA=;
 b=HX8d39x3ui+J7ugbQ04XmV4oSXJFlJlonCN9qX2lOEhIE7LuoysxCHbtIHBsLGw8zZ
 zudy59p8FJ2UwjILkNLQbk2vVFnTgh8pUtpQILKk+kgssjMyJ2Apmx+MTXJrLWwIu6+0
 SAHheeAVYQvPReyFLUwYu/5Jqcp+AqYsyNB7d3BlrPY3D6SUvDFI4nC5mP8o10V/b+P9
 B7noWdd8PGwxfl7iGOpAC4QPBI0IKiLcj43GHQvKeACx3hjKe9vBevPGiIpltsjNCKdc
 q6IuJZM+CH5bOPb+XshbGROSKvS+/jICfJlUJjK59W61edbFg3Jriu+aVZ4AMmFAKzI6
 p02Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro3SW7ak5vDZHRCgV5gaZzQb3KdD3Y9RiCYyi80cGrzfvJ8BPhGrB1wwALnoZ4HFBonwDj0+UOKd+ci@nongnu.org
X-Gm-Message-State: AOJu0Yzy4gtNkZSs7dVj0vHP2SLsQnRTgbrwC/A0SweNE7faJmIHoesJ
 +mu79CTxavPyC0dP6BK9qHefS4vEFfinwee5s1CZh7UuJ5sL8xjz9SIvSijn5AqF/Jw=
X-Gm-Gg: AfdE7ck6rOzG/phK7qcFHA2hHj8eVTQqInFpwSsdf7qQ2Rt0F6XDza6Xj+22eSJ0pqb
 6/tuzt7oDGUSA0rTWqfF/G0I9aUse6fdYrOVdPvpw24ZjjCRzvQTmykGPuuykDyAIWZD4hsTfbv
 tbrnN8k2EmGLtsZrPpHG/ntU2uw0ofsxmCZPJzVdAvxlSFsDlCVzN5odn54FpMiX0OftXQGKFgt
 DQ/h4rUTukD0381lTqTyQZ064wRlAIKH1igRiZb3m4TFnNSYU0bErzrh3WTpBuGgDqOJVlHxN4N
 4AYvUyPW00nChsb0lODha0Fg8xYnVEWkzsbMGGnTJZ3BOBm8tx5hQIxsrUX7yMmYFfuifXmRHXh
 TWBFdT8FPCOy7zeB8QVZmNjXBQeLcMulRJ5qeialciQJmGUNvf2xK4jmBndEh4a6i3pu9ETRrrt
 rZhzkwX7l1yQsJdP93CKfModRhUXZBX+yzwGSKmLY=
X-Received: by 2002:a17:90b:3946:b0:38d:56aa:6f32 with SMTP id
 98e67ed59e1d1-38d56aa73cemr1388335a91.38.1783663782373; 
 Thu, 09 Jul 2026 23:09:42 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d59e33sm53344255ad.74.2026.07.09.23.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 23:09:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v5 5/7] hw/riscv: sifive_u: Align ROM reset vector data
Date: Fri, 10 Jul 2026 14:09:12 +0800
Message-ID: <20260710060914.1227027-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710060914.1227027-1-frank.chang@sifive.com>
References: <20260710060914.1227027-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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

The SiFive U ROM reset vector data needs proper 8-byte alignment for
RV64 ld instructions. Without Zicclsm support, misaligned loads will
cause exceptions.

Add padding to ensure start_addr and fdt_load_addr are placed at 8-byte
aligned offsets and adjust the load instruction offsets to match the new
data layout.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/sifive_u.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 99423ef472d..57a57c96e16 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -564,19 +564,20 @@ static void sifive_u_machine_init(MachineState *machine)
         0,
         0,
         0x00028067,                    /*     jr     t0 */
+        0x00000000,                    /* padding for alignment */
         start_addr,                    /* start: .dword */
         start_addr_hi32,
         fdt_load_addr,                 /* fdt_laddr: .dword */
         fdt_load_addr_hi32,
-        0x00000000,
                                        /* fw_dyn: */
     };
+
     if (riscv_is_32bit(&s->soc.u_cpus)) {
-        reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
-        reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
+        reset_vec[4] = 0x0242a583;     /*     lw     a1, 36(t0) */
+        reset_vec[5] = 0x01c2a283;     /*     lw     t0, 28(t0) */
     } else {
-        reset_vec[4] = 0x0202b583;     /*     ld     a1, 32(t0) */
-        reset_vec[5] = 0x0182b283;     /*     ld     t0, 24(t0) */
+        reset_vec[4] = 0x0242b583;     /*     ld     a1, 36(t0) */
+        reset_vec[5] = 0x01c2b283;     /*     ld     t0, 28(t0) */
     }
 
 
-- 
2.43.0


