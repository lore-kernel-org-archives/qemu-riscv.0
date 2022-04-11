Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ndxDu-0004FY-C2
	for mharc-qemu-riscv@gnu.org; Mon, 11 Apr 2022 12:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1ndx37-0004SS-VX; Mon, 11 Apr 2022 12:37:57 -0400
Received: from smtp178.sjtu.edu.cn ([202.120.2.178]:36206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1ndx35-0001Ds-6D; Mon, 11 Apr 2022 12:37:57 -0400
Received: from mta04.sjtu.edu.cn (mta04.sjtu.edu.cn [202.121.179.8])
 by smtp178.sjtu.edu.cn (Postfix) with ESMTPS id 809051008CBC3;
 Tue, 12 Apr 2022 00:37:25 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mta04.sjtu.edu.cn (Postfix) with ESMTP id 6035718293688;
 Tue, 12 Apr 2022 00:37:25 +0800 (CST)
X-Virus-Scanned: amavisd-new at mta04.sjtu.edu.cn
Received: from mta04.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta04.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7tlnLjycMfZo; Tue, 12 Apr 2022 00:37:25 +0800 (CST)
Received: from mstore105.sjtu.edu.cn (unknown [10.118.0.105])
 by mta04.sjtu.edu.cn (Postfix) with ESMTP id 1F71E1804304B;
 Tue, 12 Apr 2022 00:37:25 +0800 (CST)
Date: Tue, 12 Apr 2022 00:37:24 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 =?gb2312?Q?C=A8=A6dric?= Le Goater <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Message-ID: <897919466.10558377.1649695044864.JavaMail.zimbra@sjtu.edu.cn>
In-Reply-To: <453a6303-8519-a2ec-8fd6-e18180f2ad85@gmail.com>
References: <20220405121950.3528296-1-qtxuning1999@sjtu.edu.cn>
 <CAEUhbmXBxU8-5qnVSbfcSqq0RJHdH+CtKUnhRiXXJB+cmmX3kA@mail.gmail.com>
 <ff00d8f2-be00-ac9d-0b43-4a73ae8b3b5b@gmail.com>
 <f4312553-1605-625e-5a33-7bf09ebbd566@redhat.com>
 <CAEUhbmWK99RFerHCzBB3bq8_6be+Ykvi+Nb20Q=m137xda69Bw@mail.gmail.com>
 <3e4731dd-c066-71cb-fd4c-6cd2c205bbd7@redhat.com>
 <453a6303-8519-a2ec-8fd6-e18180f2ad85@gmail.com>
Subject: Re: [PATCH v1] hw/ppc: change indentation to spaces from TABs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [218.193.191.26]
X-Mailer: Zimbra 8.8.15_GA_4203 (ZimbraWebClient - GC99 (Mac)/8.8.15_GA_3928)
Thread-Topic: hw/ppc: change indentation to spaces from TABs
Thread-Index: 1BEEzbV2iAWqxuV8LQvT+LkUTJu+EA==
Received-SPF: pass client-ip=202.120.2.178;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp178.sjtu.edu.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 11 Apr 2022 16:37:58 -0000

Sure, I will send a v2 patch.

Thanks,

Guo

----- Original Message -----
From: "Daniel Henrique Barboza" <danielhb413@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, "Bin Meng" <bmeng.cn@gmail.com>
Cc: "Guo Zhi" <qtxuning1999@sjtu.edu.cn>, "C=C3=A9dric Le Goater" <clg@kaod=
.org>, "David Gibson" <david@gibson.dropbear.id.au>, "Greg Kurz" <groug@kao=
d.org>, "qemu-ppc" <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org Developers=
" <qemu-devel@nongnu.org>, "Peter Maydell" <peter.maydell@linaro.org>, "ope=
n list:RISC-V" <qemu-riscv@nongnu.org>
Sent: Tuesday, April 12, 2022 12:32:23 AM
Subject: Re: [PATCH v1] hw/ppc: change indentation to spaces from TABs

On 4/11/22 04:23, Thomas Huth wrote:
> On 11/04/2022 08.57, Bin Meng wrote:
>> On Mon, Apr 11, 2022 at 2:45 PM Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 08/04/2022 21.19, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 4/6/22 07:08, Bin Meng wrote:
>>>>> On Tue, Apr 5, 2022 at 10:36 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wr=
ote:
>>>>>>
>>>>>> There are still some files in the QEMU PPC code base that use TABs f=
or
>>>>>> indentation instead of using=C2=A0 spaces.
>>>>>> The TABs should be replaced so that we have a consistent coding styl=
e.
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
>>>> This will make Gitlab automatically close the issue when the patch is =
accepted.
>>>>
>>>>>>
>>>>>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 hw/core/uboot_image.h=C2=A0 | 185 ++++++++++++++++++++-=
--------------------
>>>>>> =C2=A0=C2=A0 hw/ppc/ppc440_bamboo.c |=C2=A0=C2=A0 6 +-
>>>>>> =C2=A0=C2=A0 hw/ppc/spapr_rtas.c=C2=A0=C2=A0=C2=A0 |=C2=A0 18 ++--
>>>>>> =C2=A0=C2=A0 include/hw/ppc/ppc.h=C2=A0=C2=A0 |=C2=A0 10 +--
>>>>>> =C2=A0=C2=A0 4 files changed, 109 insertions(+), 110 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
>>>>>
>>>>> uboot_image.h was taken from the U-Boot source, I believe it should b=
e
>>>>> kept as it is.
>>>>
>>>>
>>>> (CCing Thomas since het explictly listed hw/core/uboot_image.h in the =
bug)
>>>>
>>>>
>>>> I am not sure about keeping this file as is.
>>>
>>> Seems like uboot_image.h has originally been taken from U-Boot's
>>> include/image.h file ... but the two files are completely out of sync
>>> nowadays, e.g. U-Boot switched to enums instead of #defines at one poin=
t in
>>> time. So I think it does not make much sense to keep the TABs in here, =
and
>>> I'd rather like to see them replaced with spaces indeed.
>>
>> This file has been sync'ed recently.
>>
>> See http://patchwork.ozlabs.org/project/qemu-devel/patch/20220324134812.=
541274-1-bmeng.cn@gmail.com/
>=20
> Oh, ok, thanks, good to know. So we should maybe really rather drop the u=
boot_image.h from the whitespace cleanup here, indeed (and rather add a com=
ment to the header file instead that this is a file that is sync'ed with U-=
Boot and thus does not follow the QEMU coding conventions?)


Agree. I just updated the gitlab issue description to remove the reference =
to
this file.


Guo Zhi, can you please send another version of this patch with the updated
commit message and not touching uboot_image.h?



Thanks,


Daniel

>=20
> Anyway, seems like that u-boot sync patch felt through the cracks, likely=
 since it was not quite clear which tree it should go through ... ARM? PPC?=
 RISC-V?
>=20
>  =C2=A0Thomas
>

