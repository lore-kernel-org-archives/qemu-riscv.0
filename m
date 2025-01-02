Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C26FE77188
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 18:20:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tTPk8-0008Fq-U8; Thu, 02 Jan 2025 13:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tTPjt-0007PR-ND
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2025 13:16:11 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tTPjo-0006sQ-QB
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2025 13:16:09 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2f441904a42so16360534a91.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jan 2025 10:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735841763; x=1736446563; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6n3Ey0BMa2IfatRxBC8ClCoxhKKjolug6BuhijhMrb4=;
 b=kNOTls45dz83dNll+S0rs90Ty2j4JjYNEoQhlcqZlVtFOe8PwTIgKhZA0GkECd1smB
 j0f7YLU1/inpx2ttdGRPlCo7l4R5myK3WLM5pfltIJUDMvaZeJTaV3+bN9LcylTP/5tH
 o1db6S6iO3C/WBcDNjDq0oNOT+Ujm12JsU9THva8ZYyiAakBEjmF19BD/Lt9v3Djh0gd
 54OuZ6HbqW1uE1TWDIr3V3aHuZBiQaqtnWpqcoUIo2S/RQzztelqnMh/Kp25RGXyalEB
 Mnt219lklnM1oaFwodciJLY/SvDAvLkG10lCigfOicuBoeDhlJ0C/GsUYrfhuNiSwFmg
 p2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735841763; x=1736446563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6n3Ey0BMa2IfatRxBC8ClCoxhKKjolug6BuhijhMrb4=;
 b=PXbomeTdJ7v1E/u1ElGBKWVZSm/libWlc8Ah4qs4opxnt0/QYnAXD9AhJIE5j6APBa
 XD/qSNs9liFpDNeOceWXNBi0oXgfzbcJGL+u4IcVNlduRuidvnF0DZxJyIEgNfbxwQZs
 53vToukF2On8jwxFE6hcawwIJmuAUupfvci8VFLIq6D3eiO9xEeKafGhkMOL3iwz1JkX
 tLkvnO4WKhTLr4Tq8hyp33QTj73Ju9O5/MseFrcdQtZVRHlbPLryyxsfqErjaUyAH4Jw
 V7pQQUhYp3CLArKRTe1XY/l6C2CFdYEKxX5V3hEO7xO36rN4ZqsyUoRAXj7QWjY3Bt4N
 wJMg==
X-Gm-Message-State: AOJu0YyYvDYSSvxJ0wh4AAqvJaettE5uyeK2eYdIJ4ZQlegFtwjtPzKZ
 OfgJJTT9EbLwVLbctr2+m2zM7EUDQ3YayVmt2wmYNMuHr/pZs2F2VPSr8SrxzY/RThSduk0KYIz
 w
X-Gm-Gg: ASbGncvq7Jr8CbkfZ7lXD9jC6Y3GMlt30KJIrV35PglFmJhB8PiAFowTEW2kHwHo/aB
 9zmiN0NnEWaWbt9icmX1KiKPZGx+F+VU0rCcDlpAoITJlk9DxqKy0UYnwytqvCe6IekY3kb/z/q
 CaV3iacxJ8ucvttRWCafH+XHLZ9Qcz5XZJjzeqXYn9+QVdy6H/kOY6C7Lk9IewqxoFJx0Wf66ob
 i3rLUdSwRpc+728E67J0Xsz+FIqTTjFDAqOM1Z54my9qYam3UEyHVBUFNLsww==
X-Google-Smtp-Source: AGHT+IEbv6jRzoHjZUHIoSd5rezU6F6dIGTr1rLMUc0BitnFiESjNOmtuyfKKG76NnFWq2ORgcgq2w==
X-Received: by 2002:a17:90b:2e4a:b0:2ea:b564:4b31 with SMTP id
 98e67ed59e1d1-2f452e3db0bmr68138350a91.19.1735841762961; 
 Thu, 02 Jan 2025 10:16:02 -0800 (PST)
Received: from stoup.. ([63.239.63.212]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f68e4sm230148315ad.211.2025.01.02.10.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 10:16:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	palmer@dabbelt.com,
	Alistair.Francis@wdc.com
Subject: [PATCH 0/2] tcg/riscv: Use BEXTI for single-bit extractions
Date: Thu,  2 Jan 2025 10:15:59 -0800
Message-ID: <20250102181601.1421059-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Based-on: 20250102180654.1420056-1-richard.henderson@linaro.org
("[PATCH 00/73] tcg: Merge *_i32 and *_i64 opcodes")

While riscv does not yet have a completely general extract,
the Zbs extension added a single-bit extract.

Tested on cfarm95, a Banana Pi BPI-F3.


r~


Richard Henderson (2):
  util/cpuinfo-riscv: Detect Zbs
  tcg/riscv: Use BEXTI for single-bit extractions

 host/include/riscv/host/cpuinfo.h |  5 +++--
 tcg/riscv/tcg-target-has.h        |  8 +++++++-
 util/cpuinfo-riscv.c              | 18 ++++++++++++++++--
 tcg/riscv/tcg-target.c.inc        | 13 +++++++++++--
 4 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.43.0


