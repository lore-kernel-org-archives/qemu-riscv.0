Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7079EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 18:47:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIvuF-0007YB-3n; Mon, 10 Jul 2023 14:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qIvuE-0007Y0-2A
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 14:46:42 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qIvuB-0003Aa-PD
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 14:46:41 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1b049163c93so2897213fac.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Jul 2023 11:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689014798; x=1691606798;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=agsyw/x1KzgJC5Z7qaHyUkQ8vJXPexZVbIFy0l0Nj/Y=;
 b=o6REm3BlSHxAp/zNXVJch++6fQCZunGmL5MkGL03P96OjTd8kkjxU0RnMNmu3LqUuv
 dMeos2LVIta1QxU8XSvWtJ43Yr7Dg9xR32hrCNrWieQ03vrM/wzl+KbIDb4cfOHFQEPF
 TtHD0Dz59KLVIP4x+yIwghXs8TLQDdRpcjdV6kK3gouFnv9+Y3GjTHTyHw5HuKR/XPQQ
 brrdIJRYk4k0lxKMVKfdYi3B1nXw9j1wNJx9+6YmX3Nq2+8vSeGpaIjtpABvHBjvC14m
 UHaLf04pSxeEe3Y3YhrByIkwoHsK5UmSxUv1gPt+PphVy42Yon+Xh9P0bnKDzmiZ67EI
 dTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689014798; x=1691606798;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=agsyw/x1KzgJC5Z7qaHyUkQ8vJXPexZVbIFy0l0Nj/Y=;
 b=UPurksKWR7NKa/ti6OaOEOIjif9tvyx1vfZxxUi3o0bS7q+c+x9wFh0fkhAvyc6j6T
 kakgyb/goHkhL2RwtZ5P3WIXFeHZ4T62YaFu7Goz5HR49LJC1yvvlu+yyo4AjqeKz/Fv
 6pz+h8VQCHVUyrZljOQm56y5q7dtGiSMDWctUSPibgPItL7Kn+cKA47tfCEjG7Rcq790
 7U5HuDiy8Aj+p1H3EvB8pSDDN0RAJjedUAK3Sd1SdQkwhLvGrxW2ZjvJI+uyE5qgd01h
 I3gwpDtj5Azp9SxMtZLHQ0blBgb6MyL80ZYhgytvHO6sulabsSISHQ1cdWvuSqAW+cGm
 As/g==
X-Gm-Message-State: ABy/qLZHqoNdYhxgYjw/KZHUlUmhGtjW3n7o8e8Q7EDjMYO591NUPhvc
 NPQdeAiqd7DfAKQSM7SLUjqFnQ==
X-Google-Smtp-Source: APBJJlFNpHmoZ2x/ZCwtIdtx1MKyDUO7/VmbRFN75rHOIWqYsaRmXubwPrJ/a16GLIikJ12jdwRXqA==
X-Received: by 2002:a05:6870:9112:b0:1b3:d39a:9684 with SMTP id
 o18-20020a056870911200b001b3d39a9684mr11237809oae.47.1689014798250; 
 Mon, 10 Jul 2023 11:46:38 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 j25-20020a9d7d99000000b006b29a73efb5sm248264otn.7.2023.07.10.11.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 11:46:37 -0700 (PDT)
Message-ID: <ef0c313f-1cb7-83e0-9faf-8143736dede1@ventanamicro.com>
Date: Mon, 10 Jul 2023 15:46:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: qemu-riscv@nongnu.org, abologna@redhat.com, ajones@ventanamicro.com
References: <mhng-dd30114d-b418-4519-944d-be0f0e7f4ae3@palmer-ri-x1c9a>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <mhng-dd30114d-b418-4519-944d-be0f0e7f4ae3@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
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



On 7/10/23 15:13, Palmer Dabbelt wrote:
> On Mon, 10 Jul 2023 10:53:12 PDT (-0700), dbarboza@ventanamicro.com wrote:
>> Hi,
>>
>> We don't have a 'max' cpu type in riscv32 and riscv64. This is a special,
>> fictional CPU type that has all possible extensions enabled. It can be
>> either an alias for a real CPU or a new CPU type. It's used by tooling
>> such as libvirt for capabilities probing.
>>
>> Well, in our case it can't be an alias because we don't have any CPU type
>> that enables all extensions. Which brings me to my first question:
>> what's the criteria for marking a certain extension default true/false
>> in rv32/rv64/rv128?
> 
> Pretty sure it's just been a somewhat arbitrary decision, with stuff that's likely to be used being enabled when it's added.
> 
>> E.g. this is the riscv,isa DT for rv64:
>>
>> rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu
>>
>> It has a lot of extensions but it's missing some common ones like svinval
>> and smstateen.
>>
>> We can add/remove some extensions from these generic CPUs, document it
>> and be done with it. I want to propose a different design though:
>>
>> 1 - introduce the 'max' CPU. I guess we'll need some prep work in how
>> the extensions are being declared/stored in the code. I'll work on
>> it;
> 
> IMO it's the right idea in spirit, but there's a handful of conflicting extensions -- mostly vendor stuff, but even some of the standard ones have conflicting encodings.  So I think there's likely to be some decisions to make there, but when there's conflicts there's usually also one called out as being aimed at microcontroller-class systems so there should be a natural choice.
> 
>> 2 - introduce rva23U64/rva23S64. I would like to add a new 'profile' option
>> for generic CPUs, with '-cpu rv64,profile=rva23U64' enabling a whole set
>> of extensions. We would also support enabling optional profile extensions.
>> Yes, we don't have all the profile extensions available yet (neither does
>> the kernel AFAIK) but nothing is stopping us from adding the base
>> framework;
> 
> Would we also make incompatible extensions forbidden in the profile CPUs?

I think we can allow those as long as they're not in conflict with mandatory
profile extensions (not sure if there's a case of that).

> 
> If we add the 23 profiles, we should probably also add some other bases. We've got a defacto base in Linux that's rv{32,64}ima (plus some cruft as things have drifted around), I think there's also some interest in the 22 profiles.

rv32/64ima would be the base of the minimal generic CPUs I proposed below.

> 
>> 3 - reduce the generic CPUs up to the minimum required to boot Linux.
>> Yes, a rather arbitrary criteria, but Linux is the most common OS used
>> by RISC-V QEMU currently so we'll go with what most people are using.
>> This would reduce rv64 to "rv64ima".
> 
> Have a "minimum CPU required to boot Linux" option seems reasonable. Most users will probably want at least FD and C, though, so maybe we want something like that as well?

I don't mind making the minimal CPU be rv32/64imafdc.

> 
>> The end result is that we would have a max extensions CPU, a barebones
>> generic CPU that can be fully customizable from the ground up, and
>> a profile option to allow users to boost the generic CPUs with a
>> set of extensions. We will avoid having to deal with generic CPUs having
>> an (apparently) arbitrary set of extensions.
> 
> IMO we still want to keep the ability to turn on/off extensions, the profiles are a long way from being concrete and we'll still have a lot of systems floating around that don't line up with them.  Being able to test those configurations in QEMU is a huge benefit for users, even if it's a headache to keep around all the options.

Absolutely. What I meant is that, today, rv64 has a default set of extensions
that seems arbitrary. It would be good to have more predictability, i.e. have
a fixed set of extensions (like rv64imafdc) that users can use as a base to
enable/disable extensions.

The same thing can be done with profiles. I don't see a reason to forbid users
to do this:

'-cpu rv64,profile=rva23S64,icbom=false'

Meaning "I want the rva23S64 profile without Zicbom". The user should be aware that
Zicbom is mandatory for the profile, but since it's being explicitly disabled in the
command line, we can comply. This can be used for debug/development purposes or
the user is doing something silly. As long as it's explicit in the command line
it's fine.


Thanks,

Daniel


> 
>> I don't think we'll have too much opposition on adding (1) so I'll get
>> on it. I really would like to hear about (2) and (3). (3) will break
>> users that are using rv64 while counting with that whole set of extensions
>> that are being enabled by default, but this is why we're going to add
>> (2) first.
>>
>>
>> Please comment. Andrea, feel free to give us libvirt/tooling insights.
>>
>>
>> Thanks,
>>
>> Daniel

