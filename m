Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3903CA5FCE
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 23:34:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCQHS-0003Py-7K; Thu, 01 Oct 2026 19:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xCQHQ-0003Ni-4X
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 19:33:36 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xCQHO-0002BS-ED
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 19:33:35 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 d9443c01a7336-2db479a55b6so5694415ad.3
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 16:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790897613; x=1791502413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DUwciZrhb35dWobbDbyl9C2LkylNosQiGSNTw0bMY5A=;
 b=f79O3Xxm8vpbMKqorWWyZlx9HA4bxBAQo6AJ8vuy9sTL5KqwJgDCxQC/i9qH0skC9c
 PWHqttpw4puYDdt+oo42pXxHbe1ze86SKlIDD+fOUgzuSBGr63+QqdSk7IOn7GJyzWa4
 AYcPMPx8xkY4RuzVoqlTCQy8ML7FIYvpxeppaYl2hiVPYRuue7mxf1Agcve+I4Qhytp/
 Rc4BAOaIX34Zkc0BMm8yH2zd1YAj3O9wTWBE4Tga9fjFIx76UC4gpsGi4L2rchquv4Vj
 roI6TwyF1iR0peyzwWATvt7/SAbyqW3/mtYFWSs5pid+I1MjGPGiPGilw4iCfkX37mtW
 Nrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790897613; x=1791502413;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DUwciZrhb35dWobbDbyl9C2LkylNosQiGSNTw0bMY5A=;
 b=iSofbDOMDxB3XppxqMSMzExnqf8Ke+q6d6dNR8I5fgqWL6DGRPFx1DtnBgAeVukpYB
 KoosXmL6hc3I6Gh2/d0oXcAO0NRWWxDOj9lcDJeid3WhSjJTPdTFYA+EZfXuDs0jkwou
 K6hm0/tS/VfBD1+HGj8kQOn5Cjh64v5R3gKwhuVzwi2Siddms7oDKhyRB+GboJPGM+Vm
 jrzdsfSGHTuU2U36ddrXC9hi8y8ANn9mS7Tjr8N4w6oMUjvglPnQ/l5e9agxviypDzWn
 VG0o048rBFzHsH7/xSVhLDHzPe/QIYFDW1a/PQU8dxSkcWSepyzJeavKD8F1AbqsMFMZ
 wFgA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRNYjFazzUpgaVqQk1p4eBOAXAYRtOJ2RHBcC0KflTkmXDSvNkVMiGyK7rlFP2wCGTmg0OltLLpo7K@nongnu.org
X-Gm-Message-State: AFq9FYIHxjN1BIHYeuhXxEWtI1sL1orM76ZRFF/o74pgXnd4KWH6U9EC
 0JDPTu96lbfV//iZcOhA/7zwQlpaLuWi2ISfav2lZDGi0R6LmFw/dCznpS5ennD3L8k=
X-Gm-Gg: AYBFou1N6DlSuA5Lk64BsfRKDJdu8BPLcL1GcLGL22MeeXhTP5yv+TLraUf7l8HvTbR
 GpHg28FrupnWa4/DkjdaRW1cmm/jbwKmu71BVHWlqp1f0jkw6sco308LUJ/EO1ef5fOJQ3O8y8v
 RJ8wATtdFIc3ph9kfyFQSs5L/YpSIWLw22c84VFOGevHzcr6P04dDlxpfb5IiPVI+RW5o7X392H
 kAyXoqPmvr3GN3JBLR5e+lFhPskn9yJcYYgD6XksIfGTo/DGQKscuYQWHr4z+o7Bf7UpP0ICtZv
 +XYgovuVyoHHW67Fke3jBmpvDmoG+xDbz54ADD2h2pqe7kLpoextBUICLU4jBSB9HtktmPmEfs+
 FJVgV1lKg+zubl6HWxraqMb6G47hXjhobnFdcFbAliEmmZBut+LwLnSHiMLKmC9voxpIOlVy1Db
 TRipAdVXPMSa4IpsEPRRX9Ch+FGG3wix3ipJTWqtK6BvQcoxzFgasxCxszoDLItBFlkWYk87lJx
 5FvnYyfmR3Lj/9j5Kf2w/0FvAEIf4LoCQTZvKs/bIodVFo=
X-Received: by 2002:a17:902:da85:b0:2df:8ab7:fe3a with SMTP id
 d9443c01a7336-2e49b66ee56mr12239775ad.4.1790897612691; 
 Thu, 01 Oct 2026 16:33:32 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6aea97sm1851855ad.45.2026.10.01.16.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 16:33:32 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 0/4] Improve modeling of the Atlantis UART
Date: Fri,  2 Oct 2026 09:33:20 +1000
Message-ID: <20261001233324.2636629-1-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=portias@tenstorrent.com; helo=mail-pj2-x0f.google.com
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

The Atlantis SoC has a DesignWare UART compatible with DW8250. Previously
the Atlantis machine had used the ns16550 UART with an unimplemented memory
region backing the DesignWare specific register space. This updates the Atlantis
model to use the now modeled DW8250.

It also adds the remaining 4 UARTs that were not originally included in the
machine along with a machine property, console. console allows the user to
which uart is being used at the console and will be mapped to the first
serial interface.

Changes from v2:
- Fix typo in documentation
- Fix white spacing issue in machine help text

Changes from v1:
- Drop DW8250 fix, to be squashed into original patch which is not applied yet.
- Use qemu_fdt_setprop_string_array for creating compatible string
- Change machine property,console, from string to uint32 and set default value.
- Documentation fixes

Portia Stephens (4):
  hw/riscv/atlantis: Use dw8250 UART model
  hw/riscv/atlantis: Add all UARTs for Atlantis SoC
  hw/riscv/atlantis: Add machine property to select default uart
  docs/atlantis: Update Atlantis UART documentation

 docs/system/riscv/tt_atlantis.rst |  19 ++++-
 hw/riscv/Kconfig                  |   2 +-
 hw/riscv/tt_atlantis.c            | 134 ++++++++++++++++++++++--------
 include/hw/riscv/tt_atlantis.h    |  14 +++-
 4 files changed, 129 insertions(+), 40 deletions(-)

-- 
2.43.0


