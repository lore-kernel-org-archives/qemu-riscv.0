Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvXr-0005sR-Dh
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvXq-0005os-6T; Wed, 05 Apr 2023 01:18:54 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvXn-0004Fi-T6; Wed, 05 Apr 2023 01:18:53 -0400
Received: by mail-ua1-x936.google.com with SMTP id h34so24817395uag.4;
 Tue, 04 Apr 2023 22:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680671930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2uY2jyM6SfIGd/UE6+5+88f5ryHuFDbsRiNRSUtGWeY=;
 b=TlCDf0ESqKWM+Dg6WB6UeSDxQJIonpM95IrxnygG27tTZVZ+WNWSmcow0UD8aCwXiZ
 CybEvsaJ3Eu414M6Q5ies/oXmBdhkJWZuwklD9DCQkph1Z8s25l/GKxuFPIs1AZjMdGp
 cwcrx1G0UkEXLOiGp4lTkrAH+LzXShHzmgXs8kgjHFOEM6EACZFad34eM+Nv2E58Tm5x
 G7ju8BQk6T2VMQtbotIwSC1Nn1jPoOIxYPl0CVPeHqLYziRzidSSFGhE4ujxCPO+3COi
 ajfqp1Qp0SZtKYUJzuFlVNYUXHBMeRAhJ9blmXaewNz9ZXC+MHljWL/yUnaw4BV/L4ko
 k6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680671930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2uY2jyM6SfIGd/UE6+5+88f5ryHuFDbsRiNRSUtGWeY=;
 b=Tb+xiniuE2j15lEqdi5U2tpi9vGSw/tGX62PPjeZKCzRB/1yEmfirSXbyRu7bMoe9m
 deXQsY0HgPmnIpVOuX8tCg4VTSVRCzCaakQZVjOcPmBN1rSdomGDPG9tE4AtmSRorU+Q
 7Bqp1I7MoLjs2syTEIXo9QtqW56dnu6wNpmuKiCDPyL20yUYRHGnfqO30tc+pt988Etd
 Op9l5u3qVvB/Pk4LRGzJmFVeE94FTjYoHegFeH/l95SWEQsmYaeM1/89H4/FLtGdRLj5
 fzdK1LIs32i2M7hGEkx6gFYR2XiBGrWfAqTqjRtl1n/DT2Nm6lOd2SMrDi4qhIYFQBVf
 14+g==
X-Gm-Message-State: AAQBX9caFyUJbHa+L93FMzC93oxgWXSZHGybWCUuEx7Lxq43svbEFzeK
 eY7sfP2biojSM2frNTRs89kg09yrM91Ofa6hCQk=
X-Google-Smtp-Source: AKy350YPztYU3SNkeU3Gm5iJ6uePRFvBtCxdr5h/eKLnzwR6yTwZsIrf4sEnKU0x1QAUbVdTFs1gFb6sdNyEBNauvUs=
X-Received: by 2002:a1f:2147:0:b0:40c:4d1:b550 with SMTP id
 h68-20020a1f2147000000b0040c04d1b550mr3938226vkh.0.1680671929926; Tue, 04 Apr
 2023 22:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:18:23 +1000
Message-ID: <CAKmqyKMBTs9hkhORLZ+ZFQzWx8Ku6idDRoz3As_JGXkvSTL8Gg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] target/riscv: Remove check on RVH for
 riscv_cpu_virt_enabled
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Apr 2023 05:18:54 -0000

On Mon, Mar 27, 2023 at 6:12=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Since env->virt.VIRT_ONOFF is initialized as false, and will not be set
> to true when RVH is disabled, so we can just return this bit(false) when
> RVH is not disabled.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e140d6a8d0..62fd2c90f1 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -560,10 +560,6 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target=
_ulong geilen)
>
>  bool riscv_cpu_virt_enabled(CPURISCVState *env)
>  {
> -    if (!riscv_has_ext(env, RVH)) {
> -        return false;
> -    }
> -
>      return get_field(env->virt, VIRT_ONOFF);
>  }
>
> --
> 2.25.1
>
>

