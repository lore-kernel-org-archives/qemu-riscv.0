Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6C7E77188
	for <qemu-riscv@archiver.kernel.org>; Sun, 12 Jan 2025 23:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tX79W-0003yN-MQ; Sun, 12 Jan 2025 18:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX79R-0003y0-Ql
 for qemu-riscv@nongnu.org; Sun, 12 Jan 2025 18:13:51 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX79Q-0003Tt-5z
 for qemu-riscv@nongnu.org; Sun, 12 Jan 2025 18:13:49 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385df53e559so2989083f8f.3
 for <qemu-riscv@nongnu.org>; Sun, 12 Jan 2025 15:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736723626; x=1737328426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q1BZuJ/3m/XEdW/VfGC3pXpwHIJtrElJlYbu+OJQj4Y=;
 b=JxqtrhBaiysti9bXafYlXRfH0BjzfnQITJFHmB08h59PuzaOfZqWS2J92sdIEK9OaR
 AGZmk5vK5EDVO9pQT0CQllyso77rBALzfteArZ8/26se8BImLRsBIIm/lmGWLmz/dsQU
 OmcRfiiVMnmeCwGKCZGJ7eFcXG+8NCybOgFcx0NSZhb8YXhTEhqLPgEi7APCQ0YTZIU2
 V50CD5fRd/uk88UMH9FTufYVJGuKP94wwFOctRUYBrj6hl4ctqhKthFfD/dYNhszY7c1
 QBCo8KjOc8OsgmbjV1dxdmMDfSz+x/B/2MXpUY6Qe/pPdxAUSCDDPd4XZBcqREuX55Cf
 X10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736723626; x=1737328426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1BZuJ/3m/XEdW/VfGC3pXpwHIJtrElJlYbu+OJQj4Y=;
 b=orSGI5LMfGCyjhQWNGHjY9ATrZg3V4zes0p46C1CQtFiO+cQAmJhfLAfohkiLF773+
 JiTI5Oe8MHLC4nLUK9f7LPR/g9G/nUBYFvore98sDVKEfjb0i7BBZOnTff6jcb+3tKTM
 lGbSPt09NlXf7SRmhKk1N30qEKrrC79CfGgtmKlTCwr/Ri+aXS1T0KHNqP6yVgLAICuX
 J4E6ieJQfY+f1xjKytXltRU4bcc/3vfp2qsixp9m9e3KfXkN/wvwR20uJ60ZQkOx3gvt
 bxIVrNW7hl7ThQ9C1cBSpYWfAbYGaJKj+f8qJp2MeFeXHT3EKrHKnEfy7oZwTZrYN+T/
 mrQA==
X-Gm-Message-State: AOJu0Ywl52XaGbZuHEs59fjoFd/MD4KtjKg9+m4CjEzs1njN1XWiXYUa
 +ccUxPf8ZAbC7Fm/StMIfG0pIMChBht4r//ZH/HR4D3BWobYfFdFfbeUC/DEfZA=
X-Gm-Gg: ASbGnctXr887z+o48jC5zyfdC1wicquLrjaZtuCM7oNN8+A5QsbgxFe11G8EabPAGDZ
 HdqaRVFHvMYf1nOsFBfczis1RxPiGa6sMc7to1IN6/gccGwKuWRoicSQLGFePnY/scswsUIYJq4
 MDhbO1Ac/B8SAVnmY1slS0fBsb7RH7CM0OSOa0+r++K+uif7u2toybacURVlLzt3W7q3CFQclQp
 p2GXkZn9CL7W6JTf6lo3IadYWobRzUbuHIxUu/G9q5eNP2fozxgTWzTim7c+9JSa4nn0TljUlcc
 cxdjHCUrrm01A2nyy99ODwnRt5qhaKA=
X-Google-Smtp-Source: AGHT+IH2ptvawcohnb/6MklZRBJiyUSiD223cNAo1GSPhVP3xZF+K6tz6xv+iQ/wsCxRb6uBV/NwyQ==
X-Received: by 2002:a05:6000:481e:b0:386:37af:dd9a with SMTP id
 ffacd0b85a97d-38a872f534dmr17772354f8f.35.1736723625957; 
 Sun, 12 Jan 2025 15:13:45 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c76esm10455112f8f.47.2025.01.12.15.13.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 15:13:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/riscv/virt: Remove unnecessary use of &first_cpu
Date: Mon, 13 Jan 2025 00:13:42 +0100
Message-ID: <20250112231344.34632-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Pass RISCVCPU to kvm_riscv_get_timebase_frequency(),
then access the first vCPU via Virt::Array::Hart[]
rather than the &first_cpu global, which is going to
be removed as part of the heterogeneous emulation
effort.

Philippe Mathieu-Daudé (2):
  target/riscv: Have kvm_riscv_get_timebase_frequency() take RISCVCPU
    cpu
  hw/riscv/virt: Remove unnecessary use of &first_cpu

 target/riscv/kvm/kvm_riscv.h | 4 +++-
 hw/riscv/virt.c              | 2 +-
 target/riscv/kvm/kvm-cpu.c   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.47.1


