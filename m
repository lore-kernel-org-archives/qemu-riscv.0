Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862A1D0BB7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 10:31:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t3v5A-0000ss-NR; Thu, 24 Oct 2024 06:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v57-0000py-NN
 for qemu-riscv@nongnu.org; Thu, 24 Oct 2024 06:28:41 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v52-0008B6-4b
 for qemu-riscv@nongnu.org; Thu, 24 Oct 2024 06:28:41 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cb6704ff6bso918004a12.3
 for <qemu-riscv@nongnu.org>; Thu, 24 Oct 2024 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1729765715; x=1730370515;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43Rqa3rSbEjTn7/M1pMockmjAAn+2b2pe334Yd8EcZ0=;
 b=W0Mqz4T4S4R6tkeOLRFstQLj0Sy5WUh0poDANHG2wWSQqZkV1Z+6wILSCWUTOFY85Y
 nOpL1EGjoD0Zsbmph9Yqs3L+lqumRuuK9JzaMNG4t4jECUB97XyfTDsZkiWuN11vTVAo
 fqrMhWmZIycVMWUGR0C2+TP3qphs/uI5ujn81m+AMQi37EnTbKTMNnraUFgVySNt8fds
 v7SsHPBBvD0MAeybplS4pFBf7LJ3aOOgmsQEv/4xnMeKLSHZa8yBLB2M8AQsH3TKPeFB
 P2K5T8pX9eY+GrrM0QxQnnDRc5K4zUgFD7Lm7bEDXzUjuEUIz6HA7bQVkR/pB7PP5SHR
 dvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729765715; x=1730370515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43Rqa3rSbEjTn7/M1pMockmjAAn+2b2pe334Yd8EcZ0=;
 b=Yg81UtnzDPUojuajTXgjKWC3s1VmXsqD3rMVd3LYi1REt4B6wH3ymF24clJoetfHDX
 nKWc3pZhaN/fow95vcuJj7pckAIHmlBQoLzgM183zmYJrDyMdK4w6/686Q+OhqZBhxTt
 VpHePQpAgLNyVEf5asUZTtSPB/1oZyMb+3PFY74eKFT3Pq8nlG1CDq3HmpCs8Y9l37V9
 GCHUPTgnJpUona1TrsH8XflhPp9cFd+FGyHGj9PsCpiZXPcJHvBt+RuqwWF+DYWVL1eo
 mrDg4xiGO8mg8iCem4moIhXtId3bWOOdUz8ZDgLzvpYtP3/6oSfmxkDByczthzasD0rD
 v3rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7h3TuhtISqU0UxKxLqGBleFv7UQveAKmlmhMNRngFedD68jkPIElP229qjLypC22QE0jxGbjkBMdg@nongnu.org
X-Gm-Message-State: AOJu0YzXviEI1xJJr9EmPkfnYnyvdxcC9cp4RagBwlPymKdo67KDPGws
 Sg42Gs6HuWTsO6qkYgfQCFOglZ7dO4eBz0dOgzwDEoSG9fpGxvBUaMEgY7JVdw==
X-Google-Smtp-Source: AGHT+IEpYl4Q/8H3+GW9gpPBXgzVnIWs1IvZEfEOnk8FJgaWRP+LahGIuJT7uhMHwtwmXMFE6w9Yyg==
X-Received: by 2002:a17:907:7216:b0:a99:3318:e7c3 with SMTP id
 a640c23a62f3a-a9abf94de69mr532170966b.43.1729765714570; 
 Thu, 24 Oct 2024 03:28:34 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913706d3sm601019066b.134.2024.10.24.03.28.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 24 Oct 2024 03:28:34 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Thu, 24 Oct 2024 12:28:03 +0200
Message-Id: <20241024102813.9855-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241024102813.9855-1-phil@philjordan.eu>
References: <20241024102813.9855-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::530;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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

I'm happy to take responsibility for the macOS PV graphics code. As
HVF patches don't seem to get much attention at the moment, I'm also
adding myself as designated reviewer for HVF and x86 HVF to try and
improve that.

I anticipate that the resulting workload should be covered by the
funding I'm receiving for improving Qemu in combination with macOS. As
of right now this runs out at the end of 2024; I expect the workload on
apple-gfx should be relatively minor and manageable in my spare time
beyond that. I may have to remove myself from more general HVF duties
once the contract runs out if it's more than I can manage.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3bfa132fd6..16ea47a5e6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -505,6 +505,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -512,6 +513,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2580,6 +2582,11 @@ F: hw/display/edid*
 F: include/hw/display/edid.h
 F: qemu-edid.c
 
+macOS PV Graphics (apple-gfx)
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/display/apple-gfx*
+
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-- 
2.39.3 (Apple Git-145)


