Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO1DZ-0001oC-A2
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pO1DX-0001nY-4W; Fri, 03 Feb 2023 13:55:23 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pO1DU-000406-LQ; Fri, 03 Feb 2023 13:55:22 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E2F60746377;
 Fri,  3 Feb 2023 19:52:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A7FE7745712; Fri,  3 Feb 2023 19:52:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A6B297456E3;
 Fri,  3 Feb 2023 19:52:48 +0100 (CET)
Date: Fri, 3 Feb 2023 19:52:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 00/19] hw: Set QDev properties using QDev API (part
 1/3)
In-Reply-To: <0fc499be-7981-6a6d-9115-3c6f320b0c04@linaro.org>
Message-ID: <fd0b660d-344f-fcce-f499-41a6d4317aee@eik.bme.hu>
References: <20230203180914.49112-1-philmd@linaro.org>
 <0fc499be-7981-6a6d-9115-3c6f320b0c04@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-127882288-1675450368=:50577"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Feb 2023 18:55:23 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-127882288-1675450368=:50577
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 3/2/23 19:08, Philippe Mathieu-Daudé wrote:
>> QEMU provides the QOM API for core objects.
>> Devices are modelled on top of QOM as QDev objects.
>> 
>> There is no point in using the lower level QOM API with
>> QDev; it makes the code more complex and harder to review.
>> 
>> I first converted all the calls using errp=&error_abort or
>> &errp=NULL, then noticed the other uses weren't really
>> consistent.
>> 
>> A QDev property defined with the DEFINE_PROP_xxx() macros
>> is always available, thus can't fail. When using hot-plug
>> devices, we only need to check for optional properties
>> registered at runtime with the object_property_add_XXX()
>> API. Some are even always registered in device instance_init.
>> 
>> I have probably been overzealous, so I tagged the patches
>> not using errp=&error_abort|&error_fatal|NULL as RFC.
>> 
>> PPC and ARM conversions will follow as two different series.
>
>>   46 files changed, 155 insertions(+), 221 deletions(-)
>
> Forgot to mention, this is based on
> https://lore.kernel.org/qemu-devel/20230203163021.35754-1-philmd@linaro.org/
> "hw/acpi/cpu_hotplug: Convert 'Object *device' -> 'DeviceState *parent'"
>
> Based-on: <20230203163021.35754-1-philmd@linaro.org>

Doing these clean ups is nice but making tree wide one line changes in the 
middle of development window has a high chance of breaking series not yet 
merged which is less nice. I'm worried because it's hard enough to get a 
series reviewed and catch the attention of the maintainer so that it will 
also be merged. But when another series that causes my series to not apply 
lands first mine will get rejected needing a rebase and I have to start 
again which might mean it will miss the freeze and get forgotten or 
delayed until the next release. This is OK as long as the other 
conflicting series is adding functionality or fixing bugs but if it's just 
trivial clean up then maybe it would be better to merge these tree wide 
clean ups during the soft freeze or first after opening development to 
reduce the number of comflicts. It would also be less of a problem if 
merging a series would not take more than half of the development window 
but would land within a week or so but maintainers are often too busy to 
handle their job so we're limited to one ot two pulls per release. Please 
consider this when submitting these clean up series.

Regards,
BALATON Zoltan
--3866299591-127882288-1675450368=:50577--

