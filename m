Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC1BC0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 16:06:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvgOJ-0005oE-D2; Wed, 25 Oct 2023 12:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgOG-0005ne-9m
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:05:52 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgOE-0005Mj-7x
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:05:52 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so903791066b.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 09:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698249947; x=1698854747; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a2W+cfx4ygltibwHiauz+yXltI3yGSlfMY70472otNQ=;
 b=n43vwi8SU6OVCq8TwTd+uFbf81p2Y+qxCRWms9XMd2BF/55XhE1/x9l8jK4Qx2vicW
 f3h4262F0Hh9q0yHP+zYuU7y9xRGKwwPjuc/5Oph8gi4HYHV6q6s8FFitjqNgPalBUF7
 zMeECgAgVlu3Fin7mXv4Oh4Xm1h5XHjz95/CpriXkQiiYbtK2qoux9261IeUBUyt0MAa
 iYi0pvYfaBHcsja26vk0/hBqzKjPlWGZyXd7HziJUnJu/XmCcUlOVPDxbOJs5QXhQbAz
 UgOhNOGGkcY5p86XMXuh1DtYljSODC4QbIr+d7L+qcZ+jx3gvwo/eNo2k5oTD78IjCZo
 xx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698249947; x=1698854747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2W+cfx4ygltibwHiauz+yXltI3yGSlfMY70472otNQ=;
 b=FakHZ67hyidA/fyfQZls7K0EQjz9D3eHvi6MNyp/FhtO9VlMwQO7aPyEh3jr6iWi+t
 GhtJ9lewSRAuqkJ2GnK9u4YnyZVGh9F0BP8MORm41lajnVPzglCIf+1PvWcdNyJNaWIK
 F/8NXeidcigvp9tNTsJHyro9WPIllgDb9snYx6H615WoZ6uyPANhlibpVEyUdGVFxlfX
 oMQ7+GgH4BhxwghF1YdSBELK36zLVbDmKAkYDr+teAj6zSgGEUdAhdtjETUoWqilTy8n
 DqO+MH3Zie0UsBK9al05vb66UjSwC+o/94WNVlp1poGye13SWFpc8manrHxm7cCFqWXD
 8YYg==
X-Gm-Message-State: AOJu0YxrODlAsCElXYgBc9SCu2LTRVXHOow5hdxloS68tLBsiwXDAIYz
 IRiI5ERPLG1Qts2fmDamqdayFw==
X-Google-Smtp-Source: AGHT+IE4TglKDd26xPrl/FF+CtTqz2Qj5t7KN4SVNAmIa/hAzG73FukDaBvQevszA3KblmqU2PzQ6w==
X-Received: by 2002:a17:907:26c9:b0:9c7:59d1:b2c2 with SMTP id
 bp9-20020a17090726c900b009c759d1b2c2mr14863604ejc.27.1698249946866; 
 Wed, 25 Oct 2023 09:05:46 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 gu18-20020a170906f29200b00977cad140a8sm10161364ejb.218.2023.10.25.09.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 09:05:46 -0700 (PDT)
Date: Wed, 25 Oct 2023 18:05:45 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v4 1/9] target/riscv: add rva22u64 profile definition
Message-ID: <20231025-3d85561bf6f08059fc7eb359@orel>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
 <20231025135001.531224-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025135001.531224-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 25, 2023 at 10:49:53AM -0300, Daniel Henrique Barboza wrote:
> The rva22U64 profile, described in:
> 
> https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#rva22-profiles
> 
> Contains a set of CPU extensions aimed for 64-bit userspace
> applications. Enabling this set to be enabled via a single user flag
> makes it convenient to enable a predictable set of features for the CPU,
> giving users more predicability when running/testing their workloads.
> 
> QEMU implements all possible extensions of this profile. The exception
> is Zicbop (Cache-Block Prefetch Operations) that is not available since
> QEMU RISC-V does not implement a cache model. For this same reason all
> the so called 'synthetic extensions' described in the profile that are
> cache related are ignored (Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa,
> Zicclsm).
> 
> An abstraction called RISCVCPUProfile is created to store the profile.
> 'ext_offsets' contains mandatory extensions that QEMU supports. Same
> thing with the 'misa_ext' mask. Optional extensions must be enabled
> manually in the command line if desired.
> 
> The design here is to use the common target/riscv/cpu.c file to store
> the profile declaration and export it to the accelerator files. Each
> accelerator is then responsible to expose it (or not) to users and how
> to enable the extensions.
> 
> Next patches will implement the profile for TCG and KVM.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 20 ++++++++++++++++++++
>  target/riscv/cpu.h | 12 ++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f40da4c661..c9e263cbac 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1429,6 +1429,26 @@ Property riscv_cpu_options[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +/* Optional extensions left out: RVV, zfh, zkn, zks */
> +static RISCVCPUProfile RVA22U64 = {
> +    .name = "rva22u64",
> +    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC,
> +    .ext_offsets = {
> +        CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
> +        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> +        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
> +        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
> +        CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
> +        CPU_CFG_OFFSET(ext_zicboz),

There are several more mandatory RVA22U64 extensions in the ratified
spec[1]. I think many of them can be "implemented" by QEMU by simply
adding their names to the ISA string. But, in any case, I think we should
at least put a comment here explaining why they're not in ext_offsets[]

[1] https://github.com/riscv/riscv-profiles/releases/download/v1.0/profiles.pdf

Thanks,
drew

