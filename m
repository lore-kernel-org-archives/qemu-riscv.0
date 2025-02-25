Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB5CC021BB
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:02:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmxON-0007oH-9a; Tue, 25 Feb 2025 11:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tmxN0-0007GA-4G
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 11:01:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tmxMs-0001wL-PM
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 11:01:17 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43996e95114so38434665e9.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Feb 2025 08:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740499255; x=1741104055;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D0G1BlFEwahcM4AHHFlaoJCV2Tx9e8WvmvlKENfqIqs=;
 b=1pQPqI8MjZMJj9f73A/2n5VqSu3nxCNbnNTHwx1ZCUu3AXU6x3zzLap7PrLKEoraiw
 1qN5mddC5mceLO/CpBUUJqZ0m/ElME3LS/GZxXSww5qjsk2KkoZKiZPRtjB7O80p4DoS
 YUJ81LnfD7GECt42DG9VNgCpoCc7vRcDVXiONesvr2cdBJfnGGVFOQzEjwCLnr3di+eU
 3fj9uAA94KqRH6mte3eHdVCrc8t8VHdjd/c7uYlXuW8ch4HYmjsQPiZJU4aGGAtl+dnm
 EXe0urdWU7FcKhBgYruCDtqj9kE40pX8MVWDhR4XuU4iZX5dIsa3fsG6D+49IOTzaBNR
 5C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740499255; x=1741104055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D0G1BlFEwahcM4AHHFlaoJCV2Tx9e8WvmvlKENfqIqs=;
 b=cp9ys7lfFSY/36WGpnZBXKes2Etrzy5rW285tkMAeNB7yTip+0O/wYwrb89DA1BR4a
 HwtfukyfVXOGHyau36yfivqPyuSuNha+9rm/wxlTpWBsM9gvF/adxZcwQuXz10fE0Yon
 /HXbsLfMqxvFFcCsK3gQSwjSnPY1o8osOcSYxQqtRWLez6Aiy0lRxkScX4gMpiLxZTWN
 mK7qxUve/Bw/tC4u3DH7fVdPDn3Uh3obu0VvAgp7tDt39PawVmJT5pa01cYjeRJPfZ1l
 yqbwk4OjaIV8pyn/OS3JJDXQwhc0Yz47y4UbU26tV750IOBp309e5zcMiTIrWOCGtSvD
 2XDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW47A6eP/g7A0zfpDJKK59NjO0mPOaboGLpxMERT3dVwc3mYVSoCaEFhsImkpqwj8Mp1s0VX5BFu5e8@nongnu.org
X-Gm-Message-State: AOJu0YxQ/+nW5fw91uj6tRlrt25IYCjIwbL4IsKCnCd0kBIfVHGjwLoK
 S4PESkOu3wnXNCpT45J1ZMBMuZVqph2qCEcOP03hPgrcgLiylOhWMc1BBrizTlg=
X-Gm-Gg: ASbGncvFJUlFseg9GIn6mtMgeDBShNCie+r0J9B0gBiK7rLfEeSOC3mhOO5Pxh6UBST
 lOMbBUX7m3c7wgiQRNZatWeOkmJsgcjRmf4IO0JzSi83C9b3j1TFGLgr5KoKND6Nq01XRFA9NZC
 3dA5SCeWHDJlinfB01Lx7ZX2VEmNqmPapiifsTzAkSq/ShIs8by1L0fVtknUYm/HUtJGvfCfq6l
 r9ppurgtqmSxjIdTvwk3O6ceNLrExMMtiob7bxTFfQTrr7FuZkXAWcrdZw2QChv05012SDqYl2G
 h1uG9SgcqGK4ZPAqTJDYdc2asV3GfN2O3sZ3grquG8p4y0TbAJtKLTAyMfXmm9+wJWPBKjVCWQ=
 =
X-Google-Smtp-Source: AGHT+IH9/nIdXEJG8xS0y2So5FuCfzYmG8qjQ2yNx1oWH8TLHk7/aqf2xNxzTgkojx5IEwL/KxLS4g==
X-Received: by 2002:a05:600c:4ece:b0:439:9274:8203 with SMTP id
 5b1f17b1804b1-439aeae0543mr145133975e9.6.1740499254652; 
 Tue, 25 Feb 2025 08:00:54 -0800 (PST)
Received: from llx1.cad.pilog.net (lfbn-mar-1-50-94.w86-229.abo.wanadoo.fr.
 [86.229.28.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab1546df4sm30530755e9.17.2025.02.25.08.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 08:00:54 -0800 (PST)
From: =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
Subject: [PATCH 0/5] target/riscv: Smepmp fixes to match specification
Date: Tue, 25 Feb 2025 17:00:47 +0100
Message-ID: <20250225160052.39564-1-loic@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=loic@rivosinc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

These patches fix Smepmp implementation to make it compliant with the spec.

First patch limits RLB to CSR changes since RLB should not affect privilege
evaluation. Patch 2 extracts some common code into a function (to be used in
patch 3). Patch 3 fixes validation of pmpcfg CSR writes in order to match Smepmp
specification. Patch 4 is a small optimization and last patch is just removing
redundant code.

Loïc Lefort (5):
  target/riscv: pmp: don't allow RLB to bypass rule privileges
  target/riscv: pmp: move Smepmp operation conversion into a function
  target/riscv: pmp: fix checks on writes to pmpcfg in Smepmp MML mode
  target/riscv: pmp: exit csr writes early if value was not changed
  target/riscv: pmp: remove redundant check in pmp_is_locked

 target/riscv/pmp.c | 151 +++++++++++++++++++++++++--------------------
 1 file changed, 83 insertions(+), 68 deletions(-)

-- 
2.47.2


