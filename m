Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTMax-0006L1-KU
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 07:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mTMav-0006Jx-IT; Thu, 23 Sep 2021 07:08:49 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mTMap-0003nO-Ni; Thu, 23 Sep 2021 07:08:49 -0400
Received: from [192.168.15.189] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E523C20777;
 Thu, 23 Sep 2021 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632395320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKGcNnmlj8pflXWMttiwz2KP8cVDOcviRK9BnXLJgmg=;
 b=Yzw8VOoeXtchb31M5o7ihWMzh115d5LEkUD/IjkknpVcRv+Wpiik2gMc7ix0A9ZGEFXtUd
 BNML4R9Kt/vkAR74LOFxs0dragUKbR0yYkvXfUnQ3YLvVm937WLOKlcaHHrQZDXvPolsfg
 qZfCuKoudgXjuISaTcUD5bKxvcPzjAk=
Message-ID: <d080506d-04a0-0af1-5426-6162091ef55f@greensocs.com>
Date: Thu, 23 Sep 2021 13:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 00/16] Initial support for machine creation via QMP
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <a4debda9-f00b-dc99-7e7c-37ea9b4d7b5c@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <a4debda9-f00b-dc99-7e7c-37ea9b4d7b5c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Sep 2021 11:08:49 -0000



On 9/22/21 19:50, Philippe Mathieu-Daudé wrote:
> Hi Damien,
> 
> On 9/22/21 18:13, Damien Hedde wrote:
>>
>> The goal of this work is to bring dynamic machine creation to QEMU:
>> we want to setup a machine without compiling a specific machine C
>> code. It would ease supporting highly configurable platforms (for
>> example resulting from an automated design flow). The requirements
>> for such configuration include begin able to specify the number of
>> cores, available peripherals, emmory mapping, IRQ mapping, etc.
>>
>> This series focuses on the first step: populating a machine with
>> devices during its creation. We propose patches to support this
>> using QMP commands. This is a working set of patches and improves
>> over the earlier rfc (posted in May):
>> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html
> 
> Do you have a roadmap for the following steps? Or are you done with
> this series?

Hi Philippe,

We would like to stick to this scope ("creating devices in a machine") 
for this particular series otherwise it will become very big and cover a 
huge scope.

We have some patches to "migrate" more devices to be early 
user-creatable (like the last 2 patches of this series) so that we can 
use more device when building a machine. But these are trivial and only 
depends on what is the condition to allow this. We plan to submit these 
when this series is done.

We plan to address other issues we have in others series of patches. We 
do not put a roadmap somewhere. But we can details this in a page in our 
github or in the qemu wiki if you think this is a good idea.
Here are the main remaining issues:
+ the base machine (we are using "none" here because it is "almost" 
empty and fit our needs but it has some limitations)
+ adding cpus
+ non-trivial memory mappings
+ solving backend (eg: net) connection issues

> 
> Yesterday I was thinking about this, and one thing I was wondering is
> if it would be possible to have DeviceClass and MachineClass implement
> a populate_fdt() handler, to automatically generate custom DTB for these
> custom machines.
> 
> Maybe in your case you don't need that, as your framework generating the
> QEMU machine also generates the DTB, or even parse a DTB to generate the
> machine... :)

You are right, we do not need this. We indeed use a device tree file to 
describe the platform but this is an "extended" device tree (it has more 
info than needed for linux). If it was not the case, I think it would 
still be easier to generate it from the source platform description than 
using qemu as an intermediate.

It is probably possible but it is tricky to generate the dtb: mapping in 
dtb are not standardized and really depends on the node types.

For example, to generate the interrupt-map property of a device node. 
You need to know the interrupt mapping (which interrupt line goes in 
which interrupt controller) and also have info about the interrupt 
controller's cells format (eg: how many bytes do we need to specify the 
interrupt). For example for some controller, you have specify the 
interrupt kind (rising or falling edge, high or low active level).

So you'll probably need some special "get_dtb_interrupt_cell" method in 
interrupt controllers to generate these entries for you so that a device 
can ask dtb data to its controller.

Bus mappings also depend on the bus type, but since qemu devices are 
already organized on a bus-type basis, this is probably easier to solve.

You'll have similar issues with every mapping. But bus and interrupt are 
the most important ones.

Thanks,
Damien

