Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B211DCE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 11:10:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkjUD-000122-70; Mon, 25 Sep 2023 07:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qkjU6-0000vd-Q4
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 07:10:41 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qkjU4-00063Q-9v
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 07:10:37 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c5bf7871dcso43858405ad.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 04:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695640234; x=1696245034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BvX2+sVn3mYCB1tN/Qo4MV8jbyR8oE8a/ORQJtmCsgc=;
 b=ZM8SPrZ/PmtYSeBF+n8ADEBDIoTSuaYSy6XzHMxxKivlFegsgw19LCZ0TSZF4FujtJ
 ejv2ZpKvCleR99+p35u1BE9u5XyAYNA7PtJxPvwzruX+nJYtWq511qJ3QdBXuUPdKDL5
 7t84cvppuTppI0Dakav0OU71h9fBLO8H3V20Bhjro/qQ/CO8ZYILvqIF7sRrHWfJBt/C
 cLS9CZnpxzSd1nnkm95bzEmWCqi1OiMh34URQGkAyTjj04XJ2b6Mq3k31GiEsfY9ojkQ
 sKhOxJontvcoCFOYzG/r+sc4o3pvZ9IJJUuxfHMAXA/0ispuPmXBvbyWt6R+10NBSruZ
 XxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695640234; x=1696245034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BvX2+sVn3mYCB1tN/Qo4MV8jbyR8oE8a/ORQJtmCsgc=;
 b=st1ovXgI5ovInjal+Bb1UJH1mfVGQzUzntfO/IoJJYZiOK8FYy3m5WOdayQmwqTO0O
 Oph5pNUMvQ4eRm2Ld1IuTuRvw6wzy3+LQxAcbgvb9LzgGyNJrtWShjVkQRM1cVuf7MCc
 zHkBT6GjZAWat/B4VIWRVPrOhrVaMnsza1MPP5inaoy2hPRZen5YIORtMsqrkkfBcryv
 cdP5pAbIiY99qexYFUArWvlpFHNBMWHVTVlVjHi7C3Jp3yt2TKjRP0vaHVKGQDMof6qj
 aYBNliOsaArrvy3014YjRfz0MZNO8Je3xYI6F1D/nesVpFhOb1ZD7ImuYnCKEEVVqMYz
 vLdQ==
X-Gm-Message-State: AOJu0Ywyt2w8+ZXBihwQEuD7ayoTBKleFzFzzR/CUaf0H2ITG1glcc8c
 4O/SFZGoihkd5IjQgIhbZ6C8MS/tQV2FIyLy717wNXTf
X-Google-Smtp-Source: AGHT+IHZL8Q7lLAUUnCqbzWnlc1zd8CEkgGl1WcMIWfpOuk/KZGaEFEIPuTXhKUKMHY0bK/vDQNXOQ==
X-Received: by 2002:a17:902:ab1a:b0:1c5:cc30:7329 with SMTP id
 ik26-20020a170902ab1a00b001c5cc307329mr4466578plb.54.1695640234560; 
 Mon, 25 Sep 2023 04:10:34 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 n11-20020a170902d2cb00b001c06dcd453csm8527791plc.236.2023.09.25.04.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 04:10:34 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] target/riscv: pmp: Ignore writes when RW=01
Date: Mon, 25 Sep 2023 16:40:25 +0530
Message-Id: <20230925111025.543094-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

As per the Priv spec: "The R, W, and X fields form a collective WARL
field for which the combinations with R=0 and W=1 are reserved."
However currently such writes are not ignored as ought to be. The
combinations with RW=01 are allowed only when the Smepmp extension
is enabled and mseccfg.MML is set.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/pmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 5b14eb511a..8e25f145e0 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -120,6 +120,11 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
         if (locked) {
             qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
         } else {
+            /* If !mseccfg.MML then ignore writes with encoding RW=01 */
+            if ((val & PMP_WRITE) && !(val & PMP_READ) &&
+                !MSECCFG_MML_ISSET(env)) {
+                val &= ~(PMP_WRITE | PMP_READ);
+            }
             env->pmp_state.pmp[pmp_index].cfg_reg = val;
             pmp_update_rule(env, pmp_index);
         }
-- 
2.34.1


