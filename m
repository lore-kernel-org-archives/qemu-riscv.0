Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSouj-0000pJ-EN
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 19:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSouh-0000oI-9X; Thu, 16 Feb 2023 19:47:47 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSouf-0005vh-Cr; Thu, 16 Feb 2023 19:47:46 -0500
Received: by mail-ed1-x52e.google.com with SMTP id u21so9579608edv.3;
 Thu, 16 Feb 2023 16:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AiNIOxQ6rX1Ru+Z1mLh6GY/CNr0ay3G7aslM5J5XgKo=;
 b=DGUoSGtlMvOJKIIvqnf8byPMK90PsHkwfl+vYamOfVMTZ0PY18StyYAsdyuxP3C404
 9hjl+WZvV+kCzLj/i0Zv6mMyyBVEzSATjABZRN6dN8TuCEtMPaclCCKCBFJAx2e1XvvY
 GOK9ZtG09VxkBVmLJOEMafZvT4CYj6a25YZmMK1puKHGD10psreWct4Qi1DsF07jt6W0
 LYJDVeMiVR7rvxxdgVLs5lnXz1MyFQvgtvKot8mhxX+uwTxZNXL9TzzppTjeHZuajPon
 FgrzxYmLn+dr5KzJBZKNRsj0afVhZNzphptgiR14OKeOX2R7yJYf5lILwFQiD1knC1nc
 soUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AiNIOxQ6rX1Ru+Z1mLh6GY/CNr0ay3G7aslM5J5XgKo=;
 b=lMHDqqatq6gbpvxWqsaeNYxTL9DeRcfgISn60iS/DFiGzYgUpKWMONVsFvD2ypA+vY
 9oBegm0Uoqcc0o849L98WTsYNjVlBOfuVgZlKu2VqO4skVgjgLJ+CnW5JkLZUOLhybRn
 g3raGyvQSvsbtzxmR0WhHj9/UhoRJOVfsGxJc9RaaTFqzH7ndTKqhqeYcrATu3Sv89Iz
 v4BYlB2qGuBVK8Gjr69U63ag2L8TJj0L4Ab/c++G8L2eVPku5yW1J1gMHr6xqgbhKuUq
 79fKbFyvc8kAbQSLEkHIeWgESrpt92usvlfo76k/mlbawk+ayAvjExH/Qv9j8PpzvNGV
 RkAw==
X-Gm-Message-State: AO0yUKU7KRghztFTezgcqkHwJTfIuqAU5M/3C8rfN8lE6m+HjLcKxtJ9
 MvTq3sC5Y8XFAc/PKAoahKtw3JASvvZeATAKktM=
X-Google-Smtp-Source: AK7set9A4JLw+Yha/WfEyhFmFSRrCdnCoUH7OkcOn1dsvJFM8meTdM/WtTFBrr/nS0aiL3Y153bv04WFIP9+EWxZYQo=
X-Received: by 2002:a17:906:5293:b0:8b1:2fff:8689 with SMTP id
 c19-20020a170906529300b008b12fff8689mr3749732ejm.6.1676594863132; Thu, 16 Feb
 2023 16:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-3-dbarboza@ventanamicro.com>
 <CAEUhbmVQa=A4CXT=hhN_NNaq2ObbZ3e13GJB+7UJ3H+-qMsOyw@mail.gmail.com>
In-Reply-To: <CAEUhbmVQa=A4CXT=hhN_NNaq2ObbZ3e13GJB+7UJ3H+-qMsOyw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 17 Feb 2023 08:47:31 +0800
Message-ID: <CAEUhbmXta4bLtrRXKpsJq28aG9reTZfm4rhGUybDbgcqS5X2BQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] target/riscv: introduce riscv_cpu_cfg()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Fri, 17 Feb 2023 00:47:47 -0000

On Fri, Feb 17, 2023 at 8:45 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Feb 17, 2023 at 5:57 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > We're going to do changes that requires accessing the RISCVCPUConfig
> > struct from the RISCVCPU, having access only to a CPURISCVState 'env'
> > pointer. Add a helper to make the code easier to read.
> >
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >  target/riscv/cpu.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
>
> Looks like the RB tag is missing somehow?

Never mind. I see the difference :)

Regards,
Bin

