Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ndxDq-0004Dz-AP
	for mharc-qemu-riscv@gnu.org; Mon, 11 Apr 2022 12:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ndwxs-0005Vh-W1; Mon, 11 Apr 2022 12:32:33 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:35660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ndwxq-0000Oc-NZ; Mon, 11 Apr 2022 12:32:32 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-de48295467so17836943fac.2; 
 Mon, 11 Apr 2022 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TxRRf70P5pkoAqwy1wbWnv0oduPKtfS++PO55e9/nlM=;
 b=H9UY5U19KWoms7w0+tQKDIolZtAqMduze3g/r54ojRQSzhYYhU3eGOJNx6EWvSam6m
 p7CIziaYRoz8viqfKffftML/VDqekEpmPgeItRWDktZa2VRe5FJBcGSvyQPrmWRUlelm
 WP5wcZSz9GhEi1F8G7u3wu/NKEMGSczoOSYWD1A3doB7lv97Jq3FCpmxU7CaqiGlWyML
 zN2MDKIw8DU26ENvdokqgmvIVRs2JjSwLeWoWZxH8LY2XzXfPfHOUGaPu9T03EtFsOw1
 rpEg57RfjCxLuJxNEkRbMKub0JtgoL4CAmrxoMd3DiCaQWOfJheCV9XeXsuLcl3xTEPm
 6WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TxRRf70P5pkoAqwy1wbWnv0oduPKtfS++PO55e9/nlM=;
 b=PQ76JiaF5bAvndchoMhC8ttOKJ4b41OW0X+BGpmCd0U+LlbACHpYyquVakHL+i4krh
 gOMMbFDoX5vxCnCyAIyDKK1k1lI+x5oWatTXPUibFDlsCX/BcKaoMhRu1u8z6pcpI16f
 zT4A9cjY4rYYxaofFvy1ynue9NGEg9U2viicm61kEV+IvwSaoOVJmAqoPqHsHRGuf9MM
 +qC+OvNf8cigF+MkDQp8zBoP0r7AL75d5lvv2xUYKVuMTYRRrLRZ8Mcbqle9eBiaJq3F
 S6ouYXsPyEy1tbZaqfTLYJAHbXh0lF7LrMhdOTPPz1ToM6EsjR7kckqYk5NMm/Np42RP
 DUuQ==
X-Gm-Message-State: AOAM533pNwlGtoHH+zalefdSozsha9uLQDSeukFvnnriCNOrPqWWRC30
 fZWlHdLS2880g5Ea9Pv76yc=
X-Google-Smtp-Source: ABdhPJw/pZDzVEWH7W2f1vgf+DlAnDUNEJuanJKEDFZWEP3z4Rp7xj2g6QscHkIWrtGQHn2roZoDvw==
X-Received: by 2002:a05:6870:8996:b0:e2:976c:7732 with SMTP id
 f22-20020a056870899600b000e2976c7732mr6745301oaq.231.1649694747591; 
 Mon, 11 Apr 2022 09:32:27 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:7ee3:afd9:f010:3a9:fd23?
 ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05687072c200b000d9ae3e1fabsm12010786oak.12.2022.04.11.09.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 09:32:27 -0700 (PDT)
Message-ID: <453a6303-8519-a2ec-8fd6-e18180f2ad85@gmail.com>
Date: Mon, 11 Apr 2022 13:32:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] hw/ppc: change indentation to spaces from TABs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Cc: Guo Zhi <qtxuning1999@sjtu.edu.cn>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
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
 <3e4731dd-c066-71cb-fd4c-6cd2c205bbd7@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <3e4731dd-c066-71cb-fd4c-6cd2c205bbd7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Apr 2022 12:48:58 -0400
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
X-List-Received-Date: Mon, 11 Apr 2022 16:32:33 -0000



On 4/11/22 04:23, Thomas Huth wrote:
> On 11/04/2022 08.57, Bin Meng wrote:
>> On Mon, Apr 11, 2022 at 2:45 PM Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 08/04/2022 21.19, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 4/6/22 07:08, Bin Meng wrote:
>>>>> On Tue, Apr 5, 2022 at 10:36 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>>>>>>
>>>>>> There are still some files in the QEMU PPC code base that use TABs for
>>>>>> indentation instead of using  spaces.
>>>>>> The TABs should be replaced so that we have a consistent coding style.
>>>>>>
>>>>>> If this patch is applied, issue:
>>>>>>
>>>>>> https://gitlab.com/qemu-project/qemu/-/issues/374
>>>>>>
>>>>>> can be closed.
>>>>
>>>> Please add the following tag in the commit:
>>>>
>>>>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
>>>>
>>>>
>>>> This will make Gitlab automatically close the issue when the patch is accepted.
>>>>
>>>>>>
>>>>>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
>>>>>> ---
>>>>>>    hw/core/uboot_image.h  | 185 ++++++++++++++++++++---------------------
>>>>>>    hw/ppc/ppc440_bamboo.c |   6 +-
>>>>>>    hw/ppc/spapr_rtas.c    |  18 ++--
>>>>>>    include/hw/ppc/ppc.h   |  10 +--
>>>>>>    4 files changed, 109 insertions(+), 110 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
>>>>>
>>>>> uboot_image.h was taken from the U-Boot source, I believe it should be
>>>>> kept as it is.
>>>>
>>>>
>>>> (CCing Thomas since het explictly listed hw/core/uboot_image.h in the bug)
>>>>
>>>>
>>>> I am not sure about keeping this file as is.
>>>
>>> Seems like uboot_image.h has originally been taken from U-Boot's
>>> include/image.h file ... but the two files are completely out of sync
>>> nowadays, e.g. U-Boot switched to enums instead of #defines at one point in
>>> time. So I think it does not make much sense to keep the TABs in here, and
>>> I'd rather like to see them replaced with spaces indeed.
>>
>> This file has been sync'ed recently.
>>
>> See http://patchwork.ozlabs.org/project/qemu-devel/patch/20220324134812.541274-1-bmeng.cn@gmail.com/
> 
> Oh, ok, thanks, good to know. So we should maybe really rather drop the uboot_image.h from the whitespace cleanup here, indeed (and rather add a comment to the header file instead that this is a file that is sync'ed with U-Boot and thus does not follow the QEMU coding conventions?)


Agree. I just updated the gitlab issue description to remove the reference to
this file.


Guo Zhi, can you please send another version of this patch with the updated
commit message and not touching uboot_image.h?



Thanks,


Daniel

> 
> Anyway, seems like that u-boot sync patch felt through the cracks, likely since it was not quite clear which tree it should go through ... ARM? PPC? RISC-V?
> 
>   Thomas
> 

