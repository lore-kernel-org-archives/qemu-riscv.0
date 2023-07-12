Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1199C0015E
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 20:31:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJgU6-0003VS-RV; Wed, 12 Jul 2023 16:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJgU4-0003Ta-6j
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:30:48 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJgU2-00085U-N4
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:30:47 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a40b756eb0so2144838b6e.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 13:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689193845; x=1691785845;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rnrTUjmw1hSE7RnGBwTNI0eiK/PNw5p/T84Bx6uctlg=;
 b=m1603YjUUfF6dew9pV8bStV+ukhM/TZga5vG79InCVxZgCLi6Y5h8FKERgupAxHHOW
 XCUG5WUMM1VIO0ph2T52FGtHUgzyXnFzKs5TQZpGAzPb/KnEpSXWh696zK3VIdel08/9
 sVSsHcSmeCqnWiaFhmpQPn6IhbR9Ye0w74hDGL4QbRR8ufyhasful3eR0mAFjaVJnsYb
 /AFOyu5XNbSRJlDp9OR/S+rpQrK9sFIeCMI5YMgvYkTce3dQzTz/sRA6Jh5F5b6re1lm
 lC6j5/7F+Zu9exupT5TJCFVU76UCcG0YmGqVUXMgQHbkEt243VJ+wkGdyHAmUXVvWXNg
 XybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689193845; x=1691785845;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rnrTUjmw1hSE7RnGBwTNI0eiK/PNw5p/T84Bx6uctlg=;
 b=O6v93ap/kWIstePzTC4CTZ7v5tOtGFQsqM94cNW5qg/8ME+/rRrZZIMUsacbmHCvZz
 UPOcfROCT6O5uR7BP1DCl6nIOPXZcuPZV/w48dasMmSSGzJGiy8QZGMJdJAY7POPmj9+
 WvmXj8jsJODe2tKWO7Si0hLTo6KE4y204fI7OpWQrtigPn7auVbTQPiGOjDBk1+hysfz
 MP1wp7wrksCoGH25TVjRMNyFAroiPrm/pmngyHZ72todXGz2ePwa1Yifqo4xqo/auaPw
 C2OvJ+vIZB/X4VBCt4mzV85CEBHqLLQ6XFIi4ID95/Me5Z1ItWcAYJnzwZEE6hcShjfz
 jhPg==
X-Gm-Message-State: ABy/qLbG5R7c7/uELB89XoP+6mwN+yv5p6SkspSvo09RhaLsiyd36nB6
 +fyoZ8924uwVVL0q5n8ndrYwXw==
X-Google-Smtp-Source: APBJJlGP4Ydweqx6Dw5EjRVWbWRtDSgxTQXty03oaVNn3/Jgi0KRnz31fGcPPR8tPo3lbYnlt3GtcQ==
X-Received: by 2002:a05:6808:10cf:b0:3a3:fd01:504f with SMTP id
 s15-20020a05680810cf00b003a3fd01504fmr12450053ois.32.1689193845365; 
 Wed, 12 Jul 2023 13:30:45 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 bg32-20020a05680817a000b00398031b1014sm2273088oib.26.2023.07.12.13.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 13:30:45 -0700 (PDT)
Message-ID: <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
Date: Wed, 12 Jul 2023 17:30:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
 <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712-stench-happiness-40c2ea831257@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.11,
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



On 7/12/23 16:22, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 04:01:48PM -0300, Daniel Henrique Barboza wrote:
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
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
> This seems like it will be super helpful for CI stuff etc, thanks for
> doing it.

And Linux actually boots on it, which was remarkable to see. I was expecting something
to blow up I guess.

This is the riscv,isa DT generated:

# cat /proc/device-tree/cpus/cpu@0/riscv,isa
rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zfh_zfhmin_zca_zcb_zcd_
zba_zbb_zbc_zbkb_zbkc_zbkx_zbs_zk_zkn_zknd_zkne_zknh_zkr_zks_zksed_zksh_zkt_
zve32f_zve64f_zve64d_smstateen_sscofpmf_sstc_svadu_svinval_svnapot_svpbmt#


I'll put this in the commit message for the next version.

Oh, and I just realized that I forgot to light up all the MISA bits (we're missing
RVV). Guess I'll have to send the v2 right away.


Thanks,


Daniel

