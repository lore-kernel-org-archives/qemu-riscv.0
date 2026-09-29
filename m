Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD03CA5FAD
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBOLP-00050a-KI; Mon, 28 Sep 2026 23:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xBOLH-0004t9-Th
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 23:17:20 -0400
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xBOLG-0006xY-3Q
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 23:17:19 -0400
Received: by mail-pj2-x2b.google.com with SMTP id
 98e67ed59e1d1-3a49b3e7bc3so88188a91.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790651836; x=1791256636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zozyAcbZ1VUQydZR7vvEW52sN1AndGrBgYH/TN5JD7o=;
 b=PH9JkYZUKeHJk4A6EmXZwQEXCMKOrO643b0LixbDo26G3wdQ2xMS+Y/x61q3T6fkAM
 zWjsnwF4btJRbrkuCI/CnYswxORxkk0TgAyVRWxIRLj0J8+bDNEGpTSJ3VL+YLnYfAiS
 wACbOHmX6dVDXBB8SxVdawPlIGvN4/YslXoKyOE//0xsR4i5kbjYabMbD33WBdHU/TLe
 yY1ym9HVLYoxfgem5r1kgevp7jgV4nWib+DRkTcJzrDdQIWiclWcvuzarHr70MniZ1YY
 l5AjvY3SXfocS+BMk8Fyi9h9iw1pzse5x0XAw5d+DwUsXqMdgMq+JXqWn5HfOJp/qGEk
 HoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790651836; x=1791256636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zozyAcbZ1VUQydZR7vvEW52sN1AndGrBgYH/TN5JD7o=;
 b=GbxPJGTi1yM0H1t/HtUF0m3hG7dc6TmUug80zF7E3M9fuvAWQmh7ZyqY98TqU9QOo1
 hC6c2HD1LA/w/+BKM5gZCEo+X+0Kypg48FpQozMDatWAbdWp9fIN/1+gZMRttOS/Ex5T
 btIN5TLkDW9kp4aN5fC0f2J0PWldurf45CuNBcERj/XIaZ2AvfvAhh7KAi92CdPkv4IX
 ISYg/8F2REQVn9NkvWA6rCl39coaJp1MwDcvWx5Z9HJ1kJCndJL0aZM5uQzmsJjkTgQm
 cQYFmc3itToOnIQvHrZiV91xK4D+k+K2o03OEWGbGvQ2CAJF+VAvDYvtxsLZkUzMCftr
 /4yA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3wMJdWw2sJ1GVvmi/ArQcWE5mlbw2urYhD+JWBi/4c62k9kJBNuP6WENhHvTBW0Bl5ljzmmzXGTAf@nongnu.org
X-Gm-Message-State: AFq9FYKfEU5H4NJYZCP1wcffWZLkfZq+XrD5RZse/WxkzYWZ3AlGhKNM
 /MPzthLGJ5Vi4ogDmkRgHu+bugAO0OMBDoFfbdlOHz0ER+dqmFTUp+U0PPyg2zpjTXw=
X-Gm-Gg: AYBFou21AtfXnG3xoGoJcwpmzSek4ugQDiz2wXE5UKZlZXZxvUIpiAotcInTK4nFLcT
 3z9UW/MPZmXhTlgYzJcVtm/0jYcTeFV6TUQSMAFaqhKjmNZlTqMH//r8lYcS7oe6Hmm1FWojM28
 41D0Q1QHtCX1cx0szdqZ79jnpxx24oAO3F4QOYL0FLns0NLxd89cVzN9V4F7XFCporxUcNnPmgQ
 xZMdIuSeoanbAtT99rRY2pd9SDkNx/LmMnZVptT5bhtrvY9fqVkzP/lANguG8ptInGqFEcBFdMF
 mMxdbtlQyC0O6JjKeUkAK6Licrj1cawQ2vyzffvmjZb3aQt+R6sJEQMCCk7MK+M4XRhFGh1wEBE
 Fm6PwWcmsyhjCZBI8UATIzMzlLOgeV7L+KjM0cXKMCRzJpbbweT0CTrlffIKgzy2s8mHlXLx15b
 H3fREIFsjyfI74CB/TnPL+YnGPqtu3sf/N53iyK5KnqKRBiKgowbJ0Ggc8rMxDW6oUiqejej6/k
 HNiQNlQNEaK5uvwoWXhY9sk5y9sFeb1ViFcc93Sb8jFOr0=
X-Received: by 2002:a17:90b:3c8d:b0:3a0:8001:7d11 with SMTP id
 98e67ed59e1d1-3a0b2617800mr17665004a91.6.1790651836141; 
 Mon, 28 Sep 2026 20:17:16 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a492dfc5absm1563641a91.3.2026.09.28.20.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 20:17:15 -0700 (PDT)
From: portias@oss.tenstorrent.com
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 5/5] docs/atlantis: Update Atlantis UART documentation
Date: Tue, 29 Sep 2026 13:16:44 +1000
Message-ID: <20260929031644.1016354-6-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
References: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::2b;
 envelope-from=portias@tenstorrent.com; helo=mail-pj2-x2b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Portia Stephens <portias@oss.tenstorrent.com>

Add documentation describing how to use the console machine property to
control the console.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 docs/system/riscv/tt_atlantis.rst | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_atlantis.rst
index 1f2880d617..167cd57c27 100644
--- a/docs/system/riscv/tt_atlantis.rst
+++ b/docs/system/riscv/tt_atlantis.rst
@@ -15,6 +15,20 @@ tt-atlantis QEMU model features
 * RISC-V compliant Advanced Interrupt Architecture
 * 16550A compatible UART
 
+Boot options
+----------------
+
+ * ``console`` to change the default console device. Most of the
+   machines use the ``UART1`` device for a boot console, which is
+   mapped on ``/dev/ttyS0`` under Linux, but it is not always the
+   case.
+
+To change the boot console and use device ``UART3``
+
+.. code-block:: bash
+
+  -M tt-atlantis,console=uart3
+
 Known limitations
 -----------------
 
@@ -24,9 +38,6 @@ real platform. Notably:
 * There is no PCI host bridge, so virtio-pci devices cannot be
   attached. Boots that need block storage must use ``-initrd`` with
   an initramfs.
-* The DesignWare UART is modelled with QEMU's ns16550-compatible
-  ``serial_mm`` device; DesignWare-specific registers beyond that
-  set return 0.
 
 Supported software
 ------------------
-- 
2.43.0


