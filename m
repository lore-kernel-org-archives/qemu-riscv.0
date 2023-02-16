Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSeI7-0001LJ-PL
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSeI0-0001E3-1Z; Thu, 16 Feb 2023 08:27:08 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSeHw-0006RX-G8; Thu, 16 Feb 2023 08:27:06 -0500
Received: by mail-ej1-x62b.google.com with SMTP id a3so5154746ejb.3;
 Thu, 16 Feb 2023 05:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CplCPzI50Th7jHG+c71KD2WSIU0BgVLVu/8hr11aSiE=;
 b=leDm/MncRLvSGpAKgOn9eLBexx7OqdnFZB79Hmxn0lMxlRrqcDa58bdDxKLtS/19lA
 I4qORVy+0InGTP/2Gl/M60PgD+JhsJhrdcI4r7fqRp3bYxngPffwHMAnTmN5IW8hhtca
 7MP9Fg2Bjowpko8xhaxTLB8kV7quAa2k82KMWjDUxui1MRxX1PGCehVsexgktPKWRN0h
 OlfBxdiAuoZIxz932d/cHWdzaZ45Am6bdi9C5gUeLjGKzuHEvNSe7gCEVGal5DIywkIF
 FCFzG/Ni4qvpznRouoGdOuqyt9KW+IuNFkiP/sQSICLyVHAv14per2TCV0BdNvjiO/dx
 0jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CplCPzI50Th7jHG+c71KD2WSIU0BgVLVu/8hr11aSiE=;
 b=dYFe6IpNuxwsium5CzWf1OW3PrLeS6n+FTJHDBJ2yxn23k4rtaOftx9TMYxXtoQicy
 PL9cVTHIoIK8nK3DpJEDZ+oXFlO7idBSj7CT4Or85SeUjOFwWp1yau+3qIJi+x3g2GII
 a7F/uwtcDUJ3U0ytMW6U6d2LpdFka+UY+yxHChmWquHiC1jGan8T8IdO572KJTkQwRW3
 bQV8fqSDW7gH44Jixk4UPPs3hiG8ARTnd/bD3RumeqlZtF8BAybJJDx9aGulSjoFqKeV
 ygDtmzufi6PO0bOI083u+HbMDWI+xas7tEY0HJPLTZDjhvA36JoYIIKwoSnyr6iyLiOM
 mGyg==
X-Gm-Message-State: AO0yUKXJ0tnyLvdZOPR5yfK2tiLzWZY2g49r45qz5xZH+8s2WavNP0ku
 FpT3I3k3o4Wv8apkk81OwzToL1wE+f+Rp9XfJOw=
X-Google-Smtp-Source: AK7set8k16iaeW0njNZKPFkhK5wh95IuP4uv95M82dqcOLQc2nz0RmhuaYHCdxo2saD9qOBSqOYxjibATnr70TR0w98=
X-Received: by 2002:a17:906:5293:b0:8b1:2fff:8689 with SMTP id
 c19-20020a170906529300b008b12fff8689mr2847565ejm.6.1676554021509; Thu, 16 Feb
 2023 05:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
 <20230216130444.795997-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230216130444.795997-2-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Feb 2023 21:26:50 +0800
Message-ID: <CAEUhbmWWhwckM0pNQ1uE1BnMJJiE4J7FteZicqAy1cfyTHLJQw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] target/riscv: turn write_misa() into an official
 no-op
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 16 Feb 2023 13:27:10 -0000

On Thu, Feb 16, 2023 at 9:06 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to write this CSR, has always been a
> no-op as well because write_misa() will always exit earlier.
>
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
>
> It is important to mention that the spec says that MISA is a WARL (Write
> Any Read Legal) CSR, and having the write operations as a no-op is a
> valid spec implementation. Allowing the dormant code to write MISA can
> cause tricky bugs to solve later on. Given that we don't have a
> particularly interesting case of writing MISA to support today, the
> risks outweights the benefits.

typo, outweigh?

>
> Let's make it official and erase all the body of write_misa(), making it
> an official no-op.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/csr.c | 55 ----------------------------------------------
>  1 file changed, 55 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

