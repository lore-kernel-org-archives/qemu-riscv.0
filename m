Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbNaG-00017z-TH
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 09:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbKoE-00014i-LS
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 06:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbKoC-0002Vf-UP
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 06:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295088;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IP84RLEef8DaPhB4Fxzg9put8LCkXdkifQFkF3LQcf4=;
 b=HYyHFs+Xy4P8z/ACPwI0+EllHJc7+3NM6JetqSXsqORnF6IvLAnxB5Z8HReTqlnNlFKcVF
 YLjk4L+7OybDIkNq5baNQ0xoVCtqoJ2D8K2BpKrgEcVbRFZRgjUkLxHYhpyUrtsS9QPYkD
 H86gfhqaqb0RvYA6S46z4G6R5aV6Z4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-n6G9Q83hNymPECsMRQOFIA-1; Fri, 15 Oct 2021 06:51:25 -0400
X-MC-Unique: n6G9Q83hNymPECsMRQOFIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D621610A8E00;
 Fri, 15 Oct 2021 10:51:23 +0000 (UTC)
Received: from [10.64.54.38] (vpn2-54-38.bne.redhat.com [10.64.54.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE9F2B060;
 Fri, 15 Oct 2021 10:51:17 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
To: Andrew Jones <drjones@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, peter.maydell@linaro.org,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, qemu-riscv@nongnu.org
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
 <20211013122840.fi4ufle4czyzegtb@gator.home>
 <20211014171417.541c9bee@redhat.com> <20211014153609.pzndx7um3dfdgelo@gator>
 <2399ce27-0663-6780-5453-3ee773563352@redhat.com>
 <20211015083359.j5t2xt7cfdjqbzlm@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <f199b132-7db1-0f1d-dd52-49355d38db3a@redhat.com>
Date: Fri, 15 Oct 2021 21:51:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211015083359.j5t2xt7cfdjqbzlm@gator>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 Oct 2021 09:49:10 -0400
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
X-List-Received-Date: Fri, 15 Oct 2021 10:51:30 -0000

Hi Drew,

On 10/15/21 7:33 PM, Andrew Jones wrote:
> On Fri, Oct 15, 2021 at 07:22:05PM +1100, Gavin Shan wrote:
>> It's possible that the empty NUMA nodes aren't referred by any CPUs,
>> as the following command line indicate. In this case, the empty NUMA
>> node IDs aren't existing in device-tree CPU nodes. So we still need
>> the distance-map.
> 
> Ah, indeed.
> 
>>
>> However, I would like to drop this (PATCH[01/02]) in v4. The memory
>> hotplug through device-tree on ARM64 isn't existing. We might have
>> alternative ways to present the empty NUMA nodes when it's supported,
>> or we needn't it for ever because ACPI is enough to support the
>> memory hotplug.
> 
> Agreed. Please update the commit message of 2/2 for v4 and also add
> a comment above the new code with the rationale for dropping those
> memory nodes.
> 

v4 was posted for review. Your r-b tag was dropped as the additional
comments are added. Please take a look on v4 and sorry for having
taken so much time from you :)

Thanks,
Gavin


