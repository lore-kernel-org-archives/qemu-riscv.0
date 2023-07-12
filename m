Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4702CEB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 19:03:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJf6K-0000oq-QC; Wed, 12 Jul 2023 15:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJf6E-0000nt-GE
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:02:06 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJf6B-0006WK-OB
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:02:05 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a3790a0a48so5569039b6e.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 12:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689188522; x=1691780522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nS2W9UaH9gghVm/aiRhSGBwZOy7l91Ih/qPzigWpPY=;
 b=N7KgC3eHa/+VWtqsCO5AUr2wiVm9nb0vdrf9cleqru81Oat2KH+oJl8dUopTe5ijZT
 CaDhHgkSF1rOH+BYba/D1DQiJSoPcDzJMDEQZUuWL3y4CIq9ooUPqnSatVx5SFbujLjh
 3VOg8X55OWM+8A95AaI7OsgJDT+nDrgU6d+MKeCkNzwiqtgHOPeKMTRUWLRU1igPRlVt
 jOTWtblgHEiEGwICJCzpxm/B4iNmgsuE8nuacrbbN9cgJ5bkZP8DpuUF5dl53RsEWoXc
 pmaGaDg5Mphs9QeeOeHZNuMwPl8RfMK5IN5bocDElowSnmsp+/aPdtyl5fV7EHH2pnzu
 /37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689188522; x=1691780522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nS2W9UaH9gghVm/aiRhSGBwZOy7l91Ih/qPzigWpPY=;
 b=K6GGFrIVdX/N04Fcj7zTuWoQI4Y4sRAqEnWTuqXYPwqJPTFmxM2Q+zwuJ6Zqrv+CS7
 rZIDrLZXUyt6gUXaCuLkld6MEx+Cj24iJRkx7o1bml0GiiUsQG2Mt5Wu1R7dRhCDpXQM
 9EBYoh1lyJtYqtohnVOahQCZlYSWrECcy7uVaUGL26zF3U3fs4d8G9R/ZKD7WncQVHn0
 xQbTiBgezphMnUa9koAkFbWivPAqYO0MKRbZMjuGdJCgGWlcSQ5wEBh1RHt/WStxtGnA
 qpDzi8LXKIu567l4czpp8lMoVJgzGRFEf7g6XhPNCRm5h+gUMsmgtyYlx/c0TjvCWf23
 MvVw==
X-Gm-Message-State: ABy/qLbIa9olPeaKDLKmmSVPF6hpI+kS1wJ2VL890ItQO0pdRdaCskpC
 ZeU3PcxFUmGTQD4MiASLezc6vw==
X-Google-Smtp-Source: APBJJlFGyx3mVUuTtdguj/90gB+dMBEPYDsqnfUTgRQBAjqaARl74rDY4W23WrwqS8a7FFIxGCLytg==
X-Received: by 2002:a05:6808:1395:b0:3a4:1f76:bdfb with SMTP id
 c21-20020a056808139500b003a41f76bdfbmr5559154oiw.14.1689188522469; 
 Wed, 12 Jul 2023 12:02:02 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05680802c900b003a020d24d7dsm2174435oid.56.2023.07.12.12.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 12:02:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 2/7] target/riscv/cpu.c: skip 'bool' check when
 filtering KVM props
Date: Wed, 12 Jul 2023 16:01:44 -0300
Message-ID: <20230712190149.424675-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712190149.424675-1-dbarboza@ventanamicro.com>
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

After the introduction of riscv_cpu_options[] all properties in
riscv_cpu_extensions[] are booleans. This check is now obsolete.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cdf9eeeb6b..735e0ed793 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1907,17 +1907,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
              * Set the default to disabled for every extension
              * unknown to KVM and error out if the user attempts
              * to enable any of them.
-             *
-             * We're giving a pass for non-bool properties since they're
-             * not related to the availability of extensions and can be
-             * safely ignored as is.
              */
-            if (prop->info == &qdev_prop_bool) {
-                object_property_add(obj, prop->name, "bool",
-                                    NULL, cpu_set_cfg_unavailable,
-                                    NULL, (void *)prop->name);
-                continue;
-            }
+            object_property_add(obj, prop->name, "bool",
+                                NULL, cpu_set_cfg_unavailable,
+                                NULL, (void *)prop->name);
+            continue;
         }
 #endif
         qdev_property_add_static(dev, prop);
-- 
2.41.0


