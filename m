Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F7CE7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 12:52:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLMCA-0003FF-NH; Wed, 11 Dec 2024 07:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tLMBi-000334-5n
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 07:51:38 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tLMBg-0001rX-94
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 07:51:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so3249624f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2024 04:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1733921490; x=1734526290; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7DRVhbud0qAfrBBeXAkjxxiV64CObQSqSSiJf4H0jTk=;
 b=AgsoBpPJMcSPzacrzQuoBwk3kNoWN5w/MUgQbJ8mIH0/RcD20MKV+u9xQ+cpn839lU
 +t/WStpur8RxuKVXw8PjP6mrMiyrttaPaZ253MHVWjUTCp4J2A0LKjjbl9KMrRVFetgR
 31/kc/23uaFAzYkiJgY7Uv0exhCZgIpUAj3IrIh+R45DUf50Y3e71j2xa+u9G5wxGLUF
 abI+Z7nPzjXHvNS+2hRVumrNVEDERb2rxygujR3NGqRyEmcHI17NYASNGvy1FgjAqbkh
 oroB4aAr9rhEK7s9bSUMIBzXfMMS+zHhTrYcm4mQaBdGg8e8JLXQysG+L/ANJj8bn94F
 DiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733921490; x=1734526290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7DRVhbud0qAfrBBeXAkjxxiV64CObQSqSSiJf4H0jTk=;
 b=EmSmKvq4Vh6/oacIC8vXQUZN395oVAjlG5qM17UCigGZHsWHzwwzAWqS31fuzMlL0K
 lGBquRIzviMflHIeweb/1jgGiWRD9zSCO08jUzdx6r3+HSYrNBL9NhcrHGjakZ3RgAAD
 oP1Vaprz0f+YB2GUVbgJaCyeX9u5O0GRmtefwC47vJ0sGSEwvJsKW3R/KBACjsx5EuY0
 bpx8ugeNVTUIahe5aVKZLoESvaCIG/5rYgYYYd+4PWtgvn0+MNiTlOfH2D3RdOSw/Snd
 neV7bbG54+IyM3jIdUOXBrEY9QSWjrxazfB9i/g5n2y4wk0BE2PaZ952xo0ZfsFHX+ZV
 Gbww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6neu3tTwr/Y6AB3o8rywba1nsqOgxDar446j6mj9R2YSOyJmCL9gGQqqr9Ss4WTZzLxtylzlm5anK@nongnu.org
X-Gm-Message-State: AOJu0YyA8VIDB8vXnCNSiuVM7GkHarmRlQGlRUsz72bP/I2kN71ounVP
 1AOBwrG9LsXL1FBzOZzAsHVE/9sWoPsgeDm0fM/SoUhwih3EzH2fNF0ExvRaNLg=
X-Gm-Gg: ASbGncuJPvUcfGGAMjMw0Bxo4RiB9OWQDHyDelqGImSC4mYkRn3VjkvAv80gUgjImKT
 BAVlCFsDWsYknAC44alrweNSLyDVeAsq8X6TcyqmaKwkTMuj0hr1k+ZK15tTM31b1BTYaECgZyk
 V/ePkxuXhZFFbrdT3IBgDLWgbR8UP4Ksr/JhAyQARXNWOAEmaBhGZO7rYrVw0bbJRKVS1oFuvqh
 sQoW7/0Ebf1WiZwciGx2z6In0OQmq5cwAcqlxgjtfLVb/1bT6nGNlV8GSJCHgrR+8bBbniDM4sx
 RjWDjfeosvDnIJAwYKUOUGM7qZuR7+3j9K6aQ6ORGcy93w==
X-Google-Smtp-Source: AGHT+IF9HOlfsbL1zSs+IEVhAyHVqNH5UbsPCVFBjzmDnzVfJqo1t9oVlPxTmruDuzy204sJaybVUw==
X-Received: by 2002:a5d:59a7:0:b0:385:f44a:a3b with SMTP id
 ffacd0b85a97d-3864cec390bmr2085285f8f.41.1733921490242; 
 Wed, 11 Dec 2024 04:51:30 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f44eaac7sm120542125e9.42.2024.12.11.04.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 04:51:29 -0800 (PST)
From: Craig Blackmore <craig.blackmore@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Craig Blackmore <craig.blackmore@embecosm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
Subject: [PATCH v7 0/2] target/riscv: rvv: reduce the overhead for simple
 RISC-V vector unit-stride loads and stores
Date: Wed, 11 Dec 2024 12:51:11 +0000
Message-ID: <20241211125113.583902-1-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wr1-x42b.google.com
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

Changes since v6:
- Limit access size to element size to address Max Chou's review.
- Fix a typo in the name of a function that this patch now calls.

With access size limited to element size this patch still provides a
significant speedup.  The `memcpy` benchmark from:
    
  https://github.com/embecosm/rise-rvv-tcg-qemu-tooling/tree/main/strmem-benchmarks

shows up to 75% speedup with this patch:
    
  VLEN | Size | ns/inst (ratio)
  -----|------|-----------------
   128 |    1 |            1.50
   128 |    2 |            1.42
   128 |    3 |            1.35
   128 |    4 |            1.29
   128 |    5 |            1.23
   128 |    7 |            1.18
   128 |    8 |            1.09
   128 |    9 |            1.06
   128 |   11 |            1.01
    
  VLEN | Size | ns/inst (ratio)
  -----|------|-----------------
  1024 |    1 |            1.75
  1024 |    2 |            1.62
  1024 |    3 |            1.52
  1024 |    4 |            1.43
  1024 |    5 |            1.35
  1024 |    7 |            1.31
  1024 |    8 |            1.12
  1024 |    9 |            1.12
  1024 |   11 |            1.01

It is not clear to me exactly why the patch is now helping.  At first I
thought it was due to avoiding `vext_continuous_ldst_host` calling out
to `memcpy` for small sizes but trying that directly in
`vext_continuous_ldst_host` was much less beneficial:

  VLEN |  Size | ns/inst (ratio)
  -----|-------|-----------------
   128 |     1 |            1.06
   128 |     2 |            1.14
   128 |     3 |            1.03
   128 |     4 |            1.04
   128 |     5 |            1.02
   128 |     7 |            1.02
   128 |     8 |            0.91
   128 |     9 |            0.92
   128 |    11 |            1.03
  
  VLEN |  Size | ns/inst (ratio)
  -----|-------|-----------------
  1024 |     1 |            1.10
  1024 |     2 |            1.14
  1024 |     3 |            1.04
  1024 |     4 |            1.05
  1024 |     5 |            0.96
  1024 |     7 |            1.07
  1024 |     8 |            0.94
  1024 |     9 |            0.93
  1024 |    11 |            0.90

Previous versions:
- v1: https://lore.kernel.org/all/20240717153040.11073-1-paolo.savini@embecosm.com/
- v2: https://lore.kernel.org/all/20241002135708.99146-1-paolo.savini@embecosm.com/
- v3: https://lore.kernel.org/all/20241014220153.196183-1-paolo.savini@embecosm.com/
- v4: https://lore.kernel.org/all/20241029194348.59574-1-paolo.savini@embecosm.com/
- v5: https://lore.kernel.org/all/20241111130324.32487-1-paolo.savini@embecosm.com/
- v6: https://lore.kernel.org/all/20241204122952.53375-1-craig.blackmore@embecosm.com/

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Cc: Weiwei Li <liwei1518@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Helene Chelin <helene.chelin@embecosm.com>
Cc: Nathan Egge <negge@google.com>
Cc: Max Chou <max.chou@sifive.com>
Cc: Paolo Savini <paolo.savini@embecosm.com>

Craig Blackmore (2):
  target/riscv: rvv: fix typo in vext continuous ldst function names
  target/riscv: rvv: speed up small unit-stride loads and stores

 target/riscv/vector_helper.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

-- 
2.43.0


