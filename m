Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A9CC98324
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 08:26:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAkCn-00041K-Ec; Sun, 27 Sep 2026 04:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xAkCk-0003xH-GC
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 04:25:50 -0400
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xAkCi-0004fb-TY
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 04:25:50 -0400
Received: by mail-pz2-x0e.google.com with SMTP id
 41be03b00d2f7-cc797656e69so440687a12.0
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1790497547; x=1791102347; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pX81RubxJXGeHk2Ek4qy67Lkkg8XYA6a/IolSvKf1EQ=;
 b=dC8+uGXKGDIyGzWGKbvaNU1s0bcNLufwqsUcbEKFaj6skI0eXCK9jw5abHqROK7YZX
 2i6oIImmbllC5qP+bCfanB5NgN0MQgzYjATYunGUee/wM1ce5kXUGPXYocahIqvReUUL
 FZf7n1hQeI7Lth+GXSBsw0QIH8RPMaGbBg+e081SqlXzA+8yXwWcn4AjiQ1pWUoE0dxh
 MpU2H99Fbv3wfyv6fiuGwZEtLmKMdtLQvAY1zRU010yjijSqlp0BnvjkKzjw51xGZc39
 pk1Q5TSOj0+O7/mL5JzyEqrpAxzsNZW1LUxifEltuIaIrKi3yiSJWgMppIuzFBoJmua0
 qV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790497547; x=1791102347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pX81RubxJXGeHk2Ek4qy67Lkkg8XYA6a/IolSvKf1EQ=;
 b=PYeVROyn8wYD/qW5CeNF9xqv+4tsZdQFfUEqLSEemIqFBDd/UiGtNAs9Pa2OWoGMp0
 8IguDAKO5h2IUa7isb6CVgTrHce4mV78FyI7A8+jGPjvnAbkZ8xbsOoW9CfXyDUF6vqW
 woUcZL5vjm5M2c7S6X5AWHW2IsIDQXwsiaUBI0/p31TJXDS0LHw1FpCzxWmCcHUVgIW/
 b7GHmAiBZs0k9lP/qwXKoKub8/oa03TTosICin+y/dkF3WTt7QV+SCoAUQTT80qbetpx
 T4Ewm2zYxaprP9W1xQKbtLBbczeT0BJCGJJby37YXI5jJ7/PfnigUPUMhRpSC+MkNmXS
 uDIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxyK6Z4fXUYjFp9bbNnY3B1ca0x30RnNVusJP97ZAliNdwvFowOvHOOi0aGgPmQyhKgOSdqQV13Pnp1@nongnu.org
X-Gm-Message-State: AFq9FYIp4PtyT/blnBdFRQwC+u3EKCUKuGC+SS63xFKhxz53ry0PkDKm
 wXUUwNRVgCkdmYSWsNDFOnOlwo1G5C+23jY6RiL3hh40K7sv0xv+62AXVha6zoHwd3E=
X-Gm-Gg: AYBFou1jdfftNbIVMONQfLagUcAUDli33ZfM+Mh8ubi6RlHtLH0pNtzdcwhz1WMyLFw
 65gyzJYtDpZC9xt2HcwVdY5FJ9IBditbnadw/zNDq+ym98bv27+wprVdH2PKuOJIOjDbwsphwRq
 YUAGMO0Hw3g7FTwaBY6bufczg+o+21pl0SBUTtvCO9PzGzfkSFiuflCzAab/zeuz2bcmySGOt6k
 WHIftc9kg8m1EgkS0YNs7Uh6EA35sCHHdb9pLYpkVmSZEQQ974YtoB4Ii0WNWYC9UK78v/ax8ES
 MqFOtDLRoW+X+cTmlajNlkZbBIO51XTzuxlj+XNhQJScUMBtZch7v1bOI6lvmtwpwb3y9sY7Jec
 QKq4PYTk/KiWPBtHts2No0zqRzYCqO7Smqt//r0kyiIS2TiFxITzdQbpnTbCprSwPqF0vFn81II
 a+HSGAuzebrpFdunGLRYZm4U0QLJaa7qul9+D4G6VKmq9eVD4Amah0n0PICMyiT5RVO2OXyuS70
 NqsUO2ZJwUYeBu7LJB6DR4sZkRKw8APNfYfWrnYJzqQyggubzK7lsm5aiK4QhHO/CQH6pXSug==
X-Received: by 2002:a17:90b:2748:b0:3a0:7dea:6dd4 with SMTP id
 98e67ed59e1d1-3a098570051mr8166539a91.7.1790497547621; 
 Sun, 27 Sep 2026 01:25:47 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0b9357f64sm14498871a91.3.2026.09.27.01.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 01:25:47 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 3/6] target/riscv/cpu: Add SiFive custom int8 matmul
 extension implied rules
Date: Sun, 27 Sep 2026 16:25:31 +0800
Message-ID: <20260927082534.3228237-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927082534.3228237-1-max.chou@sifive.com>
References: <20260927082534.3228237-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::e;
 envelope-from=max.chou@sifive.com; helo=mail-pz2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Add SiFive custom int8 matmul extension implied rules to enable the
implied extensions of SiFive custom int8 matmul extension recursively.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 90fa1d714c7..714697c66cf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2906,6 +2906,24 @@ static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule XSFVQMACCDOD_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccdod),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule XSFVQMACCQOQ_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_xsfvqmaccqoq),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32x),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
     &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED,
@@ -2957,6 +2975,8 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &SMCTR_IMPLIED,
     &SSCTR_IMPLIED,
     &SSSTATEEN_IMPLIED,
+    &XSFVQMACCDOD_IMPLIED,
+    &XSFVQMACCQOQ_IMPLIED,
     NULL
 };
 
-- 
2.43.0


