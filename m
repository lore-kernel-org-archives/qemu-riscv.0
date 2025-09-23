Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B016CAC5A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 09:09:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0z0E-0004Mz-UC; Tue, 23 Sep 2025 05:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1v0z06-0004K9-O5
 for qemu-riscv@nongnu.org; Tue, 23 Sep 2025 05:07:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1v0yzx-000054-Mw
 for qemu-riscv@nongnu.org; Tue, 23 Sep 2025 05:07:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-27d3540a43fso4611435ad.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Sep 2025 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1758618460; x=1759223260; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TwDWGCnzVp2md9jXpRmyhyahuiECd2RbbH3vyHCO39c=;
 b=VSegOUCISJxf0MPjEJItY8T/GsP/mFR0mPjN3ReETZaAXkgRV+ani+sB15x48CPpfa
 Yr/es7SqCFNE+msk5d4YrXrlNlXRMZGDHmRFDDsMiBSOj+8bLwSnZU6FKoVO2ezFpgzC
 Iy/ZPRwkekoIClgFI/QOyWQE0RjJ9264N3VoP4wkouwch8Li1CgkN2EjpNOb9JwBRYUh
 enb9+7UArA2dp9Xde2j3hu0ZCRZvkv9PdqyRVYlPiSHAtYX9Nj6jqN7Jn7hc4Zs6I3jJ
 ekt8xiGRhRAKBy9RU4AteZbYRyOwXaRemG912wSaUvgaSlZjt+suW2OK+kg3ayCV12ei
 Msfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758618460; x=1759223260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TwDWGCnzVp2md9jXpRmyhyahuiECd2RbbH3vyHCO39c=;
 b=JvG7DVcY3i2semJTkl4SMbHEqDdoSDkujZbLS5258l8hDgVQbLu5HH6q73Ztq8Se2I
 vavmkJubGNen3Y9weqp9v3k0S2T/9hsNZgz8mniMvRLUz5d1ch2ROlPN1N+v44375DeQ
 U15NonXGncbxdcGwtMswubUiyBn9iFZEpkLPZ/kvm1keLYijvM9NTTBiZyBg3ywP+P5T
 CRbPnt0DAbO6fuslWy9DQdP1AfKQQDyV1lbUhJZ+3nKMsW4CY0OA5DVxCiPLgt2TMqzh
 EIGgw2SJWpHGAz2y1olxlPFxnuEixZx1JRRuk6CHmXDI/aqM8OJaRU/R4Jtls8AaEyPc
 KRKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdpI19sRnTl7CxHrBNApvZNJWjWJsptW8A2tdYPMwsvSsGaaGD7ZMjAPDpo1Bg8caw1K/ye0mRXnsX@nongnu.org
X-Gm-Message-State: AOJu0YzQzChf0jTaLcGbGA3l58/zaSwwvNfWccaLfi1kj3PtgONgYQdS
 1ZHj+DC2/7j7aA0KKLLjEfVWB8wArH6YQXyHV4XPX0LqSWfXsxr2Klu9F429aZzGQsk=
X-Gm-Gg: ASbGncstqIIEhYfPBvipJ6POjkH0/YqaoJDTZyNGK2e6y0k/VQHXHqB7b1u/M8AIee7
 6bmWnroQ5ukpnCorA2YY9KvnG8CfbnlPI7WNlEZKFORKG7C4sqCZPKHbNQP+Gxl6etfVPVtHsck
 DLCcT5jepbS9FiJKCu2Au1k+pVI4DpR+2c3NUKblyXzcnGz5mvC2DJmFp/EH8rKINByaAIfCaJh
 aceR/AMoxweL+580JN/Jx311c8bBDsEJYAQe5crAHJGKK52iRAGamJ2qxY9wzx9Fc12LZ1+3Xgp
 1FMjQdkPi3wkVfRAY5hCE2qLsrIeQ2OGMZIDRJbWJYZ8SEQ7tnyHDMwKiGVjPmk0VCb5DX6KY37
 VldNlC8c3V4wnr3z7oWZvh6XcQWQGCgfwSu3xZ1aqLuwdR7mmh3DPyHS45f576G2kC04=
X-Google-Smtp-Source: AGHT+IE0YziYtVaKy+f37OepKYp/a2J1JQbC7hktUlSENlG6gniAMbzgLAxoaPdn5ApY5M5NkbnctQ==
X-Received: by 2002:a17:902:ec84:b0:249:3efa:3c99 with SMTP id
 d9443c01a7336-27cc7f92191mr19399125ad.61.1758618460280; 
 Tue, 23 Sep 2025 02:07:40 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269800530b7sm157486245ad.18.2025.09.23.02.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 02:07:39 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 0/2] riscv: Modify minimum VLEN rule
Date: Tue, 23 Sep 2025 17:07:27 +0800
Message-ID: <20250923090729.1887406-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62c.google.com
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

According to the RISC-V unprivileged specification, the VLEN should be greater
or equal to the ELEN. This patchset provides following modifications:

* Replace the checkings of standard V with the checkings of Zve32x
* Introduces a check rule for VLEN and ELEN
* Modifies the minimum VLEN based on the vector extensions

Extension     Minimum VLEN
V                      128
Zve64[d|f|x]            64
Zve32[f|x]              32

v1: 20250627132156.440214-1-max.chou@sifive.com
- Rebase to riscv-to-apply.next branch
- Add patch 1 to replace checking RVV by checking Zve32x

Max Chou (2):
  target/riscv: rvv: Replace checking V by checking Zve32x
  target/riscv: rvv: Modify minimum VLEN according to enabled vector
    extensions

 target/riscv/cpu.c            |  2 +-
 target/riscv/csr.c            |  3 ++-
 target/riscv/machine.c        |  3 ++-
 target/riscv/riscv-qmp-cmds.c |  2 +-
 target/riscv/tcg/tcg-cpu.c    | 21 ++++++++++++++++++---
 5 files changed, 24 insertions(+), 7 deletions(-)

-- 
2.43.0


