Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E6606A31A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=theorem-dev.20251104.gappssmtp.com header.i=@theorem-dev.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=t0MgVS92
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJsuN-0002fD-4q; Thu, 22 Oct 2026 09:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xJksA-0005NF-AP
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:57:50 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xJks7-0002ON-Ut
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:57:49 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b1f31c63ebso930703a12.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 21:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792645066; cv=none;
 d=google.com; s=arc-20260327;
 b=NrHYJ9z9upGxpp3dR+kwWzLAtF7s9/TVmCd38bPDudL5FLKxN1BX85vFXVLZCJ2//P
 m5S5IG1OuN+1MibFydv75zunVPgpsqFkaC2ZbYtflUCDUIq1dzZUaV/hhqIxTSzYqjv/
 pf7IOwnNprBItW11/0CPOzQcHkVqay9B0VpdVTDyblt/wwda/U5x3BvXJqA8KH32yWiZ
 vV3948lbdw+NoXeiQhmjT0uqwuvjfwUw3pJLFxn6zevWlkFAaJWw7jYsemJgf9ZjH5dG
 fRwMZiZz0HzIyrrArr0hS9mhcNpSrROLxwOfjzTBf4qzAuUSt/BEUv+Hf3ketg0sE1+B
 mGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
 bh=yl4HWkmrDNimBUaI8VIFcbAax0pHxh7K3loxflXpKbI=;
 fh=WpNAuUXiMsfIKUBu/gBiH5cBz4L+2NGE/KQSYqZbhSc=;
 b=H+MxM+GRoS2qHF2ZkcRCIB9/I86Rus24I7SRoGjTSnGa0ZVckt3O7DrwatWny0Sziz
 NNuRcKR1oeVHVI77inBfsFLdE49o226YqAXzOXSI+AhfGDTe1nULTO88js8f9nitpDB7
 ol31XPFNWFlMSEztyEehj+DGpfKGA1MDZ0hC134r1ZcLJTTl4kWyAC7ZLRDvWsKu8PWi
 3x6wvKIKiSpafg+GB8C4WwbWDIHaPZOya2lqMGFSQ5XkQ3dLJ6dyTVhqHGOBY4rNNVKZ
 m+wik0vzCTDeUrsRLJilx14PnXoRfQWUP0XH1oChc7zLULIS+bJvPxzusrZspqGtdhJZ
 8e5w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theorem-dev.20251104.gappssmtp.com; s=20251104; t=1792645066; x=1793249866;
 darn=nongnu.org; 
 h=content-type:cc:to:subject:message-id:date:mime-version:from:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yl4HWkmrDNimBUaI8VIFcbAax0pHxh7K3loxflXpKbI=;
 b=t0MgVS92JZSuPPbk3z+evSFqtuMLEiOn7FFHJfFd8l9lZKTuRtnlnrlqukSsHtDB9X
 vZJy2C8+7szGNXqzF84XeO2vSYiACC4EBnyKZye+IITcaTJhdSVcvnitx1uw3IccTdlD
 yE1kbMfBWItS9Kl77oQY8THSjL4MM9EgqTXxZepdqfLlpgic30PvFePtYKcVjpdlfzAL
 TTOAecUzhcCNh4iY64fIEvhx3Kzee5jCh9kiJIODc9V6zDyWZCfpS3fCCGhj+6051yPx
 ldPtYumcFOZfXug+VBXwPZmVazHLAZSzYgvtpEd2cBrtqoInvrPFpJlmdrQ712qb8TJS
 Y/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792645066; x=1793249866;
 h=content-type:cc:to:subject:message-id:date:mime-version:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=yl4HWkmrDNimBUaI8VIFcbAax0pHxh7K3loxflXpKbI=;
 b=mM1Man4+W0+cwd8dE9o5UQhnuNoBBjzh7MYd/MKD7XuyUmVFf8RfarP1mUujSLi1z5
 u7+FKPDXblDoDGjLiE//bYnjUHsopuujK/EeFRmu7t+IDlwAcNlVDtenrDT64CPAXLbq
 HRTDFtC4iThHyf/VZuVxrO1/Vn7BJV1Fs6jbk26I+TyoTI9RlV5HAyZMNpokExNzjxe6
 MFPomjExJfJYmXjo3CKRBSywJ8z6xDJ95qAMUfUHZNA4HlCIaH+XPaXQUC/VNQ3luVvt
 +/uH/oalPD0CBa4FWHzpAUxlSYqWKqjl7RbIaLY0ShJni+GrzcCAFg715iOfKRZYQ9hb
 GfMQ==
X-Gm-Message-State: AFq9FYIEf1Of70L6maEmHKpXZpnvmotaB/ZQGLrmh+ZumiNLaE/roU68
 DsaKVVYK+81I3+Q+wa1OoAoqOND0I2sc9d1SaMvCQ46UEiSFp0xUYQykTJnC97QiJww4etsogub
 s2/+i+kahTPJLNyhAmqO6E5Ns6r89SnSZ0YR9xqtChQ==
X-Gm-Gg: AYBFou2Q2fgaVfOuiQesIjUgisPIYZnHnjG5mXzmEaPMMML/ZCWb/YQwgGe4c9TQcOw
 L6yX9iodzo43ERXeGR0s27gvPuC+Xgdn+Vl147RpAIfPrphwluxL+CW+S/2ejX/os5xAI0z7OeM
 3gI59BU9YQ24yXQtIuAQnKj2HYlqY+Bx2w3uQW7SQ2H9EhSKHruL9V+SjyMMRGWRsC9R3Ini7S3
 J6RMQcObLSJS80igon0A7psR9YdxO/e1t4DWRu1ZMn4O1AYrezs12OSiEhh3q5998gJ7n9fHP+t
 fY0HMi47uDgkdF907hBRGewCvRbF9vMNh3i2lxgdWTWm49sqCJpPPyyrSSfn/h7yz4Fbu0VSb0P
 7Oivc/qb2urSWPf3E2Yot754EWWi1rQwxr0uzOnlDQtzSodMM4sQJUsKk2o8=
X-Received: by 2002:a17:907:3da0:b0:c42:4f89:13 with SMTP id
 a640c23a62f3a-c468d80594amr132772866b.15.1792645065334; Wed, 21 Oct 2026
 21:57:45 -0700 (PDT)
Received: from 428534693058 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:57:44 -0400
Received: from 428534693058 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:57:44 -0400
From: tewaro <tewaro@theorem.dev>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 00:57:44 -0400
X-Gm-Features: AclHuK_8oTtMQam4LbO8gSyI7fuGTL1z4KK1tJ7PN2qHosLb0v_MuXYBMfgYark
Message-ID: <CAEq2Q90UbCK2=7SFGQErviup1=u0AYVf=n90NaJvo1M9N=_BUA@mail.gmail.com>
Subject: [PATCH 0/2] target/riscv: report the no-PMP-rule fault on the S/U
 fetch rather than on mret
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, disclosures@theorem.dev, tewaro <tewaro@tewaro.org>,
 tewaro <tewaro@theorem.dev>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=tewaro@theorem.dev; helo=mail-ed1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Oct 2026 09:32:31 -0400
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
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

tewaro (2):
  target/riscv: do not raise the no-PMP-rule access fault from mret
  tests/tcg/riscv64: add test for mret to S-mode with no PMP entry

 target/riscv/tcg/op_helper.c         |  10 +--
 tests/tcg/riscv64/system/meson.build |   1 +
 tests/tcg/riscv64/test-mret-nopmp.S  | 100 +++++++++++++++++++++++++++
 3 files changed, 103 insertions(+), 8 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-mret-nopmp.S

-- 
2.47.3

