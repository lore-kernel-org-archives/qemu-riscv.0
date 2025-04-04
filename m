Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5754C36014
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 15:28:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0ixf-0006Vo-NC; Fri, 04 Apr 2025 11:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0ixd-0006UK-6D
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 11:28:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0ixb-0005TH-HC
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 11:28:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2240b4de12bso30351275ad.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Apr 2025 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743780478; x=1744385278; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JHvDixeqqCqQ3InyOpgHqgh3IZF1/xzNuPZ4aIWXwiI=;
 b=L63RmDKvTFoaPonsOtNI+sLrztC8ZTPZamNvIjroTc5SODcWt8NmQQOPtviFs5u5PW
 z8j8FldMFzrxrFrN2clcpYujVPKoJYgD/0cKDyRqc00Kqf4ptuGd5sp9yLu3S+Rxaiin
 ehjBsr+NvJ4ceyAIa2DHjwvZy72tLVbjPqUbxhAGYFtWraKgVkySHIYJgQhqflN9GeMu
 SHvBzYgg+iTXKXwS/nuhW5gIWObjurHtsYsW3zvTqcL/9AH9SrFktaQVNUvrF/mI47LN
 OTgZ+bRRQdPE2UNdKxf2L+Ok/D3/+0HissNKUHRsBz4ThTtA8e43VKIzgqSsW3BWuAZa
 pflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743780478; x=1744385278;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JHvDixeqqCqQ3InyOpgHqgh3IZF1/xzNuPZ4aIWXwiI=;
 b=ut3l1QbLvJAK1ksD7acaDyJRPb1b+bm0S4cOq+6S1yr6omvXxi2RM7kCgi0vTEqrzB
 cmbcBaG8w/eVSu+zOThfqeNyS+ySOv7OX9kS5M46WELZq5WKgJQMn4XetJ5JQYn+OIME
 afuXfh4XFAvOyv/CaOh+wHJWwksut4DWVUVH/TH2W39RvKwqMj0kmKtSf+TSWQ+teb13
 /q4flwFS/TwwchTYQIsGQ/tP5Eagp95IZqBlS+WXie5WvWqyP0AUBBrnvR2M/RKhE5/v
 ubTBtCIYVuSQSEWEUdcB46pX6xV9lwRJO9BGf2ppFc6eIk3HGZWHabaUL0An0j0Sklbz
 a88w==
X-Gm-Message-State: AOJu0YzgaIt5gkMUJXQ4fmusWDVLOIZoboxQNA6pU9mSpTgO46edNcDp
 gvZCbdesZD9LXT8UNB5gbSUMhL+1YdheNApdVrWgF4ReDlqiygzhkh/NYnPgNkQ=
X-Gm-Gg: ASbGncu5hoGUmJvcf1/s3/R1L6BZL6v8TuDN3s4KUb6SDDYKADJYVMUl1+QdrHEaVjC
 f13VxCz2vn6U9E/0/XhqOriUoi+90z+ZntR67h1xSFZtbehDxvZtUs6jY7dqhmqfDgOOkR8l6mA
 /LTvH8TW9Qa34rJqPNc/na4iAVPqYc3O1c6yTFfPnD9jZnsghIg00PH2g7LVc50BkCFMNDbWCQU
 H2lkBDDl9s1lokYuWTUZDi703ylUbePdI7HVkxBAFM/zm6QH643NGmFF9sg1ilE87EdZiwfHSCP
 N+yGkcCYi4datVtu+7WwQzctPj7HZIp8erOzL9XrbanzR6S1YUaWvQcFqL34dGWdu2wKrgKs5w=
 =
X-Google-Smtp-Source: AGHT+IH8w2/JncjaknUeIrJaE1jlwsQl/wbFMyoD1dfwpSmT8YF6+1qPE3kXBc2VcDOCjTYrHvIP+g==
X-Received: by 2002:a17:902:db01:b0:216:2bd7:1c4a with SMTP id
 d9443c01a7336-22a8a0659a3mr39917885ad.26.1743780477923; 
 Fri, 04 Apr 2025 08:27:57 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2297866e3ecsm33570655ad.198.2025.04.04.08.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 08:27:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] hw/riscv/virt.c: change default CPU to 'max'
Date: Fri,  4 Apr 2025 12:27:48 -0300
Message-ID: <20250404152750.332791-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

Hi,

The 'rv64' CPU, the default CPU for the 'virt' machine, is a strange
CPU. It is a collection of extensions that were enabled/disabled as
extensions were being added in TCG, and in the end we ended up with a
CPU that we can't say exactly what it does.

This is further aggravated by the distros move to support the RVA23
profile. Patch 2 has more details, but long story short: distros uses
the 'virt' machine, and they'll start building on top of RVA23, and rv64
does not have RVA23 support. In short, distros will start to break in
the default 'virt' CPU.

Changing the default CPU to 'max' will not cause (intentional) user
regressions: if the software runs in rv64 it will run in 'max' too given
that we're adding more extensions as default instead of removing them.
In my opinion this might be enough to avoid a deprecation cycle and we
can do the change for 10.1.

And yeah, patch 2 mentions the already old trope "and ARM does the
same". This is intentional: I want RISC-V code and usability to be as
close as possible to ARM and other archs to promote a more homogeneous
experience when developing and using QEMU.


Daniel Henrique Barboza (2):
  target/riscv/tcg: make 'max' cpu rva23s64 compliant
  hw/riscv/virt.c: change default CPU to 'max'

 hw/riscv/virt.c            | 2 +-
 target/riscv/tcg/tcg-cpu.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.49.0


