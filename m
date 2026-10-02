Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7950CA5FD4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 14:03:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCdqn-00043G-Jl; Fri, 02 Oct 2026 10:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdqm-00042w-7S
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:00 -0400
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdqk-00084X-Jl
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:02:59 -0400
Received: by mail-pj2-x0d.google.com with SMTP id
 d9443c01a7336-2e4c841e9bdso59025ad.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790949777; x=1791554577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Be871saR1XVOAkSBDix+tWYc58ahQYkpdPiioZWc30=;
 b=eD203e5rg08mHYrJBjSE/KAf6gwHmMEdEeVvzQTxvI7ek53ci2M3LjVTby+EMSLJHS
 Z/UuYi3NrNyqN1WOT7x1cplBjE7xtuc5TRmdfWXBXfcr9xU6e1HpaQG/ILTrV4fkntIp
 xxWw6kdBQnb1zIdWOt7AAD7kSyYjcUv0CvzVWbfPu8kUiFHgiCWcHurDDIptSzaKXPWE
 lzqbQuePrH+0RYNxd8ol/sUtnvN3HCbHYEWJXVTnvHawwJ/Gwn5x1ahqUzs9PXEtKV8u
 CYk/bgCaOYFQu2tTfk+8RHYCGmO2ripvjiDZm9YRrVL5EhXMdeQT4kV8FzsgAGbRhpeK
 dovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790949777; x=1791554577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Be871saR1XVOAkSBDix+tWYc58ahQYkpdPiioZWc30=;
 b=ZETEcgGb3BhNc5AmlyvvNxWjndDGk3pGmhJKZMxiIqbiAFsxFO+iQ/3HLs2AUBXnjI
 xGd/kcYocMtZ7/uLv4eO6Nw8j8Vp6oeZg7EW/TBz/2SPlJFcV4MbQpaSOUeRewmNVjfU
 I+zUgZ3C9bHmvfFriB+SyGsOh8HSftKJTqHHiC+Ooma7Qd2YmJEiC0QCFCZTn3OJMlym
 /PniHIuctb8QuH6aNj4jGnE37baD+/i01APi2BLfQk3G+n6SsG9j82JbEUOQS594jK+P
 4Sc6BrAMNrH0uRTAUBy09pZqJbSHTumnppjD+hqV7jfbE451ccKFwQoM4YF/rzeYGlaa
 1VRQ==
X-Gm-Message-State: AFq9FYJ5NfVCN0pdu6l1JKpC1SvWlpkxbzX2xIE/gyKPAfkbI5XFARex
 YHuqpudG1Zd/1Aedc4+hhiPoskBzIdGh/mtW8yp2OFwmBgD9EWguVKIW
X-Gm-Gg: AYBFou2/6IpsPqsOQl4Au+MPwxpn48Wc71vsikpn/r/MX40f8XD2DGsvCU9o8chgYpS
 migYAZ1t1QYBCOIABKtcBTUZmBQaEUNKsWuI6Woz4XtdxqXf8mZpQPY0ys/ud1rzXWpgYlSH+qU
 cS5BJ4i1FfUV9Y/6FRUPVSOv6oAp55J+03srC4F4Hk+asd+M7DruzFST48Xk/sOE+PxOmy+yHH+
 f1fTS2XM7KJT57i/ESaQdzCFtRivzXiodyPwmNlYg5ZtnqcNufVKavkMKR3vJGzkiiHpg4qnyRx
 X5fG81hpUnjuKAumYGUdbUveD4lcf6CyHARJFd7xufgKl/umfPOOj+rl+t2GL90Xuo0jloUZ4U7
 lAubhCIuwlvwLzVf+kvn9eXtbWcUf+paGdSjSykkjtx6GgVCoLxcsD+i+aP4s4/2kGWAIJyltcj
 BZ0uS738mO/GaJb3uk0f1kr+2QXRujHdIBPsJTeQDL9N0cZmFiHvGl3enY5Yhq3CYNilGntuLQ7
 OP/7dP/5qoukCgf
X-Received: by 2002:a17:902:f685:b0:2df:89d3:1b6c with SMTP id
 d9443c01a7336-2e49a109cc7mr26730775ad.5.1790949777033; 
 Fri, 02 Oct 2026 07:02:57 -0700 (PDT)
Received: from dt-VM.localdomain ([101.207.27.235])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f723a77sm7996165ad.71.2026.10.02.07.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 07:02:55 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>
Subject: [PATCH v2 0/5] Fix integer handling issues in k230_gsdma and
 k230_decomp_gzip
Date: Fri,  2 Oct 2026 22:02:40 +0800
Message-ID: <20261002140245.30214-1-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::d;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pj2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi, all

This series fixes integer overflow, truncation, and underflow issues
reported by Coverity in the K230 GZIP decompressor, its qtest, and GSDMA.
https://lore.kernel.org/qemu-devel/5fc57f49cea0ac3542128d0e2208edd6d7484f7e.camel@wdc.com/

Thanks.

The patchv1 series is posted in:
https://lore.kernel.org/qemu-devel/20261001022223.8633-1-dingtao0430@163.com/T

Changes in v1->v2:
- Split the original k230_decomp_gzip patch into three patches, one for
  each integer handling issue.
- Remove the modifications "ch" in patchv1 3/3, which is now patchv2 5/5.

Tao Ding (5):
  hw/misc: fix calculating output address overflow in k230_decomp_gzip
  hw/misc: fix calculating input address overflow in k230_decomp_gzip
  hw/misc: use hwaddr for the k230_decomp_gzip input address
  qtest: fix k230_decomp_gzip test integer handling issues
  hw/dma: fix k230_gsdma integer handling issues

 hw/dma/k230_gsdma.c                 | 4 ++++
 hw/misc/k230_decomp_gzip.c          | 6 +++---
 tests/qtest/k230-decomp-gzip-test.c | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)


base-commit: 0a1ebd448b38afaa118597cbb633dbec24ef74d3
-- 
2.43.0


