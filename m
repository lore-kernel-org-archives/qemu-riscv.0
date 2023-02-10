Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQTa3-0005Jj-1T
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 08:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa1-0005JK-Lp
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:45 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTZz-0007Tq-Ua
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:45 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so6677238fac.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Feb 2023 05:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ANpy95G6JPx1yI24ko5mDktdJos2r8N2C+cU1crWQs=;
 b=YkKNy+iOQnfbrtoBNd2pOMe0WZBUO3CAvnSDUY7ZvyQ0vCe02ZyAICP2YDtZjLqhTN
 J8emTeTHliiFrunxhjxZkxNdpqjmPjFQeC5INiWP18eq3Gu36Z438hDBUNYnUfas+Wv+
 OQJTJgDIiCqICYQvPpaZo9D+thwnGi76aShcc5Z6TkeeXJBOh1++/1HlQ3croptQHPsi
 WNjkpj0b39+nj+A70X21GinvkhlCVYMa9uQt0NBeM6xuxKC+aFm0iD3Ojq8IJCGYqYk5
 WXok7uvCg53/dtBa92uxGpin2mbvo6rIHrxYAwqA8OO2/5dsubGnwWdEqjWmHLJlNW3G
 Z+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ANpy95G6JPx1yI24ko5mDktdJos2r8N2C+cU1crWQs=;
 b=sfcy7EnBAHJwY1OALKMHcoRTnkS4e8fcsEomeJ0ei3fzhTGxqZpR/tD/J6F+EowR4r
 4SYWLjw5CPmCXtBrLC26gJkUoPczoOdvIOs5c2BiEhsAX8/VxIuHGjywb5Gx2j6TIO9v
 ZwlRYCJudwM9QJOxcyVVXHz2FwNf+oQoWMgbLW8/5imDEMk7dzMVi82zp5Ak6paffjdQ
 gpYqZ/AlM32mvXgvixIBFjK2FG4GG/jZtnpmTFfb3Wv61pqraL6oE0wl0twaHfjnSTxu
 eb4Wch2kZ09bHJUtInMZQQHQuMDkjFYIza6gvDKIVVMWGuBOocu0quL+24ztmQ8k/Q6n
 XDRw==
X-Gm-Message-State: AO0yUKWUufEcL8uUVBl189f76eHB4iywyDiQyg2IxVjJctF7iTy3DOL1
 69YxWMvRDDS4nWtyLce4h5uwXw==
X-Google-Smtp-Source: AK7set+UXz3xEpB9AKyNiylZ4gX3z3VWpHBtvdLeULiKlKky/FJkLTYjDzAlF67t/xWONYsJXoRIrg==
X-Received: by 2002:a05:6870:50b:b0:15b:96af:50ac with SMTP id
 j11-20020a056870050b00b0015b96af50acmr8678301oao.29.1676036202751; 
 Fri, 10 Feb 2023 05:36:42 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:42 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 01/11] target/riscv: do not mask unsupported QEMU extensions
 in write_misa()
Date: Fri, 10 Feb 2023 10:36:25 -0300
Message-Id: <20230210133635.589647-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Fri, 10 Feb 2023 13:36:45 -0000

The masking done using env->misa_ext_mask already filters any extension
that QEMU doesn't support. If the hart supports the extension then QEMU
supports it as well.

If the masking done by env->misa_ext_mask is somehow letting unsupported
QEMU extensions pass by, misa_ext_mask itself needs to be fixed instead.

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


