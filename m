Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F52C3600C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 10:41:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u26Nd-0005Ga-Pu; Tue, 08 Apr 2025 06:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26ND-00056y-U8
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:11 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26NB-00089p-3l
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:06 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7376dd56eccso5824246b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744108802; x=1744713602; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPGCnMvFd+LYWp0JkHcVpmNOMboFHrFoP/WFEwnOqXY=;
 b=Hx2h3XeSmD/CcLazwoAPLDcMDcFMgrR+4kMhwognQTxlavMzhfw1ulcn+cj5dX6PWc
 lrqGQg2qG+adpTQJnRVRDsQSPYvwcV7cD16XkAFllpvfKJ6WHZLCW75jW1aEJlBwWNEi
 7b2UPqPBd09gnQzRdb5Yg9RA7iRMD5bi/1v9afLX1q08rS8SileQi5A8NtZxhm5htYmt
 eHR5gUPWSYIjd8YY20w2Cf7EK3XhDKjk2MOp1rsc9Wn7Ko4NYh4q0MW6WswXTD7c6gIU
 tAdFJI8barUr6puiuLBRa0c90ygdzTbE+mcEL7vakLZwqQ2lwkSEBYeGDTs1sooINdib
 ki5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744108802; x=1744713602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MPGCnMvFd+LYWp0JkHcVpmNOMboFHrFoP/WFEwnOqXY=;
 b=dFFK2Z4ccmzz0TPv9zAMfzL4hicQQPV8bXJU0IRzo48dVYLYpq2V27Cto9L/02nEwA
 ro18eq67XRABYmc0ILC3PPBdW6ui+h6NvwZCcQVV3zyjWQb6fINBUWHHX9PBKRToaatB
 n89ex6VYJ8y2j0mynau/TcWKQg96jC+hsOmWVeHMWmzQHBNxkJR/1IrgqVF72IzI8Lh/
 mTc/zkB1S5077IQaUUCsBIkidXGNIzAMdoXLqDH5dmbPpDyB0v9Oaht4u7xalxcQ5Qn3
 Nij6eYcAup3+loAUmkUlUzirfZ69ugsc6MlR7zrgI2mAq6vqrHZJHprzu1N1AsVB3ryl
 6Uvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHmqr1wv/FxFMSDo/d6oUZM8NWyLwzKSXkVaWE79HUey6bdM1nF7EdEQHIleWgDlAept+xNqoiV43u@nongnu.org
X-Gm-Message-State: AOJu0Yx1UQ6b8LHdot8np/t4px8KsayH2wD7a74Yzju1EPz2pI31+4VT
 iPA6O+yZYtjlCarmoeil9R59vxCFGlasUdRItKM/aaWa4zZopHifDdllKBfzU9k=
X-Gm-Gg: ASbGncsDRtsd8VwPa4vLHP2FMi3PrnQ16j7gXXmTPUUwlzbB2NVghFPlKQiOVPwsHSJ
 vHbkMiW3O4cegmeWEUYU0gfS+7oYK/KxEgTCGaatQ0szsj0EsR04vMCP791QBalbmxRc5Amodsq
 Y5++tmqtv/EcKhL/LVeL0ZLtFSTR4Uvo6dZoa+IbMiH9/uvOkBMI13wmuUrC5QWg9nYfPumb6R2
 rXIsXgCTBVKi14mGzQgFsLAfunI9NOSFVcFPhNC0TfMi4cEZQjPMmqsvVisv7CTcrt+Nzem/Rbx
 450gYPwubrZd1Osljm1C9i2OgGWcrgCI85tUrloHFseSfYmKEOd0XCVirHL0AxZqh0YVxEDjmgb
 s1Wcqe2MkhNiuf2KUaCeGzrzl
X-Google-Smtp-Source: AGHT+IEboZ9SAyDiYA1hoNqYj7+yI+U+oZH8Joj3pADiX1DBpke6XYVERBar9a5/+c5T4RHDs9TJ/A==
X-Received: by 2002:a05:6a00:1941:b0:736:562b:9a9c with SMTP id
 d2e1a72fcca58-739e711367fmr19288794b3a.18.1744108802129; 
 Tue, 08 Apr 2025 03:40:02 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0e3734sm10532380b3a.179.2025.04.08.03.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:40:01 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 04/10] target/riscv: rvv: Apply vext_check_input_eew to
 OPIVI/OPIVX/OPFVF(vext_check_ss) instructions
Date: Tue,  8 Apr 2025 18:39:32 +0800
Message-ID: <20250408103938.3623486-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408103938.3623486-1-max.chou@sifive.com>
References: <20250408103938.3623486-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x434.google.com
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

Handle the overlap of source registers with different EEWs.

Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4a0c9fbeff3..e8197f779e0 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -412,7 +412,8 @@ static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 {
     return require_vm(vm, vd) &&
            require_align(vd, s->lmul) &&
-           require_align(vs, s->lmul);
+           require_align(vs, s->lmul) &&
+           vext_check_input_eew(s, vs, s->sew, -1, s->sew, vm);
 }
 
 /*
-- 
2.43.0


