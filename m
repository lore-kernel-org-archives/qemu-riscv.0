Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZng-0006ak-K3
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 04:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZnT-0006Lh-VT; Mon, 27 Feb 2023 04:27:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZnQ-0006MA-IF; Mon, 27 Feb 2023 04:27:50 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso5535566pjb.4; 
 Mon, 27 Feb 2023 01:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vX+l5BNYXFo7s50RYdWlABKg5n7EzOmIIZ8TKgmZmds=;
 b=ZLjatxPvtv293uuxDaqMPuaC+sxVH4Lhv53RasQqoLd/KuqA/Rx23UiKbWxi3R+PSX
 N1wiEvhjvhNebo7GYXh4tkPIlteXXkD5sy79qSmgAGAYB/TSgXaAjoiTEz0nvF+IaV84
 PpdhaMLcCH1DNq5iGuxsGCJXEorzp6ZQimmVkyGBoGliinLrUlZr/Uvi76dzsX2u2aJP
 aneUPRygb7v5Ez4PwHmtTNdCeMKdn005rFuRM0q93gt/zc+ofh45qRuKDmSrQmDkjuOR
 ESQl1rSR7RHBfNSf9WZv2Wd1CjYBcOZj1182tuITc2/vTa8nHvxX6I/LWKDAM64tcrqM
 xkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vX+l5BNYXFo7s50RYdWlABKg5n7EzOmIIZ8TKgmZmds=;
 b=eQzM7Syn8qLOcPRhxQS1iAn6CiNwwc6Tjw2Iob2N8x3pk07MElt+T5q6ZCgES35S7W
 YfXpJLKHkRI5qw8FsW9XzUADX9bXs6e1jFM8tlwcuKBFe1S754xan/lgqPRq/Gkhf3Hv
 6zqbyW3lvPkiSydANvMZS1fLJygb6tvkBNT0Upu5elhK8TPilFfFcVemf14zbzrIrp6C
 JXCpVTRi5GF9ponUAL3I+F2H5jtkOF68m3yqOw1IMWHNjSo77FFFO88BHiECnGbVJpd+
 dumCum47V+KhpuwF9Gz6Frt7rwG6V7YmLykiC66C/kUlmQGM70bzuMMJho6WlInpw3n2
 fl5g==
X-Gm-Message-State: AO0yUKXdalIRzoINosrSeYlmGDEOoKD5AC7Fwl2GYItZeeZcGYvAXxXZ
 uAMeTbPWQs+OWNwP8WkbQekNEr8dVXC3fRjXGbY=
X-Google-Smtp-Source: AK7set/FGvy8UJU70H5hXy1QTWpigHSC79sep5xTKs4bW17HwsE/VqLzAivgZrM2hydJAHHAKyEmPZTTC30JQcxDYUM=
X-Received: by 2002:a17:90b:3e8b:b0:237:ae7c:1595 with SMTP id
 rj11-20020a17090b3e8b00b00237ae7c1595mr4603508pjb.2.1677490064770; Mon, 27
 Feb 2023 01:27:44 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-67-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-67-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:27:33 -0800
Message-ID: <CAMo8BfJXdtpxcfwnXfRaH3WARgQtyahZ+8oveF9SAt3uM3F6sw@mail.gmail.com>
Subject: Re: [PATCH 66/70] target/xtensa: Split constant in bit shift
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 09:28:03 -0000

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

