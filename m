Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWKSk-0007w4-Lz
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 12:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWKSi-0007vb-5F
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 12:05:24 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWKSg-0001hW-AW
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 12:05:23 -0500
Received: by mail-oi1-x236.google.com with SMTP id bk32so3482658oib.10
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 09:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ks0PsirPV1znxzxkig8pd9YuXVhxkGZJkD591xJZCXU=;
 b=W/M/8kxFn4A62HWdimLTTsmS63Fx8lQqtTQEx7Ju4tcRv6i12P43Wx6fH3kc7jUbZn
 5Z3jXvM/aTRDUfXU4UeI/dKEM0VIBDE7blCI3zHNunpU4uxECssqaKNE4h9tOGoPa1Xt
 /qtKuZEzjh6ubXzCWEQhEPtDi81zuBaT0TRemAM0T4v/ungsSohaMYXWr8tQ3s5I1S52
 hj1lf45hLljI7t74mlmiEJUQA/5XpprRy9IjjxLF9decIz7VxrZizzSG8jJdWIWG7kNU
 liujSpqzkbegpLg9TmlKCJCySLdk9vMVhE8fDusRHDZeWJpOYjr5XWniyxIrr8Q6qlIZ
 X5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ks0PsirPV1znxzxkig8pd9YuXVhxkGZJkD591xJZCXU=;
 b=hjvl8g5QHxlEf21oroHznIfzZLIzAwftK54/vOdNiqRjTH6yN3kVwUfCTqXfMIEJ4/
 HNV9Yc8YlK6d5htjtgmJSDFiqTe/r0PP1wL3FKl5yxNNd/QEeMbDEy9AJ+S7E+VB5KtN
 KH/yWGSP5z/HpR53+xulAa8WOgnlTKbxsZZsGfzLGSk3Avk+KhdFieSIeD6vSAX/oH6L
 63NuRbUxoABIxqpmeBlaadS007+OQIoTxGs8iEbPo5cIcyZ8ZdAhJgxTVMYxvEoOCm/e
 xcWtty9EJ2iPFNhMAEZhh5A72HktbIpJWxwt75MhlHjMWyVHG94YmmDqXruo3HWPYlRq
 dJrg==
X-Gm-Message-State: AO0yUKV3X4mOOmZY6DW6G5Qjghu5gpHhycmoqnFbyceU6BCIaj8ToJND
 bNL0IYPRRUlld3YUdCbJymYJcQ==
X-Google-Smtp-Source: AK7set/iISrGBxm0B3Zv1++X7CBtGz25ZK0MCinuGbKTeVi1hotGN9YpaZNeG3+npxrWF1QBsm5Paw==
X-Received: by 2002:a05:6808:6191:b0:35a:54df:638b with SMTP id
 dn17-20020a056808619100b0035a54df638bmr6394155oib.4.1677431120365; 
 Sun, 26 Feb 2023 09:05:20 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 n83-20020acaef56000000b00383b8011881sm2142406oih.18.2023.02.26.09.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 09:05:19 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] target/riscv: some vector_helper.c cleanups
Date: Sun, 26 Feb 2023 14:05:12 -0300
Message-Id: <20230226170514.588071-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
X-List-Received-Date: Sun, 26 Feb 2023 17:05:24 -0000

Based-on: 20230222185205.355361-2-dbarboza@ventanamicro.com
("[PATCH v7 01/10] target/riscv: introduce riscv_cpu_cfg()")

Hi,

This is a re-send of patch 1, which is already reviewed, with a
follow-up that uses riscv_cpu_cfg() in the remaining of the file. This
was suggested by Weiwei Li in the "[PATCH 0/4] RISCVCPUConfig related
cleanups" review. Patch 1 makes the work of patch 2 easier since it
eliminated some uses of env_archcpu() we want to avoid.

Both patches depends on patch "[PATCH v7 01/10] target/riscv: introduce
riscv_cpu_cfg()" that can be found here:

https://patchew.org/QEMU/20230222185205.355361-1-dbarboza@ventanamicro.com/20230222185205.355361-2-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (2):
  target/riscv/vector_helper.c: create vext_set_tail_elems_1s()
  target/riscv/vector_helper.c: avoid env_archcpu() when reading
    RISCVCPUConfig

 target/riscv/vector_helper.c | 104 +++++++++++++----------------------
 1 file changed, 39 insertions(+), 65 deletions(-)

-- 
2.39.2


