Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8775F606A31C
	for <qemu-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWKspRSq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNCaM-0003ni-Hq; Sat, 31 Oct 2026 13:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNCaK-0003mk-4y
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 13:09:40 -0400
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNCaH-0001Ub-Ur
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 13:09:39 -0400
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-3550c917fd3so2332494eec.0
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793466576; x=1794071376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ua+SMK/D12kY5S4ua0C3rz2vp/YaC8hcZtPUp39RsRU=;
 b=yWKspRSqJBXoIBJRVG+EuCBmonmjj6qPTwtEOwz3stjA9BtByVxjx3MygrckpsGKB0
 Txkm0RQ47m0MwuidJd0/PO8zTZzNuuEhDAspE4M84WzJj0OQd+Yeo68RXVFfTyaskfPM
 EKyKbIZQhIVqr6+bLvZOrHC/ococ9F7QEtiw7fBQ+KrjqDE3/kywCv6vrM+BmLzmmmOn
 oV+3nQ2x3vHkqEDqAl07Lqrb/uESwFEKJCX3+vEvJ04gVb5VpkZe4lCaqpfaDD6IRmWS
 UXy3o37ma2PH4/FxCnMwyci3DPpj1iSb/AM5d0eXpC2naXZJWF3pMjBzes1VP1J/ZMqZ
 6zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793466576; x=1794071376;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ua+SMK/D12kY5S4ua0C3rz2vp/YaC8hcZtPUp39RsRU=;
 b=P5XQhBXAMQLQHiY+6slrpxNzArDv4d2d5J5QRpibhvH0OMRMjWly3n7oLr/UNCwc8a
 b6nhL57s2/Dscl120JvYjNSvA4TfQGpw7Zxq4ENskOzWb6/Ak9oWioLIkjLC/XRhvwxc
 BHGd/Xs9F6a18lufjTBnJuYykqB3e0Gs98X56TmM3n1HlMxdLC/gO5TsuRgRzL1c5CYa
 EOQNn2gtfRTP1rrkM4R8asTNpMtL8R8gTPe9oR1mtGZHJay6iBCuo9XN9zNrKtkipi5X
 EKtXCPIo2WnJKkckanuev/MRZWKPfy1Mybr9D3vnwsdNDmhxydh4d5YRabE98M4gQSAK
 yp4g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxL5o/6y2FqzqEimTec69Ya7assM2MiSTqe34k24Kg261JMIRw+a4JNs9vY17iR6H/9lK2iU64I/4z0@nongnu.org
X-Gm-Message-State: AFq9FYK09/X+sHY54XKgkUCWLCsxMqc5bD8CvA96EkCgAuSbWSA7ik8A
 +Qw2cRkaDeTF6yfPKMoenVxI+SbTBXEI12L5DpuqL3p86TxUo7yuzuj6
X-Gm-Gg: AYBFou1h6ywgP+jrhutx7vy5rWkZZ86T9443FAFZVsjFcUdRXgXMJ2pzFAF2OXa1tjK
 vZ+Fo6dfWAd3vR5fKkDi6/v5U7123PaGbZBNtgbG9AFImyTbe5p9tIuEr2kI7tBk1M55HW/Idlw
 2rgDEGQLO/L+b79/97iJYfuoVWuNpmgQNQAjwkRqcrwXSM0IhS9vrKRN2NmCmn17Q+phoa4g0+3
 sWn5BJMEMI1QeCykdDyDelXZEIde81DVlJhEnDrOmer8XMyy2rbE3XwiI7o8wncMnfQs8QEp6aO
 tCA8ZGoxAsyrhOMRjcwvVACLrZvb9bFdgMqFfNqkPpMmppNamu4o6EoHXv4+PfFXDQw6MN+EEh4
 qklXEo3MWPA4KtykiaJWRfeHlfqKQRWb72niOiIeFMt7NInsmu+VPoQAozIUL60LLgFxUiQNSdZ
 Um9f5XpkXvOZp99aDeVeurlEeSX3jXVmoJFMm3CMjbHTgEi2VwOkO339AVHcpDs9LwVlHgwQdr3
 TmSEldIYFOKZfslWpv6VJy767eTQNjnDjoB+4jA1j56GK9zk43MJAfzKUb80zq0R6OYNmObm0BC
 wl8Qk1YtveUIW6ET2eUuiDDXfexCxjMFBNYAvqHC5/pbDwlX
X-Received: by 2002:a05:7022:1301:b0:192:fd91:c569 with SMTP id
 a92af1059eb24-1ac5a0b8a8fmr7102800c88.11.1793466575782; 
 Sat, 31 Oct 2026 10:09:35 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854da78sm23749065c88.6.2026.10.31.10.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:09:35 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>
Subject: [PATCH v3 0/3] Register accel-$cpu_type for all targets
Date: Sun,  1 Nov 2026 01:09:22 +0800
Message-ID: <20261031170925.789-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A multi-target system binary links more than one target, so each one needs an
accel-$cpu_type parent. accel-cpu-target.c registers that parent from a static
type_init. The name is "accel-" plus CPU_RESOLVING_TYPE. System targets for arm,
riscv, sh4, and xtensa share one CPU_RESOLVING_TYPE, so those bases build the
file once per TARGET_BASE_ARCH and link that object into every system target of
the base. User-mode and every other system target compile it once per target.
The constructor is static, so more than one copy can be linked.

test-multi-target checks that each target's accel parent exists after QOM init.

This is an alternative to gating accelerator CPU types with is_available. The
RISC-V TCG and KVM gates are reverted here as redundant.

v2: https://lore.kernel.org/qemu-devel/20261028063049.2530-1-luoyonggang@gmail.com/

Changes v2 -> v3:

- Drop accel_register_cpu_type() and the bool array keyed by SysEmuTarget.
  Register the parent from a static type_init in accel-cpu-target.c
- Build that file once per TARGET_BASE_ARCH for system targets that share
  CPU_RESOLVING_TYPE (arm, riscv, sh4, and xtensa), and link that one object
  into every system target of the base. v2 compiled accel-target.c once per
  target and skipped a second register
- Compile it once per target for user-mode and for every other system target.
  The static constructor lets a multi-target binary link those copies when the
  type names differ
- Check the accel parent from test_qom_types_are_unique(). v2 used a separate
  accel-cpu-parent-per-target test

Yonggang Luo (3):
  accel: register CPU parent once per target base arch
  Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu to riscv
    targets"
  Revert "target/riscv/tcg: restrict tcg-accel-riscv-cpu to riscv
    targets"

 accel/accel-common.c           | 15 ---------------
 accel/accel-cpu-target.c       | 27 +++++++++++++++++++++++++++
 meson.build                    | 32 ++++++++++++++++++++++++++++++++
 target/riscv/kvm/kvm-cpu.c     |  2 --
 target/riscv/tcg/tcg-cpu.c     |  1 -
 tests/unit/test-multi-target.c | 10 ++++++++++
 6 files changed, 69 insertions(+), 18 deletions(-)
 create mode 100644 accel/accel-cpu-target.c

-- 
2.55.0.windows.3


