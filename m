Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715E8E65D19
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 03:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEKFd-0005Ug-Vn; Thu, 21 Nov 2024 22:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFc-0005Ta-II
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:32 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tEKFa-0003wJ-4E
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 22:22:32 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2128383b86eso16406135ad.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 19:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732245749; x=1732850549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ete+ZJB8URbofv6Sb72yOCLqH3KqEk//Slye3l6+Ywk=;
 b=ReYY0V14yx7limW5OhkEIqMDkrcvla4NKGieLXG5C8GEphe3eTB0naP/L6HUfUuVFK
 HMPCrxu9vkeJd3QEgqN8Z4MzXrpweGd0EGCPvEHYnBVtCeCoNkwr+tbD3l6OIV7knyu1
 8Ua/DT0RYocKCwhbOXKEQ9B5vlgV6Q+ysvpdypxM4FETP+OpEGr+E9mjc15zinI/LQUm
 PxcfRNxSi9I6pEFy/Cyge7NjfTTD0h15tOUoZ8a3uROuxK01nDWZseyjJoB/+uYk9eIs
 FTKXlm/NbqsCPe0GMEWHgg4/67dbE4QVrSGR7jIz65w3jK0Ni2Yi9vRpiTF+bavgN/4a
 +RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732245749; x=1732850549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ete+ZJB8URbofv6Sb72yOCLqH3KqEk//Slye3l6+Ywk=;
 b=esIIJ7qdEpCvEz3tLJs0xoR/Id0zOxqxnL+zSC6q29yzcItHkpuvrn/BAgaGqkYZoL
 BT7ZS2OkBF4aLFfwgGZz2LXEX6OWjtVzqVC2dngAOQXrCAnsOJ/Z3bHYHGPh/MCpEf1I
 m+J24lwUqt2q+TMiV2mdRjzgxLvGX5O+W0spKszLiNmcBjRUquLUBPwo+tqABuFyP7xO
 7Ga5HQefdUwdidtbZw7xQuB5VodZRD1wFayXiGDPAGW8CQyeMqvR4bEtmRMvgW8WN6vt
 UvtP8bpg80s1V0o8o8A+mXu+n/Ar0i+8XcvR3nSoqMUDX7Q+Cp3Wmdfoj7kJ+7TFSkCh
 /X6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvI3vSrlkIvBQo5Ayj775eG1OFgQ07dBlqzW8mtP9aPlPoKPy4XBLRjN/ZjIX443oI8B7Dt2GdEfOn@nongnu.org
X-Gm-Message-State: AOJu0YzK7B7Rbs1l1mIx/nsD/yXLESkLiUeetuxjlEfi7JpX9huUzuwE
 DNmT1jrZ0qiumu0f14KqgE0Z7+ex6m7KFjQTzwssSk/QPWOHLb8V0n46hTRxyyk=
X-Gm-Gg: ASbGncvP6BT5FWA+SPP77U/oKsldlXFipE4o5ZLgi90/1Sbz1nU7NVJ3DEVmgGELi2p
 2RxNPsNq+YgfN4JEMWGD6kYghTZrgNXuPGuQq8mcp+MZbJn90k2eH9AHUMC9tIzGn/UmSZIXsza
 cBk8uiAB1lEu4Pg7gMwILHBYhy+f8cg0s6UBCQ1zoOIXvs8OoEWEOxgViLSUOvGkMJATx0Ee5Rk
 rPONvEx03vRF7S/7nLGwn1t1hrE2TZn1dT2MzUD+HVEMPra/KmzU0IFYEOWSm+7qghpVYKoiEBw
 dXLG3g==
X-Google-Smtp-Source: AGHT+IHBEVnFrbzMXecQHh/nZ+GmGIm98FgEFEm1Vd5Gh6Yy+xQdDvnKgQD8iOmlfoA0OndNvUSyYQ==
X-Received: by 2002:a17:902:e742:b0:212:4e37:204b with SMTP id
 d9443c01a7336-2129fd74184mr13294575ad.51.1732245748842; 
 Thu, 21 Nov 2024 19:22:28 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([136.226.240.187])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc157f3sm5506905ad.203.2024.11.21.19.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 19:22:28 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Tommy Wu <tommy.wu@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v9 1/6] target/riscv: Add 'ext_smrnmi' in the RISCVCPUConfig
Date: Fri, 22 Nov 2024 11:22:12 +0800
Message-Id: <20241122032217.3816540-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122032217.3816540-1-frank.chang@sifive.com>
References: <20241122032217.3816540-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
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

From: Tommy Wu <tommy.wu@sifive.com>

The boolean variable 'ext_smrnmi' is used to determine whether the
Smrnmi extension exists.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_cfg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 59d6fc445d..321f64fd72 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -128,6 +128,7 @@ struct RISCVCPUConfig {
     bool ext_ssaia;
     bool ext_sscofpmf;
     bool ext_smepmp;
+    bool ext_smrnmi;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
     bool rvv_vl_half_avl;
-- 
2.34.1


