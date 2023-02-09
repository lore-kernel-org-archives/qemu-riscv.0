Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPzr3-0000Gs-3D
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 00:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pPzr1-0000GW-Gr
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 00:52:19 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pPzqz-0002b1-RI
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 00:52:19 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 ge7-20020a17090b0e0700b002312568942cso2741047pjb.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 21:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Tjk0KykcTHvlsxmURAi3rKTnl8MoQpYJfzoeZtBo1M=;
 b=oJWOVQAMqM/Cxn3yRO8YboqXKeCQxM6s73TmbbnSJ9IO8b9WE49QDVQV/ZXTtL6VQV
 lznbbTAJoG83n2Z8E5zANKOaCffqxhxCzatD35NCiVr/Nm2+NXqDxP6uhn/QVRJyfyPv
 /zMOH+Na0K4+XjCKTwiboabNCfs2JSbzMAQA5Ju/x8kozOFFuCbdlKYkOL1odyK+sDI4
 hWwvCixOjj+QWG4xeb9sdgr+hZgz8//TFAg6mU5vXMxjj9dOVkzzStQ53DEgu/m1RiEN
 GFUJCzEhNPQNVQom/x1jVFbhpLGRlcyJfqG1GuSeZAgOUpWzfnmhLpne6jdNI1OwdIBF
 +Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Tjk0KykcTHvlsxmURAi3rKTnl8MoQpYJfzoeZtBo1M=;
 b=LCrXs9bLl0FfJMFlNPPOZe9HDdDFpKwu4SX6EbjS7slRpMSJisWZGj4tcB8qhmgdpM
 K9+I2r8d7Zlqj1NHC+oUMy3mg5Etr+cJtQoo9UUu6fdLvUc0FA7iY4PiC9sQidWyDY2C
 31kjxh1r6aj7UWrhy8LdYH4BTLEgx0kWvmN+c4+nP6d8TOyndMajSzOxPCUf2BSMkwXT
 dfkkxaaHbRJL5TVSfFsuikQOMtA2gwScJcxJxg/hB+OswDP+PCu4jDpo7w+Hy1OWOFh4
 qLoEr78Ven5PmYyjEAIRvxqRtF9aoItHzQ2qQOIZFwTKLWgFVoiD+FPN/LsvOceCKMSp
 sNkg==
X-Gm-Message-State: AO0yUKWDRbdb7AaML5Q/CIesST912W4E6AxkcVpWcKPYKSLcY14mbmMw
 hGkBuqFoUWmVV8xMDPlc7WYEpdfaULdLOqVf9xEHfA==
X-Google-Smtp-Source: AK7set+vhaNC32y+r2ftx3v/y3Qh76xJNxEZuntPWHzVydmClgJAaB4moI4MI0AGS4Ew9vfmHoGI8w==
X-Received: by 2002:a17:90a:be08:b0:22c:4b10:39de with SMTP id
 a8-20020a17090abe0800b0022c4b1039demr2652663pjs.3.1675921933757; 
 Wed, 08 Feb 2023 21:52:13 -0800 (PST)
Received: from gram.dc1.ventanamicro.com
 ([2405:201:d019:c0a2:db4c:93fc:9135:d16f])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a17090a928c00b0022c326ad011sm452436pjo.46.2023.02.08.21.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 21:52:13 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH] target/riscv: Smepmp: Skip applying default rules when
 address matches
Date: Thu,  9 Feb 2023 11:22:06 +0530
Message-Id: <20230209055206.229392-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 05:52:20 -0000

When MSECCFG.MML is set, after checking the address range in PMP if the
asked permissions are not same as programmed in PMP, the default
permissions are applied. This should only be the case when there
is no matching address is found.

This patch skips applying default rules when matching address range
is found. It returns the index of the match PMP entry.

fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/pmp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index d85ad07caa..0dfdb35828 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -446,9 +446,12 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                 }
             }
 
-            if ((privs & *allowed_privs) == privs) {
-                ret = i;
-            }
+            /*
+             * If matching address range was found, the protection bits
+             * defined with PMP must be used. We shouldn't fallback on
+             * finding default privileges.
+             */
+            ret = i;
             break;
         }
     }
-- 
2.39.1


