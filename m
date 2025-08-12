Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0230ECA0EC4
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 13:50:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ulpNe-0002SQ-3S; Tue, 12 Aug 2025 09:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulpNZ-0002Rk-To
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 09:49:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulpNP-0005Bf-Qw
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 09:49:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so2594575f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Aug 2025 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755006552; x=1755611352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cKcO64ShFrfRsSCI/jgxMemhLXevpF/HYu5Ube0T9Dw=;
 b=ndEBB7DPjya67dKfNdU6BAKviPzrGR6Y3LAB49X7XetRwGmq7LCsThhNSFaqIR+dX1
 fu/QmVGEvwY+clumAW6r9KS4CjQVOwV53fbXD79lrgfKa1+3+OgMSfc6+C/x5liu4rCQ
 w2nNNAAf+wBDB+Vm/gTnfVzSQcuga1hD1fuwO16Gfk3jIftxJjYPWbpRt89c+i9GVSJq
 ZKne6h4XY/T3JLSLg+FfLWaIjXNLtGNl2LLq6EcMY9y29IxAHtF3n4n5GqCFtWI42cgs
 g4VSFg/FJEtuyIOzeDiYIAvz0oG9AqWmsQepeqP+jfA3C+AirndYt/QDbb75Ekv7Drc3
 Kx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755006552; x=1755611352;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cKcO64ShFrfRsSCI/jgxMemhLXevpF/HYu5Ube0T9Dw=;
 b=Q5hrUQlQp641yfVecdg4X7vvl+QXbhS332ilgyMLWQehdyqebd42PwzzlPp9aXM1ZA
 rcE07cTd4hvKqKtzhbwvpAz3XTVqVYCREsiBQRpHoBMAwSHUL+SDOG+u++B2UWt0YucR
 qhLVFfoVEDN0E7yMEubQI6gZUbKQjjbR22ZHC0gqp7OBXDu4ApS4iIJu5NqJsRQbhTQd
 xqmsVD3SWrfkH0w1CAlCFoxTCrhTOaJgo5Nr5HHI7QSS3MBMJq/uYd6pTEB608XR+tuR
 3s+/mg9HJ4mfSV1siQ15OII9zZQnKz9PKN10yNYesxLJ+uY3SYM0+y/iFxfd7vMAgEqm
 hIzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwhTwSUhFWl7Fe55iGux+tYF9hYcK4V64XkXy1Zyf/Eu6Vfi3YdepkbDkgRTZSW+oG1BLqC1CHh4TW@nongnu.org
X-Gm-Message-State: AOJu0Yw/81/X0MbKqHitJ9RvZjbuCv8f798Jtl2gH7ZahCzF4LNFyaqi
 myFwIvRCVIEjISiIX0tRnvCEcTEXOdJcia4dMuNKmuoaIO98PGbqehuootNrdNCMttw=
X-Gm-Gg: ASbGncuNBl5BPphBWVTw4Iec2qgIVMeaRdIXhhaz1quWKTS7BjFQpbmSTxGOcT15RvP
 GNNF9ytwi4N3f+B8zILFXs01G6iR009mpyats7BJRPlmM5J2ZQDBm+tdIuc2NzBYbE/93CcmpB0
 apeFGD9EMVfGWvNRv7z8VAt0YOTfUAedx4Ozf8IpM2nylYTnM5o/UK8qZH3CwjMnU8WmSQsYasR
 l/aijKdy9xkCRO9Uc8Wlj9cJomR+8bAGVOaYggDTTjZ/cQ4ArA14TSLvuVKfi2SFZtZg9u8hZPe
 qCVxSBuYdViSdSbAA4uES6ZNGI1Co17uQNZtK/+1J8fKPmhzzMFzr71t+TwPp/p+gYpUo8KY18Q
 RTaOa6KatGKjssbrHPQzk3psQOM1qu+w6p2sP1IIhvOFpv2xQH4dSfkHRLVuDaGrJ6vyh88PA
X-Google-Smtp-Source: AGHT+IHUYe4A7c1ysZzI1PQmm5BEm6pRWRY7NkaP/NXgKb8U2gwDKYIWd+s7d7VyUBN/FOSA4svl5Q==
X-Received: by 2002:a05:6000:25c2:b0:3b7:9c79:32a6 with SMTP id
 ffacd0b85a97d-3b911010e6emr2229279f8f.47.1755006551893; 
 Tue, 12 Aug 2025 06:49:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45923c34af8sm399709575e9.24.2025.08.12.06.49.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 06:49:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair@alistair23.me>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org
Subject: [PATCH-for-10.1 v2 0/3] hw/sd/ssi-sd: Return noise (dummy byte) when
 no card connected
Date: Tue, 12 Aug 2025 15:49:06 +0200
Message-ID: <20250812134909.69531-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Trivial fix for the issue reported by Guenter here:
https://lore.kernel.org/qemu-devel/5b2dc427-f0db-4332-a997-fe0c82415acd@roeck-us.net/

- Return dummy byte when no card is connected
- Add a test
- Document ssi_transfer()

Since v1:
- Reworded patch #1 description (Alex)
- Removed '_' test method prefix (Alex)

Philippe Mathieu-Daudé (3):
  hw/sd/ssi-sd: Return noise (dummy byte) when no card connected
  tests/functional: Test SPI-SD adapter without SD card connected
  hw/ssi: Document ssi_transfer() method

 include/hw/ssi/ssi.h                      | 14 ++++++++++++++
 hw/sd/ssi-sd.c                            |  4 ++++
 tests/functional/test_riscv64_sifive_u.py | 22 +++++++++++++++++-----
 3 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.49.0


