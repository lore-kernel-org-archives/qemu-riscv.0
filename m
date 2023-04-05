Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvXM-0004u5-NY
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvXK-0004qJ-Sm; Wed, 05 Apr 2023 01:18:22 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvXJ-00041D-Bg; Wed, 05 Apr 2023 01:18:22 -0400
Received: by mail-ua1-x92a.google.com with SMTP id r7so24831375uaj.2;
 Tue, 04 Apr 2023 22:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680671900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqee6GtDQsXlDrjPHQra8l2gPP5FMjOkT5mbonnHNpQ=;
 b=p43S1bVCnx534sRv3LtCaWJlR0TjlPkVlxv5yox/JScUAi2NzCksFUT/3Q0SKkYrZ0
 GNg7l28my6ZZJUGUqyO5xjtHAcM8NvTpr6MqdL36X/6qOYqTjL2VjipLmyv7dXBOL+D6
 3631eSVQAO5U0cggrBfy4sD9eXMd9Y7ML0HP8hKoVbY0SgeDSpMygI5q2WUAF+D4r0Ck
 5MOW1lblY+ZxHQYDURU2wW39Ou/F+uurg8Nh9+fsXzI4E0zM4GTAMZVpl641QcLHJsT4
 l3R+BetGgTP83aE5DhS3OVKA2XyPfVAK2iDLoo+hkmNKzsz970k445KExW/n4o6fpeq5
 di1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680671900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqee6GtDQsXlDrjPHQra8l2gPP5FMjOkT5mbonnHNpQ=;
 b=sGq3r5l/GxnL/2lznvPjct6MmEoqymvd9nYGh6vBB4pNjJsCN/xZ6hNXmMrcdrh604
 gZJGzItYJQ93Fu5/tznRFa5GuVEqurRYZ2EsUxNEHhz5S/WnuSK0oOr8OfvK9V2ySd2I
 fnMzljOZz+m5BKJsiKrM9Lz2UQ5bOVZdgZPYS54UCE/CTxVTHlb5fna1q3GtmJpfRCmS
 +9wTlYGAYOP6wjoKze3BGNuyNMSM2uIfOpnoWWwfZv34uZp5TbATNxDQ4I6vfqz+ldks
 4rRld/QyH9m9yVR33wutAwbU5zoOHGlfQK3zm9JkO3XTHgZcdcvUl4J9arIjd5Tt12VG
 KfTA==
X-Gm-Message-State: AAQBX9fytCWz5tAtbb8cCHqDllyj7XeJzBD3E8Ux6QGoHS/P1N97e2tC
 OcUHyk3XvwncXRfcLKjnPYoVYJs0TMD0lGdy5cQ=
X-Google-Smtp-Source: AKy350baTWKZibPCxQrGJ3/fM5i+alXlYknVf3bE3oOCe9xb9/6RCo50pZc2mXSlZ0c6JfkiSQW7Mh0QPQ/mL7+gj2Y=
X-Received: by 2002:a1f:280b:0:b0:43b:e059:987f with SMTP id
 o11-20020a1f280b000000b0043be059987fmr3740137vko.0.1680671899927; Tue, 04 Apr
 2023 22:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:17:54 +1000
Message-ID: <CAKmqyKP97U=C03eGMGsaVtE6oS7az5yeGYb+hAG3DJg4osvWNQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] target/riscv: Remove redundant check on RVH
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:18:23 -0000

On Mon, Mar 27, 2023 at 6:10=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Check on riscv_cpu_virt_enabled contains the check on RVH.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/op_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 84ee018f7d..1eecae9547 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -278,8 +278,7 @@ target_ulong helper_sret(CPURISCVState *env)
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      }
>
> -    if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
> -        get_field(env->hstatus, HSTATUS_VTSR)) {
> +    if (riscv_cpu_virt_enabled(env) && get_field(env->hstatus, HSTATUS_V=
TSR)) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      }
>
> --
> 2.25.1
>
>

