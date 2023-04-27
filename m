Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ps8g5-0002Sp-9l
	for mharc-qemu-riscv@gnu.org; Thu, 27 Apr 2023 16:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps8g3-0002S7-5f
 for qemu-riscv@nongnu.org; Thu, 27 Apr 2023 16:57:19 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps8g1-0002LE-8o
 for qemu-riscv@nongnu.org; Thu, 27 Apr 2023 16:57:18 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-541eee15ef5so5089922eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Apr 2023 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682629036; x=1685221036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kO0k5LSdWoZPT+FqERWzWtJIo942if97mBEDYjIGUyQ=;
 b=MU4ELkK/YUVb2ppNezxUG4jEfby5FyaOs4q+mRB8EvIol1PpYdEjeJRVNLWNjvVSak
 zn/ERJ6Y4FThA1FvvrndDr1MF7I11KF/Ag9yP5mRf3e5j2lr/Ol3+oaMTEZ5FOz/csXG
 GdJP/Zkfg9hKcFxhVfjZE01tLYqhh7S1vs0RpjLwm3B2tTiuBxK8uffIW2KDR1q39OJb
 CRq1SyUdnXT0ovnz053FXaW2sPrEUsXOD5dGp3WrmIJDzonkSBBRqNgKhzO3+p2i5Gh8
 qDI89WrUqwCGPrCGmv+FK30B1fTy9ioq1eo9K+0F6UCwis+FZIy8n5hIqarfASYdZaJZ
 vCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629036; x=1685221036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kO0k5LSdWoZPT+FqERWzWtJIo942if97mBEDYjIGUyQ=;
 b=BlvbmpzVyc8BKbHwT5SXGecvBOwcQDvPVBsitukCGmVkDznAnZiBs1Wjats+5N+7uX
 fkQQfhTB+yOI6VgUyVKjkwgjljq0CdzcfrcwKZMw6tb2aYFfZSkKTizQSAX7c1lqU7BY
 Otht3tT3OdEjMVyHuzLmWG34erZlFihdxHG3d44NHzRGHxES3p8kOo9/P9EcgY3jwaDS
 Y2F3fzbYtkwgUwExwhZUW2/oGHyIPnty9IpsUWZlesdslqRcziy+T8HKaDVFDgoSdjEV
 MUWMdLKLoXlih/ZDDRGt7vvLvziJ1xQ7hk0AFfuQ7dHBQk+dreg+/pkM4F9lXqJzO1xt
 HYjQ==
X-Gm-Message-State: AC+VfDyzb4WxvCEOiD94GeNIcVwHnA6QvFQ5DDIHbxeNlo9a5fnCvdcL
 TYSr80EqCJe3SdlIvTZIzYe7tg==
X-Google-Smtp-Source: ACHHUZ4HCvU0lcZz+1kIB5ou1J/lclUlrHMbaKtDy2Nb7Krq7/A9RS/5xTEBJKJmy01CBLngHbx8AA==
X-Received: by 2002:a54:4199:0:b0:38d:f213:f97b with SMTP id
 25-20020a544199000000b0038df213f97bmr1453111oiy.2.1682629036173; 
 Thu, 27 Apr 2023 13:57:16 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 k205-20020acabad6000000b0038934c5b400sm4804225oif.25.2023.04.27.13.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:57:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] target/riscv: RVV 1-fill tail element changes
Date: Thu, 27 Apr 2023 17:57:06 -0300
Message-Id: <20230427205708.246679-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 27 Apr 2023 20:57:19 -0000

Hi,

This series makes changes in vext_set_tail_elements_1s() to be a little
nicer to the emulation.

First patch makes the function a no-op when vta == 0. Aside from the
logic simplification we also have a little performance boost.

Second patch makes the function debug only. The logic is explained in
the commit message, but long story short: we don't have to implement any
tail-agnostic policy at all to be spec compliant, but this function has
its uses for debug purposes, so keeping it as a debug option allow users
to disable it on demand.

Patches are based on top of Alistair's riscv-to-apply.next.
 
Daniel Henrique Barboza (2):
  target/riscv/vector_helper.c: skip set tail when vta is zero
  target/riscv/vector_helper.c: make vext_set_tail_elems_1s() debug only

 target/riscv/vector_helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.40.0


