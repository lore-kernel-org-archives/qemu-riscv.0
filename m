Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A09EC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:52:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmR4-0002Pu-D5; Fri, 05 Jan 2024 10:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPn-0005Tt-5T
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:25 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPk-000457-Ng
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:18 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33687627ad0so1403604f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469634; x=1705074434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=foPbRN9kgz3ubIukCDMoVcakJKSu99lNJLUQRej2Dsg=;
 b=pAJGDXvCXqCWtmEX24PENeF/S6BWfWmbADoC/oGYDGPwQKutZ5aONcv7Q3kSxSaRsj
 Vu1dKH40+YAhYVZ7ElIXYKG0OUx6y6xhkG8jaidL7xoZVDljyNVB9qb/gcn66glAF2Ej
 VADCTDYsNLlH/NBBSWO8K0crq+FVsvtxd1WsgGMiKvJDumxUi3bpkr0+gz1s5XSO55CQ
 2H1E3rcmYnn9EzUtcSsrdkwF3eoYzC0hlkyc7a0GnoOvAgaf278CFXcxQKO9qj8ggKRE
 dolEz3LzOa9vJ4XLQMRq/OC+E2g2ngAL1ZDrJWgWWG3DDk2OpuAsv+t9H7skvwZJxfuG
 htyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469634; x=1705074434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foPbRN9kgz3ubIukCDMoVcakJKSu99lNJLUQRej2Dsg=;
 b=l7+0f8xDbuj2OIqfp0HAQ+LjGBwes4BMRSdA7vSnKLVGs6BGRbE4HsNgEXt+Zj9agB
 VNpU8fswFBUDC3d+CzVBw2xiJ7weSoFnYRDOSmeVREr8P666IL89t4yRk0sF4JNKET4X
 OtLd3UFoSWDIEWjB9/rKjS8A5ooYIW/YviRZEw7xnDHa9M6BXAkKpVsgB6+p+8MpTJ7T
 h4DinSj/ExXK98Hhf5JrRySGLFQ80xKcdQawTgMTxWp+ffmRJpfkkcgAG5bfn6Ngkyr9
 XTUvyeQO6QUt2Q5HoYGMrif9KTMVNxMxmT+mbxBMip28L324BVIVT4LeJu8eL10fKNq2
 QVng==
X-Gm-Message-State: AOJu0Yw/o9TtY42evLImVwuSwxvoOLvoEuISyJWcqciIXqwiW8IJl4PB
 pO/z30dJ1rz1jeZ8pjTKI15KbBgZwF2z3w==
X-Google-Smtp-Source: AGHT+IHg1HQZbW3JaXorahcPs3JXuhS2e6/ZjANSl9hTUp1wBVq9xc+bE8w9O8VzKqOqqQuwrYzHSA==
X-Received: by 2002:a5d:550d:0:b0:332:e667:4277 with SMTP id
 b13-20020a5d550d000000b00332e6674277mr1265526wrv.40.1704469634427; 
 Fri, 05 Jan 2024 07:47:14 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b003365f5e87f4sm1623391wrb.95.2024.01.05.07.47.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 37/71] hw/audio/sb16: Do not migrate qdev properties
Date: Fri,  5 Jan 2024 16:42:30 +0100
Message-ID: <20240105154307.21385-38-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Since commit f7b4f61f63 ("qdev/isa: convert soundblaster") these
fields have been converted to qdev properties, so don't need to
be migrated:

  static Property sb16_properties[] = {
      DEFINE_AUDIO_PROPERTIES(SB16State, card),
      DEFINE_PROP_UINT32 ("version", SB16State, ver,  0x0405), /* 4.5 */
      DEFINE_PROP_UINT32 ("iobase",  SB16State, port, 0x220),
      DEFINE_PROP_UINT32 ("irq",     SB16State, irq,  5),
      DEFINE_PROP_UINT32 ("dma",     SB16State, dma,  1),
      DEFINE_PROP_UINT32 ("dma16",   SB16State, hdma, 5),
      DEFINE_PROP_END_OF_LIST (),
  };

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Message-Id: <20231124182615.94943-1-philmd@linaro.org>
---
 hw/audio/sb16.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index bf7f35a42b..fd76e78d18 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1325,11 +1325,11 @@ static const VMStateDescription vmstate_sb16 = {
     .minimum_version_id = 1,
     .post_load = sb16_post_load,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT32 (irq, SB16State),
-        VMSTATE_UINT32 (dma, SB16State),
-        VMSTATE_UINT32 (hdma, SB16State),
-        VMSTATE_UINT32 (port, SB16State),
-        VMSTATE_UINT32 (ver, SB16State),
+        VMSTATE_UNUSED(  4 /* irq */
+                       + 4 /* dma */
+                       + 4 /* hdma */
+                       + 4 /* port */
+                       + 4 /* ver */),
         VMSTATE_INT32 (in_index, SB16State),
         VMSTATE_INT32 (out_data_len, SB16State),
         VMSTATE_INT32 (fmt_stereo, SB16State),
-- 
2.41.0


