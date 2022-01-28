Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDJzy-0000oC-Bc
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 00:40:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJzx-0000lv-03; Fri, 28 Jan 2022 00:40:37 -0500
Received: from [2607:f8b0:4864:20::d34] (port=34435
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJzv-0000ZD-BT; Fri, 28 Jan 2022 00:40:36 -0500
Received: by mail-io1-xd34.google.com with SMTP id i62so6498436ioa.1;
 Thu, 27 Jan 2022 21:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4R+twz2g7ArR7470CisLDc2Kp+0psweNSVaULE0QPE=;
 b=Ht2osZxSVkN98WkCSpUJhDTkbu78/m5o2UY3+wAF+TUys2xrq3332ukjeELaJFNEAY
 jfv0nPoyodlHVxxvS6QL4FhcNmPhHwu0FnZtRqtvmpYMgqmbSt/0W1rFU0iBwjrr75id
 ngRPOcLWXhG36lbxGVB75mUtQZukp57UT+VexYDnplQ44/iZgpmLJWNin7clEeDeE00B
 iEVYc78kd/6vNesFmYKTsQF3T4ZYLioqWXeYsqyDgw5p48RehShLePMj4H7hTMKnOX4z
 5bUGRdGrl5R5mUObUJqThJSnWKJCPZjYftSVEw4LoMD6QCLXrAK2Oz14pxvD7i82iqgz
 ObSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4R+twz2g7ArR7470CisLDc2Kp+0psweNSVaULE0QPE=;
 b=5aBShwF5wbUXB/KKOuEflpf23qnev7eoimMFv536DSHl5h7w4qx03b6VZ86115jMRP
 7GFhur9vSa3bVcx0K6Tf3mrKw+GQEmchYc/a1WPiH4olKFFWTIRdv2d/NEwXlYZ6LF86
 wx5GwXNhScoNDTxD1qlR+91wDBVCA3OR4qVu0BOrlGB55X13ELRrxOT+HfY83Ld7knau
 TEhB1DJe0qyE+BQvLWzSkdsZcZf4zAcpPh4mBdjtIzBjd6FMaiiG6ODm85y7BnQpTDcM
 NOAX7xbjVMLCSFdPoRqtdT4kQHSd8RErKvkuzoQOeECUp41BofWYEQzF3aQARdG2iIuh
 +xVw==
X-Gm-Message-State: AOAM532zS6hEfgCmVinQ1jCAEi6FYyHi6RlMkd5i5RU7O4FZBX+swJ3a
 Mk0cymAKw6OYoIVMoKtoYfF5c3oesT8a9+TqNUM=
X-Google-Smtp-Source: ABdhPJwwe1RTW08k8yjCU4ctJ8L0bgeb7hXEOtVTu2zD3IgGZXq/idaW7cUfhd25Ff8XqnxHiojS8I3EaviigmkDClA=
X-Received: by 2002:a6b:4406:: with SMTP id r6mr4176001ioa.57.1643348433746;
 Thu, 27 Jan 2022 21:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
 <20220125064536.7869-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220125064536.7869-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jan 2022 15:40:07 +1000
Message-ID: <CAKmqyKMSWxhzSPw3de23J7+-WNS+gszu+LW22JeqmmFX6hp6tw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] target/riscv: add PTE_A/PTE_D/PTE_U bits check for
 inner PTE
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 28 Jan 2022 05:40:37 -0000

On Tue, Jan 25, 2022 at 5:47 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Could you please add a commit message to this patch?

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2a921bedfd..a5bf07ccb6 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -641,6 +641,9 @@ restart:
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> +            if (pte & (PTE_D | PTE_A | PTE_U)) {
> +                return TRANSLATE_FAIL;
> +            }
>              base = ppn << PGSHIFT;
>          } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
>              /* Reserved leaf PTE flags: PTE_W */
> --
> 2.17.1
>
>

