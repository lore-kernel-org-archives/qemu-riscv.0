Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6B4C02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 10:15:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbGiW-0002bY-1r; Fri, 24 Jan 2025 05:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tbGiO-0002Wl-Kj
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 05:15:04 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tbGiM-0007po-QQ
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 05:15:04 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21669fd5c7cso33220255ad.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 02:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1737713700; x=1738318500; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=726JYc2EOYPtf39xK4E0IwFh2U+9H3MDOohIfk12nUI=;
 b=IlrePebfSX4wg2vDQWIKOIjRnk3xaXdNJux226vjF6JVWTmQOgrQQO+pb3cA05WHlS
 BUlzWSOVn1h8YEDu2OaIQgVFs5fm7Qs7jSPh5tBeF3zMSOl9w7G9r+idQT1Wr+6lqulf
 lOjcCJVw0sylBroHPtNEJQPUXtp4Run4hJrrc0nyb8sUb5x57qdy9CuI24ft7cDRhQ7m
 N2Y7ZTJndWdPMNiXomQhUiwubF8ZDKdW9x4RBjCZa6FkXSRX7KIWFWkkSE43VywLyu6a
 YDZJiaNYpzJChKScXh+t2maLlaRmBxHtrBXUMBdSzB0JzJhEpKCXRkV8agpdkFCHFW6W
 d7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737713700; x=1738318500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=726JYc2EOYPtf39xK4E0IwFh2U+9H3MDOohIfk12nUI=;
 b=LeS9h9NXh3kd1CzQ4dHBPIgS+Qfh7GEuOf8t2tiMlSvwQd0fObLcwzRE/82Kw3Lwgn
 CYcX4wY7Tnj1kdLVg3wOL3iXEAXyq0av9eSfQm50vl8o4gIhJiDdGtDZHXBy2/ajL9So
 Nexcgfrq61Y8aGT3OkBinFvyoxzg9TJdgpPomq6k1Pqdi0T/ji9LyJIH+TubDK1hOGF+
 0w3P0hxGkH7KBbMGUpUUpht6ctZZg6jbVUgGH+c8Nn8verGGGw4ogSc98aBPT7tM/a+d
 OoXoYq+g5eNoRJBrI9XUoULKkawU5h2jyg6QA/S1EVbvkA3hxI7ajhrBrrhKVTcu/pqw
 T5iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiUnlB/8xFzcC0IHEIk1oeSKL01fbdcA2ICf4SgncbWY8aOkL1/8wyYAQPfneRyb5URHlxHekSkCCB@nongnu.org
X-Gm-Message-State: AOJu0YyR21gLXOEALtjkaA800ShYPW470DSDtcppw3HutfGjsm8PDRWQ
 TIZyL/a0Mi0y00EbiDFxEFUpjVGd2x1uIJRfZ9fyPwK179eHhoPA8WzDHcNqiqo=
X-Gm-Gg: ASbGnctjPuZAfxxVA1aYkjyyxLvA3iIlMU6WhvH4yYZpaXFRgMsyH1fJnTT+FqMySwU
 OcrX4osoaeqUUnA9x1eBDoLXn1yxpN5NYUAoK+hEidf3wH+TM4gqt+7pu8emj42g7nooEGSZXpF
 +OPFDz673LhWXNeu6M94P5EELa2id1WGyITAWAtjog9Qa3cXFTf/vq0uN+RgM0/r5skn3IzigXy
 1aDSVGhCRhgEhEaOMw8lPZD0Me8S6rOl+bw70wueE4Dh8VzwaHQevXs1x3CLbLyByhICv3+/bAE
 pU9WsLfVzdwdiGGAUFhkOQrqP+0p16T5UoXjWtSsDnmZIpCnxg==
X-Google-Smtp-Source: AGHT+IF5/O9f0U22I7akfqHnEXp6zoaRQ2aXvubjD+5ok+uDqU/B79QZrIEddie1r59UfmcgpBitMA==
X-Received: by 2002:a05:6a20:7f8e:b0:1e6:8f39:d635 with SMTP id
 adf61e73a8af0-1eb2146009bmr44951682637.9.1737713699157; 
 Fri, 24 Jan 2025 02:14:59 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a69eb75sm1521502b3a.12.2025.01.24.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 02:14:58 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: rvv: Fix unexpected behavior of vector
 reduction instructions when vl is 0
Date: Fri, 24 Jan 2025 18:14:47 +0800
Message-Id: <20250124101452.2519171-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x635.google.com
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

According to the Vector Reduction Operations section in the RISC-V "V"
Vector Extension spec,
"If vl=0, no operation is performed and the destination register is not
updated."

The vd should be updated when vl is larger than 0.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/vector_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5386e3b97c5..7773df6a7c7 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4659,7 +4659,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         }                                                 \
         s1 = OP(s1, (TD)s2);                              \
     }                                                     \
-    *((TD *)vd + HD(0)) = s1;                             \
+    if (vl > 0) {                                         \
+        *((TD *)vd + HD(0)) = s1;                         \
+    }                                                     \
     env->vstart = 0;                                      \
     /* set tail elements to 1s */                         \
     vext_set_elems_1s(vd, vta, esz, vlenb);               \
@@ -4745,7 +4747,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
         }                                                  \
         s1 = OP(s1, (TD)s2, &env->fp_status);              \
     }                                                      \
-    *((TD *)vd + HD(0)) = s1;                              \
+    if (vl > 0) {                                          \
+        *((TD *)vd + HD(0)) = s1;                          \
+    }                                                      \
     env->vstart = 0;                                       \
     /* set tail elements to 1s */                          \
     vext_set_elems_1s(vd, vta, esz, vlenb);                \
-- 
2.34.1


