Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915A2C0219B
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 15:37:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thVqc-0003mF-9U; Mon, 10 Feb 2025 10:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1thVqa-0003ll-2D
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 10:37:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1thVqX-00033a-IR
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 10:37:19 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so50700345e9.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739201835; x=1739806635;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2FNj/lHt1BHjvndFs0hjsvwi65QGfXgWDRzZ4lr18ss=;
 b=stvKsbrFmJmtvaIEvY605+7ECpMGTXZkSI03rLerkGDVq8S/h3tPdRBC0FMccGdMh0
 l6gMNpBfVyN151/DFE7FU2tn2r2bj5ZKaXmnlUiJOrd3FwrN+wJMkaBYRZ04Qd2s0DJV
 gLUEK+VZ9dyS6Ej3AQ1E4SjPvgbb92O6RzC+Uy49sUL4y6xYAzv7KVyqMSf5olqWrNx6
 6rV2cAXHgY11nbxPvZiTQMzouGK7Cyn8Y8Cau3CX0UC6YOtf0u7+ABG2f6V1yagkPGLK
 VCpZf8+V8muAh6uzzhI3UWWXeATK6ha1RVQIXoGzNXrkaiehUe8NpZpzIE1cpkPfD8sa
 u/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739201835; x=1739806635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2FNj/lHt1BHjvndFs0hjsvwi65QGfXgWDRzZ4lr18ss=;
 b=RCwSzbUBqceF36+FkNtZ+d7EqB/k415NZiSr1LRkTFkbzLpQ1KC1uksJLnu8wS91sU
 vCq8qKBlMKYPrr2QUH/fz/+oLBRacg2Tw7xVq1gMTf6D7rcg/VFZMSIqLZQHqPFlVIVe
 rjL86iKwVxHNVCtHSfk0D66un0Z1jG4HRqbOWU+g/DhzgbeTCpjNSO2m58it/KzUhSPt
 YKfbvHV+QTcvu2fpe5B8PQQBaMkqw5u6jqfZrUXsCmKTOqci2NGEFYeiQUFi3+FPfN1x
 46Cf2QiQXBzGGNFG6o8nwzBDICa35g8ygSMXrP/8IyMAAo2KchBv9e3AYg0tW6g/6lka
 NhZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX4kqkhdTnFDJZvuX3eUMMkLOsWu5DN9/2m4gQtAIdweKOJKwWiGQuSoQG22KDyK9PJCtOdmCyFaAy@nongnu.org
X-Gm-Message-State: AOJu0YzDsgaNrS8gv2KJ4y4X/mSt5S4chymIfXFroVXchEtJYf+uUvn+
 NIGVLm0GJgtnMWsGNHmWjBb6814B/rDKtmNvlKH8wIptG+6USGk6nU+BSKcYVzw=
X-Gm-Gg: ASbGncvRZsSJs5R8zHOvRi9qNU811HzEoRZUCdEsoL4pxRQFh28NIMmVKWkB1zLa4Z3
 jtRQoshGG0OHdNe+HTvNOQM2gmh50LOD4PGlY6fGQSCK6mYERTmtEetjoALiuKfauEfCqAsYQ2l
 IDHMSgp4Uflrmyzv7yEKkU9WkmTBh1rFNV/l36hdLLsNO4lGXfEhCRYuVWSBbfB1FhwzQxl5hMo
 omjNr5STng08/oF49vRDRMGVJ34bZDKj2kwpSCCKfSFuOx7uH6FE9CFhcPNx7LIX3Dn2VIA/j78
 BFkANoWnzyjuKbVN/TBdlOpvtv+f/5KUOIJ85YmEvzHVGlU9E0Tq9fNZDbwd6GRztn0=
X-Google-Smtp-Source: AGHT+IGNn4as9Kzn0sAxjtvPebvPmo1u/I/U9IP5mAkw+2WGT9e0lMcrRG+vVDjqvSzusscSK8qnAQ==
X-Received: by 2002:a05:600c:83cd:b0:439:44eb:2db0 with SMTP id
 5b1f17b1804b1-43944eb306emr34707505e9.15.1739201835055; 
 Mon, 10 Feb 2025 07:37:15 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439471bf782sm24052565e9.39.2025.02.10.07.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 07:37:14 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH] target/riscv: Respect mseccfg.RLB bit for TOR mode PMP entry
Date: Mon, 10 Feb 2025 15:37:13 +0000
Message-ID: <20250210153713.343626-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When running in TOR mode (Top of Range) the next PMP entry controls
whether the entry is locked. However simply checking if the PMP_LOCK bit
is set is not sufficient with the Smepmp extension which now provides a
bit (mseccfg.RLB (Rule Lock Bypass)) to disregard the lock bits. In
order to respect this bit use the convenience pmp_is_locked() function
rather than directly checking PMP_LOCK since this function checks
mseccfg.RLB.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/pmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index a185c246d6..85ab270dad 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -524,7 +524,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
             uint8_t pmp_cfg = env->pmp_state.pmp[addr_index + 1].cfg_reg;
             is_next_cfg_tor = PMP_AMATCH_TOR == pmp_get_a_field(pmp_cfg);
 
-            if (pmp_cfg & PMP_LOCK && is_next_cfg_tor) {
+            if (pmp_is_locked(env, addr_index + 1) && is_next_cfg_tor) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "ignoring pmpaddr write - pmpcfg + 1 locked\n");
                 return;
-- 
2.48.1


