Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83ABC35274
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:29:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE8FK-0005FF-Uv; Fri, 15 Dec 2023 08:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rE8FJ-0005F5-OD
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 08:28:53 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rE8FG-0002yl-KK
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 08:28:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28abb3c5b9cso188928a91.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Dec 2023 05:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702646928; x=1703251728; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fko1lpxnitHM+oOBA41I7J6nnnrbSKtYzwowR+O4tSU=;
 b=NXoA8NdpEM7kjRLwF9Ubr+QTp93BW6A/4AGM6jsTDtalGlCLA/VttmCD1CjEYyQRep
 d0RqlI3K1tNRnqAXGpWmC5G1KhELh2HULbL6xxab6Qo2BW0zF2xWdxR/AcXB4p910+BE
 EfwmXyus6tZGSsNN+1/NT0M0v70zNyXePqVnozSPIntMuz7zVYHtEIepf8AmbKmkmEX6
 saOzfVCajHHH05eqsfyLwb3n1JpFJokcg4wvpQKN1dcALyqSrKHY8CcBhcA91P7s7Qcp
 0TEQFiolT5aFcmQkYRizsmnHVvX9UZPbT1itUOlElrCPsEGKNQDXEeTOBiqhoWvnb3Kq
 hXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702646928; x=1703251728;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fko1lpxnitHM+oOBA41I7J6nnnrbSKtYzwowR+O4tSU=;
 b=hl67mRzj7pIqjFUNLUap6Nbuwi+Q5UebvaIyRfFN7I9+SkL6R6ojtH5MXtjz1syv3F
 vX6dFEG2Hq0QvoNkz6vuP5ZTqnQug9l00dFHynqZ97ECwqQRFHQ72k6SRMeN6eI08i1Q
 E37jLDEer7wtie2i1siCaa4iKq9OHJyZfYVxR6ix0vhEW2//oIb/Z+Rg4aZ8Rt7m86R5
 6n0jyF32x0qbwI6+VlpAVgZXkEOuVMc+rtUVFbJDYY8nBSr0AA94wORXLWDDV3RmegsR
 BIfFXddFfzi5R80eRddbMaZLtpSE2BHa4ufxE8m8eKRlgoabyFGJN9Pz/nRd+Q0WuxeT
 YGMg==
X-Gm-Message-State: AOJu0YyDlOuI1kjDT0aENWVY2+CLl0dIYE0a8Fzluo9EIOPPIjmTLqCE
 nXrdvX71tru8cqfWBm1gX+eisYB1LjuJxfS3Y/Q=
X-Google-Smtp-Source: AGHT+IGL/NYTcu5XtkjcuOjc/+WPm/2fOPyLBPK1DJz5zFbuOaQUJ2QxS4ZCOC/pso8WtdJsajdSmg==
X-Received: by 2002:a17:90a:aa87:b0:285:b239:f4ed with SMTP id
 l7-20020a17090aaa8700b00285b239f4edmr4879762pjq.34.1702646928547; 
 Fri, 15 Dec 2023 05:28:48 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170902744500b001d34cc99dc5sm5202367plt.232.2023.12.15.05.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 05:28:47 -0800 (PST)
Message-ID: <eb848757-f703-4a02-a5f2-0b9ce5635541@ventanamicro.com>
Date: Fri, 15 Dec 2023 10:28:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Vendor CPU overrides of non-extension properties
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-riscv@nongnu.org
References: <b815ab5fdf33d9b9000c8165d50d000f387a3463.camel@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <b815ab5fdf33d9b9000c8165d50d000f387a3463.camel@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 12/15/23 08:49, Rob Bradford wrote:
> Hi Daniel,
> 
> Thanks for your work on improving the extension handling for vendor
> CPUs. I have a query regarding the correct way to override properties
> that are included in the "cpu_options" list as part of the vendor CPU
> initialisation function.
> 
> i.e. these properties:
> 
> Property riscv_cpu_options[] = {
>      DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask,
> MAKE_64BIT_MASK(3, 16)),
>      {.name = "pmu-num", .info = &prop_pmu_num}, /* Deprecated */
> 
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> 
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> 
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> 
>      DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize,
> 64),
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize,
> 64),
> 
>      DEFINE_PROP_END_OF_LIST(),
> };
> 
> I think that these values should be specifiable as part of the vendor
> CPU initialisation method however unfortunately they are overwritten
> with the default values from the properties as
> riscv_cpu_add_user_properties which adds the properties is called from
> the type post_init method which is called after the vendor CPU init
> function - so any changes to e.g. cfg.vlen are lost.

You're right. And curious you're mentioning this problem now - I have patches
that fixes it for vlen and elen (due to some work I'm doing with RVV).

I guess I'll just go ahead and do all these riscv_cpu_options the same way.
I'll see if I can post these fixes next week.


Thanks,

Daniel


> 
> I would appreciate hearing your thoughts on how these configuration
> values can be set for vendor CPUs.
> 
> Cheers,
> 
> Rob

