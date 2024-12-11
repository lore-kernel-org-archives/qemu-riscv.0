Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573F0E7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 14:31:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLNkb-0002Tv-Uu; Wed, 11 Dec 2024 09:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tLNkX-0002TQ-Vv
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 09:31:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tLNkU-0001rB-UM
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 09:31:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso4910495e9.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2024 06:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1733927493; x=1734532293; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FkhAb6XWdcUVPQN7u/akm5gsE8B+w0RWYKLeoc64EHg=;
 b=aA8ggWhHDDmWbGCWYyKmLtwG+MO8LS+L5S4Yd4soloRRe+mRtZQmYxdFvTo+yyOERr
 r+q4yfhp6Y6XdB/KrttuLAGY3fl8hjx31IIvtWRk2/w074ZoNESE7WUm+3Vakrer34If
 drzV9ITSwpga3qQ8o0UFkT36WNjShojR3F/VJJnsRa99ZpSEY1wWexR1ZnMRXsESCJUN
 H1KI99gT/hS8XavJ88rlk5HOoV0vcGunKjGZzRahKpjhNPeZ9pMStRf9C5DT4f7uW7w4
 I9tRm7Kt6Bqguff0vXiSoTj6u66ji7vbwSjAPA/9VnUzjTJid7jF4TkgJ0MD2JpeTfos
 FtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733927493; x=1734532293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FkhAb6XWdcUVPQN7u/akm5gsE8B+w0RWYKLeoc64EHg=;
 b=wbulW+ljhrIwKGkwvyQUoJLYfdd2SjyTvoA3JRVTPn3lTPyqPECTilUJyn7djXdh7J
 Q2hXB/tG63EBqBdTVyUjKP0KUDrVpeV/Rd8r4VVE3sjgnBtr7jb3s5gowS+lpdp+JULq
 ocWFbGeXxNG5aR0NUig9utjeVIToMx+HsDZpaMAZXJxZLgNxcgOqmpdS9Iiu3BtzjhNj
 4z+Id8QstKsQxGdK7/6nc5Tl5zJcvTHTHjRmZO1juCoeffImzcmrIm9jI8Vy5WThdO7W
 bJ4PZXQ+q0xYYiG6o7G6R2kEzlVKdsQqOGGGh6h+oCi5TrXcf7k110dW082+/AkN1PzN
 fq+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMhNLKVoNnWkbyx7QFgwafmemTshQXLl4wXoombl5GPbhP/cMz/OTdkapuZmXO8vASVf+T0tafPMIE@nongnu.org
X-Gm-Message-State: AOJu0YwRrP/6N/npU3OTZeIC2vEZkIqiWmBiQ0C1RjCA9hP/UunSrqZ3
 nNqaeDVgynbDr/hN7BUDFX819FXb6F3K0gue3gp0I1ihxe456E98G3eMIm6sM9w=
X-Gm-Gg: ASbGnct8TPu7SdLsMSYkEsX4gfCWtE8vzgThkjAybV+wRNFb8flTogm2x5EFCmxifY3
 QTeIcaKwaKwaCwCl3sGaSPG8ZLR+vx2vXOx8PTQj6RV9dpLeIYh5l6Qg0XHfPxbWM7oXmYOBkRP
 fW6ZWE6gAuofteZsYrmeT9L9ascyWPYYnrZuBvxNHoAZNj/w4I6aprKykZTUmJsqxADI0Gb8BTf
 TMBBGFXBaCV0dn43N7PqFDkH2cOtvcFhedepGdCFd2rgdNlM4ivX5MnRqtpQ5KYGfMpwS0FrylK
 ifQWfUtUG1ApFsJd0coCoIqh69yzgplB40BxA4hauXe7bg==
X-Google-Smtp-Source: AGHT+IF1+shcds8SZy3f7b7zGJcUMiGguvDS9X6DsFDrr35nbBJcUalLIvhtVhJfiYmLbVDpuJNgjg==
X-Received: by 2002:a05:600c:350a:b0:434:a684:9b1 with SMTP id
 5b1f17b1804b1-4361c344cb7mr25337145e9.4.1733927492962; 
 Wed, 11 Dec 2024 06:31:32 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434e8ec8072sm153602425e9.18.2024.12.11.06.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 06:31:32 -0800 (PST)
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
Subject: [RFC PATCH v5 0/1] target/riscv: rvv: Use wider accesses for unit
 stride load/store
Date: Wed, 11 Dec 2024 14:31:17 +0000
Message-ID: <20241211143118.661268-1-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wm1-x32e.google.com
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

Changes since v4:
- Split into a seperate submission to simplify review
- Use load/store atomic functions as suggested by Richard Henderson
- Do 8, 4, 2 byte atomic ldst for sizes smaller than 16 bytes

This patch now uses the atomic ldst functions from
accel/tcg/ldst_atomicity.c.inc to ensure element size atomicity.  I was
not sure of the best way to make these functions accessible from the
riscv target, so any suggestions are very welcome.

Previous versions:
- v1: https://lore.kernel.org/all/20240717153040.11073-1-paolo.savini@embecosm.com/
- v2: https://lore.kernel.org/all/20241002135708.99146-1-paolo.savini@embecosm.com/
- v3: https://lore.kernel.org/all/20241014220153.196183-1-paolo.savini@embecosm.com/
- v4: https://lore.kernel.org/all/20241029194348.59574-1-paolo.savini@embecosm.com/

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

 target/riscv/trace-events    | 12 +++++
 target/riscv/vector_helper.c | 95 +++++++++++++++++++++++++++++++++---
 2 files changed, 101 insertions(+), 6 deletions(-)

-- 
2.43.0


