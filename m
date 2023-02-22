Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUuE9-00079x-Hb
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuE6-00079C-J4
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:26 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuE5-0004KA-5j
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:26 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 v17-20020a0568301bd100b0068dc615ee44so1676544ota.10
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zvvhFufYKaxYrfOxF5GlRHGMfqK+pFBiVwcRuEAhcPI=;
 b=lNM4ZWhvCG6bS8HQ54ocfKa490tMQstmpHVIU0E9zijywVlLIiCxAg/FEYXp7t4H0/
 ER04PZkpbQwNXEk+/1TJe1iiAbFRi2jAe+gHkrzna9m8u7dc93gKo4JQ23xnrWvZ+/sG
 rYva6WLVM/3jKqfTDoeJuF2T7XXguGN0MmDCnkGWeRkf6r6q36Qq/BGIzBhHwziAjtHf
 rqKU9kBZzoTSdzzJ0hCiqmkH7sFR7gCvRovkvjdttp8mUGdMUZqoEHp0EwOTG4ky2fDI
 6pL/xNhkx0vErlQlvkXelijrp0MB0uXBcnNlMRWpoDRjZL9t4IRsJo4AYZvevG6N81jp
 8Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zvvhFufYKaxYrfOxF5GlRHGMfqK+pFBiVwcRuEAhcPI=;
 b=Gi5s0ua8Qajxo6LBHvUixhCa1bO/8sBAf1CfrUfPsuneyPAuiW6xzsSpw9anpGX7Br
 wpKsTJU9gTyQR+nDWZ2ND7YsgeOJBVGVwsVn//AQNV+hdJQPrrbZZB7OQ+SJfEGhiH9+
 Vc65ie4UD4PYefUMbdEx9CwXx2F/JUKus/oQyblAMSuhyPYDH217yJ1Iqzpd6+OTl2sT
 0taYj6SasIj+4+mvxRsXbSGF3HSCP6Vz37UvvMjGOUsMHFYq2AcU5OnAhwMX7g9h/T4i
 hTtT2EwT+R/8vFfI+wYG7HS5mkTltCTduTBBMBv7SIHg4z/9RIBkZl/6EcFQJHXvjz7G
 JFrw==
X-Gm-Message-State: AO0yUKUkDMuCADn4V8CcMMLHp4cocM+0PyfDKpQsbRIj1H+HkfQDEspR
 T5ci0hSH2m36bAUKv7yqx1WQ1g==
X-Google-Smtp-Source: AK7set8wL5d+kOjymM4LgkwHIvlrSH849ezofvRzyEyEwC46GMc6RZcCwoAGmfROJ3ueH3Mr/uy2CQ==
X-Received: by 2002:a05:6830:3101:b0:688:56f8:bacc with SMTP id
 b1-20020a056830310100b0068856f8baccmr456016ots.0.1677091944567; 
 Wed, 22 Feb 2023 10:52:24 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 02/10] target/riscv: do not mask unsupported QEMU
 extensions in write_misa()
Date: Wed, 22 Feb 2023 15:51:57 -0300
Message-Id: <20230222185205.355361-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 18:52:26 -0000

The masking done using env->misa_ext_mask already filters any extension
that QEMU doesn't support. If the hart supports the extension then QEMU
supports it as well.

If the masking done by env->misa_ext_mask is somehow letting unsupported
QEMU extensions pass by, misa_ext_mask itself needs to be fixed instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
2.39.2


