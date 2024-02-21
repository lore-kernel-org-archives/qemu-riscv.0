Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76556C54787
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 02:24:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rccGV-00037G-Ud; Tue, 20 Feb 2024 21:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rccGU-00036t-Hr
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 21:23:18 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rccGS-0001Hp-Vq
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 21:23:18 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6e2e6b405aaso2642535a34.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Feb 2024 18:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708482195; x=1709086995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AbjV56HSNPOfq6zJHSiyHtAr0YbtPcePp6SnmecF8j8=;
 b=pMP01Keq6SllME2SOgWyMYNrZAH6mPhka6fcaKXFerMMjGF8XWRBXQwmeK4ElzMU8k
 X71mtI7HCPfM7ngHVvYgnAfZ6Qzng0i229kLl/j6mnzVDAnfVAocXUwum2wAp8CiV0wa
 ye8F2YJkrIhBNcEAAelbo0NyGWaMn3KLJBpmQvCTovjzFk6e9BA11zHN8ep4QaQz8Eu7
 OIDXU4K4VZk30Kk7u5bNSKbw5X1+IKfBT8fDjL9xbVpm94PMQSi4QkzfzawKLEAEcyDs
 eErDHzG/wqDnxN6xwPUP4R82freZmr8H1B3d6qY6MzDN2n9eWt7WhMtuFJzJJJ4fTwp1
 UrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708482195; x=1709086995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AbjV56HSNPOfq6zJHSiyHtAr0YbtPcePp6SnmecF8j8=;
 b=hRrRC9CHxIB0L77NW+7sFXF0oxB7L6y+7iL++WcEU69I2cJPt+Pu3z/v6LCu5zU48Z
 jg2wzYh+GgkHDMOdXrVJHS7+UtsHaVKYqTOkl9vHPGwNQXogG/WjVIHK5yW3ecpIArzE
 /t1k8mbVR0L5NccZlgP7xVB12qC9Ao2sXyvSygagZCV3fYXXFc/XWdy+F/x8RzFCn2Fi
 WH7rtXAcWR6vp4l7BNLhOf6wM/Z16tK/CCEjcsJb13B7+W6OQHQgkO3MhTt2IpfL8r5t
 uvO6xo3vj+Ec6SGBagMRbjLU8vncKCd0UBLciKWrzMlXltKgjQuY2jTdC97oweB75x5B
 Vfiw==
X-Gm-Message-State: AOJu0YyoHYualBpxsYBgMYEuosC1aSxLzg6nTKlTOiEEaxRBogZ0SGNm
 tEWdErpgLnjPdEt9hL9uCRNQUtRjfBWR3X+ym1NtAlIdmi9wnIKQh4lstu7swUQ=
X-Google-Smtp-Source: AGHT+IG4R8mQeUe9bM6MMu3DHNrlDUlGl8QTmUWT1de1w4/qAPLCPCaFwmedDx+XNZGxJHZZr2o3KQ==
X-Received: by 2002:a05:6359:4127:b0:178:7ac7:a0df with SMTP id
 kh39-20020a056359412700b001787ac7a0dfmr17247760rwc.29.1708482195612; 
 Tue, 20 Feb 2024 18:23:15 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a634945000000b005dc48e56191sm7183355pgk.11.2024.02.20.18.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 18:23:15 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 5/7] target/riscv/vector_helper.c: set vstart = 0 in
 GEN_VEXT_VSLIDEUP_VX()
Date: Tue, 20 Feb 2024 23:22:50 -0300
Message-ID: <20240221022252.252872-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240221022252.252872-1-dbarboza@ventanamicro.com>
References: <20240221022252.252872-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The helper isn't setting env->vstart = 0 after its execution, as it is
expected from every vector instruction that completes successfully.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 84cec73eb2..cc7290a1bb 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4782,6 +4782,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
     }                                                                     \
+    env->vstart = 0;                                                      \
     /* set tail elements to 1s */                                         \
     vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
-- 
2.43.2


