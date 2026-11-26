Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD16606A31E
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LOmABge0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWaaT-0007ul-2C; Thu, 26 Nov 2026 09:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaaC-0007eH-Ld
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:21 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa6-0001h1-Ua
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:20 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so75741545e9.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 06:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795703773; x=1796308573; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DW+Tq9s7bAuq40IVRsHiajWOijY47D/nSd/bFeQOF/4=;
 b=LOmABge0HkzZn6E9ebjnoyAoX7VW1d+uPf14xY8S8f7l4qyvH/hrJAYWYvvf8BeZaZ
 EQ/M0OlXnNWe4CKQvNUKPTuX2GQzoopLluLHw4AI9WwN+OAS8kUWE8x0BBUomoXAWNE3
 0XdzTmJrVAUqFSZCwrgLohl7g14MWzGY7d+ZrkleCTKN/RphHzSebXl1eOlSApSVq2As
 uLTs2XDlG8BzhS84dYervC4RlyNRBMZrHKyNH705z5YhdBWxh04LOByrRy0HQhUUAFtn
 my5s4UDMPO2Y+JiaIdWN3kH0TVsgUnPB4f6AkuZt/wNwYQO2XAFkwm6sjLRAj0cLZ1s9
 jS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703773; x=1796308573;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DW+Tq9s7bAuq40IVRsHiajWOijY47D/nSd/bFeQOF/4=;
 b=sNReyNMSC6Fg5jm0jf+Q+tY3HOLsvL5/Rxfj7Daqu22WXJLWc2Sx9VYiBj0CrNddCp
 aDNV78MLykXDyQd1kWSdPI5EHVcawtZspHFEpdB23LTlzy400ojBYVoFuM9rg+gkLnUM
 f3hx9SufWRg2ICK0tiLbvx/hsSTPh+TfaASphhEBWr/qpdTDl3lf4AbXyBCJXYVyAKpa
 0LtFRN/h5kHYMFlKJVmf5BjIu0GiwJhy0weG6pRaNzSwz0+RgzRnwCAM0O1AGbo/Pdvv
 nr9PAroK6tr3tGxroxVzJ2tD1YVgHQG6OAHjnqpwE1kCUcEQWY0Yglcsl/lVIzW45KFi
 YSPw==
X-Forwarded-Encrypted: i=1;
 AL+hErFiQsF5sW7YOmqURbq+wEKPQblxc4p7HdmPXEuIbboIXQ0y/TvQY8WqYTEESh7nBTgd13wFmBly6MrI@nongnu.org
X-Gm-Message-State: APuU4Z9dgBLdgtHXigZWm3pT6emFxTkN4cmchJqrpSNrA/U11+FAGLiW
 NQRDw53e3xVQhhY98M8L8byWWLQmc6UTHt0j6kxtOViVDJciUjVCZV6mli1xhjV0goM=
X-Gm-Gg: AZFdTZdwQ4E5QyyujW0q+LpRXYdIFXGmJpalVWOblEcE1yXrnYG7UWORBgy0VB3YRqt
 svd8IQQMi59F+bO6eQoThe+JfGN8rLu0yyJf/TITIi6KiVhdIthp4u07AWmCXNiH/HrUG/ZyKwu
 W9mlXeF4TuBcPWPZeRI9UbeIWnmcP2J6spFQf175urKzZQhcpsqVJRcRlJmp1EqN8VaAaz6wcll
 weqRioKOe8Yzu0d9icXaFqPC5PSFhJUBX0LJOKHb93K844AdIRQbQE9qm+7ffFAuTNYB8gqhSNG
 Jh5hNqPwoLq+G9d5z52iRvtidO+KjSVLfeCk/TseH3srcCVf14IH6cj/9sbK1B+Bk/m2Lw184I/
 9aFouF8VOzImuiFvhE4BZs64955mudc51twngids4UkTIg5F+CdxIMsSaUtDfkLfj1WoSeLgj9v
 NibM4gSKrm7MlwcFxGemfqVcnHEs+q9to4kecphFaFmSRhEw7tUQ0idH9eRCa2wUhcLb3LAIWK9
 7OzYMeQG8TT3nAfQkYFNXYS/UAtCWH7XtUpNuU9AHFzZmGcmsoovQt6m7x3HoMIbNf2GnJdy83F
 FYSLpQe2Sd5pCK1FeBJDPq5KcTxX
X-Received: by 2002:a05:600c:4584:b0:4a7:c366:d791 with SMTP id
 5b1f17b1804b1-4bb887e266amr412153615e9.1.1795703773310; 
 Thu, 26 Nov 2026 06:36:13 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8d4f9aa8sm577987155e9.4.2026.11.26.06.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:36:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4C4C05FAC3;
 Thu, 26 Nov 2026 14:36:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 8/8] docs/virtio: add note about virtio-gpu acceleration
Date: Thu, 26 Nov 2026 14:36:07 +0000
Message-ID: <20261126143607.2374676-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126143607.2374676-1-alex.bennee@linaro.org>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

3d acceleration has a bunch of issues and is considered hard to secure
in our current setup. As we have dropped it from the virtualisation
use case lets call that out in the docs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

---
v2
  - also mention in security.rst
---
 docs/system/devices/virtio/virtio-gpu.rst | 12 ++++++++++++
 docs/system/security.rst                  |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/docs/system/devices/virtio/virtio-gpu.rst b/docs/system/devices/virtio/virtio-gpu.rst
index d05f8cb8e3f..06e60ec6782 100644
--- a/docs/system/devices/virtio/virtio-gpu.rst
+++ b/docs/system/devices/virtio/virtio-gpu.rst
@@ -29,6 +29,18 @@ host's GPU and for the best performance be able to reliably share GPU
 memory with the guest. Details of 3D acceleration requirements are
 described in a further sections.
 
+.. warning::
+
+   As 3D acceleration by its very nature involves giving the guest
+   fairly complete access to a bus master processing unit in the host
+   GPU we consider this outside the virtualisation use case with
+   respect to security. You should only ever enable 3D acceleration
+   with trusted guests. There is still the option of off-loading 3D
+   acceleration to a separate process via :ref:`vhost_user_proto`
+   depending on what guarantees that process can make and how well
+   confined it can be if things go wrong.
+
+
 QEMU virtio-gpu variants
 ------------------------
 
diff --git a/docs/system/security.rst b/docs/system/security.rst
index c0254fef113..322ef003536 100644
--- a/docs/system/security.rst
+++ b/docs/system/security.rst
@@ -99,6 +99,11 @@ an issue as a normal bug.
   crashes / undesirable behaviour in QEMU will **not** be treated as
   security flaws, but should be fixed as hardening bugs.
 
+* **virtio-gpu** with 3D acceleration. While VirtIO is generally
+  preferred for the virtualisation use case we make an exception for
+  3D acceleration given the potentially large attack surface it
+  presents. You should only use 3D acceleration with trusted guests.
+
 * **memory allocation bounds**. There are many ways in which a QEMU
   process can legitimately consume an amount of memory that is
   significantly larger than the assigned guest RAM. QEMU's worst
-- 
2.47.3


