Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB2CC28B28
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 15:57:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsORz-0005qd-18; Wed, 12 Mar 2025 11:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tsOR4-0005TW-9N
 for qemu-riscv@nongnu.org; Wed, 12 Mar 2025 11:56:03 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tsOR1-0006BS-Cu
 for qemu-riscv@nongnu.org; Wed, 12 Mar 2025 11:55:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso73901725e9.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Mar 2025 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1741794950; x=1742399750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UOdaUTcClFq5xfQidKy1NhBGiVo5JORsaakmaIBhmno=;
 b=eIhfiZ4imoLL5KU3MEQQt0s9L2+KbVZ3tthXWb7jssdQ2aHLLTXdyIvs+ur9EC3t8A
 M/wfgvSRzd7sr1Ikov8dn3Xdmcb53fy/SEdsTGxHhaZ7QD67JfO5TdxKaPkA+qEn7h1e
 2/gJyS9Mbt4YwFyyWk4/ysS2YDInQ2YSD1reDdSSCEC1NmAcRt9d5E8Sncq036qx8QmV
 /QAbEqtqiqybWlFJCoEx0AKUjLdz7cP6ULnjJG6SoPMVrO0RIqBPmPMZQrzmGLK0sVOK
 uLLYaWl8lsgZ7sz6+SPMAHrq5U9OrA/lhTT0ZorQ0oamXngX7TsUFFLEiUZEp4YA2X2w
 wM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741794950; x=1742399750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UOdaUTcClFq5xfQidKy1NhBGiVo5JORsaakmaIBhmno=;
 b=nKrFgge2PXwx0ZcB8YKApD5mZ2Ejl6RF+Jp5AMEERNRIn6ZSC7OAiBy39mlGG3GanP
 oZW28VQTzEt4KQDgRK2y1mhuP/yKxqL8vfEakMuOFelSX7422qsIn/kY/k5iSz6YXh8Q
 YQFsYUS3xjmGkxKb/c0VSLkxnWu9mQfaKhEWUhzNO9JnTjq5tMLCxaS3+tXz757FVL4i
 BbL4xGvcNkYQ6nPumo32dCP2+RfisT+8sED5VStNDTlfD2X/ZNtApoL+1GXi4oHgKHhc
 J1G0sg/YGy6pvzb0ApN2G/L9V3Jylc8BweM1XIuKJ8LV6SkLaAknm16m91fnfrZ+3pVG
 m/aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2UtPFU/oc+f9KUTr0TWsTDCTYmHMgSffxfRCyVZNyVGNjwKZcCFeZgDDRWEOrRSe6/cGIwrnle8UY@nongnu.org
X-Gm-Message-State: AOJu0YzCYCJyTzjC6Oc6OWXam1SIJ+1/bOrYwVmwAXTjoAuDciTYPwWI
 Ln8jTPuaF1xM6g/ifjAFyB5MMcH1rCEsTiUjrfNe24UNPDuqQ0i2VeQBEysnfY8=
X-Gm-Gg: ASbGncuA2BG0M/PQfrQE5cfprCaWrkZcO7uU6lvSJqDzgWaH/85WfHKefTalzvlVz+R
 ZhDdLZDG39Q8TsQF9I9BOMAE1TppXjxBxY+14Lgn4HxevdsFWC6oWl/WSOdsfdwOCh1AvH2IaNT
 8hs2VYEaWl12f3KnH92PuSozPwWCkpzo+Z9eEE8VgaCSEgcQBC6Ti3gdKl+u8bYrThvpf1H1mp6
 RJK5cegeHGkv90aHEz0C0WGOTliSyX53z8INt92VhfsjLfbxKxWF4jVGICapROM7LfZq3wgBYNz
 FZQTXUkbr8+ECASzajNqixmUXgsh9LNeb1R5RWkooK9+4z7LsUP7/oXSGnc44iQmtrea7zCPCQ=
 =
X-Google-Smtp-Source: AGHT+IGS5LCdMh0dqpnxbcxt/VveBsr57HrqT00nn6Y1Zwc6SbVwJkiFD4DHvhbV8eUcEOQgj9knbw==
X-Received: by 2002:a05:600c:4fc5:b0:43c:f969:13c0 with SMTP id
 5b1f17b1804b1-43cf9691636mr124446855e9.29.1741794949779; 
 Wed, 12 Mar 2025 08:55:49 -0700 (PDT)
Received: from paolo-laptop-amd.. ([2a0e:cb01:d3:f100:3f9b:7278:8381:286b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0ac26758sm23583115e9.35.2025.03.12.08.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 08:55:49 -0700 (PDT)
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
Subject: [PATCH 0/1 v2] [RISCV/RVV] Generate strided vector loads/stores with
 tcg nodes.
Date: Wed, 12 Mar 2025 15:55:46 +0000
Message-ID: <20250312155547.289642-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wm1-x330.google.com
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

Previous version:

- PATCH v1: https://lore.kernel.org/all/20250211182056.412867-1-paolo.savini@embecosm.com/ 

Follwing the suggestion in the following review by Daniel Barboza:

https://lore.kernel.org/all/9be2ecc4-fed3-4774-a921-259f36e23b1b@ventanamicro.com/

we simplified the emulation by tcg nodes of such a complex operation as strided
loads/stores by breaking it into two separate functions.
One function implements the loop that performs the main load/store operation
with the supporting logic to address the vector elements with the right stride
and to fill with ones the inactive elements in the case of a load.
The second function implements the loop that sets to 1 the tail bytes if we
are in a tail agnostic regime.

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
  [RISC-V/RVV] Generate strided vector loads/stores with tcg nodes.

 target/riscv/insn_trans/trans_rvv.c.inc | 323 ++++++++++++++++++++----
 1 file changed, 273 insertions(+), 50 deletions(-)

-- 
2.34.1

