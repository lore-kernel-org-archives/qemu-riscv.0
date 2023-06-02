Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B9BC7EE33
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 12:17:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q53iU-0004Xq-Ie; Fri, 02 Jun 2023 08:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1q53iO-0004XF-I4
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 08:17:10 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1q53iI-0008IE-V8
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 08:17:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so20336155e9.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685708220; x=1688300220; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MhangMvHJjdaPhMX2/Lbj4p+BUY2mJrM3MiE0wIUp6s=;
 b=2VGPeWHV9hIdxC6U/K2uK3f1I+/QxT+wh3F+y9Azyk3s1nfURPNevq83Wq76twrhgW
 XV0HxQPiuG4xr1riNsaqigi1Pl/XhxDki+SnB2YsMuLyYop/dyNo7lWoTLFWHSyB2UmN
 //rPp3UjT1a/3G70xfOl3Z2HXoJWooAh31q71iTljKrzabcbsmDpyqNFkzcDkw51ajKm
 nv7up76MwehiMLAlN0S3Pk8vIbCwmwMuBv9ReHzIsdAnmkK/7oO9VEjwdzQKdiiPDMNd
 Ci7xFUL4rI5P1/lPNx+rUXdxGCsTrtmU+/A1yEfh4lAS4j781Eaet/uRAqFIlLhzRToL
 UEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685708220; x=1688300220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MhangMvHJjdaPhMX2/Lbj4p+BUY2mJrM3MiE0wIUp6s=;
 b=SvB9LHPcMYUX9FqlcSNMJdzCMs+zqnqMJVt2gKBza7I5VlgwSlODgyZNjKQFpGyASX
 O2qgKMF/BtiFp08qz2dmQk7nSiVYMeMcNbP1n6Zc8QLp2dQ35IwonYkHQeFLfkTki19S
 LqEqSt+6sC/coR7KedSvVyDkS0BN+wxbEZzzfddEUCmcAgwgwDtRES5FTWqhxiqVusZC
 AUGfrVghytRdkMknSDw1Qps0ryTXriCNSwjG0DhqdFyX8gGCocRZsvQXPqCoLGPDdvf5
 W79JgH0mSqzm66BcbAWmxc62UIHTAvdlNSS38hb9y2CNQ5y6ru5HnOFBy9ZtCo6DKNuv
 5mEA==
X-Gm-Message-State: AC+VfDxO3Mvk5a+VJycgkWmaABqPFOko6LZkX64auqbWnoPPJIx8rPQB
 0cvEcpcr82fAUMelOcrzEAidaDYxC/rYA6ucEyE=
X-Google-Smtp-Source: ACHHUZ6t1Tv3nGqbU1gA25sOo6xJ7QVbMYhIVrBxEqGv8+lnNza512fMzymCGu941Cx/t/Dt/w+mZw==
X-Received: by 2002:a7b:cc85:0:b0:3f5:fb98:729e with SMTP id
 p5-20020a7bcc85000000b003f5fb98729emr1888364wma.22.1685708220549; 
 Fri, 02 Jun 2023 05:17:00 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 z16-20020a7bc7d0000000b003f605814850sm5391847wmk.37.2023.06.02.05.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 05:17:00 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: RFC: target/riscv: Add support for Zacas extension
Date: Fri,  2 Jun 2023 13:16:37 +0100
Message-Id: <20230602121638.36342-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The Zacas[1] extension is a proposed unprivileged ISA extension for
adding support for atomic compare-and-swap. Since this extension is not
yet frozen (although no significant changes are expected) these patches
are RFC/informational.

Cheers,

Rob

[1] - https://github.com/riscv/riscv-zacas/blob/main/zacas.adoc


