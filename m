Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AF8CCD19A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 13:13:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v9NmO-00023D-B3; Thu, 16 Oct 2025 09:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9NmH-00020o-Nk
 for qemu-riscv@nongnu.org; Thu, 16 Oct 2025 09:12:21 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9Nm4-0007D3-Tp
 for qemu-riscv@nongnu.org; Thu, 16 Oct 2025 09:12:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so674777f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 16 Oct 2025 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760620322; x=1761225122; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XOUFNZvpHvqjnm/AtQ2K0Ky2w9UxP0NVE0y9sfgq5R8=;
 b=XhF08UrJ+8tx+TuUe3l6gYI6u/zxNdARqUFZFGzMaxe1FwubBWeNTbzGBqSlkNiXdt
 7hSs7N1eitfPH3uzPe42/VWebiNAtXfB6JOJlB9aTZgUaFtStk8gbrCJ99ePuu9tsrtG
 8FMy9zXoBbeGHxTpCM1cR57vVU/JywnYXKoN3IEQV1GYGnUpi3WwsPCyu7iA0Awzp/t3
 VfvfYLrGcx5RtIq1Kd3VfBJJQRVo7/QU5Udshwou0ci7MvxZgbSpjuEuJJUnSn/p4Uyz
 x20y3qzCN4g4O/adh5sK2jFa134/WcnjHHVJs4pp6Tlqpyty6J0iLMAJoeGaN/ESc+AE
 I/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760620322; x=1761225122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOUFNZvpHvqjnm/AtQ2K0Ky2w9UxP0NVE0y9sfgq5R8=;
 b=hFjqNCYcm1soRcH0yNMXTVaijeqwIe1iix8q9CheH6qDocvuUEF8cL8/giYH27KY3B
 teQWHSL2FHWNUSjI5aSp4z8K96k9MF6m4Kv6ojDZzR9Lq0VDV7IGS+G6uUCMK744Zony
 Q1hbohQfHc9qg5ftOHJNcuK4llBef7etEWIemuo3A/r3gIadlRUS6fI/CbTS1j2Frq/l
 /AMq/r6EmTR6VlNyGj5+CRMcHlcPWCI4HoyEwjI/9iquLpb6qPyuLr/rzxTRGfzz6ArB
 k/wtOfNvkv6IK1e5ORXG5ABs8RyTD/Iblze1wlp1TwzbfInI8rErtooD6CEpbvhVzqMu
 ll3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXryXZrLWZEw8MBXnnektgtYXNs7vglQifW6Cq/MIGigRVlrELXuTsfZCATomFTs3fzS3p4ZHm9RtJd@nongnu.org
X-Gm-Message-State: AOJu0YxceKl24oPYPY/qVhCy3iffDUFdMeVsB73Xc6BHKzsQbqZAzkJY
 t4CBrOTqHNfyd0cyZnADu1cVaNAEWzYfB1f9QaqSFXME9/MTs2Y21NQRS5ezKSsNX7g=
X-Gm-Gg: ASbGncu5PqbLqKvCS1yFHefNzvEuXGeMBmGQCOrqIyDpAJN3O/6ZBPM9W0IJHdyqyim
 3fLj2YiBuAJI71kBhxleZTF5TVO+obVTkLYbp1QEWOtTyEelFV4Zr8dOo4SlFy0fee8XzewojL4
 xUm38GlW5goc6v45T1Dli6FSNRS8PmgYB2GGlrvuN+v1Mb0GULQmqsuoL8iAl2FpujPdFu98p6l
 bosMsRrW7NdNTyvctLJqW3/EaLMceDA85xX3he4UTuR2W0DxIzycuC/MneVvBdXYPoCeceBiUze
 sj3bYAW74DmWQ17UV0+acakwot0iLAvZwGyw/1dVJb5PJnPUz1ncMRXDPE/qPNoOFmlhRtr3tE2
 mebsrdQaK89OmN6uBhEkHqQLp6R3LN9Ek9BbejVP3UvHIxaAYoC+jIcvW7cqDxBlONFEdeNiTwL
 X4T/NVENyblmdBqyNmJboC9NfLRrvk3l4=
X-Google-Smtp-Source: AGHT+IFbroAqjxKopL/8oWTHIEPp0sO95JEtiIY9HxkTTxB57rQwFTtY3xXmFhLIKybwLh1K7gC2pQ==
X-Received: by 2002:a5d:5d02:0:b0:3f7:b7ac:f3d2 with SMTP id
 ffacd0b85a97d-42704d9b22amr30802f8f.43.1760620321700; 
 Thu, 16 Oct 2025 06:12:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711443e81asm28033515e9.10.2025.10.16.06.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 06:12:01 -0700 (PDT)
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
Subject: [PATCH v2] docs/system/security: Restrict "virtualization use case"
 to specific machines
Date: Thu, 16 Oct 2025 14:11:59 +0100
Message-ID: <20251016131159.750480-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
changes v1->v2: updated the list:
 * remove isapc
 * remove ppc, mips, mips64 (no machines supported)
 * list pseries as only supported ppc64 machine
 * list virt as only supported riscv32, riscv64 machine

I believe the list to now be correct, and I think we generally
had some consensus about the idea on the v1 patch discussion, so
this one is a non-RFC patch.

---
 docs/system/security.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/system/security.rst b/docs/system/security.rst
index f2092c8768b..53992048e65 100644
--- a/docs/system/security.rst
+++ b/docs/system/security.rst
@@ -35,6 +35,32 @@ malicious:
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
+  ``microvm``, ``xenfv``, ``xenpv``, ``xenpvh``, ``pc``, ``q35``
+s390x
+  ``s390-ccw-virtio``
+loongarch64:
+  ``virt``
+ppc64:
+  ``pseries``
+riscv32, riscv64:
+  ``virt``
+
 Non-virtualization Use Case
 '''''''''''''''''''''''''''
 
-- 
2.43.0


