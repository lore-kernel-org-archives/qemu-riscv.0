Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn8QP-0007EQ-6R
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 19:03:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn8QN-0007DY-F7; Tue, 16 Nov 2021 19:03:39 -0500
Received: from [2607:f8b0:4864:20::d35] (port=42890
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn8QL-0003T1-L5; Tue, 16 Nov 2021 19:03:39 -0500
Received: by mail-io1-xd35.google.com with SMTP id x10so781381ioj.9;
 Tue, 16 Nov 2021 16:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O8cGFq4ydty2yWe5+6EyLzcP72kskIVeKQM8JJewVqo=;
 b=lQJ+wMixhF5ShBJUkn32RSjmg12ahlzTf983ZT5KnHH1EXPmkxvn19bNG+K5J1tJhe
 qZ4Wwi3P2Keg+vo/1p9hxT5AFU0i1k2/G1jvVH21nInTbTZkjnMfcMm3sW2T632OfLk4
 no1lN4Omx7Yn7ggj0X6R7dgpJvuKLEoe1XNJdl1B3A7kU/PdbcihpTA8+vDmL0Gu+up3
 JyGjrzaVD+oRXJGzOug9pIT5atu9L14Aw9cckD3Xtk5krzz63ai8wTxzB6YvZDcR/oZ4
 mRLORInOVjoJ3mIPI5MAfcau6QXS6QMTVqYhkwIGCBJgd8ZjKPofZmG0AAPVKgowdbpc
 H5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O8cGFq4ydty2yWe5+6EyLzcP72kskIVeKQM8JJewVqo=;
 b=T/itaOoFeSX1gkdff/wRdvJkEq7hMT/s0exuB7K1CUVcyuvZWPKSlVU3ij08Nvc0En
 BT0kbBiySdBpLIWEgQTRYgU8ec3WXvfCta40KGz53J33hdVbG4QImJ2qsRV3OCfDSkMt
 0up03Sis96CgdGmhajcUHOop2/2arDcz+EFy3CfxJGtrEgwDw4lot4umQQGgF68LgMqa
 J/MJI2LwE+FGZP2qL0u8dIvTh21Hf/xbhNbbpUvHKT0o/syx7BU+yLpUTvN1VeQblkF9
 12jD3tGxNt5JKWzKXZ+xzw9tYWYHfbvSgTpnkzZDZAoqiLPasv4DbZKzFe9xw9OAQj5S
 WdAw==
X-Gm-Message-State: AOAM533njaslGnd50kNxMLik4SAVoy30W0hQpbf/mIAeR4a5kAd4IuoU
 HHdiP23zZRKoPWVKVEHkrOwj3cmhwpZc/5ut2L8=
X-Google-Smtp-Source: ABdhPJzWmwp/ro5em5q107Ph2Zn+ZCGzZcZ+KywPhJ58lSvOk1TUTQ954+puJmx8sLcGkU7hwSfNAKgnrmMBF3WCWIA=
X-Received: by 2002:a02:9f0c:: with SMTP id z12mr8945778jal.117.1637107416374; 
 Tue, 16 Nov 2021 16:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20211116151138.81209-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20211116151138.81209-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Nov 2021 10:03:10 +1000
Message-ID: <CAKmqyKMAzzV=6pWY2V9r1UmCFGG__JBuFGhTQ19Uo=VwiD2eww@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Check PMP rules num before propagation
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 17 Nov 2021 00:03:39 -0000

On Wed, Nov 17, 2021 at 1:12 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> If PMP rules number is zero, it should not influence the TLB entry for
> M-mode program.

This doesn't sound right. From what I can tell if we have no rules
pmp_is_range_in_tlb() shouldn't have an effect on the tlb_size. What
error are you seeing?

Alistair

>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9eeed38c7e..48da872d39 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -376,7 +376,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>      }
>
>      *prot = pmp_priv_to_page_prot(pmp_priv);
> -    if (tlb_size != NULL) {
> +    if ((tlb_size != NULL) && pmp_get_num_rules(env)) {
>          if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_pmp)) {
>              *tlb_size = tlb_size_pmp;
>          }
> --
> 2.25.1
>
>

