Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nM5wh-0003bC-Ts
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 05:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nM5wf-0003Zl-5b; Mon, 21 Feb 2022 05:29:29 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:33028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nM5wU-0002Jn-Gd; Mon, 21 Feb 2022 05:29:21 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D3FFC20779;
 Mon, 21 Feb 2022 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645439353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUcoPRDI2xtck9p/njARnuSy9HBHqx6F6T08TC4wcVA=;
 b=mgEva6/hGY5rzxyNnDyHZNQMgdXlkHHwtw55UkEdLGzaX7Itz7fsihSZKnI82sLGf5dHHV
 Id1rjZfGn15gr2bU3lSPDa1PNNzK5EI6Vdw9h3pnS463Nu9wPFIPv6TI/I7Mn/VZGC2+Np
 NwN4vmDQFVAxwt8BMlIrS2bdExi0bsI=
Message-ID: <a2967493-fd00-8f9b-29bd-56baaae9f89a@greensocs.com>
Date: Mon, 21 Feb 2022 11:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/5] hw/riscv/riscv_hart: free the harts array when the
 object is finalized
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20220218164646.132112-1-damien.hedde@greensocs.com>
 <20220218164646.132112-2-damien.hedde@greensocs.com>
 <CAFEAcA_xtf-LtvhNqxMEtZs1Z6NePkVKOp6Kh+tN_HZTkFiuTQ@mail.gmail.com>
 <af1de21c-bccf-58f9-4941-e88eca6c1a5c@greensocs.com>
 <CAFEAcA_=ORjLU7_T51Jau6DNh8hM_T+XbKbMuh4QjfC03uH4pw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA_=ORjLU7_T51Jau6DNh8hM_T+XbKbMuh4QjfC03uH4pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 21 Feb 2022 10:29:29 -0000


On 2/18/22 18:46, Peter Maydell wrote:
> On Fri, 18 Feb 2022 at 17:39, Damien Hedde <damien.hedde@greensocs.com> wrote:
>> You're right. I was confused when re-writing the message.
>> This leaks happen on
>> init -> realize-failure -> finalize
>> Because the array is allocated, then every cpu is initialized (and an
>> error failure may happen for any of them).
> 
> "Failure during realize" is one of those cases I don't think we
> handle very well. I'd like to see a view by one of our QOM experts
> on what the best way to handle this is -- should one do the
> cleanup in realize itself, or in instance_finalize? Do the
> sub-objects that are being initialized and realized need to
> be manually cleaned up in the realize-is-failing case, or is
> that part automatic?
> 
> Which is to say that maybe this patch is the best way to do this,
> but it would be nice to be sure about that...
> 

Right now we have only 3 life cycles for coldplug (for hotplug it may be 
a bit different, I don't know but that's not the case of devices in this 
series):
+ user help:       init -> finalize
+ failed creation: init -> realize-failure -> finalize
+ normal cycle:    init -> realize-success -> ... (maybe finalize at 
qemu end)

I'm not even sure unrealize() is called on the normal cycle, at least it 
is not done by DEVICE's finalize() method.

We could try to be clean at the end of realize failure, but anyway it's 
better to free memory at the end. So we'll have to do it in finalize() 
too (or in a unrealize(), if we have guarantee it will be called).
It look simplier to do it in finalize(), it catches all use cases.

Note that we also have two cases of memory allocation:
+ the allocated space hosts some children objects (like in the 
riscv_array of this patch)
+ the allocated space hosts simple C things (other patches of this series)

First case is bit a tricky because obviously we cannot free a child's 
memory until the child is also finalized. To answer your last question, 
cleaning of a child is automatic when the reference is removed at the 
beginning the finalize process of the parent.

Writing the last paragraph makes me realize we have probably no 
guarantee this is the last reference (but it should). So if we want to 
be sure we don't free a still-in-use memory space: we should use 
object_new() instead of object_initialize_child() and let the child free 
it's own memory and avoid this specific issue.

PS: Added qom maintainers/reviewers in cc.
Thanks,
--
Damien

