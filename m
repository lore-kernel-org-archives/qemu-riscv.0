Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31B7606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=theorem-dev.20260707.gappssmtp.com header.i=@theorem-dev.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Xch21V/9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM9qX-0001cD-4V; Wed, 28 Oct 2026 16:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xM9q7-0001YC-RR
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 16:01:45 -0400
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xM9q6-0000pb-1j
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 16:01:39 -0400
Received: by mail-dl1-x1234.google.com with SMTP id
 a92af1059eb24-170135e43c7so340416c88.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theorem-dev.20260707.gappssmtp.com; s=20260707; t=1793217696; x=1793822496;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iqnUw9FLhJP2iszbEYV3XU7KkM54lm1JBi81oyVkTv8=;
 b=Xch21V/9L392DTMI4gTOWRYwLJeBpLOFGXOyk7E8xz1bJxcdoZdX0hk91vhaDxRnx0
 JeK6vB1TzhQCep3CrYLvBDaVNWk0cnBAxj4vQpbOBulxrxxL3/P5sWCltwifn040ae28
 wc3IyNP3lmtiubtxpJdMSOY5cflbyj4qa1SdxkP1juUIELU/6Aujj0s3fv/z4xlvuqFN
 4Fe2pDYy/nnCyETzh+5L7HVZ/ZpjbKqlDDsxacHkoDDBZi6vn1Kavq+rOgsn5SKDt1zM
 l0jW09zzeg6odLSbwE7jYO6oEJe/Dbb7BmySgurqYt+nzTr9EBE70eRj8oLs8fEjHR6S
 IPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793217696; x=1793822496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iqnUw9FLhJP2iszbEYV3XU7KkM54lm1JBi81oyVkTv8=;
 b=Xc5jRTGazy/l+VlJal5qVzWtjz/HT0tjUDsPgr4HP/OFouibkAaOtSe3MIuDlU7Zh1
 tOLdMDsG4lDPi2lw9fVLHry5hRYK2J6JEEJy+OoDeQUYppCK0fMgxD5gjoeyKJSNLuV5
 Wrue89/0vfNxI/nfhESkK/9fbgXRq0gHuSpipzw2K6Xo5wIJf6vLq++wx2uGltWCbu9s
 0lHq4ubCYbx2DP0YYJLhYKcTexmrCTU5AfKhr9KXUlZxVkXUXW14N3CcuP8+k+MhC09e
 Jzz3jKrYmhVoPRFXqvBeLs31LbNTVc0ognbT7pvPgPrpUBXCvPDXN8ka/bjIgDYTq1It
 08mQ==
X-Gm-Message-State: AFq9FYKcLAgVIiQa8RZlcKZXV5FgVpZ0g+FbFGBOKeQWyP5ezEWsaGgR
 JrNCAGYjbygw11NGUGYwySQyNQrhMnHPgWg6y4cusd1oe1Ap530LNWPoUQ9DPKdcOU0=
X-Gm-Gg: AYBFou0nfG7a+N0ngW512pUzuhZZPMimC4xQ1cUiDSpCYrsxI5AhTJnFTP/1DcPS2uu
 P8hgafuPzHhe2Ga0am8K5adNnTT20WuH/DXuFG3hAaI8cDfk/WTN1olvuExrS5UX3m05aqgeDi2
 xd1j+DyPUkDlf7ORk1IZbY4caplWLYfv0UC2ZcAHAuzDeUMrgTJ6fLvXiYZbjmCyzc3Te46vY85
 M4CxG8pZGrlIZE2Bjg9KAQpvGMvRR5HxRPegYt8jkDwSKu8SjR28BUvlO6s6VuO67EP8Y132SQw
 l8ea+QpnBBcykrfR6wxIqD676THPDyCL6uuyOJ/x2QUIiMLU26F8CuR5b6I0YlgWkdrJ2BnmWQE
 FVpTJP4bEKunwDpfICwZNBgtl6jQo/nyQz0re3OtcThjp6n4Tcj5aR5LoOjMs81H/O32iL7N5eM
 lj4iKunMgqzDhCi6vPMfyurqZi1Byp9Gx/gsS0KDAv7qzp4L+hGGZoUqhbXpSC6KfTez2Uk9qBo
 2jelDgDMvQVAABrbL5AhqScxgGmADaK6xu6M9dd55fMBrVtBD0ClCSpvTwnceaEliXn2BRpW2XB
 HzBalu1ggiBCrzBXOOvhQmQ7n3GwK/D/HMIIuu0cORG/cLiF5BbOrXOdegSBPw==
X-Received: by 2002:a05:701b:450b:20b0:1a7:216d:157c with SMTP id
 a92af1059eb24-1a7216d1658mr4085256c88.34.1793217695570; 
 Wed, 28 Oct 2026 13:01:35 -0700 (PDT)
Received: from tewaros-mbp.localdomain ([209.249.241.138])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1a75a5594efsm10537589c88.2.2026.10.28.13.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:01:34 -0700 (PDT)
From: tewaro <tewaro@theorem.dev>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 disclosures@theorem.dev, tewaro@tewaro.org, tewaro <tewaro@theorem.dev>
Subject: [PATCH v2 0/2] target/riscv: report the no-PMP-rule fault on the S/U
 fetch rather than on mret
Date: Wed, 28 Oct 2026 13:01:21 -0700
Message-ID: <cover.1793217528.git.tewaro@theorem.dev>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1234;
 envelope-from=tewaro@theorem.dev; helo=mail-dl1-x1234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

When PMP is implemented but no PMP entry has been configured, QEMU
raises the resulting access fault on the mret itself rather than on the
first S/U-mode fetch after it. The access is correctly denied either
way, but because the trap is taken before the privilege switch, S-mode
can never be entered on such a configuration. Patch 1 has the details
and the history; patch 2 adds a tests/tcg/riscv64 system test that
fails before and passes after it.

This is not reachable from S/U-mode or from a guest, since mret and
mnret are M-mode-only and PMP is configured from M-mode. The affected
software is firmware that executes mret with PMP present and no entry
configured, so I do not consider this a security issue. The same
symptom was reported in GitLab issue #2074; the earlier discussions in
Launchpad #1923197 and GitLab #585 were about whether the access should
fail, which is not in question here.

Tested with make check-tcg for riscv64-softmmu, and by rebuilding
v6.0.0 and v7.2.0 with only the mret check removed to confirm that the
normal PMP path has always handled this case on its own.

Provenance: the bug was found, and the analysis above was debugged, with
the help of Claude (Anthropic), used as a research and debugging aid as
permitted by docs/devel/code-provenance.rst. The code and the text of
the patches were written by me.

Changes in v2:
- Rebased onto current master (73294d096c). The new meson.build entry
  now sits among the tests added since v1; no other change.
- Resent over SMTP. v1 went out through the Gmail API, which rewrapped
  long lines, stripped trailing whitespace and replaced the Message-IDs,
  so it did not apply and the patches were not threaded under the cover
  letter. Thanks to Daniel for catching it.

v1: https://lore.kernel.org/qemu-devel/CAEq2Q90UbCK2=7SFGQErviup1=u0AYVf=n90NaJvo1M9N=_BUA@mail.gmail.com/


tewaro (2):
  target/riscv: do not raise the no-PMP-rule access fault from mret
  tests/tcg/riscv64: add test for mret to S-mode with no PMP entry

 target/riscv/tcg/op_helper.c         |  10 +--
 tests/tcg/riscv64/system/meson.build |   1 +
 tests/tcg/riscv64/test-mret-nopmp.S  | 100 +++++++++++++++++++++++++++
 3 files changed, 103 insertions(+), 8 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-mret-nopmp.S

-- 
2.54.0 (Apple Git-157)


