Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZrH-00044w-5Y
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 04:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZrE-00040R-LL; Mon, 27 Feb 2023 04:31:44 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZrC-0006uo-Im; Mon, 27 Feb 2023 04:31:44 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so4937447pjg.4; 
 Mon, 27 Feb 2023 01:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bce9C9gEHX2JUTnxtKPC+KT8yDkI1qx/UzxiapyYd3c=;
 b=d3EbPLbNlaBWe3KZ/Gg6wEE88o+58cSHXIFrRRDNhalOGavIsCsIbrZpUAWftRZfbC
 k8jyvcIiyNz3xYGWUegygB2nA2f0/3rZ+W1Lu5l2a5NKD3ONjgBwUBXLIXfvh0QSmSlu
 dzYExyzhbyMFJT39Pvs3EgJPsgPGytdyVYJpxiSBrGwkmRKlLLCtV9O5umnG7LEDl9Un
 aS1s8zTzXEo3QB4apN7AIACnkRS/AZP5fD5Klxtg1PAX1Vcylzoj2dNCimsm/GGFnX+O
 XZYlXPKJk/bxgZxwP2LcSBGCQcFHNaFtFTX2QXNwe2gmq0Ax+s1qsyTKM2/qnkqNBL4G
 0sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bce9C9gEHX2JUTnxtKPC+KT8yDkI1qx/UzxiapyYd3c=;
 b=0l4ULPPTU199K8n0l9n4MNyaVqOWLIXZ0p35EyRcw9sHBMf4UEAqFcoUYmisf7A9Sd
 1Nb/UwZ9ln68kLkK57tLIi8AtQ3RFSNl8DFUc2DGsI5D/zS30T0O0uKpJkFpIWJmhldu
 /dUJpy5yaCiHEqkqIsd0JBYD+5MrmRHTP0ZDd+ytleZmBUTKYCKQkNOZUMqeYIS7+fFs
 nycTnGbvxIAepeFz2raHYpP3M6rkLKmkspZR70/yCp7Jzcr7TVT7JTjdV1ecbqVi+p/r
 glII2sayGnKz5s4oEc44wuLNGTL66vmfeBv/hHoEETDxCSBZ6dyv1NsTgvtZIrx54z+r
 UJCw==
X-Gm-Message-State: AO0yUKXVH90nxI1Pc9+yQ0JNmoZBVDOPhfxExqpNdV22n8s9s0gloCdx
 9c7/iGdmWCUmmLcmMNAnXIxqQKOdspk60k9LPSQ=
X-Google-Smtp-Source: AK7set82IOBvkbqi5Pa3zvbhXmXEMP8yXZ2nzAAohRz4aNcyNB9+7dQu1WRkOSU8eOv9Knj7dYIfphMI1yhgv2IZXvM=
X-Received: by 2002:a17:903:2651:b0:19b:8cbb:30fe with SMTP id
 je17-20020a170903265100b0019b8cbb30femr5923497plb.13.1677490299535; Mon, 27
 Feb 2023 01:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-68-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-68-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:31:28 -0800
Message-ID: <CAMo8Bf+AJ-uBs2san=Kva7vZ7W8iN=4dfXGWrm_rqYojGXv1UQ@mail.gmail.com>
Subject: Re: [PATCH 67/70] target/xtensa: Avoid tcg_const_i32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 09:31:46 -0000

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All remaining uses are strictly read-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

