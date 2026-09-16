Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F93C88E77
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 06:28:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6j8N-00060i-TW; Wed, 16 Sep 2026 02:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebasjosue84@gmail.com>)
 id 1x6gYr-0005Hu-GH
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2026 23:43:53 -0400
Received: from mail-ua2-x10.google.com ([2a00:1450:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sebasjosue84@gmail.com>)
 id 1x6gYp-00031n-Nv
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2026 23:43:53 -0400
Received: by mail-ua2-x10.google.com with SMTP id
 a1e0cc1a2514c-97e7c796e3aso130798241.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Sep 2026 20:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789530230; x=1790135030; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5oHA943d8ACzMVOJprq1KS/7rfZnroShoKqBibdtbZY=;
 b=NdLL3KH/KJWpLBy0VIbHAKAViDa5RVK0D6Kp9B+dBpG5xmFxzYxIGbsScdmpD9Lh4Q
 BANZb3pX28WEy5o1psbwhKfklNSRXTDSpncte3uCjM351rXeamxsHlATVka/Ftqiah8w
 aUWQ7eu0ryNhdUv2Z3F9FGUBJ4jzYzsFFgsn1/wxaBgA7cFWcbz/ilX5G7vbIde2U3NM
 rZnxfzLvfa6wVv/Uh2Fy2GnaFZoC2983j3NSyZgEiMYwyikQe15VhjPNqNMJvgj8JdN+
 u1HRxDrC33PqXvQsqqMcngGMCdbmXSGuIUMyTfB7ifRCwww3bWF2NEn1SCYy5eP6IuSd
 v0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789530230; x=1790135030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5oHA943d8ACzMVOJprq1KS/7rfZnroShoKqBibdtbZY=;
 b=NL2TjoOd696wvD6XDu/zdlURYP+BmgmWrRRWavqaIWxCOoJGmJMqGsPxQCTFszKeOK
 nn33KxRaAYP8FUOL8Tp6oAUeKw3M8K+DaBMiQLtqfG0E/laNEphCX0sbbFh0MjQwf8fF
 rdhog0aggqbAzbps20Ah84xY7w8HUM1j2Cppsch2f471Ou2VFm7b973lPJo173FECggc
 mmwBmAwVyQL1zFGeBs4hbKE+wwz89ztOybjchsLqzxv2VL+a0562eZ7rIsWtgHH+tGiH
 r01hxxE0y+F1rH4Gqo9oDWy/SEKYVGKDoGf4yeWjpQzlDVH4NapiGVmQ4njz2bu6BpBj
 FsKQ==
X-Gm-Message-State: AFuF++lPF1hCRZgirXxOiyBcoxp1x0xZWv0EDquy8UcU5UVDWiPhJxu3
 MPs7MiRDB8Wq2z2k8dUgeVrANZEKjU81p4w25Km3IwSQtsF9NMy1KnBk
X-Gm-Gg: AYBFou3sLj2HO7jX8XrZ5BzeERxU5TeaR12wjgyH9XXKOBDwXKMkQYSyYQPMSYb7i0f
 p9FViy6GuAtHqAy2pJpAK6OButiQHTCCqBkrhvtcyIwQFBDg0Zk+xsMhqVOCTwuxKH1tWEaVoqv
 JLUx1q3inpyrHXtB2TKFAWYBO/+R1BrbLUfztFV0zAz0CPIs5rIZI3xumf76hdTjLUQFT1G1+Tl
 QTftpNAeg506y35Kwf9DlAX9LD0Xyu/zgaRG5A9fmLSWG39nPojrboz4fJQmqvj/LoGvtT4IOJK
 XwFREEzb6U3qAUbY6w3WEemxfd50IprgvknXGu4/BrLuO/ZPE0Ir8nxaI/z2aExOBVYOQQFdBSC
 xGlb1cTU5lxokI1wKoDfO3/yRMbzpsHSGije7VNYXZoAcYNl4JxTniZSC/zgYz+qMJnemeMO+IM
 Uu9p5ZvaZ4xp/L/PqPuRZQvl2eDUrNl4xXlNxWTY/O034x09Ozf83lcTIxRaB+W47ySsNwum5u7
 3nOJrTDz53szR7nYQqnd0qyCXtktt3A+LpePWJhTB73c7tMuqOYdNHq9eArHrtRc43JVq6H2jM=
X-Received: by 2002:a05:6102:4b09:b0:79e:221f:705 with SMTP id
 ada2fe7eead31-7a0251b53b2mr1049581137.3.1789530229614; 
 Tue, 15 Sep 2026 20:43:49 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-79facbaa2f0sm1776961137.1.2026.09.15.20.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 20:43:49 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 daniel.barboza@oss.qualcomm.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH] target/riscv/pmp: unlock all PMP entries on reset
Date: Tue, 15 Sep 2026 21:43:31 -0600
Message-ID: <20260916034331.2390427-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:39::10;
 envelope-from=sebasjosue84@gmail.com; helo=mail-ua2-x10.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Sep 2026 02:28:10 -0400
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

pmp_unlock_entries() bounds its loop with pmp_get_num_rules(), which is
the count of entries whose A field is not OFF, not the number of
implemented PMP entries. When the active rules are not contiguous from
index 0, every entry at an index greater than or equal to num_rules
keeps its lock bit across a CPU reset.

Those entries stay locked after the reset has cleared mseccfg, so
mseccfg.RLB is no longer set and pmp_is_readonly() silently discards
subsequent pmpcfg writes. Firmware started after the reset finds PMP
entries it did not configure and cannot clear.

Reproduced on -machine virt -cpu rv64,smepmp=true with a bare-metal
payload that sets pmpcfg0 = 0x99990000 (entries 2 and 3 as
L | NAPOT | R, entries 0 and 1 left OFF) and then resets through the
sifive_test device. On the second boot pmpcfg0 reads back 0x99990000
and writing 0 to it leaves the value unchanged. With this patch the
same payload reads 0x01010000 on the second boot and clearing pmpcfg0
succeeds.

Iterate over the implemented entries instead.

Fixes: 4bf501dc0118 ("target/riscv: pmp: Clear pmp/smepmp bits on reset")
Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
---
 target/riscv/tcg/pmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 41b55519a8..5286c6aa90 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -201,10 +201,10 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
 
 void pmp_unlock_entries(CPURISCVState *env)
 {
-    uint32_t pmp_num = pmp_get_num_rules(env);
+    uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
     int i;
 
-    for (i = 0; i < pmp_num; i++) {
+    for (i = 0; i < pmp_regions; i++) {
         env->pmp_state.pmp[i].cfg_reg &= ~(PMP_LOCK | PMP_AMATCH);
     }
 }
-- 
2.43.0


