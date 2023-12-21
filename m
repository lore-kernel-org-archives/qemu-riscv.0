Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7452FC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 18:21:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGNfm-0006Ls-5t; Thu, 21 Dec 2023 13:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNfk-0006Lg-BJ
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 13:21:28 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNfi-0007kr-Hx
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 13:21:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-28be8ebcdc1so761462a91.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 10:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703182885; x=1703787685; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LKSv0asA38xhgbFm7rSdpUGyY8mor4Uq7OVwVbusBr8=;
 b=b/44n62nWeAkrFlcUariQgzxOaST1R07IzJbi9wdkYn73gs2lsNBEuKcmAs97FzMSr
 zgC5GKFpruAFiAwx3X4Cxbnpbn7c6Aug9MdLUSITGgwRXNOZxuqyXqD59QOqXYhoMaUl
 z7c85qnwG9bGFCEnbjDp6AMCUxJu35Pr3U7uNakj22yiRU3/uYVkHmwJ1Q1gouJdUGiJ
 g5dmlVV8bJKBTOCiRCYY/P2tKo30FXTz/Kn3hvL1j2mle7uSn3/hgyU88J54NOL2Uj5E
 srXs+M6cuDpW8OV6PzGgM2Jr9a+M7R1P9TXq0O0Vfx3t6Qo+aevzIPkZYtd2zpiKhI4f
 UE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703182885; x=1703787685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LKSv0asA38xhgbFm7rSdpUGyY8mor4Uq7OVwVbusBr8=;
 b=BjUkuYQLSoiB8TQX5l/uH8lEdPFSr4Y9VlrnD6Y1IW7Mke/j3X2U7bctasaQ032r1j
 OrIthqoyhxQis9u28V3Vcc8/+nFbn2qw1EVb6B5mfpPLSUXr9UfhK9ir0OAcJQfcBJUd
 bRIPGBFgrbk2nQfY5rO5j2VeoecPcZZ2XHAbANhaVuldcU3FxEaJSGOqPbsHTlGWkrYs
 191mHikeHuOrb5owFYtX6huZqSwpyK5WWa4MDTNYWwTiO5JjMfqs1E9+0H1bMxXyJ27w
 y/BGWLxm4CMzIFo61ZUemhEgsxMsCSOpuZnER6KeS9Onr4Uubl18Ochg8zepusEqaNWS
 azmQ==
X-Gm-Message-State: AOJu0Yx7bjSNDJDLqfynOVt61iX1euJuMJN8lVVXwiNgJsxYTpvk4CGY
 gE8TFCulyuJu9vndCa+p5u/+uh6vvPtYOw==
X-Google-Smtp-Source: AGHT+IG3lU90gwaTTHi8+ERv3YY7tw1ibOw7Idf67FG3VYWeu5lN+xlCqEpNVJHUbTFzhJd1ZlRJsQ==
X-Received: by 2002:a17:90a:bf04:b0:28b:c534:c88 with SMTP id
 c4-20020a17090abf0400b0028bc5340c88mr146328pjs.45.1703182884691; 
 Thu, 21 Dec 2023 10:21:24 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 sc17-20020a17090b511100b0028ad273525dsm5806810pjb.25.2023.12.21.10.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 10:21:24 -0800 (PST)
Message-ID: <13e05181-8faf-4f1d-8b79-b4098daf74c7@ventanamicro.com>
Date: Thu, 21 Dec 2023 15:21:21 -0300
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102d.google.com
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

Hi Rob,


I just posted some patches that hopefully will address the issue you described:

https://lore.kernel.org/qemu-riscv/20231221175137.497379-1-dbarboza@ventanamicro.com/T/#m10b05b26b86be368f7a131de57656374f679e432


Feel free to test and review. Let me know if I missed anything.


Thanks,

Daniel


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
> 
> I would appreciate hearing your thoughts on how these configuration
> values can be set for vendor CPUs.
> 
> Cheers,
> 
> Rob

