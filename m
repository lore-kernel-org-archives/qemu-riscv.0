Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcni-00057N-84
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnh-00056G-5R
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:13 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnf-0006sx-LZ
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:12 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 x18-20020a4ae792000000b005376d6c9cfeso1260157oov.3
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=mZhGZrxnkUI0SDuWnX5gsX77RGSRdldbf4UwdSqsWgOwUuxqXi1CQRjfmen8pVwJas
 +iy7pCIhxPwjoLgLPghVyZYc967eBN2L+aFBa+Fi5EkTFrRm7Dze94gph9zPwhwbmecN
 clWIIOUuO03iyf+oMJ3ofwm9BSw0hk+nJ6ZTe/jf1rViaPJJbwJLYDaS4bkuQQR2Sope
 g/qIuPQOwHT1yy7mizo5XUeJdwgqAK/mSC+euWk+RHovirqOvLL1km0VX1e/Y4H8y55j
 e8Ubnzfwvqt66PU8O2wuy7JzPejgAqKUQ8spiry0d9fUsCBHcyi2+swHNNVMBjnky8gQ
 Zx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=KoEZdcFbXkuHVdjmOoEers8k15iEY2am++fBPJClg2hKZK9n7Zo/mCW5LZu2piJ3Qb
 LjybyGLFReOgVz3QbIu7QXJw4UzJ4OtT1mNx/qn6nPPYKc9yLfocBIauqS+O7VIyCj6/
 gYflnShsA2K+YNmZ04B7FgtM56IQGDyS2QoZS1mbuKXyseobqecLG3mStu5n35E3aitj
 38yCtHHRIB0AzSlsolWPDo+/JjsJwKabR20QA4K31/qzM/RF8ruitJrXoNWaEtQcSsgd
 GyPr/evUlnDpnopzpCVcjbx6nZWnf+FTH8vSblWWBghYpS2erbdpsNKfhIO24cPCaTwR
 qbeg==
X-Gm-Message-State: AO0yUKX218AtNQEbFKmzMVL9lCioL0Mc7uAyvaZXBePOh9tNKJUZk647
 3MJcImEG+YPIAspdHH7gf/MbuDBdMPtnN4Crm7k=
X-Google-Smtp-Source: AK7set8yibs3XBZfysgy8GBnm1BjjN21tnFnZ/jSkCAj22lDf6aGNwdihuSWETF629eb92hItr/mjQ==
X-Received: by 2002:a4a:5288:0:b0:537:4278:a593 with SMTP id
 d130-20020a4a5288000000b005374278a593mr1677078oob.9.1679169911052; 
 Sat, 18 Mar 2023 13:05:11 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 10/26] target/riscv/cpu.c: avoid set_misa() in
 validate_set_extensions()
Date: Sat, 18 Mar 2023 17:04:20 -0300
Message-Id: <20230318200436.299464-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:13 -0000

set_misa() will be tuned up to do more than it's already doing and it
will be redundant to what riscv_cpu_validate_set_extensions() does.

Note that we don't ever change env->misa_mlx in this function, so
set_misa() can be replaced by just assigning env->misa_ext and
env->misa_ext_mask to 'ext'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c7b6e7b84b..36c55abda0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -949,7 +949,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, doing a set_misa() in the end.
+ * cpu->cfg accordingly, setting env->misa_ext and
+ * misa_ext_mask in the end.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
@@ -1168,7 +1169,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVJ;
     }
 
-    set_misa(env, env->misa_mxl, ext);
+    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.2


