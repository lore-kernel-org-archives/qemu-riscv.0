Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F27606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M+BpdnQS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJ6qq-0000Tl-O4; Tue, 20 Oct 2026 06:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJ6ql-0000SB-E8
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:13:43 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJ6qj-0001fY-TL
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:13:43 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8b125371596so2367847b3.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 03:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792491220; cv=none;
 d=google.com; s=arc-20260327;
 b=PFi4inwGLNE87EdAWhLWE3MgCRFbeJPt2UnwBsCX/AzCs7gMqAgm68/Fuwdv7+vOHo
 Ma72YKz93IVhPpZV3sHs2MwID69EF3nm/xc342k3zk5HUQjRh7bxBrIReAbTAgSTz4f7
 Iqd/j0RY6xI6/ACkyk7J/1rBcbYY1mBmd5dxxoVxGuhF6N2T1ZZ9P1NUGHY02Ztx2WYq
 D8fZi1H0vsRJXrrD0Q/vWj//r4a/gyJq1cFfWnY8g7baFo+UfjfpgzGozXiVUl6Jx8Ap
 ALA9t0wX7MxOz3oxxwmDmwgBNxWv3sOTsOtxa11ZJaL1whfYKBdLgDrz+o/BWeRFNFHK
 lgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PRsB9LC/9b722cwBC5j1n6/wc/Ay0KTAGtZK1kbgKXY=;
 fh=hHz50KGXGrNjginwFlvlVVyNFi3e+tYSTS7L9kSnosg=;
 b=ddRlLfOcPcP/lm0z6/WJ/jDwra2ZuSWMmDwkbApk6Vhrx2WWjbd8wLe2H9Nyw8ITm8
 iZdNNPHVGqt+5RMPnwvW0nbVTyq5hcO5jPD+r02Ijy8js1SleAM8ytKpsR1K18WVVGPV
 45gXJjkfqpIK9n0GMkXYuUuFjQ2ehAgMgp7LHxrkjPlvGCzTAgqEBshOk1/iJze0mf8o
 en/VFsDqes48awT18OeuVDnDQnzCnDmV69HrphlN/Wgvs0oud0MSr7Z54woIJRRx6q0r
 K/a+jHQXCMVh5XZgajmgR7zqhgzXk4zKpwu9gODE4Sq9aNRUeSlZ5j+B28m1oq//7e+7
 lOqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792491220; x=1793096020; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PRsB9LC/9b722cwBC5j1n6/wc/Ay0KTAGtZK1kbgKXY=;
 b=M+BpdnQSftRJn1mNztAdAZ85sYEvI8t01wZxoKlXaw5ohXieAM2XUWxN4S9KNMBYfH
 jrQPabAOyydw2nQZU2Vcu9NbRToE00xyXYvV1rJk+sf9O7rtD6Yz9SeFwPAbe/C5pr+h
 vc0TjCadRGtoY2Iv0+LpKc5AFDIcbL8USln7V5J01BvWuAv/6Q4FHqyH+qdg6444ano+
 URMnXBj41xpAjFsMQB42cNYhviGDLL5LdwpFA8itHSsFjHwcKpDD6MDA3ryQBZOSxqnO
 Duu1rLsf5wVrCGpX5zSFBTzMceHOyXmGxWpDd57fxvEn5g8RfdV+M3404nqJKRgeCBTJ
 Ke3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792491220; x=1793096020;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PRsB9LC/9b722cwBC5j1n6/wc/Ay0KTAGtZK1kbgKXY=;
 b=lcmLEbL94N0pP7vdhAv4vhyJOblTD6tC4mH0KN9pd0zSEKvJbGWeXK0GIXqQRO2NYQ
 2qODTAE3v0kPJONuhmGts/b+PniyOAJ5cpk1FnSnzhy0kgL3Z0kZPlDT2p74CcfsiCRm
 f7hKQt1J1GwbMDevnOit5YwPl7TjvnTxB1kSvR+NvLskH9gU5UjhxHUFv90uhUpUi/zM
 sJv9m+BdEytgFnddqEd4JsXZWpyrALQoL5ZuvBkaX3OpbFmUag84qUk7gS+UnS/+gMCS
 XMAmEA1uEibpMbz2y7t5L4rutZvpK9tCBC1WfPNZ3L78WtMK0+KRQ5SibVIvyLtlZTam
 1NFQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwUF8RFNhU5dejkefuDgE69MUeusK1Q/rgScVQosFT92lu8uJn8urCSozbnLyguJ4AYBBlcWF1/X6as@nongnu.org
X-Gm-Message-State: AFq9FYKVf4KUxwcm2F/t8qtCQrdCmmsJ53CPBeddDLCnuP4D8Oyf01vC
 fOTM9HpEWE8G7ESb/67lFGKhl1Aff9QArS4SjtWqZzMgnh7RQAkCAwXhN/SiLt/6/TqYpsoll5h
 pjiSqp/VOoL6E7urK4G7nYoyS4kdsoJdP3sr8Du5QTZLwSDh0Kc4QMg4=
X-Gm-Gg: AYBFou2Qew4PyeyVlfzkMej4qMazIHLVWKSilSow5ekYBbQ4EeH4MFAWSuITLcJc6y3
 GHQ9D4zR/pK4JDlPEmuxOIC+gcnyY0350Ey9qtABBbqiM1cp3p5efsBkXEPo0bzOJoe5eZGRZD7
 JWgpS80Rcrd4BGRt4qpCrujy/eYGpqGOjQZ7ySCuzK1vH3YiN+kdFkc+bSN1QLA0DDCsSqJ0Uf1
 Bqz9YHQwWYv9JaXCZdHvsGitXV96uTpu7//zbc64xnmTNROiy9j6SEF5LTZccYHwzGTOfE9EZxR
 hlPSHjQtJ8A5wVL+1C9BdDoHg+6Dy2q4ASoDzBAl/2i+XshHEsAEspWmDgA8Um3gx7RlWaG9sUt
 2WEpp8l5e2eewM5G0748eVQ+fmVv1TqfWg/H+sJY=
X-Received: by 2002:a05:690c:97:b0:8b0:bc8e:9d75 with SMTP id
 00721157ae682-8b120054e65mr5681457b3.22.1792491220419; Tue, 20 Oct 2026
 03:13:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020075927.56983-1-philmd@oss.qualcomm.com>
In-Reply-To: <20261020075927.56983-1-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2026 11:13:29 +0100
X-Gm-Features: AclHuK8-v59XNJAaqQ3PHglvgqaCbOZMo69jmvEw9CwAMfs4PAF0IIYptsPE_T0
Message-ID: <CAFEAcA_S60THRtAeck_khNhLQkzTMTGap=jr1AnmNoDqg+8rEA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: Move RISC-V 'Z' CPU properties section to
 removed features
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 devel@lists.libvirt.org, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 at 08:59, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> RISC-V 'Z' CPU properties were removed in commit 455c0fa9eef,
> for the release v10.1.0. Move the corresponding section from
> deprecated.rst to removed-features.rst, adjusting the wording
> accordingly.
>
> Fixes: 455c0fa9eef ("target/riscv: remove capital 'Z' CPU properties")
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  docs/about/deprecated.rst       | 24 ------------------------
>  docs/about/removed-features.rst |  7 +++++++
>  2 files changed, 7 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

