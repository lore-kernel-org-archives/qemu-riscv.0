Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ndoOz-0001QE-E1
	for mharc-qemu-riscv@gnu.org; Mon, 11 Apr 2022 03:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ndoOm-0001N5-JH
 for qemu-riscv@nongnu.org; Mon, 11 Apr 2022 03:23:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ndoOj-0002RF-5Q
 for qemu-riscv@nongnu.org; Mon, 11 Apr 2022 03:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649661820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqrTkjWH/Y9XIQAms3W3e8pg8X/QAI1vgK4VbhMhjzo=;
 b=O+8+Pz0zmNQSm9O4gcx8QyT/nkInS/RNCHbwLviiN2ktQ3gAqXQxYfCyqtXTtkJKmREs1O
 eBiP5ksPLHC6zeFDd6uzl1ygMz1EgXLdl+mvCmP8KuNnNQ2Bl6zxJpL3DtlGJWutogdoLg
 KTAltB5DEH3/nb1Qe6Rvvuvp62wHaSc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-CNwmFwaQM62w7AUtgoCtqw-1; Mon, 11 Apr 2022 03:23:39 -0400
X-MC-Unique: CNwmFwaQM62w7AUtgoCtqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n21-20020a05600c4f9500b0038e3b0aa367so6069451wmq.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Apr 2022 00:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rqrTkjWH/Y9XIQAms3W3e8pg8X/QAI1vgK4VbhMhjzo=;
 b=xinZJOkFsR5yYf5QUt7URL5m7/fN2gDWFaoIQSkglJZZdxg0v27PohtYB/Naf5V+vq
 gUPAA1pbjnSNIF1TVVt9EdiicWfPjmQz/gDOqyFCBIiXrxpiCeMPLphtTVkAxXGOhzky
 Ex79iiJ67xdpRi7bxfRLN1VgMV4LDgn71QlZ4FmAHhAXKCdShhYu9ig8nf8XOSz25f8f
 0D05S8VRhvdsOC9ntKXeZfB38Ed58A2nWKV4eTTs7nJDMupki3vMSD8P9IqB7KyblJ4O
 E44/xHiX/8nJDJ6wy8lvbrZDJHANNoYs3IB1mvSZZuSxVSHBj63Y+hyQ56D62XpTwG26
 asDQ==
X-Gm-Message-State: AOAM533+gYOb/V+o0ttrN9YyO8hxh3TpXs8bQ1Mr5t6MQS4R3UYgkz1I
 eorRcVsJITvCXnRHy9ifpnDluH7c3u49TxYvjdyHJZdYXj8azPy1QxCNkZN1jKTNcyzVyAuW+sa
 5I9baVo3LRYCkC0E=
X-Received: by 2002:a1c:1941:0:b0:38b:4af1:49f8 with SMTP id
 62-20020a1c1941000000b0038b4af149f8mr28039034wmz.156.1649661817748; 
 Mon, 11 Apr 2022 00:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOh4oqE00AqtgLrZhku5LJ7H1Mg28lSI7vQVP3p7DM1EKc1/63D+V7+jwtAy8TIP1oM/iEXQ==
X-Received: by 2002:a1c:1941:0:b0:38b:4af1:49f8 with SMTP id
 62-20020a1c1941000000b0038b4af149f8mr28039016wmz.156.1649661817509; 
 Mon, 11 Apr 2022 00:23:37 -0700 (PDT)
Received: from [192.168.42.76]
 (dynamic-046-114-150-143.46.114.pool.telefonica.de. [46.114.150.143])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600001cc00b00207aac5d595sm424930wrx.38.2022.04.11.00.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 00:23:36 -0700 (PDT)
Message-ID: <3e4731dd-c066-71cb-fd4c-6cd2c205bbd7@redhat.com>
Date: Mon, 11 Apr 2022 09:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1] hw/ppc: change indentation to spaces from TABs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Guo Zhi <qtxuning1999@sjtu.edu.cn>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20220405121950.3528296-1-qtxuning1999@sjtu.edu.cn>
 <CAEUhbmXBxU8-5qnVSbfcSqq0RJHdH+CtKUnhRiXXJB+cmmX3kA@mail.gmail.com>
 <ff00d8f2-be00-ac9d-0b43-4a73ae8b3b5b@gmail.com>
 <f4312553-1605-625e-5a33-7bf09ebbd566@redhat.com>
 <CAEUhbmWK99RFerHCzBB3bq8_6be+Ykvi+Nb20Q=m137xda69Bw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmWK99RFerHCzBB3bq8_6be+Ykvi+Nb20Q=m137xda69Bw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 11 Apr 2022 07:23:47 -0000

On 11/04/2022 08.57, Bin Meng wrote:
> On Mon, Apr 11, 2022 at 2:45 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 08/04/2022 21.19, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 4/6/22 07:08, Bin Meng wrote:
>>>> On Tue, Apr 5, 2022 at 10:36 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>>>>>
>>>>> There are still some files in the QEMU PPC code base that use TABs for
>>>>> indentation instead of using  spaces.
>>>>> The TABs should be replaced so that we have a consistent coding style.
>>>>>
>>>>> If this patch is applied, issue:
>>>>>
>>>>> https://gitlab.com/qemu-project/qemu/-/issues/374
>>>>>
>>>>> can be closed.
>>>
>>> Please add the following tag in the commit:
>>>
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
>>>
>>>
>>> This will make Gitlab automatically close the issue when the patch is accepted.
>>>
>>>>>
>>>>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
>>>>> ---
>>>>>    hw/core/uboot_image.h  | 185 ++++++++++++++++++++---------------------
>>>>>    hw/ppc/ppc440_bamboo.c |   6 +-
>>>>>    hw/ppc/spapr_rtas.c    |  18 ++--
>>>>>    include/hw/ppc/ppc.h   |  10 +--
>>>>>    4 files changed, 109 insertions(+), 110 deletions(-)
>>>>>
>>>>> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
>>>>
>>>> uboot_image.h was taken from the U-Boot source, I believe it should be
>>>> kept as it is.
>>>
>>>
>>> (CCing Thomas since het explictly listed hw/core/uboot_image.h in the bug)
>>>
>>>
>>> I am not sure about keeping this file as is.
>>
>> Seems like uboot_image.h has originally been taken from U-Boot's
>> include/image.h file ... but the two files are completely out of sync
>> nowadays, e.g. U-Boot switched to enums instead of #defines at one point in
>> time. So I think it does not make much sense to keep the TABs in here, and
>> I'd rather like to see them replaced with spaces indeed.
> 
> This file has been sync'ed recently.
> 
> See http://patchwork.ozlabs.org/project/qemu-devel/patch/20220324134812.541274-1-bmeng.cn@gmail.com/

Oh, ok, thanks, good to know. So we should maybe really rather drop the 
uboot_image.h from the whitespace cleanup here, indeed (and rather add a 
comment to the header file instead that this is a file that is sync'ed with 
U-Boot and thus does not follow the QEMU coding conventions?)

Anyway, seems like that u-boot sync patch felt through the cracks, likely 
since it was not quite clear which tree it should go through ... ARM? PPC? 
RISC-V?

  Thomas


