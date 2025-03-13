Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75952C282EC
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 15:24:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tskPO-0007WV-PK; Thu, 13 Mar 2025 11:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tskPJ-0007Sm-TM
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 11:23:37 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tskPH-0001fK-UV
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 11:23:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso10461595e9.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 08:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1741879413; x=1742484213; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9nVjncuiVzGqqYqTlXbnw4WnIwWipltA0nH22oS5ZUs=;
 b=cRBt0bOZZmP17WXeUnY1fhrnL62vuZHc957vgyONqkbNwMS1IBE5kOy2v4QQuUPuRj
 /B8tlfTbF9uwTvIKZilhIM9NsZitNM2BVP9Xu07f4N/GujiyhTXI2jIc6tdn9obhXbDF
 jrH0pzwtmdHMNyCC5goL0jT2LIsZMTMbD4oN2rnvL1r9I98asrfu1XFl+d7sZUt/MoHj
 avMn5W7BazlJdAvbZbTi1s5JSk7MCLduNqUnlFaXTKAFpbErwIUR3MpaFBdxlAZX4ORT
 yvPjaJZKA+l9VqU9NejZqqxqPO5ghaWu6lhJSYzwL9R940L4rXpWjmPO1ZGaOku2i+cA
 7E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741879413; x=1742484213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9nVjncuiVzGqqYqTlXbnw4WnIwWipltA0nH22oS5ZUs=;
 b=mI+sibF9u8quIA9J7QOxFsn/sUchPzt7Jt+XLgrUAhoqSC9hKqJJCOrn4A0Bemv/te
 fEhTLP/UGMzNlVi4w2rahS+s+LrzT8oy7c1RZFy8X5i0gkqQZwGg6jKMtpMqt/QidmNZ
 d6WqTX2Z57MebHM50G54AvpWRlmqYEaPWwDkUIMdtboOhJNXP1PUFi7y08xgXmsel/Jp
 Qvk9EYhtwoBLZyDa8XHDv+uSgpli8OmfzoBt7bJKg0ZQJ5ehVfDwxWu5nGiGkyIvXbAw
 N+76fWsXOG4PFeJp9XzFD+6mSASvIauXQMl7LEDuVzOdMTWAbKmQGG+BcZY1N1kqtawj
 iaDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWA+RubuOfNeQXRK0/4NDI/mGMY/W5fisZP/fkBDLfAGpHOOHHsSN1olSc7HbOsXo+A6/EBz/KWzZS@nongnu.org
X-Gm-Message-State: AOJu0Yyn+aftePF1osVKJVeLOXmxmP1Y4TAbKbIDLp5ow+CCCg/0eR9a
 VfByeF7JDn9kGR37pEAyc/wizIpD19qZpHJnYtZp6X6WL3d/BakfWjuw7/p6Pfk=
X-Gm-Gg: ASbGncuH3rmFurRDpZYk4l3wuK+gVl96rcsco2vMi3Kzu5WPKMDuai9Xvr6XvgKjA4X
 mh7FoBGRxLjEYkLU/W4RDxwvEfStDQ3dLXWPpmOoQ0EZ6zvsEeXB3GaespVFmbklmbFQG5URytU
 Ym0u9WGmgRMm+xP6EN7MljHaIXRh/7NzYzEzTBrevqw3y+DmASMxs5zZjFgUuAOKZIi/z0eIoDw
 4t1+jVovxvfzHMIQSczxsnn94KK2//CConM1FvguctjGpOtTjGWhlSXonABFJqlBO+KBBDnAlg5
 PZ0ANAtjIhouXQMY4kZ4Ggy0nbOPP1SacEPh8Btb7EjsfHIWM4D42XZGbsDeb4OJpDEX6+7+YHj
 WlmD/wKq6AQ==
X-Google-Smtp-Source: AGHT+IEQMV2Zhvynym5jPJEeBEzsOTWLlS4hmQv6E96166TOjIAPpd2etOrK8btyzJHoNfGsTQvKLg==
X-Received: by 2002:a05:6000:1545:b0:390:fc5a:91c8 with SMTP id
 ffacd0b85a97d-39132dbd475mr25968294f8f.53.1741879413146; 
 Thu, 13 Mar 2025 08:23:33 -0700 (PDT)
Received: from paolo-laptop-amd.sou.embecosm-corp.com ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ebaedsm2462868f8f.90.2025.03.13.08.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:23:32 -0700 (PDT)
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
Subject: [PATCH 0/1 v4] target/riscv: use tcg ops generation to emulate whole
 reg rvv loads/stores.
Date: Thu, 13 Mar 2025 15:23:29 +0000
Message-ID: <20250313152330.398396-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wm1-x32a.google.com
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

Previous versions:

- RFC v1: https://lore.kernel.org/all/20241218170840.1090473-1-paolo.savini@embecosm.com/
- RFC v2: https://lore.kernel.org/all/20241220153834.16302-1-paolo.savini@embecosm.com/
- RFC v3: https://lore.kernel.org/all/20250122164905.13615-1-paolo.savini@embecosm.com/

Version v4 of this patch brings the following changes:

- removed the host specific conditions so that the behaviour of the emulation
  doesn't depend on the host we are running on.
  The intruduction of this extra complexity is not worth the very marginal
  performance improvement, when the overall performance improves anyway
  considerably without.
- added reviewers contacts (thanks all for reviewing the work).
- changed the header from RFC to PATCH.

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
  target/riscv: use tcg ops generation to emulate whole reg rvv
    loads/stores.

 target/riscv/insn_trans/trans_rvv.c.inc | 155 +++++++++++++++++-------
 1 file changed, 108 insertions(+), 47 deletions(-)

-- 
2.34.1

