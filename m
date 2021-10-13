Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mafGn-0000fh-Uk
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 10:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mafGm-0000fD-8j; Wed, 13 Oct 2021 10:30:12 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:59842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mafGj-0004dQ-SR; Wed, 13 Oct 2021 10:30:11 -0400
Received: from [192.168.15.165] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D0C2721C32;
 Wed, 13 Oct 2021 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1634135406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6HgMh5IMSwLEmZN5256moVuZUZTLWR6X/E7D989GAM=;
 b=1v5ahRx7kFy03JQEDgOMnsn6lCXMTvv/S4+cDS/eYY03VM2Fab7wi/9CaK/uJ+1vtCgm0H
 djgb9bc2m613XpLeGkEmpMC45AEY450QTrKfNQkbp7R8rGkXeXJIUrvGXVoFt5dFaeY82p
 KtyNyCsawGqJgUOc6OJpIm0RPipPZhg=
Message-ID: <11aa7a10-62ec-ebde-030c-5919e36ec34d@greensocs.com>
Date: Wed, 13 Oct 2021 16:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [RFC PATCH v2 04/16] softmmu/qdev-monitor: add error handling in
 qdev_set_id
Content-Language: en-US-large
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>, Paul Durrant
 <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>,
 Igor Mammedov <imammedo@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-5-damien.hedde@greensocs.com>
 <CAKmqyKNWBYpq8CbhtGyw9=1Gt_LujZZrtD7J_Ye2FyyVA6eqcw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAKmqyKNWBYpq8CbhtGyw9=1Gt_LujZZrtD7J_Ye2FyyVA6eqcw@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Oct 2021 14:30:12 -0000



On 10/13/21 09:10, Alistair Francis wrote:
> On Thu, Sep 23, 2021 at 2:29 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> qdev_set_id() is mostly used when the user adds a device (using
>> -device cli option or device_add qmp command). This commit adds
>> an error parameter to handle the case where the given id is
>> already taken.
>>
>> Also document the function and add a return value in order to
>> be able to capture success/failure: the function now returns the
>> id in case of success, or NULL in case of failure.
>>
>> The commit modifies the 2 calling places (qdev-monitor and
>> xen-legacy-backend) to add the error object parameter.
>>
>> Note that the id is, right now, guaranteed to be unique because
>> all ids came from the "device" QemuOptsList where the id is used
>> as key. This addition is a preparation for a future commit which
>> will relax the uniqueness.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Alistair
> 

CC'ing Kevin who integrated this patch into his series about
"qdev: Add JSON -device"
https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg01826.html

Thanks,
--
Damien

