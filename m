Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZfH-0001Fe-JO
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 04:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZfF-00018o-2V; Mon, 27 Feb 2023 04:19:21 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZfD-0004R7-Kt; Mon, 27 Feb 2023 04:19:20 -0500
Received: by mail-pf1-x42b.google.com with SMTP id a7so3071539pfx.10;
 Mon, 27 Feb 2023 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWvaxcsamypNzFDAGfG4rN8CNE/eAdGqu28hE58V4xQ=;
 b=qkPhEFz95yE51M74nJFbd9EfxsvWJG02YN13nRMS70hutxnUpfkvTIZWC6kL12v4Mz
 kf1DWUchtFWjeAeDrQsB5CtKVStFFH4Z0b3CdZgZ+9wy8qSp2VTmraqxZG0YbxPu3NGQ
 yLwgV+jxHtsAbfJ+J8Q6qmKC0Dlu9kwUUDLbZo2Fi4ZVrv8g8XDac0MzlPV1/1xh2RFa
 s1fZmySD0Y6aVLjxd0e3s6iqTWMyVoIriTZLiO0yhZs/94oLsdQ0baPa+hbInG+y7PD3
 cy36/pMPKDMInozNkWkTCF6jPhR3c2A4LUAQNy6+nMKqQlp10H8MfE2uC8fct97S0RmC
 eA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWvaxcsamypNzFDAGfG4rN8CNE/eAdGqu28hE58V4xQ=;
 b=AkKGt9yDnAB2uIxnAK6Qxh0tvUqE0GyMohOm+wW8Ql0mXSYnZ1nS1yF2ZSxooLEZJL
 Z3ZeNW17hVPghYytDWqy0yV1PN32k8NI3rclw1XW7ZqP6e/sSpvac30O/dO2nVbq0vKF
 f31R9Loqp4uQRlZ9pKNc2lVw8ik5htdQEVtK/IYONovurr0SyTPgbrj8bitvqoSSM+fB
 NyYGPKuwak+l1ZhQsBnKweqDk0YGfdmVhauF7fG39To9wxfZDlthDnW/1C5BZ+r15mpy
 2VbujQZGLACvYrfFeNVjc8wH6lcaUcMiom1HYAZZlRO4J7fuv8+ZO6MREtqOO0QH/Uti
 6QKg==
X-Gm-Message-State: AO0yUKW8lMIfSYoFbN6DUxK4PleM3ky3magPVS4L1rEMhqp5h7H3tLSO
 2/6VKqQxPCgU9Ne9bibQLH/vHHlC40+0VNZC9zg=
X-Google-Smtp-Source: AK7set91vw+wwUa1KdmsVuKYjoxMb5o4O25yndkzq/MbLx09+lTOFd6F2MFDeRihcK1s2KhNwrM97Sw/vKm/S6ddQJ4=
X-Received: by 2002:a63:3855:0:b0:503:253a:1da3 with SMTP id
 h21-20020a633855000000b00503253a1da3mr2206118pgn.1.1677489556616; Mon, 27 Feb
 2023 01:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-63-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-63-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:19:05 -0800
Message-ID: <CAMo8Bf+ZCnWZFUJyV-PnuMLQ0PjqW_RoWG1JJBRkMKQy18Q9BQ@mail.gmail.com>
Subject: Re: [PATCH 62/70] target/xtensa: Tidy translate_bb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 09:19:22 -0000

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace ifdefs with C, tcg_const_i32 with tcg_constant_i32.
> We only need a single temporary for this.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

