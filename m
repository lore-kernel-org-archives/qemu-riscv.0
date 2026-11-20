Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B2D60A2607
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 00:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2WjG8Tj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xUC4y-0001L5-Sz; Thu, 19 Nov 2026 19:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1xUC4x-0001Kr-MF
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 19:02:11 -0500
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1xUC4w-0004Ri-0D
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 19:02:11 -0500
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-170135e43c7so511341c88.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 16:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795132928; x=1795737728; darn=nongnu.org;
 h=date:content-transfer-encoding:content-type:references:in-reply-to
 :to:reply-to:subject:from:message-id:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/m4ZQFGAFqNIAqWG7swTbnnCMjhQoG51+gFEd/TL9KQ=;
 b=B2WjG8TjPplG4LKOa5zznLiyx6mfIYyiXOJmMWso2R86B4ZOxYUpbaal7Jcw4GJx8U
 v5FcBgLEhvs8fCpLIxBZuEiDSLUj88ysVI02NKB8AnwPryllTq6ubCOODIekn98Cw+tk
 FKGy7Bbp77FF7XaHsavZjTswWO8fJt1pKPrnVOzWe81XyALHeOGbcJZj7aCTHEQ93cYO
 MEjjYmqhQfjdVsI1A3oH0uwrvl1EJsFsL7Kaaxjmn/G4OLALqgxsQXE3XHGFFCcCQ/ye
 sYLbyj9g1tQxQ4N97ry3iOC+Y2+xC63m+T1n+mWYtRx6g/q4plGhJzrFnoeiymEqTOWr
 7UIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795132928; x=1795737728;
 h=date:content-transfer-encoding:content-type:references:in-reply-to
 :to:reply-to:subject:from:message-id:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/m4ZQFGAFqNIAqWG7swTbnnCMjhQoG51+gFEd/TL9KQ=;
 b=HS/UmZrXwaiwaWD1XAMei5xDfBrr51WceTaSlhuqndZ4LY9HKYgGFbuGYM9JrjsURd
 CreMPal29wuOe4Pznw6laseeV8eaR79AwItSOItm+F3QFQ3lXqPGcptjV/MJhZRMCmPJ
 XvO+o6gfJan35Z4JpBftpyRbaXTpy+K/LTmTDGK7Cgtl7NTDDrIr+illclSuZrJ7aG5T
 qn7z39icLUUsiFrK1kC5RYcGor0rPjcB+HUT6l02boHuKGDU1J3aaNuZtrJe+Qd8d+O1
 H1qNex8XBCJXXuhTZKQk8O3BP62OHrIeh1pCSJKAPfu43uJedHD2zes26c2kCawXJXDx
 jedg==
X-Gm-Message-State: APuU4Z/02A8zhOAoHsjDOo/hdKtW+MBUAFywbu9jnFXwAVrbY66vzyad
 QPFg7eMelRncd0+Ep1oCzizds8rwPG9m6o4wIxsSrpeoxIzPLcUhy56qzFjHdhk3
X-Gm-Gg: AZFdTZfdWYq26H8PFSA7Czo7NVhl4h97YOrJ/m2pJbpq/fI6N5zmgg7MTaE8V+SXHK/
 EcFTWNa3qNaVeDe9wAKPfB+auHQaxJ71h/66MlGCr1Dagy1KcF0Y+esGHwXbo3/qCOuoRO9s9qV
 MEFk/5wGmPLQYiZWwXZUT2Yrp3oKNqJSY9QDGs+8q8/MWbTARWcpoQdJjkmpf2l7CEbSbxu9Pff
 +9Zci/h8IGuNUrD9IOxsHaaFxdw45W0LdXEq1ODCEwzAbCuAPZ38L2aGuFD4jDNSqUaiWsIMXjC
 1E8HyQdiqMLaZyutnzYrjwUUzCrHsx9uXTkn2ydIv31YMJiiUI1WVm/zklD/9pjq20iCfTWYvbg
 ClSkfxcWQX5CuemZVqf3K65EjZccNNghmwNUk1wXWy48FOOwErc3MIBTNUyN+T7N1xLC+EWd2l2
 yGafx7pKVY4+Q3IbpzO6LlPRXx2wsuJF5xhCGSRsU2EwTraHjxYGrm0LzqVqgCr5TK8CNZSHS/A
 hk+2VtiH9J+tlu+0Am8G9zl84qT28tHu6gws3qCzf7es0g44qb0XQNf91H6frK6aiRt9wftw+Db
 A1m9WCtKikeNNmm98gj1iLIk
X-Received: by 2002:a05:7300:f68e:b0:369:f291:49da with SMTP id
 5a478bee46e88-38571814b1dmr953346eec.40.1795132927967; 
 Thu, 19 Nov 2026 16:02:07 -0800 (PST)
Received: from toolbx ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38566cd40c5sm2353367eec.10.2026.11.19.16.02.05
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 16:02:06 -0800 (PST)
Message-ID: <sashiko-outbox-257@gmail.com>
From: alistair23@gmail.com
Subject: Re: [PATCH v1 2/2] target/riscv: Write zero into mtinst/htinst for
 SSPUSH/SSPOPCHK faults
To: "Alvin Chang via" <qemu-riscv@nongnu.org>
In-Reply-To: <20261117132638.1452474-3-alvinga@andestech.com>
References: <20261117132638.1452474-1-alvinga@andestech.com>
 <20261117132638.1452474-3-alvinga@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:02:03 +0000
Received-SPF: pass client-ip=2607:f8b0:4864:20::1230;
 envelope-from=alistair23@gmail.com; helo=mail-dl1-x1230.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-To: alistair.francis@wdc.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] target/riscv: Double-shift error in access_size calculation
- [High] target/riscv: incorrect access size calculation for transformed
  instructions
--

- [HIGH] In target/riscv/tcg/cpu_helper.c (riscv_transformed_insn), the
  access_size calculation contains a double-shift error. The first shift
  calculates the byte width (e.g., 4 for a word), but the subsequent
  access_size =3D 1 << access_size; turns that width into an incorrect
  power of two (e.g., 16 for a word). This causes incorrect memory
  access sizes for HLV/HSV instructions, leading to guest memory
  corruption or incorrect state. Fix by removing the second shift.

--=20
Sashiko AI review =C2=B7 https://risc6-threadripper.alistair23.me/#/patchse=
t/20261117132638.1452474-1-alvinga@andestech.com?part=3D2

