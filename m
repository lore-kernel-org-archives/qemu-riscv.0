Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0248EC001DB
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 21:07:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTTuy-0006rJ-DZ; Tue, 08 Aug 2023 17:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qTTuw-0006qQ-7j
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 17:07:02 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qTTuu-0005Tc-Gm
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 17:07:01 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6bd045336c6so1102315a34.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691528819; x=1692133619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xhkFM/Sb5IDeC14Ji5x6ZNEX3+vwWu8QS3FvvhSvAH4=;
 b=HBfB5V+G41SvWsvy1JCDXZG/KHpCCOkj6SAv5nKmf1YeHlpNPN4cXdSpgMYT1Yvt23
 X8TzYIUTu5FyRObxSVx+BXkXcY9C3cvxCT3v60xVT6R46fjtiwBCZPe0TI2kPEtVuFBr
 IqRlAncPxPt5WFRFPg3Q0wmzahf+hn7csMXQxfx85tUE+iC0YSgtUfmPrjdOdwjnPqW6
 IqyENeuG2288yI1c/wpFJkJKZKmhY7AjYgUbTYx4DzVabEGiBpn/P4XbjmnZ8fBllqtk
 enZV2bbIkkiWWtlvHYjnD58xEVz8906xysehKJpuRSvbiPJphhdtBvAkIV+o8/k5PBBC
 TK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528819; x=1692133619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhkFM/Sb5IDeC14Ji5x6ZNEX3+vwWu8QS3FvvhSvAH4=;
 b=Jpiv/N9JapM9RJBOf7rGswnuJnBE7tIuokdpjaZU0M9ysWKpD3sdAtQ+/UVXsi/ZiK
 RsIzGN4Y044jSo82ePlo6II4ydU2uYmEyYXaT6bGxIJLs89lVUvTjhDg26WCMEBuLQY/
 DNP6KOzF/LmMvx6v2xd358klJujkdTQ61U5E1mc6GfMaF5JE8r4sQS0edJj0CvwvVxUz
 7ws2frWPUMpsogsxLSpcnizLOHYZpo5pdMpyU65rZFa68bp8LTj4YajhJxwDnfAUWgdo
 Ftl6NLMI9WUd9/w+GeQbr1PyyrNjoqqy9gtd9jyN/iDlGOd/RZqMLKssgcXLzAOMie5L
 SYmg==
X-Gm-Message-State: AOJu0YzOqg9eZPgi2UNIDI1Icmx/2WDfyzcaOB5W7pZgLNhFHNKhc25v
 DJPKJK1gIW80TaEVHETBbRqWrA==
X-Google-Smtp-Source: AGHT+IFYcoJE7NpEgUfzB49aiH+dpsbow5EuDN0xzxInZl1Hjp2UafNRPgY7DX60J8DBa9V3lO3FVQ==
X-Received: by 2002:a9d:6249:0:b0:6b9:53ff:7513 with SMTP id
 i9-20020a9d6249000000b006b953ff7513mr813827otk.34.1691528819044; 
 Tue, 08 Aug 2023 14:06:59 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056830004200b006b94aba1f0bsm6434341otp.43.2023.08.08.14.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 14:06:58 -0700 (PDT)
Message-ID: <ff43edc3-f160-e57d-deb1-185601ed5b7d@ventanamicro.com>
Date: Tue, 8 Aug 2023 18:06:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] riscv: zicond: make default
To: Vineet Gupta <vineetg@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: kito.cheng@gmail.com, Jeff Law <jeffreyalaw@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230808181715.436395-1-vineetg@rivosinc.com>
 <20230808181715.436395-2-vineetg@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230808181715.436395-2-vineetg@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

(CCing Alistair and other reviewers)

On 8/8/23 15:17, Vineet Gupta wrote:
> Again this helps with better testing and something qemu has been doing
> with newer features anyways.
> 
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> ---

Even if we can reach a consensus about removing the experimental (x- prefix) status
from an extension that is Frozen instead of ratified, enabling stuff in the default
CPUs because it's easier to test is something we would like to avoid. The rv64
CPU has a random set of extensions enabled for the most different and undocumented
reasons, and users don't know what they'll get because we keep beefing up the
generic CPUs arbitrarily.

Starting on QEMU 8.2 we'll have a 'max' CPU type that will enable all non-experimental
and non-vendor extensions by default, making it easier for tooling to test new
features/extensions. All tooling should consider changing their scripts to use the
'max' CPU when it's available.

For now, I fear that gcc and friends will still need to enable 'zicond' in the command
line via 'zicond=true'.  Thanks,


Daniel


>   target/riscv/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 022bd9d01223..e6e28414b223 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -438,6 +438,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>       cpu->cfg.ext_xtheadbs = true;
>       cpu->cfg.ext_xtheadcmo = true;
>       cpu->cfg.ext_xtheadcondmov = true;
> +    cpu->cfg.ext_zicond = false;
>       cpu->cfg.ext_xtheadfmemidx = true;
>       cpu->cfg.ext_xtheadmac = true;
>       cpu->cfg.ext_xtheadmemidx = true;
> @@ -483,6 +484,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>       cpu->cfg.ext_zbc = true;
>       cpu->cfg.ext_zbs = true;
>       cpu->cfg.ext_XVentanaCondOps = true;
> +    cpu->cfg.ext_zicond = false;
>   
>       cpu->cfg.mvendorid = VEYRON_V1_MVENDORID;
>       cpu->cfg.marchid = VEYRON_V1_MARCHID;
> @@ -1816,7 +1818,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
>       DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
>       DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
> -    DEFINE_PROP_BOOL("zicond", RISCVCPU, cfg.ext_zicond, false),
> +    DEFINE_PROP_BOOL("zicond", RISCVCPU, cfg.ext_zicond, true),
>   
>       /* Vendor-specific custom extensions */
>       DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),

