Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D62C35FFB
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 20:21:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuyze-0007Nw-V5; Wed, 19 Mar 2025 15:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tuyzc-0007NX-Eu
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 15:22:20 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tuyza-0002Cg-Re
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 15:22:20 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-224191d92e4so144852775ad.3
 for <qemu-riscv@nongnu.org>; Wed, 19 Mar 2025 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1742412136; x=1743016936; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jtptQpawWvWvvPo7p+5ePzZbn/0qrX0uFQnRGLb5OR8=;
 b=VbyPscj/wVC6Z5xK2MdciGZdvTEbFiaTfxhyzVlhhvg6LtuHNHz9XTkMgRX1/h+fEo
 DBuf+nzNGraxRfZOwcfkOuE8tqSedo+NI2D/+WhxCCRkctiqS8+WtQ35AdNf2C4YMhmF
 OQ+kPb9Wqvzwcy4CVKQ2ujSR22m7pXbehl6r5Y2F8pfjsx44thtLEuLnX5bV7QpSnNqk
 BQg9tWr7eYB9TlBqV87Kxjx/Rv3F5kW2f0O6hwze8Sqm3r8EpjgJCzQafUq0RQS+XbfQ
 uracjuL0xuOMo60QUBfQ3gBVPiov3V/z7ld5v2ZhRQ66j4KrP3znRwOC4rCmGqdqieCe
 zH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742412136; x=1743016936;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jtptQpawWvWvvPo7p+5ePzZbn/0qrX0uFQnRGLb5OR8=;
 b=l5JUUO1E6kIJACEM1Oi18JcFV6H/KL4owiZ0/GcNv+Kj3VxOKfK/jo8PH+w3Jcq7p7
 yGrqcpd98xtI11wS8mGj5Q7FFWYsACnI+hPBwr8daWsAY3bW8F0bSx2eOFJPY1owAqrl
 a4FGm+oU6V7FZvBRIYk+Al2Lzk0+Y17pTi5EWyBNxrttbc+4AphlxiGdwags1tgRW6kq
 JVJY8KHFLPTVYkF+oPVQSVGVJ1qxyiNbak6ymqan500SuFGUmq4AY81Dg7msXuGEUfo/
 M06IKy4Y7Aq9GkTx2VXLUcTQzAj4+nRbKDfWhVvl4tZCIqTa0bIjwWwckGnywB/BYqeJ
 7qkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW8k5mLYxcVxjcVONR9AuJA3JTmPueDb/OmgiWI5b+ucOBFQLcnXroYqH6a0vEpnsb/Y1Y/MMSHUDH@nongnu.org
X-Gm-Message-State: AOJu0YyPaRsGzT5Bb+oNDm9Jdxo1LQiAX/LVq/CWKZf/9L//2keAkRpc
 hUSQ54X4vRgdDuqCxmQ3q5guRcbZvYNyza2TgTi4Yhou9hBl+cGiZNYlLUAUAi0=
X-Gm-Gg: ASbGncvvDdXDH6f+EigLVlG2BfVVysT0IndurQ4U6jL5xVxqQkMibmWkxWXTHxojooS
 IGn8eOG2BA3PwMUi5Nd7h+PyBweB20jt89M0lsZzx1o3Ks+pFzquWfa2gzyofI5rWDrtbw1Zhj2
 92FmUJ6DozSTggK+fdHLRMVKJ3A1S1miBheiOLxkDp/wLuDxnF+UltXyDLvsz6K8zUMvookpPO4
 xAi/jovq8mkQKxXQObewOIu2rgZyQiUl9YkZrFX6rZqSDiow/ss88FCGrX8C1nC6WBLx89Levy8
 +R3hGl7TDmdPfmIKIrXHc61CbI4fKhjbq1kuDx1NBHWeXfXSQAa0N9nBODq0fEz3a+I=
X-Google-Smtp-Source: AGHT+IGb80ZN540wcGAg63HcRJ/3dRkHokXskLkNnkc7mEboWtJIlDoyAxzX5p7HEECTnvoHIXOkCA==
X-Received: by 2002:a05:6a21:3989:b0:1f5:619a:8f73 with SMTP id
 adf61e73a8af0-1fbecd41923mr6058469637.26.1742412136668; 
 Wed, 19 Mar 2025 12:22:16 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea947a4sm11432175a12.70.2025.03.19.12.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 12:22:16 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 3/4] target/riscv: Fix VSTIP bit in sstc extension.
Date: Thu, 20 Mar 2025 03:21:52 +0800
Message-Id: <20250319192153.28549-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250319192153.28549-1-jim.shu@sifive.com>
References: <20250319192153.28549-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x630.google.com
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

VSTIP is only writable when both [mh]envcfg.STCE is enabled, or it will
revert it's defined behavior as if sstc extension is not implemented.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/csr.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 49566d3c08..ba026dfc8e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3630,7 +3630,14 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (riscv_cpu_cfg(env)->ext_sstc && (env->priv == PRV_M) &&
         get_field(env->menvcfg, MENVCFG_STCE)) {
         /* sstc extension forbids STIP & VSTIP to be writeable in mip */
-        mask = mask & ~(MIP_STIP | MIP_VSTIP);
+
+        /* STIP is not writable when menvcfg.STCE is enabled. */
+        mask = mask & ~MIP_STIP;
+
+        /* VSTIP is not writable when both [mh]envcfg.STCE are enabled. */
+        if (get_field(env->henvcfg, HENVCFG_STCE)) {
+            mask = mask & ~MIP_VSTIP;
+        }
     }
 
     if (mask) {
-- 
2.17.1


