Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0uQ-0005QQ-At
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uP-0005Q5-B2
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:09 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uN-00056f-Qo
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:09 -0500
Received: by mail-oi1-x22b.google.com with SMTP id bh15so13851307oib.4
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LC73mPmFrGq5o3KC93WRhQ0uBlIIBFIRs5CA6y4B+Tk=;
 b=Cq+dQTQfJWoTeDleX+T/9EyfaDIoxDB5Crv4RuI4umGJ8e7vY02x+eAc9k6q6o94vN
 qNkXXhpm99pHedCDyhGoWFL44lZvUOAbadkS4mmK3XcaLGY6NOAuvcHsaGNz31D48GPR
 /+5bXHcxDTinOy/rbxoIggmU+npjNVotnds9t83PlqPwarQ1JrZmdvmQeFODImZvsvst
 9NYcSp4Bv8BY6d/Di2cF/kFpP6hJaWzPBV0AB8FedjyZt64pJvU7NMSMLVlAqtz5ZdsU
 nTCimhRImyKuBLO9w0AXqn5FA6oIEbxpqEAV0bzSkhjpbjYG35epvcDFho8lG24nO4fn
 9xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LC73mPmFrGq5o3KC93WRhQ0uBlIIBFIRs5CA6y4B+Tk=;
 b=JvVQzLraIee/utirLSvJO6Q/GVQNCTjzrxdU1BX07BWmmJeWMSD7+sB1mAdG/Dg/t9
 bqLanahKAD0xV5nPRv33cMTJJ56BX4vGsGQK1C/2oInbog7WSK346g0oarrw9J1JUu09
 bUjnQYv5eZOQyWcHfHLrmLqU3TTg3ea+hzPlB+19p7YRqea8AGm/yKPzrjm7J58nlTXx
 NwVLCaIglpEQR2FoP1SeDgFHp5rEGaTPS5tJuAp3AJZ/xsIkuPFlVk9Nx672emukML3h
 3XN2y0fv4VYT+av1F3+SkD0SBQtPboGDYUrOvs2fhCzDwzv/QOG5D7Sz+kY7yDjv/xoZ
 bzZQ==
X-Gm-Message-State: AO0yUKUzMudtOkHeU3VQLAMS0uykZ5U60H2o2qun7ij+N4r+6qKzNcx8
 HdzOq+OdQEacQ/KXw6lVhhcNUhdQzWU38NcT
X-Google-Smtp-Source: AK7set9o9cke3UPKcHIFJs9PcVy/va3CuNO4lnfcAi+thzvWk+lAZvLf1Uw9j2J6RKtRoPI1N9i9kw==
X-Received: by 2002:aca:2211:0:b0:378:81f8:bb2a with SMTP id
 b17-20020aca2211000000b0037881f8bb2amr1545048oic.33.1676402646194; 
 Tue, 14 Feb 2023 11:24:06 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 01/11] target/riscv: do not mask unsupported QEMU
 extensions in write_misa()
Date: Tue, 14 Feb 2023 16:23:46 -0300
Message-Id: <20230214192356.319991-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:09 -0000

The masking done using env->misa_ext_mask already filters any extension
that QEMU doesn't support. If the hart supports the extension then QEMU
supports it as well.

If the masking done by env->misa_ext_mask is somehow letting unsupported
QEMU extensions pass by, misa_ext_mask itself needs to be fixed instead.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..e149b453da 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1356,9 +1356,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     /* Mask extensions that are not supported by this hart */
     val &= env->misa_ext_mask;
 
-    /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
-
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
         val &= ~RVD;
-- 
2.39.1


