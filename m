Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824EFC5DF9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:12:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSOI-00037j-W7; Thu, 27 Aug 2026 01:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOH-00036W-D7
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:11:05 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOF-0004A5-QX
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:11:05 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2d5cad1a6baso3606155ad.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807462; x=1788412262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0rPIO/eJ4fCcyXhjl8aHWuRIEQEoWUmTA8VQtKKUv40=;
 b=n2Lyj2rZXnhOCRDT/rYsGgsRP8Vg2zFrx1UkAtmTGvMONU8fxYTbW5LvUgU0DEPZgp
 yd1NGM3adHzHfWaeDntlMnsNrNmTQwVxcbDy4VwBVirpxS15ZKwSX93AG5kicp1XHY4L
 3JXqFwuV7ooohhOTY8BiA/RSsZZNOU7BNd9kXqUalUnSmyCc7d0odRsNxnnvJHtxtHT4
 UePvb/9LZjr9/Skn9HbZjMQd35/sPkdsPuq82i+6pLXI472kfj+X0QHxg1Yn6j4nylcd
 IxPusnRwcPhT3Z1dkd+4aueNZ028gD4alJBXAm1nfZ0/Q9pxAioVjE/WTNdDXg58uOSO
 abJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807462; x=1788412262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0rPIO/eJ4fCcyXhjl8aHWuRIEQEoWUmTA8VQtKKUv40=;
 b=NdK1L+dKQhxVJQxmGgysTth3ye7Vggz4Xy2T7qKNeXS8SMX66WLYTyw7ar4V1C+BXd
 5Ktrg7CaYckRKSuiQCxxAaD+uXRRTrsp33Ek/zCQz5S1vFPlJxwICW2qpQdWArJF9Dkm
 uPBLQK8AXS2NoMhyN5cNU52On7IYmCjiouwP9hVX66JYCzqFc0pCCXAaShvZvjSBOxVU
 ggfxR4VLRIqlEy0+zhLOE5RrBvKhx4SeFBVYI7+C1mOTIgEx/hM2uXDL3O2y4IXCDLad
 7DE7Bv2GZHMrG4atJE+Ywgf/NIvutQ0AKTKEx8rpUr6htlSAj5kbXpDsbpaxtvWrKRQ1
 N3Qg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr+H8JnhU+ugnU1Xcm5YQN1cWibIm5TfMMaweKDSJELcoe4/QuWaQtozCiV7BN12+sDyAeSuQwyyf6B@nongnu.org
X-Gm-Message-State: AFuF++lUcVSE9KDgeUvH/vIi8ZRLHeye5gKQAKCPGEB3qQz7mW5kYBzb
 puV16hzgEshxAbZx/sfR42EyaU/O5RVRBc3OVA6UtjSNtB8/eT130fd3
X-Gm-Gg: AR+sD101YITMTfkvXv4guVP4AsEMXeTDYZeCrlb7X7oXTOSJO9VB9pDcbTz8THu3Q0+
 NtowzrF0hD/77vnlWVuLqSKulUHJAssodSVqPLH90FB7VUo1yVpT6SkHwGYPXYEBbgahjCLw/jp
 f0JyL6Vwfm/7WfCwDbVMg912qJV0iIse+6/2yQEqgxeFh+mjFFc8FMVBVyxOmlsjhsEfiERrLqB
 hP216HyFW1KfdiAWrxbCIUuOIvmJsqKb5fMAjpdk2mEuxUvS6vykrb5KY/zvIPcwXcPN6sgxqk+
 7vsVFNM6zw9codD8vhaaX4u1HZchMcl69iJWL6+h+NakXtD5Z1jeVTmKG3tmQ/cYddn/f09mmrJ
 T9BKO5tj+QGh8PtACZxDdvd1NcuAWXdsugnSurocMTp4Mmjh+l9ZbCyIA+WkSuB34SCtVbJ+0JD
 qFCALcCbYgvM+9kh2K7Gwo5B/HSSmMthIG4jq/JbZJYXlpBxkWKrx+FZaJCNmB+IaS6JQEOVB6/
 d8Mg/QriZ9x5DalmEtfdk96g3geaV54Y4sOy+n6Wp+/NGKg9RDiyKm3nPoDEcz34HE1fcvCw4bg
 ahchT89f7pMlJdtLG9Ov
X-Received: by 2002:a17:90b:3cc3:b0:393:194d:5366 with SMTP id
 98e67ed59e1d1-3966d85de70mr26456394a91.10.1787807462371; 
 Wed, 26 Aug 2026 22:11:02 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:11:01 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 08/12] tests/tcg/aarch64: Don't leak memory-sve CFLAGS
Date: Thu, 27 Aug 2026 14:39:47 +0930
Message-ID: <20260827050953.67184-9-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The CFLAGS are added to prerequisites, so if memory-sve causes a build
of printf.o and boot.o, they will be compiled with -march=armv8.1-a+sve
-O3, and the executables that link printf.o and boot.o after that will
also get SVE instructions.

https://www.gnu.org/software/make/manual/html_node/Suppressing-Inheritance.html

By marking the rule 'private' printf.o and boot.o won't be built with
SVE, which avoids SVE for other binaries, and is okay for the memory-sve
case.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 3f30be6c5d63..196a2afa50ee 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -51,7 +51,7 @@ memory: CFLAGS+=-DCHECK_UNALIGNED=1
 memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) boot.o
 
-memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3
+memory-sve: private CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3
 
 gpc-test: gpc-test.c $(LINK_SCRIPT) vector_log_boot.o $(MINILIB_OBJS)
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) vector_log_boot.o
-- 
2.47.3


