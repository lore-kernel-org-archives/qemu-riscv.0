Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPKVv-0001v5-FY
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 04:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pPKVr-0001uU-0F; Tue, 07 Feb 2023 04:43:43 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pPKVp-0006mz-Hs; Tue, 07 Feb 2023 04:43:42 -0500
Received: by mail-ed1-x52c.google.com with SMTP id a10so7562644edu.9;
 Tue, 07 Feb 2023 01:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4f+loUkw5z21T8u6JIiAm/XO0gtJ6V135D7+FC8DGQM=;
 b=QHvwwUqzqNc9fKuN5ALTT3HcBcvYK+jNWzbJ0AFwd7+tQyhlPByLBw3Qk0JkQ3ifbj
 qtM041er49gvPUL+1a4uavtWth0p8pk5fxFcApcXczJEVUHlk2uP7dPKi5IkogBRWodC
 TtwV5U8EEjBUjGDB4wyZtROYp3M/w6KwCulizLV54Apu5llQg8iXoWu3cp2QQo92v+X4
 A64Qd2q6RhTKAQ0Dm6bM+Vl1wGoqH4sMnrsvMvMdkQqsJMyXYIyZv0Ej4dCOsvqXOnI1
 yrVGDd/N5c1lUp3VOBhRYHie9/A/R9oq1BJnjFJ9KV1OWA0dlSRNFVh970G5CGpgPyid
 jxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4f+loUkw5z21T8u6JIiAm/XO0gtJ6V135D7+FC8DGQM=;
 b=qD2IQJ2QiNxGyQGLycijZCAlM8gmtb4zpUTQqGAPK9UsOzvbx+7tc5mLpljDn16/5a
 Hx4cpIOwUMb9B9jqmEn2VWMerFBL6PBDzAJOWaQ5n3RZVGWCiogAlv4ZHMNW+L+4lbXc
 Fd7iJ/mphq1gxPuTyE98rn6mrxQ8apcG4Yxtnfv6byIakUJtddAQ/d5s20jet5aGnF17
 NnzIY06qyblXww/S1j0ZTBfFnjayaAAnwxoXs10ES0LGlPHc+womEceKy3qyDlCRVywZ
 4PSzEjuLdo3SfVqxzhiDF+pb1reT7giSls1UIvh3lMVdmO3qik1tVeeu8ApZKVlYho3f
 5Ddw==
X-Gm-Message-State: AO0yUKUKyBccSe62MG2WmUAlBaKdsefSIbyn/QTsCwROKnvaPIwH0UFj
 N+QekhfS3BUjMNJCCP4wxkJSxImki3q9k1UbNgU=
X-Google-Smtp-Source: AK7set+XkfRHssXS7clUwtIiLC4LXHEKSxQsMp4UHcQSJcTX4qi/+flcs/AyWLQjpiSyEnG+4NT7lGSaZhjBJd7VF0M=
X-Received: by 2002:a50:c047:0:b0:4aa:9f07:aedb with SMTP id
 u7-20020a50c047000000b004aa9f07aedbmr437537edd.6.1675763014892; Tue, 07 Feb
 2023 01:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20230207084341.303907-1-frank.chang@sifive.com>
In-Reply-To: <20230207084341.303907-1-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 7 Feb 2023 17:43:23 +0800
Message-ID: <CAEUhbmX658AY8Gr=_FZfbBct+WiTuFdeQn1j=xDq4jEyi=3ORQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove .min_priv_ver restriction from RVV
 CSRs
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Tue, 07 Feb 2023 09:43:43 -0000

On Tue, Feb 7, 2023 at 4:45 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> The RVV specification does not require that the core needs to support
> the privileged specification v1.12.0 to support RVV, and there is no
> dependency from ISA level. This commit removes the restriction.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

