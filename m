Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB969CDB47E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 21:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qr2rN-0004mK-55; Thu, 12 Oct 2023 17:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qr2rL-0004lq-VM
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 17:04:43 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qr2rK-0000Jg-Ea
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 17:04:43 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-690bc3f82a7so1240919b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697144681; x=1697749481;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6jFwwIOLxO21Mi0Xm1KR9P4n/XAf1CiqiG1pPZSOLGM=;
 b=vydR/Om2CKRfvsWeeU7rDQ32axH1fkBY8xnmDRnDSt08lAsYt7qkgi6gNsY7h2rLza
 QJ4VcIIsISIMWiu+Q+RAebqh+HONA3CjqAz+8sDWASYjG/Uk8t9C51vjmhBCBte/93B+
 zRDHtA0geQScMSnAsX6ve/VxbJWhvjc4xfnRzAuZAE1uRl1y85Rm7ddELITWPlwMAN2q
 c1jSKgJl3JS/A3BpcNKniDS2ojVfEeKBG1a937wtP8wDOkKlWk2LV1gfZPEoZbNAcGW9
 CG37nNgRYC3aD9ZXfOwvRkWubSmgqy6T+jyFF7qIyzfrFf+OkGFp3zGPC5zM0uegIdmR
 lO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697144681; x=1697749481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6jFwwIOLxO21Mi0Xm1KR9P4n/XAf1CiqiG1pPZSOLGM=;
 b=f6eeujOBD+OdLhGfAbO2LGFCViI5d4zcH+HW2cfQmnUBQvFs22I1WY1b7n0nkCMboc
 IpMsOcDASC80WTF6qPiwbFLLYBWOSPh2Qu0K/Ja/h34X+zKcRIhxikWLDnIV/n1bgrO/
 00Y3KDgoBpnoIpF9qWlsU0mbiun3UMHI4KFbtYpUQ57fvgDyLrOcgj6Q+9jEyHOOP0dh
 Ra0PaOTZVu9amS912ela2jAkTw2ByszzDlHpFSgQCgi+kVfylNEJBH2mxXYFxCMRllHL
 kMDrZ+5u7s/8J1NpIXV6rVmgcqgWHgJhO6loAAJ0B/eeUbFQBw/sLis6JTDgEN8e2MC7
 26Mg==
X-Gm-Message-State: AOJu0YwrEAKMuhVjeEUOGXsZqgxr1tScyWb1OpkkMV6DyeLJsoBZVEEA
 g/DzsJaY6IAnWuE0rYK4DB860A==
X-Google-Smtp-Source: AGHT+IE8DplvM/uvBlzdfZ780+HB0T16SvxCxT7XOzJiSRkisx2WYTJS8tkjnYF/X5PCG589CZusHA==
X-Received: by 2002:a05:6a00:1410:b0:693:3c11:4293 with SMTP id
 l16-20020a056a00141000b006933c114293mr24171613pfu.14.1697144680934; 
 Thu, 12 Oct 2023 14:04:40 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa780c9000000b0069266a66a6esm12098425pfn.139.2023.10.12.14.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 14:04:40 -0700 (PDT)
Message-ID: <c5489b2e-866b-4463-ba14-62eb8a6f3c61@daynix.com>
Date: Fri, 13 Oct 2023 06:04:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/23] target/riscv: Move MISA limits to class
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231011070335.14398-1-akihiko.odaki@daynix.com>
 <20231011070335.14398-2-akihiko.odaki@daynix.com>
 <e71bbcc3-25cf-4772-bd52-832a34e366e9@ventanamicro.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <e71bbcc3-25cf-4772-bd52-832a34e366e9@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/10/13 4:10, Daniel Henrique Barboza wrote:
> 
> 
> On 10/11/23 04:02, Akihiko Odaki wrote:
>> MISA limits are common for all instances of a RISC-V CPU class so they
>> are better put into class.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
> 
> This patch and patches 2 and 3 from this version (v9) got dropped from 
> the later
> versions of the series. Can I assume they're not relevant anymore?

Yes, they are replaced with patches in the following series:
https://patchew.org/QEMU/20231012054223.37870-1-akihiko.odaki@daynix.com/

