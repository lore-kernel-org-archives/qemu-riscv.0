Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A19C5475B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 16:11:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhtr7-0006Bd-MR; Wed, 06 Mar 2024 11:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rhtr4-0006B5-S4
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 11:10:54 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rhtqz-00081r-5n
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 11:10:54 -0500
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5cdbc4334edso4962536a12.3
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 08:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1709741445; x=1710346245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=npEeaAAo3oCK9gf/6CQOc1KZa2+QOGbXENzn0EtNKw4=;
 b=NMNx874c9bSrUioPP9qsGvbQa2Cez6XKaKGewrq2nj9CS0jPSL56WmOnv5CkQ0ZIVE
 XP1ggEs6ycFgnLnHMd7YB1WU6FDh7EGo1RpyGa/gl4iAUDZiugtIzQZNtEr+Z+oKSfXh
 9h5EIQEL4mUG4ZS9KtG0qVVbf75Wzk6l0sOxTkL6CzmL9gSDXoUZygZNeHEnrgY51itf
 psp674360hjW0quN8ImHjW9hK/FTZbY1rBJFcPHkVKBDNsLwJ1vpfVTPNUTegx/Yh+XY
 +mCovhrEypcljPCbkClVtbtdkKUV7BAFbiGF5zIFBxUZL1YZeHGTbmSFv4AKkTVzDRQl
 +0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709741445; x=1710346245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=npEeaAAo3oCK9gf/6CQOc1KZa2+QOGbXENzn0EtNKw4=;
 b=UjjrBm5Vd77pHaWDSaQIpL7jvYKG9Or9QZJcXJ0z2hLBpyssOv0rf00y8e1tJfzRB1
 14WO01lgMZE7e3wtQIXWRfgcjeSjOFBFWNes9ffBzBYtmiE5eXQ8uTDcMYjUoDF3hnCy
 ubqUxjYflYfHiZcr5z2IsV6DT8GjNYrH/5GWMUGf5PBneuuQM0HMA5xcLoVowR5ryOvY
 pOulcJaDlZtKnE0Av3183kEBfVgxNyeIMEJVLoxnNm9Rp90vJaeQMus5BWn/fFEyko0y
 HrVR1vthy40US1eiFJ/Hft7veqObC3luEyfdbd8NUm9quXMOmTuxbGdbRCoUVUitHDTm
 3Evw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCm0w0drNs26scxHl2ZJXGzLhw48w8JUkhIhKzjvj8UuEf1GhxKE1CIXlmz9vgyGnT4FctsdVSJ13rO6WyC8MI6/EAR9g=
X-Gm-Message-State: AOJu0Yw5rzh73ZEBgldJThQj0gcRjoV5fPiR1wXRnSbu9gJFh7LyeSpQ
 t9/h7UWiR1GON+9ulElcBxeG3UiAgO9WoRj/a3G5ujEyDTYOJ8IL6hXNCGgbFgM=
X-Google-Smtp-Source: AGHT+IEqPnPG+bO4zBfFIKPhmTsTQGzMMvlcZQSKfqvxg3I/yda0WfXw+k5CReCmZc/fi1z/YZf+1w==
X-Received: by 2002:a17:90b:711:b0:29a:9952:67b7 with SMTP id
 s17-20020a17090b071100b0029a995267b7mr12392900pjz.48.1709741445298; 
 Wed, 06 Mar 2024 08:10:45 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 h21-20020a17090a9c1500b0029b73f2a0besm1605497pjp.45.2024.03.06.08.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 08:10:45 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv/vector_helper.c: Avoid shifting negative in
 fractional LMUL checking
Date: Thu,  7 Mar 2024 00:10:22 +0800
Message-Id: <20240306161036.938931-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

When vlmul is larger than 5, the original fractional LMUL checking may
gets unexpected result.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/vector_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 84cec73eb20..adceec378fd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -53,10 +53,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
          * VLEN * LMUL >= SEW
          * VLEN >> (8 - lmul) >= sew
          * (vlenb << 3) >> (8 - lmul) >= sew
-         * vlenb >> (8 - 3 - lmul) >= sew
          */
         if (vlmul == 4 ||
-            cpu->cfg.vlenb >> (8 - 3 - vlmul) < sew) {
+            ((cpu->cfg.vlenb << 3) >> (8 - vlmul)) < sew) {
             vill = true;
         }
     }
-- 
2.34.1


