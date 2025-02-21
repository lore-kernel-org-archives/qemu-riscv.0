Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806B7C021B3
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:21:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlVle-0003Ka-EE; Fri, 21 Feb 2025 11:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tlVlb-0003Jz-BH
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 11:20:43 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tlVlZ-0008AL-Jj
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 11:20:43 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso14757155e9.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1740154839; x=1740759639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cj6d8t8BKizy5ubP/JaWeJ4YqK80LLaBindVQUy1q1U=;
 b=Rue6Mg4LepbERm2wG3n5ukHSMI0D74yjkVeKpTk1kbYJAkAdHy92Sq2gGNTg98pgCZ
 KTo8RzoHBPBq1SK/+v3Sq7VV7kcC58XwsHWK0Pq35AP62Llv7I+aNkF8J653aV4ash3j
 x70yFMLqARQNlZK31qjkSTDAS/fFmRqfeO088CwdOcKyD4lEc4miZ7GKxlRtrIaPt7+P
 9HJme/j+PHmm/xUcylwIngYAdsWKxLhFxT7LZqLPQrUH19MfneQDjwbYt71ac6Ihzonj
 hE5ytngKefK4gU5frwwgFYih+FHZHIuycysh/oF/gbWGoK+xjjYdl2AcJ+ZXWJ+YrTdC
 UzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740154839; x=1740759639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cj6d8t8BKizy5ubP/JaWeJ4YqK80LLaBindVQUy1q1U=;
 b=BrLlKm94ZuMk7pCsGT1b71TxJl9q/dtL3lTEak13gvpdKMKeQjd90cgnVt4mlTarky
 dzb/k6A35I3QliEez1VINDyou8AW+vm0oTtpaH7HtcSNEH1Z8wi+JDSbjzrCJiyFXm1U
 DIQSlXsDhKtRMyc+NF4S7lipTL3yErdsZhsgMYaRhlmvPpYRTDnLo/5vIVDMP2npS8pk
 eO1ca2z8jv74HSKTWLu7hlRoKwtN8afepLzqF2HcZVfH5vb7iM5wIPqfU6QEXnwPZa44
 7bsqLszuyrxKjqgOW8tQmTkK6ixAp79WaB2e/goPXkepDLOCqUgabggYld5NrlQW4l1f
 sD/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsa/8dzyEKlr7OQ7H03OMdUM4/ijzooNW2hedF9zzeqiFwD+hfyW7KJUOsnF0sQMmgnTe2sR5JX7eY@nongnu.org
X-Gm-Message-State: AOJu0Yy0ligyY+HY75/fs90NmJu59/hPoSk17sIYxKNfUoX2IkgCEMWc
 QA9DclTm4/abuurx1L3tw/Br6WtCTQnbqCNEkDhEWpa3+FNOUpm3jFoWqaNh3Bg=
X-Gm-Gg: ASbGncvCIENxUfCount4wmd0XTB6w3UlPwtEYm129CyhsX9D84UwgVY9WWIIDZ/1hWM
 49cByTr4v2vVGlSwJdP84FAvxD5ER9Ev9kwHCiYxNWw6+Q2jpWftP/nK95ZeSlneZvhsHAFGa6D
 5ZJx4sFd8/bfOKmUtyxek/EqwlK+mJiH4mQr9dmpvW47EtoW1D3M5MyE3FBsxDGu9Ew5jzJ2Uo5
 pqt7gdzLyyYIUdmGloUuPSt6FkmnDk4XpaJhXO+KK8MY7PAdtOfVf8uaZTcYOOq+sc+u7laC6iA
 jT9Gtv4vVMsf/aevYHdW5RZQB5i281MN8QRNKFLsan3S
X-Google-Smtp-Source: AGHT+IGlhA1OYklYI8W3TvhcwJWfhEyCmdHdWJ7oXVqqQX5x07qyoOlI6irMKuHH0x0C3rngALr0Kg==
X-Received: by 2002:a05:600c:3515:b0:439:9f42:c137 with SMTP id
 5b1f17b1804b1-439ae1e6ee6mr38980045e9.11.1740154839303; 
 Fri, 21 Feb 2025 08:20:39 -0800 (PST)
Received: from paolo-laptop-amd.. ([2a0e:cb01:d3:f100:1f03:a9f0:23a0:9bda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02e4245sm21732575e9.18.2025.02.21.08.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:20:38 -0800 (PST)
From: Paolo Savini <paolo.savini@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Savini <paolo.savini@embecosm.com>,
 Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>,
 Jeremy Bennett <jeremy.bennett@embecosm.com>,
 Craig Blackmore <craig.blackmore@embecosm.com>
Subject: [PATCH 0/1] [RISC-V/RVV] use a single function to probe memory.
Date: Fri, 21 Feb 2025 16:20:35 +0000
Message-ID: <20250221162036.61521-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wm1-x336.google.com
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

This patch originates from the last comment of the following review:

https://lore.kernel.org/all/2df9ae98-afb8-4647-be80-12540a1c4612@ventanamicro.com/

We call probe_pages to probe the memory before doing a memory operations or
probe_access_flags to do the same while also obtaining probe flags and host
address.
This involves different calls to code that is almost the same.

This patch expands probe_pages to provide for both cases.

In the new version of probe_pages we don't have a return value to get the probe
flags. We need instead to pass a pointer to such variable in order to get the
flags.

Cc: Richard Handerson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Cc: Weiwei Li <liwei1518@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Helene Chelin <helene.chelin@embecosm.com>
Cc: Nathan Egge <negge@google.com>
Cc: Max Chou <max.chou@sifive.com>
Cc: Jeremy Bennett <jeremy.bennett@embecosm.com>
Cc: Craig Blackmore <craig.blackmore@embecosm.com>

Paolo Savini (1):
  [RISC-V/RVV] Expand the probe_pages helper function to handle probe
    flags.

 target/riscv/vector_helper.c | 57 +++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 20 deletions(-)

-- 
2.34.1

