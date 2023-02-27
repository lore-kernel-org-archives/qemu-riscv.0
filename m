Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZiE-0006Kn-L8
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 04:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZi6-0006A6-7u; Mon, 27 Feb 2023 04:22:18 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZi4-0005Bc-Q3; Mon, 27 Feb 2023 04:22:17 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i10so6015764plr.9;
 Mon, 27 Feb 2023 01:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UpyPaI0Bk3rfGe1RIKSbR32dt1ABynKKclL5PoVpIDA=;
 b=Z0tGmntnWAt7IZ31QkzpfGubFF2vkJfZD1Wh5CcLocn8dxNwREMhJ5ng+3Dw1VNpo6
 aUv06drcwR1DLs81qHjx52pHz/iT1GyTUjLbfKsYrNuvICsBY7r3/xc7hwtzcSxC4HvF
 NO+QGewR74AayyXD3iDDLNrWlheK5EMctIaphDarQMSuEJC1rn7rqGNfcsujIWCKCpws
 UznqSQmDJFVXTvC5DARGpFhqwRug2kIEjCWvppcPwTIPMqmCBuHNnj6jUBWk7mGkEmfU
 yOQU+nbNzmov2KPNeskY/QNS+Gq9el7BxmrMbezPupjM/nxry5q3lggpsYjia7iUd8HG
 WYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UpyPaI0Bk3rfGe1RIKSbR32dt1ABynKKclL5PoVpIDA=;
 b=ZYVhEx8uP86CNcCarEOI+qVP2Y/66m5eDiTxQ3Ppir2NmFdQB4qMXJ5d57f/w7Zod/
 MMQ0SN/Il19NhtK4cI78CAFF7I1gqW9yUzuoEoTiLT+KmFVRDoSKFf+0Yzx/WEPBs/91
 V9JUmGtEX2pzeoU9ZKNroMxLlsgLrolKnOsEMv61+FR0MfZ3O3esscp8Bxzky9EcOZDZ
 WpxTiFKd77fXbrj7uZXaPZ5lBEW+No/I8hcBIOElPRfgI4Ba6xSMhXmXg1BLvToHT7jR
 JQoVT2vkwJWXPxLR4qjFCCYMaTHaly+NHwp7P4G/kaXe6ooqVVQf5L0pAeHbF16idvOC
 NeCA==
X-Gm-Message-State: AO0yUKWB2Al7zUmyrRP2dy7oFS37HH/xuUoJfBhsrPecTWYnT7pz/xPK
 cC9Mv7teixj7yqefqVVqaOSpfUMi4bUEAx3mZJM=
X-Google-Smtp-Source: AK7set/MyakCk3jelkfHcrOAcx4yBlHRNJImr2+EDAAGdrXEWPnq4ClAXMKMquYoKLXlVABWBIdYky9oFaZzq5YE+l0=
X-Received: by 2002:a17:90a:9c2:b0:233:caec:5710 with SMTP id
 60-20020a17090a09c200b00233caec5710mr4310663pjo.3.1677489733982; Mon, 27 Feb
 2023 01:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-64-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-64-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:22:02 -0800
Message-ID: <CAMo8BfJtfDJ_XSVmfk+0W5KUAKOFCwMEngyuD=eaaspe3MjkUQ@mail.gmail.com>
Subject: Re: [PATCH 63/70] target/xtensa: Tidy translate_clamps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 09:22:25 -0000

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All writes to arg[0].out; use tcg_constant_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

