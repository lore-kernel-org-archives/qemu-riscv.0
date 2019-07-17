Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnlEf-0000DZ-VZ
	for mharc-qemu-riscv@gnu.org; Wed, 17 Jul 2019 10:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <walling@linux.ibm.com>) id 1hnjX8-0005VL-NA
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 08:59:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <walling@linux.ibm.com>) id 1hnjX7-00087g-Jo
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 08:59:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <walling@linux.ibm.com>)
 id 1hnjX7-00086U-9Q
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 08:59:45 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HCwLnM135980
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2019 08:59:40 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tt2kavmda-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2019 08:59:40 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-riscv@nongnu.org> from <walling@linux.ibm.com>;
 Wed, 17 Jul 2019 13:59:39 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 17 Jul 2019 13:59:31 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6HCxUmP33095998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 12:59:31 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3DDFAC05E;
 Wed, 17 Jul 2019 12:59:30 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69B75AC05B;
 Wed, 17 Jul 2019 12:59:30 +0000 (GMT)
Received: from [9.60.89.78] (unknown [9.60.89.78])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 17 Jul 2019 12:59:30 +0000 (GMT)
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
 <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
 <87h87m2knh.fsf@dusky.pond.sub.org>
 <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
From: Collin Walling <walling@linux.ibm.com>
Date: Wed, 17 Jul 2019 08:59:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071712-0060-0000-0000-000003623FDE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011445; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01233452; UDB=6.00649931; IPR=6.01014777; 
 MB=3.00027759; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-17 12:59:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071712-0061-0000-0000-00004A2FD889
Message-Id: <50befb09-d381-4362-9cd1-6fb11c96a719@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170158
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
X-Mailman-Approved-At: Wed, 17 Jul 2019 10:48:48 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3]
 hw/Kconfig: PCI bus implies PCI_DEVICES
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jul 2019 12:59:48 -0000

On 7/16/19 11:04 AM, Thomas Huth wrote:
> On 16/07/2019 15.06, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> On 15/07/19 18:12, Cornelia Huck wrote:
>>>>> Is it INTx vs. MSI vs. MSI-X?
>>>>
>>>> I think for s390x we need (INTx || MSI) vs MSI-X...
>>>
>>> I think MSI vs MSI-X is just how it's configured, not the actual
>>> behavior, so it should be irrelevant.
>>
>> My best guesses from confusing information, please correct
>> misunderstandings:
>>
>> 1. PCI devices need to support MSI or MSI-X to work with s390x.
> 
> I think Cornelia mentioned that we might even require MSI-X there ...
> Collin (being listed as "S390 PCI" maintainer), can you confirm?
> 

MSI-X is mandatory for PCI devices in the s390 architecture.

>> 2. We want a way to Kconfig the PCI devices that work, i.e. only the
>>     ones that support MSI or MSI-X.
>>
>> I don't like calling devices without any MSI capability "classic" or
>> "conventional devices".  I'd rather call them "MSI-capable" or
>> "MSI/MSI-X devices".
> 
> But you still need a config switch that you can set to enable the
> non-MSI devices ... what's so wrong with "conventional" if that's even
> the wording from the PCI SIG?
> 
>> Since PCI-E devices must implement MSI or MSI-X, we could perhaps
>> configure just the PCI-E devices for s390x.  No need to invent a new
>> name then.  Do we even have device models that can do MSI but not E?
> 
> I don't know if anybody ever tried a non-virtio PCIe device from QEMU on
> s390x ... I guess there will be quite a bit of other hurdles, too (e.g.
> the Linux driver also has to work without MMIO), so I'm not sure whether
> we really want to enable all PCIe devices there...
> 
>   Thomas
> 


