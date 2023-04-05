Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvgV-0000Ua-B9
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvgP-0000Ol-9s; Wed, 05 Apr 2023 01:27:45 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvgN-0004rR-Mv; Wed, 05 Apr 2023 01:27:44 -0400
Received: by mail-vs1-xe32.google.com with SMTP id d18so30461353vsv.11;
 Tue, 04 Apr 2023 22:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680672462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAIf8j8SjQRQ+Jym7xV9/lWu90yOWHQBhTb9ueNVJoI=;
 b=JexYL5yT6d0ZloQ9UwjmId8uXZQq6dDExAm/ZECVsNNzbi7Rjbn9f0bvL7DeGIX9Vx
 DfsRSAJV4wWwPonoIth+lFl005vG9eE+tHlJB3JTrpPfmBcsAsgUf8BUfqY+qJ6IkEnm
 vsldH/kTLyoAe2j+1tU1UP9JRNuQ0LcGmEFPDazdin8hs2ZmERuUR9ncaVV3kbfQVRUZ
 EsRbB09A2OZ0UJt9zSZ4z5OCPZUBw4Q6KgDiiFda6ZooI30GKwnYQLGMVcXbLy+UFlES
 XRGhlpn+F48Z+7xPLCUXeYOAvxTveEU/rnjvMeRZxkF5P1xewW+NvMqybcUiB9L6zWJm
 pqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680672462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAIf8j8SjQRQ+Jym7xV9/lWu90yOWHQBhTb9ueNVJoI=;
 b=sz9nsnMvMBWJ7EQRnZX8HaAtyDfapGE/GEVj0ZytqjzC6U2eQy9F9rKzp4xHjCYEwb
 yQEJ3/CYvUaAVroEfpZj1aQmufdHvbTHpSFvk/6hzW0NQCuK3V2RGCU5ZrtPnC7mhlyS
 MSt/K+8Q6NIAS7OGV9xYD3NaTiWcQuEdr9LCBWYKuvJTxYcsjbGjmI33oYMlIqiYW76j
 UtPNGXKtJo6hlc/fKAt4WR+Kz53mUK4umAlN7HXGiXkVPw7vIqQS7b3g+O9xY+167MJX
 Miewsugxdl+Wmmmvg9q2kLmZOJNS4lds9tYtKnMH+KZGrOpK6N0zPq/chqcV/cN/ngAX
 39MA==
X-Gm-Message-State: AAQBX9chsWHJ8fkNsDqXvMQ2apMnyNIW+BptTQ+Q0x2Gm5CHOlSh6DNf
 bByobv/yCy4UcJ9OpIEi/pkPA3SK2vBNTucCgbI=
X-Google-Smtp-Source: AKy350baJLy8nU7Zxr6Eju4FUjuhxJT0fIqDawdv9Klhlb9wOYZwI4c/MyfSNni/fjEBFcFZYakXEnuyUXa/9OWvKuE=
X-Received: by 2002:a67:c29e:0:b0:425:d39f:3882 with SMTP id
 k30-20020a67c29e000000b00425d39f3882mr4021955vsj.3.1680672462301; Tue, 04 Apr
 2023 22:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:27:16 +1000
Message-ID: <CAKmqyKN=44S36Vqi+bn5_h9KYrc+mV_ssG=SxiWiOFDAqVtjqA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] target/riscv: Remove redundant parentheses
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:27:49 -0000

On Mon, Mar 27, 2023 at 6:12=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Remove redundant parentheses in get_physical_address.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1ad39e7157..9145ca0ddb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1046,7 +1046,7 @@ restart:
>              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
>                  *prot |=3D PAGE_READ;
>              }
> -            if ((pte & PTE_X)) {
> +            if (pte & PTE_X) {
>                  *prot |=3D PAGE_EXEC;
>              }
>              /* add write permission on stores or if the page is already =
dirty,
> --
> 2.25.1
>
>

