Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48712CDB481
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 12:10:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcMQA-0006pY-9N; Wed, 24 Jun 2026 08:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suunj1331@gmail.com>)
 id 1wcJUD-0001AT-FS
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 05:01:33 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <suunj1331@gmail.com>)
 id 1wcJUC-0007kG-0Z
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 05:01:33 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-37cae9b7536so576506a91.3
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782291690; x=1782896490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oAFwvu0IIrO9LQu68/GCI7YYJ8LSf/BV4HbSMpLrHYo=;
 b=c0x+e1cye9xsFdU6hXEDteP2PPkqxi4JpI4l272YmW0sQwq/u/FDU74F5McSCK8338
 SUCaWt0t+xo1rnVaxU6/eRkMtEZcxwlXBuRhNDiFtrmMuDVBqBANLrvAo4gflnNrKQOs
 yTxHzgHDVhpN9pwyXfHTYXDFr3SGqFdRtgp2dm+fim4xgXM9FevsKncM3EkB4iMOcWxa
 MTtvYfBa+wbnnwetFRiZBhI7hBiepyF5r1X0U03pgZUBwxdfvkz2Qbtftac+80GmO6f/
 EPa7E7F/pR1u+WtTuaDewxcHdWyzIUN5U0mABM03Id6AR4XOtmovhuNkx4AkNdJXMaXu
 Q0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782291690; x=1782896490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAFwvu0IIrO9LQu68/GCI7YYJ8LSf/BV4HbSMpLrHYo=;
 b=pCXSknjjtJ+lhByxDlQ21InLnYwIPuxBssMgcAyKlWFdQXO9c04luwKb0j4RpKpXT+
 +4Q91K3+/4WL35zjTGlqTACgc0FFg/CEmj6aCnVxi0rPcib+kym60wJKSpJS7f1p4WBm
 XiYiKZL2xhQWLu2FC25Z9TYlnQXhpC4FKmVXdE8ST2nPlcchMfO1Wsp5qJ14zG1kHR5g
 MhUmgGn711ezZySQVjAw9BLQBEuBXie9SR/HZAv6KkMTfAt0uqwyuNlg4Q7/j+FzyWDK
 mf6voNhzhwIAPh9Qovg0KgbwaklAxh+M3mWlAM0nuIfX4WCqzlp09fa4vBQnZpPMinVO
 p1Uw==
X-Gm-Message-State: AOJu0YwGhtkgD8S86yIxOm+v+uqtJr+LXJAWr4Q2zCDHKK0IBK6F6jy1
 tqfLzjzk8IArtXfN/hETZqsPkTGo6HV4T7OiK2YYNH2hM/4eZ9dk0KPv
X-Gm-Gg: AfdE7clfkiJETA6QcxcpeJ1PZFyJBFSwlj35d5rYzf2JCXk+NJ6UnM1+P8rMVW7szWA
 PmbRfl+pl9aM30bqzA5pAGD/K0VUanPNLMB1dZYISYfnDlvX0ZWVCgi8/mGAWTclOASAfB7U4iK
 aHyQq99rWZfNfrUDrLKNFPtieat/dTkCLgFxdbIGVsbOn7uKgXlca3ST0vJ5NUx82OwjZo5ebHJ
 db9cEAzLJ15LD8FFVsPIPgrgeCEdx+VeZYhvRHUmBNutN8D3M/oZRjLsDTOt1qLUqX6MmUmWf1M
 lxb96aUFfx4JLE3EVvIDbAaE9OS/YAgpmtVoUSFMN+y0J3znME+sXHGUt0HcklBlDGHlpZGmxip
 87Dg7u9nLzszDvpnGO04DCWDR7MdPr6HGaa9pV440BMju+ibtyi8pbqQMlfDUmwhxiLuTVP/ENx
 PMMhEZYjl+91xx/dADJwAsEFTLj8nql0KlOdja
X-Received: by 2002:a17:90b:2d4b:b0:36b:8baa:a683 with SMTP id
 98e67ed59e1d1-37de428c477mr2618004a91.19.1782291689964; 
 Wed, 24 Jun 2026 02:01:29 -0700 (PDT)
Received: from fedora ([61.74.238.173]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8bc2c8d8a9sm12257944a12.5.2026.06.24.02.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 02:01:29 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] target/riscv: Fix vsstatus.UXL reserved value
Date: Wed, 24 Jun 2026 18:00:52 +0900
Message-ID: <20260624090052.463075-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=suunj1331@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Jun 2026 08:09:31 -0400
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

By the priv spec the value "3" is marked as 'Reserved' for
mstatus.UXL. write_mstatus() rejects this value, but
write_vsstatus() does not, allowing the reserved value to be
written and read back unchanged.

Handle a vsstatus.UXL = 3 write by writing the current 'xl'
instead.

Fixes: f310df58bd2 ("target/riscv: Enable uxl field write")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 target/riscv/csr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index dd9726fcf4..4c1da61824 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -5226,7 +5226,15 @@ static RISCVException write_vsstatus(CPURISCVState *env, int csrno,
     uint64_t mask = (target_ulong)-1;
     if ((val & VSSTATUS64_UXL) == 0) {
         mask &= ~VSSTATUS64_UXL;
+    } else {
+        uint64_t uxl = (val & VSSTATUS64_UXL) >> 32;
+        if (uxl == 3) {
+            int xl = riscv_cpu_mxl(env);
+            val = deposit64(val, 32, 2,
+                            xl == MXL_RV128 ? MXL_RV64 : xl);
+        }
     }
+
     if ((env->henvcfg & HENVCFG_DTE)) {
         if ((val & SSTATUS_SDT) != 0) {
             val &= ~SSTATUS_SIE;
-- 
2.52.0


