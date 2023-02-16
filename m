Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSaeb-0004K1-Ng
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 04:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSaeZ-0004Jc-J7; Thu, 16 Feb 2023 04:34:11 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSaeX-0003X2-RI; Thu, 16 Feb 2023 04:34:11 -0500
Received: by mail-ej1-x632.google.com with SMTP id 10so2911977ejc.10;
 Thu, 16 Feb 2023 01:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=td2riRHXSGpG+EFrMBxYOGryeQUr1fGlrhNwslqp23I=;
 b=bXyR2q9KWU+SG/+3EAJwixEgDzXQwtksyyo9TS/6+yNo5PW1MYjv5D/J0ZXtA9EOWu
 O/xHvzKFUPxdUcYynrQ8nA2MNhQracv/8zJJlV1GbV8A4btyv9k+8she1XwBKiZ+CdAg
 xWdvYIM3FiQivMLDv76GWGkUobaWY3dpKCYQUAcxgKFibuJo0DFtFnEeIorXLG4SL6jL
 oPNhx2jKstRamls7jJ5P5FVja6et4NF+QBY7lsTZZ/G+PxmugzHEsF0KFRoJfuUXmfhO
 DeujNozfA1B/Fh5sB7yfpAai5twCc61Sx8/tGWoEvviFLJ/bYPFIXBMgCKYqZ6ydQ/a/
 MhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=td2riRHXSGpG+EFrMBxYOGryeQUr1fGlrhNwslqp23I=;
 b=TQBMhQn467daNNuV7IaZqdV6PmYruqudBwgflBZ5PaVLdX9z9PMk9IWmFP7u9MiQgp
 xrwLz+xiY6pnFb4/bre9V1QJHpseBXz249qxFx7afyCtcSRUCF/czcu1yQbaTR0ojYKj
 NXRW1j9KVyIJecY03Cbqk5KskwzBeCwguOW+KXaAug7Bvt73x0EcKVyHIYyEpaxrEBNu
 RLZh4GlmkuillGq0L12vRfAmYxhlpH/6wa5hI4ORfCkD/ErD5LLQ/BnRJ/ik4e4A+Als
 E6S1xyh/zhMHhTAgyNZAmggtwmIKH28FgiL9TI1Zv5JVspPLNTQy1vGDdrIznUDxa15d
 G3xg==
X-Gm-Message-State: AO0yUKUcwMPQ58UsZMcrIh3pS6qdPh7BSC9I0ytls8DdXFzw9b2/jTYy
 8fqtx3RlQiKs8+gOOAJ/708kxYpXBvcikPClOoU=
X-Google-Smtp-Source: AK7set9SKjrThea3ltf2d3po/GzQGOCf8qOfZVty0/9+dUWhp6amF+UbYtB4J8dYgau/u4RX12ftknJQsGy33NF4VJg=
X-Received: by 2002:a17:907:3d91:b0:8af:2e89:83df with SMTP id
 he17-20020a1709073d9100b008af2e8983dfmr1179505ejc.6.1676540047257; Thu, 16
 Feb 2023 01:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
 <20230215185726.691759-3-dbarboza@ventanamicro.com>
 <20230216092922.sxxwuizbpj65zt4z@orel>
In-Reply-To: <20230216092922.sxxwuizbpj65zt4z@orel>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Feb 2023 17:33:55 +0800
Message-ID: <CAEUhbmUcbwCmTtBnXHcXsVY-WaO9RHG-FkYieppFeS6_NmCauA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] target/riscv: always allow write_misa() to write
 MISA
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 09:34:12 -0000

On Thu, Feb 16, 2023 at 5:29 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Feb 15, 2023 at 03:57:18PM -0300, Daniel Henrique Barboza wrote:
> > At this moment, and apparently since ever, we have no way of enabling
> > RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> > the nuts and bolts that handles how to properly write this CSR, has
> > always been a no-op as well because write_misa() will always exit
> > earlier.
> >
> > This seems to be benign in the majority of cases. Booting an Ubuntu
> > 'virt' guest and logging all the calls to 'write_misa' shows that no
> > writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> > RISC-V extensions after the machine is powered on, seems to be a niche
> > use.
> >
> > Regardless, the spec says that MISA is a WARL read-write CSR, and gating
> > the writes in the register doesn't make sense. OS and applications
> > should be wary of the consequences when writing it, but the write itself
> > must always be allowed.
>
> The write is already allowed, i.e. no exception is raised when writing it.
> The spec only says that the fields may/can be writable. So we can
> correctly implement the spec with just
>
>  write_misa()
>  {
>    return RISCV_EXCP_NONE;
>  }

Agree. Such change is still spec compliant without worrying about the bugs.

>
> as it has effectively been implemented to this point.
>
> Based on Weiwei Li's pointing out of known bugs, and the fact that
> this function has likely never been tested, then maybe we should just
> implement it as above for now. Once a better solution to extension
> sanity checking exists and a use (or at least test) case arises, then
> the function could be expanded with some actually writable bits. (Also,
> I think that when/if we do the expansion, then something like the misa_w
> config proposed in the previous version of this series may still be
> needed in order to allow opting-in/out of the behavior change.)

In QEMU RISC-V we have some examples of implementing optional spec
features without exposing a config parameter. Do we need to add config
parameters for those cases too? If yes, I am afraid the parameters
will grow a lot.

Regards,
Bin

