Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJd6U-0005xh-Bn
	for mharc-qemu-riscv@gnu.org; Tue, 09 Mar 2021 09:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJd6S-0005tU-Bu; Tue, 09 Mar 2021 09:12:52 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJd6P-0007y8-B7; Tue, 09 Mar 2021 09:12:52 -0500
Received: by mail-io1-xd2c.google.com with SMTP id n14so14060970iog.3;
 Tue, 09 Mar 2021 06:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpmYrWel7xLbhUWrYs37egYbTmbXi1z3eiKOo+zCPeU=;
 b=XxGnEaS8G6RPjcKyK7cqDX43M8bFt8EF35G810MoKni7DIaeAt4qdRdo0rmjWL8Ien
 YLo0nM9vw6MqsCBN9BSXFP3Mz3vPawulA5nlLWrBsDMrFCPcy/uiBXLv6jgM1du5uOxR
 Tx8tlr44Cs8y4CTE/F2AFS7tWbJk2QJI2VCsenOxBBkGSSU0MB0cKgotAe/ZX0En4Nle
 3AjKXH5easJjVPqe2MJnYvgdCBhv++4ozHO8xl817WhPcuMdnFu8Lz/bazZhPuaPPV3r
 kP38/W2yJLmrAsa30rjocL66pQg7lkr8an9uKlHmJHBPAubEknF+p8RjQB7aduwTJ0TR
 wiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpmYrWel7xLbhUWrYs37egYbTmbXi1z3eiKOo+zCPeU=;
 b=iEgXL/EfjTSVj7bn9og8HlB241erD7Q8N+qpHXBrNBMcmCUnyv1XwHjxO8HD5yxVRA
 MNl9MWFpi+aX2SK36dopr51Se6bf79T2nm1zwEPu+M/OZ0+S0wR0pCtnj33Es2dvy/y2
 bApp4UHMUDuqBuyD4wiWjGrwcJ0dJG0BOaZBWvMoeOAEoWnQZrk3PmsKSj7V4f4ROAL9
 Cj9bMkR0CREZ+Ld5TR0VLQ8XKhZl+Z0cYK8FM6HtWNs8glFbGIv1uM94BbyL4JiqJTJY
 5cYfi/r7ylLM+kSotAW2Z/00Q+DwDv7AApxYEHSGcsKgU3xuo1IVZCn21Dx13iHsrkFI
 zsgw==
X-Gm-Message-State: AOAM532nO9XJU91Mi98Ff2ON0DS+gocbzlxgl+zbpzRi1V/qYcowg5Jp
 HEJnhq/12fZAhzZFcTWqHHlTbmKg38Axcdtju8Y=
X-Google-Smtp-Source: ABdhPJztFKbuOe0LyWoVzhTd5PTasjsaz9xwrZi7ZRp+ngKxrzfWdxICCLL5OaYDrjZC1fkxtNCJe/zDiPOmSmsVmsg=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr28319352jap.26.1615299167988; 
 Tue, 09 Mar 2021 06:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-4-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-4-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 09:11:26 -0500
Message-ID: <CAKmqyKNhnVLNNuNVPFjjvM4OMFekJSu_dn3-sB6Ph7PAkvfTXg@mail.gmail.com>
Subject: Re: [PATCH 03/38] target/riscv: Fixup saturate subtract function
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Mar 2021 14:12:52 -0000

On Fri, Feb 12, 2021 at 10:10 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right.
> However, when the predication is ture and a is 0, it should return maximum.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 9371d70f6b..9786f630b4 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -2425,7 +2425,7 @@ int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
>  {
>      int8_t res = a - b;
>      if ((res ^ a) & (a ^ b) & INT8_MIN) {
> -        res = a > 0 ? INT8_MAX : INT8_MIN;
> +        res = a >= 0 ? INT8_MAX : INT8_MIN;
>          env->vxsat = 0x1;
>      }
>      return res;
> @@ -2435,7 +2435,7 @@ int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
>  {
>      int16_t res = a - b;
>      if ((res ^ a) & (a ^ b) & INT16_MIN) {
> -        res = a > 0 ? INT16_MAX : INT16_MIN;
> +        res = a >= 0 ? INT16_MAX : INT16_MIN;
>          env->vxsat = 0x1;
>      }
>      return res;
> @@ -2445,7 +2445,7 @@ int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
>  {
>      int32_t res = a - b;
>      if ((res ^ a) & (a ^ b) & INT32_MIN) {
> -        res = a > 0 ? INT32_MAX : INT32_MIN;
> +        res = a >= 0 ? INT32_MAX : INT32_MIN;
>          env->vxsat = 0x1;
>      }
>      return res;
> @@ -2455,7 +2455,7 @@ int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
>  {
>      int64_t res = a - b;
>      if ((res ^ a) & (a ^ b) & INT64_MIN) {
> -        res = a > 0 ? INT64_MAX : INT64_MIN;
> +        res = a >= 0 ? INT64_MAX : INT64_MIN;
>          env->vxsat = 0x1;
>      }
>      return res;
> --
> 2.17.1
>

