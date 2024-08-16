Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F99C531DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 16:08:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sezUU-0006ij-Kp; Fri, 16 Aug 2024 12:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sezUT-0006fQ-2J
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 12:07:49 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sezUR-0006br-AC
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 12:07:48 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so278453166b.1
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2024 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1723824465; x=1724429265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iM+5udRhqlu06GCwx5XhEDrXDkT/XqzKJwlAvAiH6NI=;
 b=KofQj4CRRGEhC65L7JH0grsNB6BJYynAG/gCoYODbzTd2E+z8ka307BxZ3iy/24RCj
 nlaGfhC4xoC6MMxPGGDvYW03vR6h8D2iaZ7MYG3zipf8JMNxmN2QIVktEfElsNh8jY02
 RstGHdoVPv7cyEoCSrmETYgoLNu5PxxS4cPNP5mIdJmXEjrt/W17veWhpw4RAlZ22fk0
 6nc3FUKnrPnuIMmR/XTZsshoVefcQhTBDd9Fp0XhR6v/q1b7ntmeiUYsJeCZptve/Aur
 Y3HXXV/E1YQwrJDSnClc3A6r4dt8rnfy15bA6VPQ7nDDPVHDYIbiWZFwC+56cQXdajmG
 AQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723824465; x=1724429265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iM+5udRhqlu06GCwx5XhEDrXDkT/XqzKJwlAvAiH6NI=;
 b=Rc651+0DJfKnrWIxMi9C2rrt3ws3qjV1rEnGTFirsvU6qyGrbDcXIim3OwTHDKnKPb
 ZUVKuVOM6DzpQ2av6T/gtLr1oco5VyEBWHbFOX4YpO5SwX+ducF9izcoF1X3rR5SiyrE
 iYHh5B6Y4uccXkQ677poSU9jRhzS1QnX4dprwTc3EXaQi85MDoOH9tDKh4oOVCGbxgIw
 buSt1CLWZ5nhz2LExGvNGbbralhNUiUrJYQxP6b7vw4HIb1pe4lSDchjzl7es5jBxNpx
 Yiqar6CWKCHgrIR5Rdthsoz3BhOVk65tD+5WK/3wayoLJNsscHxvgzu/AVkX0Pu0g9mh
 n5vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMmsIOVSsdvo272MzE17VkoZ1mz+ioSGS+ab+iuGZCYWRlDwUwYV7bbuG3MaBo+YxvwxlRnnWdG7hmOKgLINT/5bSIru4=
X-Gm-Message-State: AOJu0Ywdxy8clgJaLyzT80y/Op0DCmHEw1oDQktl4jW/hD408zNbHBRQ
 hSwWQlDryGNAIp1hM910IPj6md0FbJeU+i6ii4ba2dB3FZg2G41qp5pzQkbtIsY=
X-Google-Smtp-Source: AGHT+IHGb/DnkpbwydMJMfciuD6xr/pCFhv6B+yKBJ5lJsrxoJJnDJHc2uRWPQ/z3QnugN1l+eDKCA==
X-Received: by 2002:a17:907:746:b0:a80:f79a:10c9 with SMTP id
 a640c23a62f3a-a83a9fbd239mr4093466b.12.1723824464596; 
 Fri, 16 Aug 2024 09:07:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c70afsm277611166b.15.2024.08.16.09.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 09:07:44 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 dbarboza@ventanamicro.com, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] hw/riscv/virt: Fix PCI devices with AIA
Date: Fri, 16 Aug 2024 18:07:44 +0200
Message-ID: <20240816160743.220374-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Linux does not properly handle '#msi-cells=<0>' when searching for
MSI controllers for PCI devices which results in the devices being
unable to use MSIs. A patch for Linux has been sent[1] but until it,
or something like it, is merged and in distro kernels we should stop
adding the property. It's harmless to stop adding it since the
absence of the property and a value of zero for the property mean
the same thing according to the DT binding definition.

The first patch stops adding the property by simply reverting the
patch that started adding it and should be applied for 9.1 since
it's a fix. The second patch allows users to bring it back by enabling
a new machine property 'strict-dt' which is meant to be used for cases
like these going forward. There's no rush for the second patch.

[1] https://lore.kernel.org/all/20240816124957.130017-2-ajones@ventanamicro.com/

Thanks,
drew

Andrew Jones (2):
  Revert "hw/riscv/virt.c: imsics DT: add '#msi-cells'"
  hw/riscv/virt: Introduce strict-dt

 docs/system/riscv/virt.rst | 11 ++++++++++
 hw/riscv/virt.c            | 44 +++++++++++++++++++++++++++++---------
 include/hw/riscv/virt.h    |  1 +
 3 files changed, 46 insertions(+), 10 deletions(-)

-- 
2.45.2


