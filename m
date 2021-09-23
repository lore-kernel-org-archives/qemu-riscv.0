Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTPLL-0002cG-Fm
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 10:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mTPLJ-0002Z3-9f; Thu, 23 Sep 2021 10:04:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mTPLG-0007NZ-Qs; Thu, 23 Sep 2021 10:04:52 -0400
Received: from [192.168.15.189] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D292D20786;
 Thu, 23 Sep 2021 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632405886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkbynlnCvJheMvgy5KHKY+xz6gcpk1nQXV5B9mUjOns=;
 b=JWNmS1MG18oEUFGyOIkmMRUIIqV+LMdU6sw4WjnCt8zL2ND+/STJkQcO4LdS33T+zi+The
 pA9rPdNQYqWx0fnxDCONrjEK8TrHMHIt18UppwpNxwrp/CIE//fy8rM3L8EFzSG3DVonuE
 xq1U1TRyGPL0wijjmNi/1ar9ll9PUxk=
Message-ID: <b14de602-9a80-cb44-9ae0-5a39a9dde5cd@greensocs.com>
Date: Thu, 23 Sep 2021 16:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device
 before machine is ready
Content-Language: en-US-large
To: Ani Sinha <ani@anisinha.ca>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-11-damien.hedde@greensocs.com>
 <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
 <alpine.DEB.2.22.394.2109231723060.630@anisinha-lenovo>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <alpine.DEB.2.22.394.2109231723060.630@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 23 Sep 2021 14:04:53 -0000



On 9/23/21 13:55, Ani Sinha wrote:
> 
> 
> On Thu, 23 Sep 2021, Ani Sinha wrote:
> 
>>
>>
>> On Wed, 22 Sep 2021, Damien Hedde wrote:
>>
>>> Skip the sysbus device type per-machine allow-list check before the
>>> MACHINE_INIT_PHASE_READY phase.
>>>
>>> This patch permits adding any sysbus device (it still needs to be
>>> user_creatable) when using the -preconfig experimental option.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> ---
>>>
>>> This commit is RFC. Depending on the condition to allow a device
>>> to be added, it may change.
>>> ---
>>>   softmmu/qdev-monitor.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>> index f1c9242855..73b991adda 100644
>>> --- a/softmmu/qdev-monitor.c
>>> +++ b/softmmu/qdev-monitor.c
>>> @@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>>>           return NULL;
>>>       }
>>>
>>> -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
>>> -        /* sysbus devices need to be allowed by the machine */
>>> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
>>> +        phase_check(MACHINE_INIT_PHASE_READY)) {
>>> +        /*
>>> +         * Sysbus devices need to be allowed by the machine.
>>> +         * We only check that after the machine is ready in order to let
>>> +         * us add any user_creatable sysbus device during machine creation.
>>> +         */
>>>           MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
>>>           if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
>>>               error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
>>
>> Since now you are adding the state of the machine creation in the
>> valiation condition, the failure error message becomes misleading.
>> Better to do this I think :
>>
>> if (object class is TYPE_SYS_BUS_DEVICE)
>> {
>>    if (!phase_check(MACHINE_INIT_PHASE_READY))
>>      {
>>        // error out here saying the state of the machine creation is too
>> early
>>      }
>>
>>      // do the other check on dynamic sysbus
>>
>> }
> 
> The other thing to consider is whether we should put the machine phaze
> check at a higher level, at qdev_device_add() perhaps. One might envison
> that different device types may be allowed to be added at different
> stages of machine creation. So this check needs be more generalized for
> the future.
> 

Hi Ani,

I think moving out the allowance check from qdev_get_device_class is a 
good idea. The code will be more clear even if the check is not generalized.

Thanks,
--
Damien


