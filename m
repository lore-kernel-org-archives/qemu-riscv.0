Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os4f6-0003l6-R4
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 11:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1os4f5-0003kt-2U
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 11:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1os4f3-0006a8-Bp
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 11:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kku/MWx+p0+KSkRxtDsiSH5gshNM0P6rpM78NN3h3I0=;
 b=A6frlYlHDCGzboQgFzuch9H/FZfGKOFn9VCpqH9lq+ZIF1PzyoFpp2AUytRNLs/65ON0kQ
 kZb5vTciinBzjhEdQmtzO4NfZKbjcdnNAi+56wquIjk3+B5iNVR/TMM3pZJOqiUr15zEWT
 207G3VHMbCFBnPU5/i5oCz+nKZoqNwE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-k_zm4mZ6MjeBuR0b9fDBrw-1; Mon, 07 Nov 2022 11:07:34 -0500
X-MC-Unique: k_zm4mZ6MjeBuR0b9fDBrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E244C1C08963;
 Mon,  7 Nov 2022 16:07:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F56540C6FA1;
 Mon,  7 Nov 2022 16:07:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F88E21E6921; Mon,  7 Nov 2022 17:07:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Sunil V L
 <sunilvl@ventanamicro.com>,  Markus Armbruster <armbru@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Alistair Francis <alistair.francis@wdc.com>,  Bin
 Meng <bin.meng@windriver.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <93096c36-fd3a-2e2f-4ae9-3bf9e4287204@linaro.org>
Date: Mon, 07 Nov 2022 17:07:32 +0100
In-Reply-To: <93096c36-fd3a-2e2f-4ae9-3bf9e4287204@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 7 Nov 2022 15:08:13
 +0100")
Message-ID: <87bkpipx2z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 07 Nov 2022 16:07:47 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 7/11/22 14:06, Peter Maydell wrote:
>> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>>
>>> The pflash implementation currently assumes fixed size of the
>>> backend storage.

Intentional.

commit 06f1521795207359a395996c253c306f4ab7586e
Author: Markus Armbruster <armbru@redhat.com>
Date:   Tue Mar 19 17:35:50 2019 +0100

    pflash: Require backend size to match device, improve errors
=20=20=20=20
    We reject undersized backends with a rather enigmatic "failed to read
    the initial flash content" error.  For instance:
=20=20=20=20
        $ qemu-system-ppc64 -S -display none -M sam460ex -drive if=3Dpflash=
,format=3Draw,file=3Deins.img
        qemu-system-ppc64: Initialization of device cfi.pflash02 failed: fa=
iled to read the initial flash content
=20=20=20=20
    We happily accept oversized images, ignoring their tail.  Throwing
    away parts of firmware that way is pretty much certain to end in an
    even more enigmatic failure to boot.
=20=20=20=20
    Require the backend's size to match the device's size exactly.  Report
    mismatch like this:
=20=20=20=20
        qemu-system-ppc64: Initialization of device cfi.pflash01 failed: de=
vice requires 1048576 bytes, block backend provides 512 bytes
=20=20=20=20
    Improve the error for actual read failures to "can't read block
    backend".
=20=20=20=20
    To avoid duplicating even more code between the two pflash device
    models, do all that in new helper blk_check_size_and_read_all().
=20=20=20=20
    The error reporting can still be confusing.  For instance:
=20=20=20=20
        qemu-system-ppc64 -S -display none -M taihu -drive if=3Dpflash,form=
at=3Draw,file=3Deins.img  -drive if=3Dpflash,unit=3D1,format=3Draw,file=3Dz=
wei.img
        qemu-system-ppc64: Initialization of device cfi.pflash02 failed: de=
vice requires 2097152 bytes, block backend provides 512 bytes
=20=20=20=20
    Leaves the user guessing which of the two -drive is wrong.  Mention
    the issue in a TODO comment.
=20=20=20=20
    Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Message-Id: <20190319163551.32499-2-armbru@redhat.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
    Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>>>                  Due to this, the backend storage file needs to be
>>> exactly of size 32M. Otherwise, there will be an error like below.
>>>
>>> "device requires 33554432 bytes, block backend provides 4194304 bytes"

Why is that a problem?  Genuine question!

>>> Fix this issue by using the actual size of the backing store.
>>>
>>> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>>> ---
>> Do you really want the flash device size presented to the guest
>> to be variable depending on what the user passed as a block backend?
>> I don't think this is how we handle flash devices on other boards...

Flash device is generally a property of the machine type.  Similar to
physical machines.  Not an accident.

> Ideally handling smaller/bigger backend size should be transparent for
> machine frontend, but we never agreed on what are user expectations and
> how to deal with such cases.
>
> Long term I'd go for:
>
> - if flash is read-only
>
>   a/ bigger backend: display a warning and ignore extra backend data.

Truncating images seems unlikely to be useful.

>   b/ smaller backend: assume flash block is in erased state and fill
>      missing gap with -1 (the default erase value), displaying a warning
>      on startup.

Padding has a better chance to work.  But is it worth the trouble?

>
> - if flash is read-write
>
>   a/ bigger backend: display a warning and ignore extra backend data.
>
>   b/ smaller backend: add a property to pflash device to handle missing
>      gap as erased data. If this flag is not set, display a hint and
>      exit with an error.

What happens when the guest writes to the part that isn't backed by the
backend?

Is this worth the trouble?

> In Sunil particular case, I suppose the issue comes from commit
> 334c388f25 ("hw/block/pflash_cfi0{1, 2}: Error out if device length
> isn't a power of two") which I'm going to revert because the code
> base is not ready for such check:
>
> https://lore.kernel.org/qemu-devel/78b914c5-ce7e-1d4a-0a67-450f286eb869@l=
inaro.org/
>
> Regards,
>
> Phil.


