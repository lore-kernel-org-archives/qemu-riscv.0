Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38D4CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 10:02:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqsVM-00078J-5Q; Thu, 12 Oct 2023 06:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqsVI-00077a-UU
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 06:01:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqsVG-0006y9-L6
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 06:01:16 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32d3755214dso778986f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697104872; x=1697709672;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tshq197do4wem94F6Ogz/4zKOLZ/viu1Un/xTiiiD6o=;
 b=VdrJu4h/GA0MuwwrTyPbRcoGRgb8yFKBsQz8JTzXrrQYqiVUzBFjnA56FdoPQ0O0wv
 mYZ1X66qCMojSMnaK9xPxpOhPt1Y+TAryBhGhGkhndSVheydJhPBOculbp+l0dgK8Rs/
 YIFeoIXu2P4ZvHfWMnU3K+2zS7zxrFdmq2eCPoZMRfhSF9zXBtCc8KT42aj4RERxyAnP
 JZxeu4Ry+3Upj7mMAKox+mN9Yue+1wSeAvErIrOXGTFO+6tSeT0BSw8FNQfIP7Y0zvZP
 btIIG/COShrsfWsGd5zzJa9dVJw7VQeJi3ikPOJWfR2HJCOpKDZGytOb9YNYTaUWlUuU
 3msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697104872; x=1697709672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tshq197do4wem94F6Ogz/4zKOLZ/viu1Un/xTiiiD6o=;
 b=tLHa/rMdTHUY5wsTtj1pG/1JzUMvOdqkDKzWyZrLiAyUO211SE7bxcbH8OU15eNMrv
 1KMF4vFzM+cB/rdNY1IyVPkzwnQ0FmNn9u/aqlmdqYI8jHodh1BT0cRKWMSerP6METhQ
 cOMcUSodtX9lnKSpOe7i8TCbmqEYQlDO7HUUvVtwo+j/61F4P6Iq+LCYkiQNfO+n8o6a
 NZ17u2lQ1Vdntoo7AMxjuMDR7GwEYrfeDLbRIpf8d6ApzgqrBruHIRc8SGbF/GPmDvUQ
 UbXxDCtOghETD+dALN4y2gIXz78lUwPXjJvNDK59kDR6ysMfA3qRCPuAwN8iH7UBOyGA
 km6A==
X-Gm-Message-State: AOJu0YyEGmo/00DUx9ai+s1Vwl5Dx3i5rPKTlHVXrjxfDkb5eG1rFOBT
 ycqx7MpXJs1Tz8OZ9wi4BypCob/ha5p6MaUalFZc9w==
X-Google-Smtp-Source: AGHT+IGZXimiyojbuUxNuuk1VGkDRJdLFXsxDGdJdaB+KvWKkkv0gSbTvGc/MshSE5uuLhksnKyeMA==
X-Received: by 2002:a5d:490b:0:b0:31f:fe07:fde7 with SMTP id
 x11-20020a5d490b000000b0031ffe07fde7mr20606083wrq.1.1697104872571; 
 Thu, 12 Oct 2023 03:01:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056000024c00b0032d88e370basm3803122wrz.34.2023.10.12.03.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:01:12 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v4 1/6] target/riscv: Without H-mode mask all HS mode
 inturrupts in mie.
Date: Thu, 12 Oct 2023 11:00:58 +0100
Message-Id: <20231012100103.28612-2-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012100103.28612-1-rkanwal@rivosinc.com>
References: <20231012100103.28612-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x431.google.com
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

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4b4ab56c40..d99d954ff3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1525,7 +1525,7 @@ static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
     env->mie = (env->mie & ~mask) | (new_val & mask);
 
     if (!riscv_has_ext(env, RVH)) {
-        env->mie &= ~((uint64_t)MIP_SGEIP);
+        env->mie &= ~((uint64_t)HS_MODE_INTERRUPTS);
     }
 
     return RISCV_EXCP_NONE;
-- 
2.34.1


