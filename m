Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oi7e4-0000B2-WF
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 01:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oi7dj-0000A4-D5
 for qemu-riscv@nongnu.org; Tue, 11 Oct 2022 01:17:19 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:33508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oi7dg-0005hx-Kj
 for qemu-riscv@nongnu.org; Tue, 11 Oct 2022 01:17:14 -0400
Received: by mail-oi1-x22f.google.com with SMTP id w74so6593119oie.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Oct 2022 22:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MnlJJQ+OTZgC3sli8LWwnmi9LDzvjZgsISyb9OT3Rjs=;
 b=E6hhy8EDuZQCwyhQ1vcGJeL9Q+9XCyRZsymOnGhU90blhE8PqN0c2qkjhZqewxT4JR
 glGNTOBF1Iw2PVsghEs+l8PsENs9oTyMYvRa5XZhZ0YpcPPTjTnocy8Ee7eWqjEBQSF1
 4i72wtjvgt8VuyH4ZTctfRJKfh/NcDxtJhmnsvRUF7kp8iYXLVYrTbypKuBMfE8dRDjS
 mqu3cBhYcazVIM1bEP5KvBgFwMcOnK8BE3Ff7Vtck5C9Sl5U6kv34oHdiOC2L000V8KG
 YV/l2HfsUzmI2Iiy6oAiAFL45D9TpgR9VtJyGdNAbAgwUtXRWU2mEUn7E6HUST6VGdri
 b7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MnlJJQ+OTZgC3sli8LWwnmi9LDzvjZgsISyb9OT3Rjs=;
 b=tCY/o6Gkzw2gJOa0r8LU4T/txi7yqkhJNKQfyII9oM9GWwrTL/N+C25l/HjufM0ZaP
 6stretrb9UY7TC8v/1qpLwTqqOBNAQ3Eo51DFXqsUzDY9TwfsFLIEEF9agCVH0nFmH6c
 guZAlQem224647oEYq5OitTi/9Gxk+E/621UvoUkHH3pD9WnEeCXcSin80KwfWHh7jeJ
 Yj7St0RwxthdSeTmzgYvb6pK8439n9sNGfpombddMNVMUxVvm9JWaJY28/IS0IjZvVDY
 z0ekbfTvn7T5WzxGK87m3Vn7g+CYzxmTW2i2CdF14tWmiPWbMHqV0UG3jr3WV1zfEYxi
 yr8w==
X-Gm-Message-State: ACrzQf2knmt5Kq0UEpZpZNlrcrUct5ILweBoGWf6LADDVPBwIvJ6V16A
 xKx0SbfSWMC/0q/3J8BwYGn0FxU/K1pvCLN+Cer0pQ==
X-Google-Smtp-Source: AMsMyM4mwO+qYUSxx4F6l/ig5bb10xLGA+EOw6uc5diLEt1zwrohqz+D22Fy2zv/dIjjVZxeB/AXNlEVssla54A9ccY=
X-Received: by 2002:a05:6808:1244:b0:353:c8f3:9928 with SMTP id
 o4-20020a056808124400b00353c8f39928mr11101188oiv.152.1665465427437; Mon, 10
 Oct 2022 22:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221003041440.2320-1-jim.shu@sifive.com>
In-Reply-To: <20221003041440.2320-1-jim.shu@sifive.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Tue, 11 Oct 2022 13:16:54 +0800
Message-ID: <CALw707rXdhbeYiWQTb-fGDR56CfnzbY7eoacLS8hKvgded+Kew@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Enhance maximum priority support of PLIC
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, chigot@adacore.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=jim.shu@sifive.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 11 Oct 2022 05:17:21 -0000

Gentle ping.

It's a patch for fix and spec alignment of PLIC.


On Mon, Oct 3, 2022 at 12:14 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> This patchset fixes hard-coded maximum priority of interrupt priority
> register and also changes this register to WARL field to align the PLIC
> spec.
>
> Changelog:
>
> v3:
>   * fix opposite of power-of-2 max priority checking expression.
>
> v2:
>   * change interrupt priority register to WARL field.
>
> Jim Shu (2):
>   hw/intc: sifive_plic: fix hard-coded max priority level
>   hw/intc: sifive_plic: change interrupt priority register to WARL field
>
>  hw/intc/sifive_plic.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> --
> 2.17.1
>

