Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD46AC43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:12:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh1pp-0003df-Ae; Tue, 07 Jul 2026 05:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pm-0003cw-Re
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:11:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pl-0002JK-9u
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:11:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so37824935e9.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 02:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783415474; x=1784020274; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWB1VMpEOQWXHjt4fAXcLPtGgLfNKt45L82Gan4wey4=;
 b=c+4HMNOKRC64T1bigANxJ73bKTJkaegouOvv0+cYHH54Ope9ic/qgZnMVMUL5MSAjC
 K+W+1iQDQJ3t10zRwwjq1uzgUIyh98QQ197Xeu7PrivGb1G4DZ9J2tkmYHII60P8wyve
 xD70OzHWZxXiASbzPLxevQTIpopUXUUm9YKzOowzsSIhiEMQzsdo0G2TYBYX9cdx8aZO
 1xf177PwUWfT2nPFtu+YkWQWnVDmq4qcbuEYsnT+PIEqT22hBdfjWFu/MvH30z2mgFtZ
 xdfJge6V2PGc1Lht93otvenBhgw/BJ37HvY4DXO1/1uWFeGlJHk2cnWRUug4/F6MLGrl
 Iw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783415474; x=1784020274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oWB1VMpEOQWXHjt4fAXcLPtGgLfNKt45L82Gan4wey4=;
 b=moy5qm7ipObD4/kFuUIX+w1UgmeeiEh15L/LhKveyB6Us07TH2lhave9hQMRVX3qFr
 Zq+67mOSBeOJm6IApolg9NvSXUhTd/3ypaVNx9a7hrsq22VKA3Yn3jmsa2xdbnod8Etg
 IH6PW6OXAoavaS+vVnBnJCjaI81RPt8dFud157kIMyZ3d0kfhqRGX5wG5hZ8BNEZrC8+
 2cgM4E5gPecUD0zbj1j3eIccO3U2sQz0kOFn37ayoNFAGdXEYZOJ9V9zjzB+bLwMA52s
 ZWeFq3zLP8haQpxYIl+MhZNOmAqfh5+xpcuUYuQp4rzwWPOdsBM+wUoAXXgll3O8kolP
 oJFw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrFJucSg+9k6KO3KR/ZTKHUVdK/Bu6ApDRq1C4BH9LO8hYIvZAL9O32tl7oEtnmUPErAzx6Omax1V/+@nongnu.org
X-Gm-Message-State: AOJu0Yy9YNQeB5KVVvXZYpbzGI6hfJWg7jGmHILm0ueGYXD5sSgTdY00
 9MlrXcT64LhIJEm8+kJFTcX3LXx5pjsXgPOMY7IOc+6iQfjgmb0JN2sIqPzshHYwnes=
X-Gm-Gg: AfdE7ckZm9jKnps+g1fgTIc2p5E0HHp5fuLE9iJ0oYCFrCGlVIM43TITZOTY55hQoDF
 +XU+CGZvvWckvJJSDrhCKCs0FIKHGAsjChq//NZcjVevYAnN5E4VTtrUyESRBKftSejs+ofbhHy
 +NsI7yUqsuMJQA1Uc3A3CP5dVlN/ypl3j3h+W1eAXQUa99iejPs1dpnPjSDTY0jgwMHzyNYy7Kd
 TRg/0i4gUrFA5/xwwW37Vpl/TN0iR3m5K6hc0B2aAz3jFB7do85MAdrZmRDs/5KGiodC9NYuq0B
 aENchoBrZySCy1cE410K/eksWVqRMYb2O1/ycoL3QYVLxzCwsTUOgX8D5VQg6UFHsmeeKcjFtYH
 oRIw9+6sgyiAWG1aQoGU/fpL5H/UG1u/+zh9UwV3FZIjdFWsZ4abh7L/qBrT2gq0e0Ls6RUCqNi
 aVhJx62ZZuE4hNw4xj627XW0jPrslis4JijoMrI9S6t8YcfJDW+A==
X-Received: by 2002:a05:600c:1d1a:b0:493:b783:ad59 with SMTP id
 5b1f17b1804b1-493df07390amr52428215e9.14.1783415474375; 
 Tue, 07 Jul 2026 02:11:14 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f32660sm41004665e9.2.2026.07.07.02.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 02:11:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 6/6] target/riscv: Update Zicclsm ISA string and expose it
 as a CPU property
Date: Tue,  7 Jul 2026 17:10:39 +0800
Message-ID: <20260707091039.2574638-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707091039.2574638-1-frank.chang@sifive.com>
References: <20260707091039.2574638-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=frank.chang@sifive.com; helo=mail-wm1-x32e.google.com
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

Update Zicclsm ISA string and expose it as a CPU property to allow user
to turn on/off Zicclsm extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a3cccdfed3c..8735a5ce846 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -144,7 +144,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccamoa, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccif, PRIV_VERSION_1_11_0, has_priv_1_11),
-    ISA_INTERNAL_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, has_priv_1_11),
+    ISA_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, ext_zicclsm),
     ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, ext_ziccrse),
     ISA_EXT_DATA_ENTRY(zicfilp, PRIV_VERSION_1_12_0, ext_zicfilp),
     ISA_EXT_DATA_ENTRY(zicfiss, PRIV_VERSION_1_13_0, ext_zicfiss),
-- 
2.43.0


