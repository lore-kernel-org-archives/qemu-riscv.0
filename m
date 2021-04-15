Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lX4X9-0005eb-Ki
	for mharc-qemu-riscv@gnu.org; Thu, 15 Apr 2021 12:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lX4X3-0005YZ-BP
 for qemu-riscv@nongnu.org; Thu, 15 Apr 2021 12:07:55 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lX4Wz-0002Lm-Bk
 for qemu-riscv@nongnu.org; Thu, 15 Apr 2021 12:07:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d8so12324201plh.11
 for <qemu-riscv@nongnu.org>; Thu, 15 Apr 2021 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0zBREN1FcFgw+CT0xYoBoMpesVAPIJzLpyxxtfQSIR4=;
 b=JLgxkWkyH9Lf0bm7gr0NG85phFa5k6IldPpLreA02llollIYQ90rOZjw1WmGPoKR4k
 s/U1SfOzmhP3Ma9j5ZW9HfBTjvQkW5T5ma5OA2fSB95uD3pd8Sh9fOd/xSTIrynV1FXR
 LNJSDUlIoLw0+Ko4kYUxMUmkdAhPYfAVVj60gTuaskywPzLkc9ucVNhRuGJs4HKHHxxr
 peqUPO/Nwsys80t8w9G7vS8bGr6lYyg50rY1y8W97SPXhbPadM+8OEwQVK5ABz6FaTMw
 A770dBKEuCOvu/Ohytk3wLtZ2AA4+Dcxq2H08ahMNCTKgwBACq0E4YPZUSMBb045yd+g
 yzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0zBREN1FcFgw+CT0xYoBoMpesVAPIJzLpyxxtfQSIR4=;
 b=H6ibfuJGhTlY+/uCikapJCx+m2NKxvAxIGloON7C6gaBNpSnbUwqKT4eY04mh+WApi
 USlBVnp4D9of4vjO102lFDKH/L17i/msY7b1z8SlTlVZB5YFmMn07KHllgtGJDCBj6Fu
 68Gzn8yA1THrRrV51iTwDzy5dUn4BfvEqR8YDX+bizrQCPCnag3fZMN4D0je1nqrrFxy
 6zj+3SlVxxaxjWc/uR20ls4hE9eIxmKpK9Gll+L5kkC0SafYKu0UHQIJqHEsE5IStq79
 dwj5hrwxgA4YrShKkWKZvrhqe9NfQtvzRHaBnfiPpA1TpoYxDWL5xztjZc4RHV0MVRuP
 r0SA==
X-Gm-Message-State: AOAM531Ed4E0/3CdRYVcPl14gmyHVvurv/gx9l1kbyALoS0MA4YKU6/m
 YD7OmfraTyOCbTb7tytvwfRJRP8GEiXGWA==
X-Google-Smtp-Source: ABdhPJzvLoeNocaDUA6iJ+kbBgDTkaj3Zca0+vbShNC+jdWO5Kk2Wh6hAK06mr1iXAuapk+kRCleuw==
X-Received: by 2002:a17:90b:60d:: with SMTP id
 gb13mr4547611pjb.173.1618502861591; 
 Thu, 15 Apr 2021 09:07:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g12sm2512613pfo.114.2021.04.15.09.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:07:40 -0700 (PDT)
Date: Thu, 15 Apr 2021 09:07:40 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Apr 2021 09:05:37 PDT (-0700)
Subject: Re: 
In-Reply-To: <20210415134128.32670-1-emmanuel.blot@sifive.com>
CC: qemu-riscv@nongnu.org, emmanuel.blot@sifive.com,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: emmanuel.blot@sifive.com
Message-ID: <mhng-3e665ca6-2713-44c5-b0c7-8bab2fe1290a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 15 Apr 2021 16:07:57 -0000

On Thu, 15 Apr 2021 06:41:29 PDT (-0700), emmanuel.blot@sifive.com wrote:
> Date: Tue, 13 Apr 2021 18:01:52 +0200
> Subject: [PATCH] target/riscv: fix exception index on instruction access fault
>
> When no MMU is used and the guest code attempts to fetch an instruction
> from an invalid memory location, the exception index defaults to a data
> load access fault, rather an instruction access fault.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
>
> ---
>  target/riscv/cpu_helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 21c54ef5613..4e107b1bd23 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -691,8 +691,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>
>      if (access_type == MMU_DATA_STORE) {
>          cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> -    } else {
> +    } else if (access_type == MMU_DATA_LOAD) {
>          cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
> +    } else {
> +        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
>      }
>
>      env->badaddr = addr;

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

