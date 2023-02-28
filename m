Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX0Ji-0001wq-6z
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 08:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0It-0001Op-91; Tue, 28 Feb 2023 08:46:03 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Iq-00036a-4m; Tue, 28 Feb 2023 08:46:02 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so9222214pjg.4; 
 Tue, 28 Feb 2023 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7AbYMa4P8VqoNbeG3pHXiplcC1cufg42KOa2qGB8uoI=;
 b=dGU77MAT/fL4UYY8ln4zt+e+EPJ3CtVyZo93RLuxZcFtOQgE+8FVCv1M8Zmdr3vCMT
 mA01TZ9eJeJ3OYNgOU44pokI1l0RTkZ+4QDEsmOWCXozzCtcce9ycnQ0Og73C8uQ+egR
 ifT+oXrGfRWA32VMiqeEQHCiWWfjwDaJ6Wf4oAZeukCWAS8NDbPQlijSsw1eiXG0c5kc
 xO9wNdMEyuHxWN/x0uN8/RBQmxn2uRF8kMbJGnxvZ61+6AufV4lorQIrzl5CE4J3+wnQ
 qgIZTOciv0XvHKmJcCaNlYzoy2P/SFVr1av6ioguQ03+GVEjfZ9F86oDhwiXZvkZmGqo
 LeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AbYMa4P8VqoNbeG3pHXiplcC1cufg42KOa2qGB8uoI=;
 b=0yh/dzKcn0Dg2rVsX6z6pGVWpRqobwG6oBcQjgGgc4zihORDAl/KHI4ya+do2RbsU9
 2md9w8eBCEmGWKJio4uT+04tslyXBGIG1aPg86QpV+p3BtUODKEIbtUEx43ZTDzXhJQz
 kbE0nVRBoaX8DNw1XvVeJQRgQsdD7ErWbgRMqPdNPhsSgd4u2nFHVdwOxCt+TJsnmSoC
 zflVPmiUkzxjBk2rmadeG3UWgFiODgrXTmMLue0mDwQBnEyVB2UXgs/YGM5zZ7Nkk+AJ
 z7ZFRh097h68Y2Fiv2GqY2kj7uvyTRh+HneldzfkFsfVYwOzITKVDJsav0xXiEnZHWeq
 qwDA==
X-Gm-Message-State: AO0yUKW7QRqbfhgie4Wv3FnGLoj218SywSb0Yk3VBofvfmo3KLo3Nblm
 qieXEC+Lh0NqeNN0ylSjEvnSkwr4ceQ=
X-Google-Smtp-Source: AK7set85qKbOYtR7SDK5tKu94oFG2LMaC6HlJbt1mnqyzSA2l6skpdJYP/mxJO3fEkx8bXnlTzJEdg==
X-Received: by 2002:a17:902:f70a:b0:19c:da68:337b with SMTP id
 h10-20020a170902f70a00b0019cda68337bmr2979189plo.16.1677591957863; 
 Tue, 28 Feb 2023 05:45:57 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0019b06263bcasm1556896pll.247.2023.02.28.05.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:45:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 17/18] target/riscv: Drop priv level check in mseccfg
 predicate()
Date: Tue, 28 Feb 2023 21:45:34 +0800
Message-Id: <20230228104035.1879882-18-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-13-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 28 Feb 2023 13:46:32 -0000

From: Bin Meng <bmeng@tinylab.org>

riscv_csrrw_check() already does the generic privilege level check
hence there is no need to do the specific M-mode access check in
the mseccfg predicate().

With this change debugger can access the mseccfg CSR anytime.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---

(no changes since v1)

 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 020c3f524f..785f6f4d45 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -451,7 +451,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
 
 static RISCVException epmp(CPURISCVState *env, int csrno)
 {
-    if (env->priv == PRV_M && riscv_cpu_cfg(env)->epmp) {
+    if (riscv_cpu_cfg(env)->epmp) {
         return RISCV_EXCP_NONE;
     }
 
-- 
2.25.1


