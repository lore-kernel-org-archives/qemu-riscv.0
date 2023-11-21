Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A6DC54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 08:34:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5MCz-00020a-Nq; Tue, 21 Nov 2023 03:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r5MCx-0001yW-Vt
 for qemu-riscv@nongnu.org; Tue, 21 Nov 2023 03:34:12 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r5MCw-0006Jq-95
 for qemu-riscv@nongnu.org; Tue, 21 Nov 2023 03:34:11 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1cf63ca9b1bso12641315ad.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Nov 2023 00:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700555649; x=1701160449; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dvAUVQ9yJiefO4NyUjdmD/xgcMuPXGqUgJbw5KNbWRw=;
 b=c4ZevGcjXUSrJ7/WEDg0xcku1xXSVLzsHFsp1kDxPmxx1JgV9XhuEvmWGMRNVWek6P
 zfQwZEn2eaHQcoc8TyUlc4JSLUdqdWWqeXvaI0Oktan0icJshSVJsmkhN6Rz2OegFWzz
 nBfGkrBNGKFedtU4jhwtA7LGWTLWb67RprizxgHEgmc7IQsdalF89ctHl54qy/1YCKE+
 H5wbwrwJYOnlBD5gjXr65W+lD0Qw9gj9Lne5SKXE7wQRshyQ5T6eA5qPn1e8CvTsV+h/
 QCJroSOeXisKiiCY62AT59m81qegiCS04otek/JHOr+b4wAeW+KN5U3ftDMBv29MmoIJ
 maHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700555649; x=1701160449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dvAUVQ9yJiefO4NyUjdmD/xgcMuPXGqUgJbw5KNbWRw=;
 b=LeeHwKDPKKfbcA9+0vkMlxdEyJu025VnO63lgz5RSFuDhFU/sq08sAcWEXyHfzYdBb
 KNO5QhJT7gQKA51JHb0fdJPxHhVEKayGJcr7kH/ZtyO+j/pJVGUqCe4ojz/VyOsmfsiu
 ywBFsEs7jLrohLll+WrVXdmNsQBEiKmARvwB1HmL3CsnBldrSyoCDayso4Gfmm6M5bry
 WBHr/yuhhF1sQu+ToCR/ezAHzZKWVxiL/oLqW9lanvDQ1+M/RaZDR+m9ZRQBf9j9cS9x
 59W1TSFHx6x0gjh7T/aA8WeBBFeE8IgK9NMBbGJKrRa/HahWSPUsnadNv2Ja5kqMgMrc
 d0NQ==
X-Gm-Message-State: AOJu0YwqiBqx7ewJMqLSArWyWDLb4UVVWrEVT379tZxfWJVSZBcYa15X
 u2/8Kg08/lrCVjY0YhH/DNxroQ==
X-Google-Smtp-Source: AGHT+IHefqdVsGLUKEeu+gVQtn0JHqxwMA/+A/SKOi1+eW7fh19qJFV6z/FuH5KUwy9lTCxytpoZqA==
X-Received: by 2002:a17:902:e5c8:b0:1b8:b382:f6c3 with SMTP id
 u8-20020a170902e5c800b001b8b382f6c3mr9774924plf.13.1700555648828; 
 Tue, 21 Nov 2023 00:34:08 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.119])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a170902e74b00b001cf53784833sm5308840plf.60.2023.11.21.00.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 00:34:08 -0800 (PST)
Message-ID: <d1d6f2dc-55b2-4dce-a48a-4afbbf6df526@ventanamicro.com>
Date: Tue, 21 Nov 2023 05:34:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/18] target/riscv: add rva22u64 profile definition
Content-Language: en-US
To: Jerry Shih <jerry.shih@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com
References: <20231103134629.561732-1-dbarboza@ventanamicro.com>
 <20231103134629.561732-9-dbarboza@ventanamicro.com>
 <1BFE4A5C-4DE0-43B9-A865-5CF61B0BAE35@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <1BFE4A5C-4DE0-43B9-A865-5CF61B0BAE35@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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



On 11/21/23 05:13, Jerry Shih wrote:
> On Nov 3, 2023, at 21:46, Daniel Henrique Barboza <dbarboza@ventanamicro.com> wrote:
>>
>> +/*
>> + * RVA22U64 defines some 'named features' or 'synthetic extensions'
>> + * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
>> + * and Zicclsm. We do not implement caching in QEMU so we'll consider
>> + * all these named features as always enabled.
>> + *
> 
> Hi Daniel,
> 
> If the cache related extensions are `ignored/assumed enabled`, why don't
> we export them in `riscv,isa`?

These aren't extensions, but 'named features'. They don't have a riscv,isa. There's
no DT bindings for them.

> If we try to check the RVA22 profile in linux kernel running with qemu, the
> isa string is not match RVA22 profile.

The kernel would check profile compatibility by matching the riscv,isa of the actual
extensions, as expected, but then it would need to check these 'named features'
in other fashion. For example, in patch 06, zic64b would be asserted by checking
if all block sizes are 64 bytes.

I agree that this is over-complicated and checking everything in riscv,isa would make
things easier. For now these named extensions don't have DT bindings, thus we can't
add them to the DT. The kernel doesn't seem to care about their existence in the DT
either.

TBH a better place for this discussion is the kernel mailing list. Thanks,



Daniel



> 
> Thanks,
> Jerry

