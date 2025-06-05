Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1575BC5B543
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 09:45:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uN7A0-0003T3-Hj; Thu, 05 Jun 2025 05:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN79w-0003N8-W5
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:45:17 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN79v-0001zS-Bs
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:45:16 -0400
Received: by mail-qk1-x741.google.com with SMTP id
 af79cd13be357-7cee9f0af46so81572385a.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Jun 2025 02:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749116714; x=1749721514; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ubn/J2LD5Dpe/hzEurxm0V+J1k3g0NG4AbGEd3fS58w=;
 b=MRtdz9cLcPhvWl3A3Oz7oy4CmIrQhcWYyg9BT3nI/dQKKY+CBUmjXvfrlDkcahmrOk
 g1kGze4Gb7Zfz912L+kc6WBk748GgigK8vX9990782lfr/evxdEtUKSLgrFLM0fEuhrW
 L4GfSj3JNyA3VhEdS1W/2SSBg/vtxJ2/vlNMN/e7cd5IUvRWv+jALCOLZn2ATDMz+KGu
 EDFARABD/P4fLRK2AXcVHQ/neC/2jGBMFAC5RG89K40LC2VjtWr6iBQAO6K5SVokES1U
 GJkP6XMxVKGxJGIlIlyThHTS2gxP+i48ukhNqpBlEapUmq19VRWegTVS5EdREqcqm8DZ
 A7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749116714; x=1749721514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ubn/J2LD5Dpe/hzEurxm0V+J1k3g0NG4AbGEd3fS58w=;
 b=IG3sX8jyol3YwGGH7jtpEooQ25Vy9VyGaSH3VCF1KbnlVASVMD1I8s1XEL6eMwtP1z
 1aece1RIJqWlE/LwRDcBly48aQR4UNJ09SPG6gO0kYxy/ciymA+ZLsM80A4bWMhRD7U9
 5R345+dsu/OgN6S6nx9QlnaR7Wvtp+uxHV44BJ7uQqQaGwXKnpXTetCyCy4z40TNfkqO
 0J0S5FCmoOt2afqycEf3lUFGPz8Kv9imiS7CqUnvLvwgezV6ba6GGq9Uvt7cje4iJGHf
 uWahWWBPE6hkupiYvnzoN+/taAkvEh7m0xDx9qubZdJqqAg3QSU6MxvZdmjqjDHZpR1u
 jnAg==
X-Gm-Message-State: AOJu0YyDMc2O6ntDDLkY7BsajE9aXx5us7oTA7o0J9nwT59PcmsimSIK
 oQwV4GD1PU3PHUx1udg/oV1NBhMwhrKIqaaDj6Ji2hcgzdDa59UTdAy16KLWL4HHURyPY2/my4K
 i1QOgWTdemw==
X-Gm-Gg: ASbGncs4BkfB2mGO8oJjH9dkPugOJ3wCwR5GCueCJBCD/jISJshfZJ8RzPoP8p/PBFr
 JRnhCtmknO20ofLYEAjLxUjiRtmjC/3vNlC+qU12o77fEH0fSgySgrY2yDx3azIfkrrTvBkgTv0
 6/HkgJl2IM6JKFoqqhQlAn+x0JcczsykSxNpPEXtPkETNIKQ2GbiVn+izSW5tPoiksF4nI/nZ8C
 iOqmpSugZCJeL1Wh6QzeBk6/6yqJPC4fsuoe0YlozSqJP1jHAlYDH+wJp35R00FxMZToNXul8rK
 J/vi1w3zSPFUYY0OjVAQfIvdOv3n9UHzuWh4ku/HAw3seVn32IEI1gF5PkLrYbqevJIu9iqTVDq
 p4MT4spOI3s7PVp0=
X-Google-Smtp-Source: AGHT+IFGdS3cZUGZqayFGX32YUB7XyxvTrtGrxnbYTNW9eimRQ/Z96qxLDlRve1wnRyPrh5qqJc2UQ==
X-Received: by 2002:a05:6102:534f:b0:4c1:9780:383e with SMTP id
 ada2fe7eead31-4e746d19f41mr4214959137.4.1749116703187; 
 Thu, 05 Jun 2025 02:45:03 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87e2a2c28d8sm10063093241.15.2025.06.05.02.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:45:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/1] riscv: qemu_chr_fe_write_all() in CONSOLE_WRITE_BYTE
Date: Thu,  5 Jun 2025 06:44:55 -0300
Message-ID: <20250605094456.1385105-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qk1-x741.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

In this version I removed the reference of SBI_EXT_DBCN_CONSOLE_WRITE in
the commit message. That API is *non-blocking*, and citing it to justify
a change in a blocking API sounds weird. It's also uneeded since we have
a good case without it regardless.

No other changes made.

Changes from v1:
- removed the "SBI_EXT_DBCN_CONSOLE_WRITE" bit from the commit msg
- v1 link: https://lore.kernel.org/qemu-riscv/20250605090012.1268809-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (1):
  target/riscv: use qemu_chr_fe_write_all() in DBCN_CONSOLE_WRITE_BYTE

 target/riscv/kvm/kvm-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.49.0


