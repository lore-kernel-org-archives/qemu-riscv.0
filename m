Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZmW-0004JB-FP
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 04:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZm0-000442-Je; Mon, 27 Feb 2023 04:26:21 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZly-0005zx-0A; Mon, 27 Feb 2023 04:26:19 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so9453086pjb.1; 
 Mon, 27 Feb 2023 01:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ow081Nz6sbX2x/rwUnRAykh4dqanKarH4JaNrazT8gs=;
 b=D1kc3Z+J6Hg2eZhJ33X6T4jhgrbxfgl1dVHSq5BcRqzxGgonEHk9jUTxRMwLp91mVz
 ws4/c+zf3ab8pGgLmz3KSuZ7yZjMhtjmXtqGl5kGDEL8T1/fRr78bGb4/Oldn3EEHtPv
 MrY0/TIvb4MrD2M4A/FFnZ5ajzRyf3Ld+n3oApSd0E+XZiuaq+6SJMdtO+z2RJSD3Kqg
 TY0xZtuRoCrnpzcspgmS3mclaxpph0vp0EbmrklqscI1Kq/TFaE0U0CwEjD40l3PcRAE
 OQk1GoocHMJUumFMbsLeWPw8n0RO+pK02wjZfoULUjAHS4NpzeGO9d+nEJXQBn0BZN60
 k6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ow081Nz6sbX2x/rwUnRAykh4dqanKarH4JaNrazT8gs=;
 b=ImG25hlewHL8Ru9IYhfRb9VZYvSkHGDkgENaxeqBYEcXiptn5CVVqc1aiqGJLTgGXm
 EMaVeoJedAFfGUS+keGN5A+1sQ3USEZy02NoNbkxOjI1NXkwMFKFZq7RRWIdHHKzoVvO
 qeKG647avYad8k0TW6DAfATG8l8pTgn2YSr1Oeb5H0mUD+7DYkOQISRMrHwxhACdtJw4
 KSYN5YQ37zxCgbI0Dnx18lSQikVLiacgNDafPxgCdQoE9gZCELw5dOjNeQoJ3OSYs8+H
 CGQAerpb/WDKOWh3H1KyHsN2C0RsvsoYllrW65vlMkNMqJ2Ckdwtyn0KNQwuJHxwPNYZ
 ETEA==
X-Gm-Message-State: AO0yUKWNiYm5rxnIy8p6LXGdEXqoT7VIIny0D6WeLBs+/8XHOAJI0hrL
 Tme6zR7rWiBHU0M7cTPDLrSDyALGT4TKhy8k5SY=
X-Google-Smtp-Source: AK7set8uVFbq20J7qoXgczyUQpkea8A0Cyqt73MZXhfY8y0k1ZdSvMJGhEMU6kdbOQNeMrLo/LPD+J9377lUJW1of6c=
X-Received: by 2002:a17:903:2348:b0:199:6e3:187a with SMTP id
 c8-20020a170903234800b0019906e3187amr4388087plh.6.1677489975126; Mon, 27 Feb
 2023 01:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-66-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-66-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:26:03 -0800
Message-ID: <CAMo8Bf+bgL=9JiKPtBP0-LN1sv-oTcQYOjZ=6vPu5mU1uS5M9g@mail.gmail.com>
Subject: Re: [PATCH 65/70] target/xtensa: Use tcg_gen_subfi_i32 in
 translate_sll
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 09:26:51 -0000

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

