Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1C2C47DD9
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 09:34:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rnbII-0000AC-1w; Fri, 22 Mar 2024 05:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rnbIE-00009u-Km
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 05:34:31 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rnbIB-000877-Or
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 05:34:29 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-60a434ea806so20447367b3.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Mar 2024 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1711100064; x=1711704864; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8/+hfSrW/mdAYwfwaUDoq5Q6x6uBgXDbqUbcs84BAx0=;
 b=dIyhuG3ve2cFdSN3+LQvtHE7n6jC3iZCyqstujuyp+SPxOfJOIK2BYto/6CPSjHb4k
 zzyeGLytm25R7rqy600acHE6dtTjCcBP0w5Eco9kkQRNzqfnMl/RkruvlQFald8duChF
 LuywEaHR/8PiHRrwAaX3oY9rjkWytKyMRUS6C9ZRANTy6d4eFmZTuQOyeShSRBlzjfV9
 HVv64sgJiP2j6PctcdiSPfaW/+4Teo5Jq3J77Wmm7CUtnrDn7ZEPV5ebHo/Y0W1A10Kg
 vJBGutW3jXbCRWYlPXb89ovPilc/ClfHhxSjlq93EoEq1jz6HQNL33gOG+ZwBxOyh9r6
 U3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711100064; x=1711704864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8/+hfSrW/mdAYwfwaUDoq5Q6x6uBgXDbqUbcs84BAx0=;
 b=CLqZ2E54oJfCzfzj2a4gbBIReo9+Zdn3gmn8yF/ClfowoAd3yeI8Vkc8AgbJQM2I4J
 Tp4vAaRnG+rsAARz8aoyPUFGjnAEY2e7yLiVKxsU/65Sq+kT+em9kJhzMHbhYtCbJ9I+
 pKfMMMHG4qWdZ4hGInw8nJBryYvvh7c1EwR0+0VOrsvfRvOETtIMU97ptzZxxe/USbfu
 qPJbuJvSDUzOUbOLJ57X+MZCNhEK3+atBQR66V79Q/48flEyxmETpqQ34AlWs3onp4PP
 XfqV6Xb6dCH50YbQYbJsatviRoYywUsuQpKFKOd3yHtdP8WTvtxQSLEGeT7xsDnXBnuc
 /UFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsH/uBk7uOIdv8YiXkc3Xbko2JrfEXpeweKjZCyxlPVz/hRRU31Sj0lEJQ9E1U+qwtVhRt8A18anQHG8w1Xj/dLuuP7zA=
X-Gm-Message-State: AOJu0Yz7jYiQMe6aGZdEzqcITWf6JrHPV5ByU1yFqs1CioCs+ebHJO24
 m6fSiWszslfuTouah4rsP0JzX9yuEPuruhxJ3iIbIqsgjYigvPCkWfJtkjv6KAsFxh/RgphyAHP
 8yCI=
X-Google-Smtp-Source: AGHT+IFwvJO7Z4zoV4jXz1cUnNriDmsTFmmKvNfGgaZAvFlA6NbDv0PpC4+vXASvpQX4NIYAmTpmQA==
X-Received: by 2002:a05:6a20:560a:b0:1a3:6c9e:1e31 with SMTP id
 ir10-20020a056a20560a00b001a36c9e1e31mr1903807pzc.19.1711099564731; 
 Fri, 22 Mar 2024 02:26:04 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 z14-20020a170903018e00b001e088a9e2bcsm1380380plg.292.2024.03.22.02.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 02:26:04 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 0/4] Fix fp16 checking in vector fp widen/narrow
 instructions
Date: Fri, 22 Mar 2024 17:25:54 +0800
Message-Id: <20240322092600.1198921-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=max.chou@sifive.com; helo=mail-yw1-x1130.google.com
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

When SEW is 16, we need to check whether the Zvfhmin is enabled for the
single width operator for vector floating point widen/narrow
instructions. 

The commits in this patchset fix the single width operator checking and
remove the redudant SEW checking for vector floating point widen/narrow
instructions.

v2:
  Group patchset and rebase to the riscv-to-apply.next branch(commit 385e575)


Thanks to those who have already reviewed:

    Daniel Henrique Barboza dbarboza@ventanamicro.com
        [PATCH] target/riscv: rvv: Fix Zvfhmin checking for vfwcvt.f.f.v and vfncvt.f.f.w instructions
        [PATCH] target/riscv: rvv: Check single width operator for vector fp widen instructions
        [PATCH] target/riscv: rvv: Check single width operator for vfncvt.rod.f.f.w
        [PATCH] target/riscv: rvv: Remove redudant SEW checking for vector fp narrow/widen instructions


Max Chou (4):
  target/riscv: rvv: Fix Zvfhmin checking for vfwcvt.f.f.v and
    vfncvt.f.f.w instructions
  target/riscv: rvv: Check single width operator for vector fp widen
    instructions
  target/riscv: rvv: Check single width operator for vfncvt.rod.f.f.w
  target/riscv: rvv: Remove redudant SEW checking for vector fp
    narrow/widen instructions

 target/riscv/insn_trans/trans_rvv.c.inc | 42 ++++++++++++++++---------
 1 file changed, 28 insertions(+), 14 deletions(-)

-- 
2.34.1


