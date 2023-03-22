Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf70P-0006wa-QE
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70O-0006wS-Ao
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:28 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6zi-0007KH-NA
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:28 -0400
Received: by mail-vs1-xe34.google.com with SMTP id c1so14722165vsk.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=njYQgkvkyYgMYG0NSJCSMJVsf0OTcN7xkr83EKle9MbUy58FDt1Ccg/1PdakImvGWs
 TP5ZVE65gswxAmAMuaTHANMq0OrfmKMVf4SmM0sKx3k+RN3Kt0znB8XHMcQBMiN16gu/
 6xN9zlDgHnloae1gjPNflhycvhONPZmBS9bHVyjr54k0cbvJneL34KwnIJq72pFBhEfl
 O64l1lxnPIcR526fcC8Csc88v0zPQAsa4iE9Iq4HGPC7/LSgsyyxWLqmNOL0p5Kz79UQ
 RoBy2eJGbdB7eUTQwZ+ZZ0LI+U2/qUB0vxm8iCYmbahhFsxuLoo9Je3jn9aGD5STCRb9
 uK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=le0n3M6ySZo2gNGtl0bO2JtAE2Xn906sB8uL+o28txeR+o538tT61C8sXShvXSYU3T
 A0CvZXtLkZwuOril9SD3d0izrp5dlvZVgdZyvMYTU5/qS6+8nmGNP1pkpCda9hJvjffi
 6JmEORGKt6W4KzEMTfHN2s6O379j9hnNi+ZUsv7y85fkCg8SQ36mnwm3vst8I0w5aAi+
 TCc6aX9Af3q2vnU9ZmpZpYt2qFse36sMyh31Y6ewRf3Kg+SLANyqCS3gw/nTMBg+eYlR
 Sndwk4JoJb62G5bKucN98vaUVjWD2+kZ0dH43JBhY8LeUHpyfk7gUhkYTfto9iCQ8Zwx
 fcMQ==
X-Gm-Message-State: AO0yUKUSYQUThWwizjexjAX4IOx59XCU//Ou1IWVOiu/bgmHm9VkGIT2
 HYulscJXygl/D+AgcEjxpRenvKO/qRd8Q6BC3Ek=
X-Google-Smtp-Source: AKy350YRBQZtCxUKA0okoagPXBDgH2JfZUYVaT9+eTyHQ5hQV9r+YFxQ7Gz5iGc7Zhomm4Sy8KWwlQ==
X-Received: by 2002:a05:6870:5715:b0:17e:1663:7bc with SMTP id
 k21-20020a056870571500b0017e166307bcmr857076oap.54.1679523653173; 
 Wed, 22 Mar 2023 15:20:53 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 10/25] target/riscv/cpu.c: avoid set_misa() in
 validate_set_extensions()
Date: Wed, 22 Mar 2023 19:19:49 -0300
Message-Id: <20230322222004.357013-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 22 Mar 2023 22:32:28 -0000

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


