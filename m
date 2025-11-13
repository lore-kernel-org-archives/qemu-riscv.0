Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACECCD8CAD
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 17:18:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vJawi-0001Pt-7M; Thu, 13 Nov 2025 12:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1vJavg-0000SG-Td
 for qemu-riscv@nongnu.org; Thu, 13 Nov 2025 12:16:20 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1vJavd-0006Yj-UB
 for qemu-riscv@nongnu.org; Thu, 13 Nov 2025 12:16:15 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7b9a98b751eso547520b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Nov 2025 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763054170; x=1763658970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/+VeEoZv4V+FvSeUptBC/KXfvYsV2MVEcENr2lwOWwc=;
 b=mZhI6WYi05KFUdNsihfeeEavp+lBpIry/Jn+nApxUA8s5Gy/DTx99SqBEoc9B3b0Dm
 jTQlcGXvfV0X0wW1KTS0Lm6KVVKU5+tOYFY+LhtPmqNQ3BixT0v6RemwhcBSlPyWeYfz
 BtxBBjOy9gHsxl/004N2KcfM2V/39hLVB1L1/ujSWilWonbgcgtLuzLSbZBsCmq1FfqK
 We8VUdazr+oQRGVWVH5EwB+XpfdPQzY/Vy9cLFA5VJ3Z2PjTQeSyJDakRqp3vt4OV5zL
 bL1lQbJ8Mmrf241rSkG2wjAzTLgv/wFk5fF47FWvOeODNBciyZz2rUK/tmdz7sHZmydf
 jEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763054170; x=1763658970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+VeEoZv4V+FvSeUptBC/KXfvYsV2MVEcENr2lwOWwc=;
 b=Yu3oseUceO6mmPsYlh7pOHW0/ZcrYTO6A9lP2mP85FjgSqy028IY45F63fEPevJj6c
 k4qtSPhP2jsoDdk7G5Z2caanW4P4eaTtyv92dRUFKmapwPXsrGV5QwbnpxeMLhOmu2ZC
 xxlthYMQJRSnddHZZv2Mv4C9DhPUmDAMeavqXThvUpykAmmjyodn7MGdRNcGA/I/HLdr
 G14+YME+B/HFUBuySKHTl5BA1qCWAVQKn3QltR+piL/LZAXyI9jQCxJ5gaGRI4FtufHH
 hd8KKMM+Zs/Gb2IZDJ7FSuwL8g0tAlONeZvVyskNIlYraGQNU29z1PFkRqpUJzsl5EVj
 +3nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP6xqSFhYt2lFZ/ivy7RndX24AwYp8qSa6bRTBFtt1UAzRAYm3+0IBs/MEisQKyNhX8fUMDlTLZllH@nongnu.org
X-Gm-Message-State: AOJu0Yzfgs2k9X09lr62ZMrqxaB06sDbi61sJ/D2y87bDwF/JAodnVWE
 cu10X6b81H2wxfWbug222b4NUj1oTyoAGJKwndkEmS+9rfyQn4pyPEKYmzTGXzTGJAY=
X-Gm-Gg: ASbGncv3idpmqSKZvELI1cnr8y52eOhMdCQM3JgA3ysdwhdzcGzVP+ijkSG8EnIpbxD
 1DpwPpG6aM9Bf26h5E4x6ZcvyoRJqQd+z2rQeKVLjbebwrlB62v5gt2dWlDjnp3Sc0gZOdTNeqC
 Jqt/jN+xsMb4zivoXU0wfcLwEG8VUEPQf05I76fx+ZGnBMqEjElhuZAJgHbAB05RR3APervpHTu
 1TvXB8Vm43dqz5KqdIimrs2eoiYlld8NwxwfBxkooByMIhlOloKIXSZ7olTuzPYUMcftpYlEM6V
 bncJgG4dL3t922RR0S6oO6kZcoXxXiz7IJ6ovgOt9HRc+Mp98CHornmn8PR/wzYX8Yx4hTeiGy/
 gIw6WYf9XZIUSIZpuujRylYYBVGzepZ2uzG166Tj2dSYXdNLLv+z6j51jvg3Z1YeSktRwkr+Oh6
 PBdm8hafDSwVBvRhnHQ/2Bh0nJ8Ne6lIPWbDLWdR0xkh3C
X-Google-Smtp-Source: AGHT+IEHBFRC8Ia81Bn5aRJ2lYYjp8s4iP0yWvKhtWNg3wFs/RKokcr091JozWC+cLaNiUzGS+mpcA==
X-Received: by 2002:a05:6a20:3c8f:b0:343:5d53:c0ab with SMTP id
 adf61e73a8af0-35ba0994bf2mr439167637.20.1763054169896; 
 Thu, 13 Nov 2025 09:16:09 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc375081023sm2712992a12.21.2025.11.13.09.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 09:16:09 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 0/3] Fix some more RVV source overlap issues
Date: Fri, 14 Nov 2025 01:16:01 +0800
Message-ID: <20251113171604.3034161-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x435.google.com
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

This patchset is based on the v2 with following update:

* Update the commit message to distinguish the affected rvv instructions.

  Reference:
  * v1: 20250415043207.3512209-1-antonb@tenstorrent.com
  * v2: 20250627132022.439315-1-max.chou@sifive.com

Anton Blanchard (3):
  target/riscv: rvv: Apply vext_check_input_eew to vector int/fp compare
    instructions
  target/riscv: rvv: Apply vext_check_input_eew to vector reduction
    instructions
  target/riscv: vadc and vsbc are vm=0 instructions

 target/riscv/insn32.decode              | 10 +++++-----
 target/riscv/insn_trans/trans_rvv.c.inc | 26 ++++++++++++++-----------
 2 files changed, 20 insertions(+), 16 deletions(-)

-- 
2.43.0


