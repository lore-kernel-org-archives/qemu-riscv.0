Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nsuuM-00089o-FC
	for mharc-qemu-riscv@gnu.org; Sun, 22 May 2022 19:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nsuuL-00088p-8n; Sun, 22 May 2022 19:22:45 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nsuuJ-00077Y-O0; Sun, 22 May 2022 19:22:44 -0400
Received: by mail-io1-xd2b.google.com with SMTP id z20so5206069iof.1;
 Sun, 22 May 2022 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/AUg6vmvByxjRMMG6eH3crdN1nUWc7zB3TZQAxQ6NzQ=;
 b=lkQrHqyxMR+/HfYvIn+DwODmWRPI61d77CSwQhoJOxbUANAH/aBKEm6Dwpw4B4eUtY
 b6lpQBZs3dtU1KgChOxG6E9MBa7feCVu6fmXpzCWMnkRm2b6SvtR990ZyvcSsnOrjVW1
 cO2PhzDqluzVLUpIbSiJdrVMmPNiHtZDGPyEhIZYHfi2u4I9ktAQEG2iMdyJWC1+oJ8w
 btNryI8aHkRj4c0rCx9f8qUEfZ4iz/f3G/WoBpngYEP3SkXa01EBLKN0bPSoOoJ53cHv
 dCF1eLgAzQE/1LM12mxuAlv8I2IqSf9ALJS+VCWDImBSYJzP+p8tYxlb+HdxAse3Q+Yi
 GPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/AUg6vmvByxjRMMG6eH3crdN1nUWc7zB3TZQAxQ6NzQ=;
 b=6XHlLNUaziCihqi3JP/9nrCjSsNUT/R4px6FxFsjT+b6ZoknZL0Y4BAUPBwyzNdf9V
 1J2s3Wr+AJpo/X7JnhevV6Sgxel9QbadxCCQMBdNtjw2GcKhgk/iXz6bKikvN0cWtu/H
 5gjmhOo8Zg++vLD1H5WepdmJElAkTu8rnMS8KrRt6XTgyJg3deJG1ZwTr1IPFd3eEtgW
 mTIaakeo+9wXB40oK5El79CI4o+docyufK3yrgS+LHaA7upVXof3oHqdbJsWftuMI4Ae
 NDd18YwDhDSlKYZq4UI3BolEsPB74jSPDZbqlC8N6MVEj4KgiSZYFgmyfTQmPmJ10gww
 XjiA==
X-Gm-Message-State: AOAM532RlL3nEHg4H+OVHSpWo9uJPDxv4rYeyj/37ti+gUQV4EwH/A/S
 GouPvdx8D13euEyjm6KRytyXt1Ull9q74mACN2MvL+Gk9A/szqda
X-Google-Smtp-Source: ABdhPJy1xlGSs5xZklURdPIqrcWdhTGosbdXpPpgC009ZcmOBFlMySmtA9Dy7Wx5ZFnl3pgE/yRuBZ1e9JAvbN/+Tqk=
X-Received: by 2002:a05:6602:2019:b0:65e:5056:1df4 with SMTP id
 y25-20020a056602201900b0065e50561df4mr7063619iod.203.1653261761336; Sun, 22
 May 2022 16:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <YoTqwpfrodveJ7CR@Sun>
In-Reply-To: <YoTqwpfrodveJ7CR@Sun>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 May 2022 09:22:15 +1000
Message-ID: <CAKmqyKMRPmQVy7_6iWL9KT_S+uYY0Wzb2OZSEA86Y7outG2gHA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: add zicsr/zifencei to isa_string
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 22 May 2022 23:22:45 -0000

On Wed, May 18, 2022 at 10:50 PM Hongren (Zenithal) Zheng <i@zenithal.me> wrote:
>
> Zicsr/Zifencei is not in 'I' since ISA version 20190608,
> thus to fully express the capability of the CPU,
> they should be exposed in isa_string.
>
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6d01569cad..61fa9b97a4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1027,6 +1027,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>       *    extensions by an underscore.
>       */
>      struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY(zicsr, ext_icsr),
> +        ISA_EDATA_ENTRY(zifencei, ext_ifencei),

Shouldn't we have a spec version check here?

Alistair

>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> --
> 2.35.1
>
>

