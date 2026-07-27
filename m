Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E66BC531D0
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:23:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woFgN-0008Qk-Op; Mon, 27 Jul 2026 03:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flavien.solt97@gmail.com>)
 id 1woFgE-0008Ph-Ka
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 03:23:19 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flavien.solt97@gmail.com>)
 id 1woFgD-0005pE-0y
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 03:23:18 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-38e041ea211so2457430a91.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 00:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785136995; x=1785741795; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=TogoSyYAqnOGicRD5tBvpYtkzJNUZYg4OhNGGBdHjPw=;
 b=khbg9IzcXi3FIhU8FqBK6nHqIdpYlken4kHDvuK/hnMQ8PDzFStxthCv93+qyUyfEV
 nnFEdwYszIZRimTdCgEm2Bs/TCowmFiDks0MkzF5iGOq/81DfAcvK1oVwdKgVtIV2OXY
 LKU2DFgc2O4V04gXfL5sVGuCs35seivHjmSBCTYZscVImjpGlzq981kyaf7hq/uaF9H1
 hvChz64kXTFd2ldA36wNoQ5YsMsFsR3KL4kzDzXOULZQAtyLu3p3sWLrr2q9WJTjWMKo
 Uwfc7nNL0w3rQBH3M6cREi0fI7gleC2BA+eEeM727BJClXK/O6Tlh/1bKDzVl6ro1jTM
 bjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785136995; x=1785741795;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TogoSyYAqnOGicRD5tBvpYtkzJNUZYg4OhNGGBdHjPw=;
 b=oJElq5wnLntplO0c31ZZ1DFy/XSHjpKlZ9XhD1nZfuGLut7ngNFVdENVq75Gf79T2x
 DsG8Y+tWo5Cmyq+C0wo6/IRh33K2Ptq2VVIPIbveirfHEv6FU4OVsMPLh/SEiIu1/JTm
 j4kDPxHv4UtxTAnpmWvD/VdYZSIX3czyhmFAmuqYyvAgfIYMIGHLhNLKXmCN2G56VW9u
 NMcfPTa61R5J4lH8kbO0nKgDJuaodrmLY/N+cPbKZYDUQogHrzydy7HPxzm2wzWrlfOv
 jI2YzMnIBX/VfPW8cUS5VjnqfkJjBJ08Vg/sssW6hv8L8Bcyh0jvgZnNnk3UFbaN999i
 9uWg==
X-Gm-Message-State: AOJu0YxhUZQ1TUs2+hFyz503Fz4XDrzMN5cNmmI8Q1IiMC3jve2xrawN
 aBi8pyMuBIVNtMbDjjWyMpszqOVWnnd2gx4pq8RhfcXwPuz6A6jh11F5
X-Gm-Gg: AR+sD12vqrpM+0iz9oW7n/+1VRU0nQi12bpB0XgmcwS+WxBA3nYP0n79OJJl4brjXTU
 MDPoxxX1bHPqIZgSq4BUIqX85ObByy4L8eJYMTWCZwFSuEDo/fmDrkL2UQ2R1tFNWd+NJ8/AXG3
 nXENWYp1Ul2v/ZV1pWvFiUvUJMJixoaGzyOdWV0104RaW7K/P4YP2qzRVMAGdFAw+8S4IJV1qwh
 iIAKt26VRg2R5QqqnCguaJY/Y6Vv5sBcidh/wpZT93YADdUgt5NAmAw8WQL0nh98qhrFPvemBZt
 K8E8Q8wUsxFFRIQhiqSHkeeN5dqIQp/ZhCKpjNRSMknYt/FcAmVwLpLyGiG6AsjXLLV05OpEKeE
 8qF/kJnP6/1OZ7ntwlEiizKiNhKedEmBSIm2egFQzaRJWj36eee4hhd7sl4T2XwKfH68R6vHhiO
 3QnC0eCAc2Crl1rfsS9XmQXhwCcOdKdHG3oafRweHnRRKFSD6dOazldoL6UzjdnE3fzDnllSWCw
 FTf5JHpfmpxXdvb21OoNxY7hg==
X-Received: by 2002:a05:6a20:729c:b0:3bf:b6e3:fbe1 with SMTP id
 adf61e73a8af0-3c67dfae843mr7512416637.55.1785136995221; 
 Mon, 27 Jul 2026 00:23:15 -0700 (PDT)
Received: from flavien-macm3.ddns.comp.nus.edu.sg ([137.132.220.135])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-314bc419c52sm28481032eec.10.2026.07.27.00.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 00:23:14 -0700 (PDT)
From: Flavien Solt <flavien.solt97@gmail.com>
Subject: [PATCH v4 0/3] riscv-iommu: always send MRIF notice MSI
Date: Mon, 27 Jul 2026 15:22:56 +0800
Message-Id: <20260727-qemu-mrif-v4-v4-0-73e0890ad395@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0Q6CMAxFf4X02SZkLIL+ivFhK0VqwtRWiAnh3
 9nw8Zzce1YwVmGDa7WC8iImr5TBnyqgMaQHo/SZwdXuXLeuxQ9PM04qAy4eqeOGmuC7eCHIl7f
 yIL8jd7v/2eb4ZPqWRlnEYIxRQ6KxqKOWQ0XDtu239ijrjwAAAA==
X-Change-ID: 20260727-qemu-mrif-v4-c8e3c3a48b9c
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Nutty Liu <nutty.liu@hotmail.com>, Flavien Solt <flavien.solt97@gmail.com>, 
 qemu-stable@nongnu.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785136991; l=2062;
 i=flavien.solt97@gmail.com; s=qemu-mrif-v4-gmail; h=from:subject:message-id;
 bh=ZybOj1O2n/iMaiUtLO7CVeo51mOtVb7T1dr8njt9H+c=;
 b=v55VSux4NAkRWFcaah0qsnr3O9xJBXlZBXL37EI3O4qRJkBrtEnxDBmoPLgYq/cpv9/zm8ELq
 56i4jdYXU1wAe1D/fY56Jx0EBOOlF6+udwS5k1Bfc5L+pSyt5jt7fgl
X-Developer-Key: i=flavien.solt97@gmail.com; a=ed25519;
 pk=wEVvqF5SMWVnTyKNb8WAo78S30Q6giJmU/VisghJRtI=
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=flavien.solt97@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The AIA specification requires an IOMMU to send the configured notice
MSI after storing an MSI to an MRIF even when the destination interrupt
is disabled. QEMU currently reads the MRIF interrupt-enable word and
returns without sending the notice when the matching bit is clear.

Patch 1 lets iommu-testdev select an MSI payload and supplies its PCI
requester ID. Patch 2 removes the invalid enable-bit gate. Patch 3 checks
both enable states through qemu-system-riscv64.

The complete RISC-V IOMMU qtest suite passes:

  MRIF notice: enable=0 pending=0x20 notice=0x12d
  MRIF notice: enable=1 pending=0x20 notice=0x12d
  6/6 tests passed

V3 used MIME transfer encoding to protect the patch body, but lore still
received five hard-wrapped hunk headers. This revision resends unchanged
code through b4 and carries the review tags received on v1 and v3.

Changes in v4:
  - Resend through b4 after the v3 lore copy remained line-wrapped.
  - Restore Daniel Henrique Barboza's Reviewed-by tag on patch 2.
  - Add review and test tags from Nutty Liu and Chao Liu.

Changes in v3:
  - Attempt to protect the patch body with MIME transfer encoding.
  - Add Tao Tang's Reviewed-by tag to patch 1.

Changes in v2:
  - Wrap the fix commit message.
  - Keep the existing notification comment.
  - Add deterministic IE-clear and IE-set qtests.

Signed-off-by: Flavien Solt <flavien.solt97@gmail.com>
---
Flavien Solt (3):
      hw/misc/iommu-testdev: support PCI MSI test writes
      hw/riscv/riscv-iommu.c: always send MRIF notice MSI
      tests/qtest: add RISC-V IOMMU MRIF notice tests

 hw/misc/iommu-testdev.c         |  14 +++++-
 hw/riscv/riscv-iommu.c          |  13 -----
 include/hw/misc/iommu-testdev.h |   1 +
 tests/qtest/iommu-riscv-test.c  | 102 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+), 15 deletions(-)
---
base-commit: 499039798cdad7d86b787fec0eaf1da4151c0f05
change-id: 20260727-qemu-mrif-v4-c8e3c3a48b9c

Best regards,
--  
Flavien Solt <flavien.solt97@gmail.com>


