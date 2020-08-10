Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5GZr-000523-5m
	for mharc-qemu-riscv@gnu.org; Mon, 10 Aug 2020 18:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k5GZp-00051s-QH; Mon, 10 Aug 2020 18:47:33 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k5GZo-00009Z-BY; Mon, 10 Aug 2020 18:47:33 -0400
Received: by mail-io1-xd41.google.com with SMTP id s189so10705047iod.2;
 Mon, 10 Aug 2020 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dxc546p/XTjL0jg8GPPGX9kFHD8YVGDZwJnCXYzvNm8=;
 b=XH5l59YwrDapFwBZMNPnhwJj4Gi075lXLv468KDIvVEqnJ1XEIn8PXIPnu4yo+NPF5
 pK0y6XlCQUU093MhaJ45PZbF7FqZwWbTFnEI6fmY9eUWU/fgFEtxsDSvLHpPX3F06JkC
 j79cZ30huZgVVaSQcE+DPd00xS0hkO8Tb6vyAvejg9dwYt9Q7shF+MmAOI7uB9olHNNo
 9pmcwlCK77U6Xg67kFSupM5gogU9yAzmxSLTxVRWCWWBPQ8QhUOTnAiGHuQ3gVeDQw5Z
 fc8I5i2UM7bhZdOq30gPv/GtmZ2nnEVx+uBaccSse6DPWta8dr84ePtozzqIjEfqeE9r
 GaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dxc546p/XTjL0jg8GPPGX9kFHD8YVGDZwJnCXYzvNm8=;
 b=mQvZpDv9wsuIevCufGTDN1uJZ3bcAkzQZjQtUyoLuBfXI68fpBX245K5TmBJBvMnVj
 Sq6RGR1WCLzl5JtTJZKjSMWqj6ykxR+UIzQ72cbyGkxuhHgsuGbE9fLBYBJNDBWAcGTA
 03xbMixJcL6lli1pFlQK6oKdQY1rOfEIQAGwxPIwHehUG136qmZ1uXcEzjd4Ci5qtmxg
 YSsWaX1dlA5CttGbbRHp48+mydQ3WCmc2Mt3xwUiXgPXKnLrfzEmiw89fNcKVQdZeqy8
 BN9a8KcgowEEqL2smqTgjKlqCSB1eWMJ5IsCg55OKvfDWk4zOLtYUUAM4frz2pyD5yRb
 DU1g==
X-Gm-Message-State: AOAM5307khvwppHAe1cMDkEJr9jrHDTx/eGrsULZ9fpCtbJAFPVGQR2y
 EjIuZ2ql/PA1OVmGR3btN7HwWgYvwlmdargugmA=
X-Google-Smtp-Source: ABdhPJx7AYTEHUAb39AWIK2s3wvIww3TNlQkO2gDr8eV/mGBhN2f1c3rL40AzAi9N74Joy8hV44Os1m8qii0KkwwamA=
X-Received: by 2002:a02:84c1:: with SMTP id f59mr22676456jai.106.1597099650822; 
 Mon, 10 Aug 2020 15:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200729112801.108985-1-anup.patel@wdc.com>
 <20200729112801.108985-3-anup.patel@wdc.com>
In-Reply-To: <20200729112801.108985-3-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Aug 2020 15:37:06 -0700
Message-ID: <CAKmqyKNaXpYt21PdX3EwwDXQEjcTD5_+Vpi3J3f2CNywjX8_OQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Fix write_htinst() implementation
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 10 Aug 2020 22:47:34 -0000

On Wed, Jul 29, 2020 at 4:30 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The htinst CSR is writeable from M-mode and HS-mode so
> we should not ignore writes to htinst CSR.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f985b85de4..99fcb7f67d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -943,6 +943,7 @@ static int read_htinst(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_htinst(CPURISCVState *env, int csrno, target_ulong val)
>  {
> +    env->htinst = val;
>      return 0;
>  }
>
> --
> 2.25.1
>
>

