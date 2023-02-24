Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVc8X-0001mP-Gf
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 12:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8W-0001ki-0m
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:36 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8O-0003Zn-9A
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:30 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1723ab0375eso324289fac.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X+OnNfeuiwGlnJ89jbTWsgHWPA0/Mf8xBENtahjo6Y8=;
 b=Iu6I7EN5TvKrlFAygxxe7K4USXeVB7eTmp8ydQ59eLxcYs+rfN8fYA/6Vna/+AHrHM
 Iw/PO21aBuKcl3dPFtNuWsAcaiTBGLZ2Dh0RoqNfJ2AJ8Q56ibSKevayNaoyYwmUAf9c
 6vNZz0pj52Pwj1bOP4xaXNHA/1I/bZE7VZYFUCCQAnbPyYLCW8NqConomaHZOsMjggkX
 qoiqIjS0xiQXYUw+W7ZpZ/hRoeSsAvtyDK+6aRQH7VROqA0rxnIp89P038eBk80GhSLH
 nWxa/5UY2b25EcRV1s/vFeUc/rKrwSSYJkqw2OM3+KZbGRknPRNPIyt+sdmW6CvUjmdi
 yJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+OnNfeuiwGlnJ89jbTWsgHWPA0/Mf8xBENtahjo6Y8=;
 b=VpoOHGv6l9qOXIt2UZepjQvNV28QbhEtW7mpyHhNDRAp3jxnrZX6ePUyKXiZNMQfm5
 8RlD2EjkmYcP1MWMhCyx6lJdtIhFxMkzVmVCudLn1dwOSJBrRe1I3nDk6J+Oep/7mMdi
 uWXiZ/O8DhV0SbWdN990Ydgz7nGiobKuuCaNmvlBCHbXeUI/WJdpB/pfzE/L0mxjgauz
 d0Fu58ASG6KodUElTEFUpDR+/n2EVIidiLVf7NlJenIdOUwUmdmzKErlNWcKFsprjgDJ
 oRJtvAjlQ5J06GfQKoiCjKtzGjW3uzdHQN0sq+j5FU6RY57Y8CgwDW1apsyUiiKc59hM
 Mn2Q==
X-Gm-Message-State: AO0yUKWpbsdfJOl8eqN3AsUaK9CSc2Gp9ApXqliFt2UXsLcNLGD2dOYO
 5qeh+5ObX4bXQLoKY206fmh02A==
X-Google-Smtp-Source: AK7set+DBMaP/6oM1C1dXrojg6XgD1VA+qDv/gAUvqu2oERUUVuZ8EVYQcI6FgJ0d6aEHysSCgLuBw==
X-Received: by 2002:a05:6870:912a:b0:169:cbcc:25c0 with SMTP id
 o42-20020a056870912a00b00169cbcc25c0mr261177oae.14.1677260726618; 
 Fri, 24 Feb 2023 09:45:26 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 zf48-20020a0568716ab000b001722c5625e2sm3604123oab.7.2023.02.24.09.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 09:45:26 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/4] RISCVCPUConfig related cleanups
Date: Fri, 24 Feb 2023 14:45:16 -0300
Message-Id: <20230224174520.92490-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 17:45:36 -0000

Hi,

These cleanups were suggested by LIU Zhiwei during the review of the
RISCV_FEATURE_* cleanups, currently on version 7 [1].

These are dependent on the patch "[PATCH v7 01/10] target/riscv: introduce
riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.


[1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06467.html

Daniel Henrique Barboza (4):
  target/riscv/csr.c: use env_archcpu() in ctr()
  target/riscv/csr.c: simplify mctr()
  target/riscv/csr.c: use riscv_cpu_cfg() to avoid env_cpu() pointers
  target/riscv/csr.c: avoid env_archcpu() usages when reading
    RISCVCPUConfig

 target/riscv/csr.c | 90 +++++++++++++---------------------------------
 1 file changed, 24 insertions(+), 66 deletions(-)

-- 
2.39.2


