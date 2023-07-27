Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F031C0015E
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:20:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP1jQ-0000dZ-Ld; Thu, 27 Jul 2023 10:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP1jO-0000cV-Lu
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 10:12:42 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP1jM-0001s1-VF
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 10:12:42 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bb31245130so824120a34.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690467159; x=1691071959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QGNYNym7CPG7P82yIxID+feNFr4ORJdXTXNq2DaJX7c=;
 b=FAKkoAzSG3TnrhSCPNmna15sHHmwM1cO5+7g4OjjWROtFLM6S3rApQd2MhbGVh1Z/B
 N5wCAf3QcDVZNEHLDQrJnxMLQjYLcN+5YX+I6KnR4TyG0ZOji6a0I6KKzH+stVnu6LVC
 K6R/ONiu+FScPEpDKZcwlc6tj6eSlT3xnj7eTUIM6kxp0KPYjQrratSEz53ANegBlldO
 JmpQV/BkmkYoFf3lCLy/0C3ruaSH2zijuTRQpBgTtxfxXmeBUJmqfKs36VzVOAbjBRO+
 Qh6E5+XygjdxWgv5/38b1GrlX74gObIw7GD2J3jQ4VMHXiVhyK7nMUTpYuFTavxFWJq4
 S4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690467159; x=1691071959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QGNYNym7CPG7P82yIxID+feNFr4ORJdXTXNq2DaJX7c=;
 b=S2DRtj1HDs4vvdiaaYLHGZUf4ACQ7+zRcvpzjh87oB4bZaNJ+GSQci0IF2A8ME7tkm
 4VmBz8nzb2sfb8dWdniRacX8/ju8BafRMkbJOVzcGx+lJC38Ok5jIhhE2atw0U34jlOr
 5AyfxHrE9p+hTYQ97A1WMygUTA+9q9oa3o49enVA5AqmvUCoDpQn2XFwL8dftdSDG2bL
 OucfU+Sb/WeJs5oUwKJZJnhZc9Ws4JWVNezBRVeKR1/8wsirtMiUkCg5015MC/sJtiVf
 GsqdC+cdBGztcaY/7OKJcs5mnysvRUzloSd07Ti+/L3rXyMoL5r5r8vszoFtb8kuY7Se
 X1IQ==
X-Gm-Message-State: ABy/qLYzRme+k4VVoK2W4fiWRQfQojWkRhMB1Mm6ATi+3uHctRrYYWsM
 qz+ltWFlUIb/oi6fVJCuIbA+bQ==
X-Google-Smtp-Source: APBJJlHCY5Vt0jIhWS5/lQAyxruckUsVbBtcAdFqjoeL1JbGhxy1hWXlAn4LOwAO7zHH1xdmLRgT4w==
X-Received: by 2002:a05:6870:9108:b0:1b3:b6c7:ab1a with SMTP id
 o8-20020a056870910800b001b3b6c7ab1amr3235930oae.28.1690467158883; 
 Thu, 27 Jul 2023 07:12:38 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-36.dial-up.telesp.net.br.
 [201.69.66.36]) by smtp.gmail.com with ESMTPSA id
 wh16-20020a056871a69000b001bb58a346b8sm730588oab.18.2023.07.27.07.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 07:12:38 -0700 (PDT)
Message-ID: <6b4981c7-72d3-2e29-3eb2-b8fd76047e44@ventanamicro.com>
Date: Thu, 27 Jul 2023 11:12:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.2 v5 09/11] target/riscv: add 'max' CPU type
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
 <20230720171933.404398-10-dbarboza@ventanamicro.com>
 <20230727-armful-french-e572d80fcac1@spud>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230727-armful-french-e572d80fcac1@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 7/27/23 10:59, Conor Dooley wrote:
> Hey Daniel,
> 
> On Thu, Jul 20, 2023 at 02:19:31PM -0300, Daniel Henrique Barboza wrote:
>> The 'max' CPU type is used by tooling to determine what's the most
>> capable CPU a current QEMU version implements. Other archs such as ARM
>> implements this type. Let's add it to RISC-V.
>>
>> What we consider "most capable CPU" in this context are related to
>> ratified, non-vendor extensions. This means that we want the 'max' CPU
>> to enable all (possible) ratified extensions by default. The reasoning
>> behind this design is (1) vendor extensions can conflict with each other
>> and we won't play favorities deciding which one is default or not and
>> (2) non-ratified extensions are always prone to changes, not being
>> stable enough to be enabled by default.
>>
>> All this said, we're still not able to enable all ratified extensions
>> due to conflicts between them. Zfinx and all its dependencies aren't
>> enabled because of a conflict with RVF. zce, zcmp and zcmt are also
>> disabled due to RVD conflicts. When running with 64 bits we're also
>> disabling zcf.
>>
>> MISA bits RVG, RVJ and RVV are also being set manually since they're
>> default disabled.
>>
>> This is the resulting 'riscv,isa' DT for this new CPU:
>>
>> rv64imafdcvh_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_
>> zfh_zfhmin_zca_zcb_zcd_zba_zbb_zbc_zbkb_zbkc_zbkx_zbs_zk_zkn_zknd_
>> zkne_zknh_zkr_zks_zksed_zksh_zkt_zve32f_zve64f_zve64d_
>> smstateen_sscofpmf_sstc_svadu_svinval_svnapot_svpbmt
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> 
> I was giving this another go today, like so
> $(qemu) -smp 4 -M virt,aia=aplic,dumpdtb=qemu.dtb -cpu max -m 1G
> which lead to a few
> vector version is not specified, use the default value v1.0
> printed. Should the max cpu set a vector version w/o user input
> being required?


This isn't exclusive to the 'max' cpu code per se. It's the common RVV handling
code that is expecting users to inform which vector version they're going to
use every time we activate V.

I believe it's too late to change the command line handling to force users to pick
a vector version, so the second better approach is to silently default to v1.0
(or perhaps to the latest RVV version available) if the user didn't set anything.


Thanks,

Daniel




> 
> Cheers,
> Conor.

