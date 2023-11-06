Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA91C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:11:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxOo-00067e-Vr; Mon, 06 Nov 2023 06:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxOm-000645-Jz
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:04 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxOk-0003gJ-8W
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:04 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso53602571fa.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268640; x=1699873440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPtEnXMJWXTavrW+hTGrjLz6IdGpJzROhuSvymabGIo=;
 b=p9co09EvtEhyV+0iMFvP8l/SD6Zri4nNAVsabpDWHywl4jXrqKB48H3ttuYAKNrMFy
 LQ1VkvMJEYiEWlOMZauNo763B0962SlMVQ+YqXHuA/6lhz6jBZ+/3QUZRDM4ZSXTYnMC
 ESKPz+t+8v0S+8t+UVtw4tYcmJeTf7rIPB4exwjgWSBglgYwktNRwX9fTubURCf+eOSK
 CBjmG2kMoFf4rlH6XFR2N70fhK3pjbqBv7KulUNcm+UoiLVD7V5D/xH2CIxL37ghkM9b
 aM8QVK4xi0qHMsZGSCaDzwMEAsLl5arOzatiiOGbvYtXpsvE0b2boP12YIRhiWTgbyAv
 cu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268640; x=1699873440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OPtEnXMJWXTavrW+hTGrjLz6IdGpJzROhuSvymabGIo=;
 b=qEX3T4kFl4tif/mlBqi5F/+bWBU4g3q/qJnI0SSV6skLDxKJSCccxhUS76jjpW/SmZ
 Z3P6bjHSpmNIsF7I+RHnJ3gRqbwCginIhevuIB9tEtH1iz7LCP8eIoSyiBLQOmfzG2ul
 z/SrNHCCGdE4vsVFRdTPfGD2E/fz8XYXOGQTxiQwUlYrgUW3KaSq4lfDzqkOaRfLFjI1
 qxXG3jQR+U3NDEPIC/jMci112l79zABKu3G2zaEtzOKq9H62NQSITFPbCaQQ7X8RpXvm
 RRi06ZFndc0hksskVl1cQ4xh1FyjvjQzqGCDB5PtXBPJGTyJxBMDsJK8mrRzocCIQzrV
 Ce/w==
X-Gm-Message-State: AOJu0YywobdzY67VckaevSs1Z8AXf0rmV1z4Vb27KkNWKTMxDJ/J4M+r
 1Tjh+vSQgnEApzOv0FyGdG4kvA==
X-Google-Smtp-Source: AGHT+IHnmaFN+GKLxd2N49xPwJp/PkOfW8YFcpTs0zHKDnkUPvcBfxvj2jLWyUiBIPgGTifMjl5zjg==
X-Received: by 2002:a05:6512:1282:b0:505:6ede:20a9 with SMTP id
 u2-20020a056512128200b005056ede20a9mr26978590lfs.65.1699268640437; 
 Mon, 06 Nov 2023 03:04:00 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adff48a000000b0032fdcbfb093sm19447wro.81.2023.11.06.03.03.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:04:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/60] tests/vm/ubuntu.aarch64: Correct comment about TCG
 specific delay
Date: Mon,  6 Nov 2023 12:02:35 +0100
Message-ID: <20231106110336.358-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Wether we use a software MMU or not to set the SSH timeout
isn't really relevant. What we want to know is if we use
a hardware or software accelerator (TCG).
Replace the 'softmmu' mention by 'TCG'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231002145104.52193-2-philmd@linaro.org>
---
 tests/vm/ubuntu.aarch64 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index 666947393b..eeda281f87 100755
--- a/tests/vm/ubuntu.aarch64
+++ b/tests/vm/ubuntu.aarch64
@@ -25,7 +25,7 @@ DEFAULT_CONFIG = {
                      "apt-get install -y libfdt-dev pkg-config language-pack-en ninja-build",
     # We increase beyond the default time since during boot
     # it can take some time (many seconds) to log into the VM
-    # especially using softmmu.
+    # especially using TCG.
     'ssh_timeout'  : 60,
 }
 
-- 
2.41.0


