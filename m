Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCF6CAC586
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 12:51:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvbLH-0002HI-7I; Mon, 08 Sep 2025 08:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uvbL3-0001rv-4S
 for qemu-riscv@nongnu.org; Mon, 08 Sep 2025 08:51:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uvbKv-0005Qx-IT
 for qemu-riscv@nongnu.org; Mon, 08 Sep 2025 08:51:16 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45cb5492350so27969915e9.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Sep 2025 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757335861; x=1757940661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nxPytzeq6dPngJT4hbcEIQRox1Pjr2WlO0kU+VWzsNQ=;
 b=KI6+11hpGUo708lRewtQ8Pte1mbp7EhsEmrCYSkgbXNhHnpTdMg7iR8BLlS5K14mql
 EzMOetdj2IiwMvgiOgbIWAu4j9+hmtwLrQ/TYH9emtjQWqAOJJ7+R1kg1CDlOPYONjK+
 h3aHJ5FUjLoNLIqzJTLZRLJ52fEaAI3X4V0NS9vd75YjEyhmWK+MpS0BbDOHpw3+PEO2
 wpkDrKDsAJEEO0I6ckmHM3AUwwXWJF3rAgNoHImpro8jv1OrmRN/jDdOXq7Fa00vxvu8
 kuaf2PYdKovR4SG+HZPE3Vz1QkjRR00WLalrpNUOqnkNFK3vBg0SLPb7UPDZboILxNK1
 6VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757335861; x=1757940661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nxPytzeq6dPngJT4hbcEIQRox1Pjr2WlO0kU+VWzsNQ=;
 b=gcUzEB+ReK/DphFVMNoYHkSVmavyAsL7WbFpuG2ax6GecasNOtaxKEFb5v/AVzlhZr
 vjxPOnQq5Nb8DTEiXRQgAdCwgP1ClD3/DNmBEjm7mtlGWAwl1SBKy6GQKU3DrNcoMCs9
 1s8nijq4oh090dVF+cyo/A+kff7S5+LQ9y6TIZJwS367eYyrAb+q/dFONN/6de2lbBiv
 aQh8kGJC74l92C1sByJvitW8NqFHl9cgyce53Ihvv39SxA7J8VzOClimktS6qlpOUcV5
 KnPYR+izYyT+F7q7K2ZpKgfaYb4t/b2lM42hbMt+BfuPvktJ9SaU8Lv3Z1EJ1/+9chAA
 R2sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeFUrR+ZbSRrxrGJUfOl/+qW6HQnGd9D9tcFxIQtGYeGY5EvHppNHp0b0kdSKffsgb9qhPi5/QIOv7@nongnu.org
X-Gm-Message-State: AOJu0YxVFnl2nAWt3Oza6ZnSGamtt7ejJHAWiZnWXl1vcxJ9mydBnaF8
 +YrJXu6L5BXbhaqrWUUAJJmdhFDGw1VGkMdtKoKi1cozd9BRdOBA1zBXI2zmVfgNJcE=
X-Gm-Gg: ASbGnctz/Utf84DMxDco5ApRf3oH7OLFB6jc8aoSTSpRNSAoJsLxMz4+lNBEf/v/HKi
 uAGYNSuyaCKDEbhPvCZLss3ElJTC6Ih4dT7J7bdpwgeIFndvfQhndu5NOqtNjcIonVUO5KwKDUI
 frzVTAKxKLsqGuK+VQ4+GfavcGewLExMyMgDhRVR8Tp60y2owiPemW51vCvWKHZP/8ZkI23UZEX
 UqpLyKtz9vHhBjYvcUsJhHucSb55xO2DYbZBMNN/JMAoEJZg6gYJjChHUcDtEX1wqtorxhSmbn5
 Gs/j963R/6TYY8p1hRu4q5l/ySdDXX1ObWj4j7URIAJOkoBuijsysz8WG+i6otTRjR5PmiV8gPR
 I72FWM8OLgZCb9R2EPFjLfjWPnFRF
X-Google-Smtp-Source: AGHT+IGsDim/DMSViM56KXy45ZJJdjM1w8uuhVmP2tGMEZ4H5/V+mkgrys6of98GIjOlt/H+9UXilA==
X-Received: by 2002:a05:600c:1993:b0:45d:db2a:ce30 with SMTP id
 5b1f17b1804b1-45ddde0d828mr63620025e9.0.1757335860663; 
 Mon, 08 Sep 2025 05:51:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45deab47e5dsm15240425e9.2.2025.09.08.05.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:50:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
Subject: [RFC PATCH] docs/system/security: Restrict "virtualization use case"
 to specific machines
Date: Mon,  8 Sep 2025 13:50:57 +0100
Message-ID: <20250908125058.220973-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Currently our security policy defines a "virtualization use case"
where we consider bugs to be security issues, and a
"non-virtualization use case" where we do not make any security
guarantees and don't consider bugs to be security issues.

The rationale for this split is that much code in QEMU is older and
was not written with malicious guests in mind, and we don't have the
resources to audit, fix and defend it.  So instead we inform users
about what the can in practice rely on as a security barrier, and
what they can't.

We don't currently restrict the "virtualization use case" to any
particular set of machine types.  This means that we have effectively
barred ourselves from adding KVM support to any machine type that we
don't want to put into the "bugs are security issues" category, even
if it would be useful for users to be able to get better performance
with a trusted guest by enabling KVM. This seems an unnecessary
restriction, and in practice the set of machine types it makes
sense to use for untrusted-guest virtualization is quite small.

Specifically, we would like to be able to enable the use of
KVM with the imx8 development board machine types, but we don't
want to commit ourselves to having to support those SoC models
and device models as part of QEMU's security boundary:
https://lore.kernel.org/qemu-devel/20250629204851.1778-3-shentey@gmail.com/

This patch updates the security policy to explicitly list the
machine types we consider to be useful for the "virtualization
use case".

This is an RFC partly to see if we have consensus that this change
makes sense, and partly because I was only able to identify the
machine types we want to cover for some of our target architectures.
If maintainers for the other architectures could clarify which
machine types work with KVM that would be helpful.

Notes on the listed machine types:

architectures I'm pretty sure about:

aarch64:
 -- virt is definitely the only supported one
s390x:
 -- s390-ccw-virtio is the only machine type for this architecture
loongarch64:
 -- virt is the only machine type for this architecture

architectures where I've made a guess:

i386, x86_64:
 -- I have assumed that all machine types except the "experimental"
    x-remote are supported

architectures I don't know:

mips, mips64
riscv32, riscv64
ppc, ppc64

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/security.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/system/security.rst b/docs/system/security.rst
index f2092c8768b..395c2d7fb88 100644
--- a/docs/system/security.rst
+++ b/docs/system/security.rst
@@ -35,6 +35,34 @@ malicious:
 Bugs affecting these entities are evaluated on whether they can cause damage in
 real-world use cases and treated as security bugs if this is the case.
 
+To be covered by this security support policy you must:
+
+- use a virtualization accelerator like KVM or HVF
+- use one of the machine types listed below
+
+It may be possible to use other machine types with a virtualization
+accelerator to provide improved performance with a trusted guest
+workload, but any machine type not listed here should not be
+considered to be providing guest isolation or security guarantees,
+and falls under the "non-virtualization use case".
+
+Supported machine types for the virtualization use case, by target architecture:
+
+aarch64
+  ``virt``
+i386, x86_64
+  ``microvm``, ``xenfv``, ``xenpv``, ``xenpvh``, ``pc``, ``q35``, ``isapc``
+s390x
+  ``s390-ccw-virtio``
+loongarch64:
+  ``virt``
+ppc, ppc64:
+  TODO
+mips, mips64:
+  TODO
+riscv32, riscv64:
+  TODO
+
 Non-virtualization Use Case
 '''''''''''''''''''''''''''
 
-- 
2.43.0


