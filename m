Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BD1E77197
	for <qemu-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 15:29:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVuSt-0008Dz-DD; Thu, 09 Jan 2025 10:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tVuSo-0008Db-Gc
 for qemu-riscv@nongnu.org; Thu, 09 Jan 2025 10:28:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tVuSm-0006sC-M0
 for qemu-riscv@nongnu.org; Thu, 09 Jan 2025 10:28:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso8481735e9.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Jan 2025 07:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1736436526; x=1737041326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c6WJpUs4643oGwxH6y7zuN4dJbGbFyPImupCGr0ate8=;
 b=bDIqZINdUVxuDg+yfVGGr/vZjnXFMGrFkv1LZzV58KaoIx+tWWqvJ+DtzPaixRSNlz
 rDlO+M0tkInu7pDUppQU7MhxRyv/dILCjCkX5JVG7a9tQ4alKq39YhZGN5/EjHuvhEKQ
 Y8Er8KGMxPhayIwrm5Ys1OOPyjXJt9XBnV7UDNSTxJMTjJBc6nzSa1FdFjg6H9ve7/Sv
 ZzApK+/TVJARfTYJJwjG6Tnbj55nqWFG1K9HVae6LzorNHFYSgglMv6faxyTf8rZuLnx
 hNEjW55WSJTifXQ8mZ5jYuykvSyzF3vt2MjSeTs1saIH7Ft2YzuRZRk5L4e1q6vVAB12
 yRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736436526; x=1737041326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c6WJpUs4643oGwxH6y7zuN4dJbGbFyPImupCGr0ate8=;
 b=pLQibR/CeTmO90WvGHYPNRNSVbL9fvY1mk/kee2YS49Ya1zvtZNoNdq14/a79KKC59
 kBfH3eMOcNQtCc1bxvclEXxIP6/C0w6S9gx8cKVNwZ118igcAR+deR9dq5xPmFlkY0iW
 Ym/p2Qm4+Ig6lTfRqmaeGrnGBSTRo8qvYTIdxOb0s+sullbA8Pjs/+uYBy7FJT11iQs2
 WbNvYZYHDFWnFuewINyTrdqU81CD5SoTnhexCDukbQZA+vaklag+/zGpFeYAML36z0oQ
 oIgy64rkNKU0JWvpX1ThsFNJKaXCWDxSstOt6coeZ6Pv9kTDOPhZLZA0stzeKjoKfflw
 3Rpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm+ToIIzxsO43129j54jia7tE9qrzbDq0mI5dW9c/YWlCOXxybQat/USvxaTJ3leDuNHMQjGzMSU5L@nongnu.org
X-Gm-Message-State: AOJu0YxRIddymT1bQT0vamtIuDWeDz7AIOtkb5EEHpz7DPn7j045ZKLN
 2uK9pepY1CTMgxzQ0P0vSrQfj8/dJJqRFwZxxMcdW70bp8GFjx/FYaGGjCbgcJE=
X-Gm-Gg: ASbGncuxap6GMfCmFaTlu/MeJlYF7vglVlJqT0iitMvwXEcUNz8elU1jPpNceMi2JwL
 iqKm2graglycRtyk1pvpo4gRgyyoIjyYIwDoGJXq6OoiZWTeXtz4SiAfqLRCQzVG6Xb/AXff0HK
 RHu3nt5YL7vGogaBCfqRa/Bw0Fj9ddaSqt1m8blFlFWn6vKft75wBXYb0VYOAGiZtzssh3q6cRx
 aiZdzXP7iGzarFGy9wLsi96HtFgstesJSm3jyiyD1kdZnGaZ8V6TiyqMOs6lu3V4hOsT8izSWwm
 9j0JvclpYhXm
X-Google-Smtp-Source: AGHT+IHEycFJQjTsq6l4eiTjwRcOrJBPYNwtPSYMh1f55P2vtlqlk/7oehIN6kvopQj0qEiO9msPNA==
X-Received: by 2002:a05:600c:4449:b0:435:192:63ca with SMTP id
 5b1f17b1804b1-436e26f481cmr57297475e9.21.1736436525753; 
 Thu, 09 Jan 2025 07:28:45 -0800 (PST)
Received: from dorian.sou.embecosm-corp.com ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e92f7bsm59226775e9.38.2025.01.09.07.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 07:28:45 -0800 (PST)
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
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v9 0/1] target/riscv: rvv: Use wider accesses for unit stride
 load/store
Date: Thu,  9 Jan 2025 15:28:32 +0000
Message-ID: <20250109152833.75385-1-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wm1-x330.google.com
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

Changes since v8:
- Add missing CONFIG_ATOMIC64 guard.

Previous versions:
- v1: https://lore.kernel.org/all/20240717153040.11073-1-paolo.savini@embecosm.com/
- v2: https://lore.kernel.org/all/20241002135708.99146-1-paolo.savini@embecosm.com/
- v3: https://lore.kernel.org/all/20241014220153.196183-1-paolo.savini@embecosm.com/
- v4: https://lore.kernel.org/all/20241029194348.59574-1-paolo.savini@embecosm.com/
- v5: https://lore.kernel.org/all/20241211143118.661268-1-craig.blackmore@embecosm.com/
- v6: https://lore.kernel.org/all/20241218142937.1028602-1-craig.blackmore@embecosm.com/
- v7: https://lore.kernel.org/all/20241220122109.2083215-1-craig.blackmore@embecosm.com/
- v8: https://lore.kernel.org/all/20250108143523.153010-1-craig.blackmore@embecosm.com/

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

Craig Blackmore (1):
  target/riscv: rvv: Use wider accesses for unit stride load/store

 target/riscv/vector_helper.c | 92 ++++++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 8 deletions(-)

-- 
2.43.0


