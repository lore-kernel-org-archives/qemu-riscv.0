Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxTIs-0000tb-59
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 08:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxTIp-0000sg-8T
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 08:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxTIm-0004gB-TJ
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 08:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669123623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9/KHig+HpORrQ/dr1QviCbDwAXqH4a+jWUeX5NNGJbc=;
 b=Z66pjtyigVeyHEkvJ6TOOobTQQe/XpjMZpkBlESgdJxNig31W/VR//hodeHi6Mn5Je7l6K
 GZca7QGknV9wCnOIBHAYUS+VVXrXAlgu+gycbMXHXIkbH1Q+Ua5hxGVnmeQnq6uCvMUnYo
 hPw+nX9ufCDg1oqwTNzQhcmYZJmelxE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-mae31NTsNkage0I4t4I2lg-1; Tue, 22 Nov 2022 08:27:00 -0500
X-MC-Unique: mae31NTsNkage0I4t4I2lg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AEDD833B15;
 Tue, 22 Nov 2022 13:26:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D56949BB60;
 Tue, 22 Nov 2022 13:26:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4458721E6921; Tue, 22 Nov 2022 14:26:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  fam@euphon.net,
 kwolf@redhat.com,  hreitz@redhat.com,  groug@kaod.org,
 qemu_oss@crudebyte.com,  Alistair.Francis@wdc.com,
 bin.meng@windriver.com,  palmer@dabbelt.com,
 marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 yuval.shaia.ml@gmail.com,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 quintela@redhat.com,  dgilbert@redhat.com,  pavel.dovgaluk@ispras.ru,
 alex.bennee@linaro.org,  peterx@redhat.com,  david@redhat.com,
 mrolnik@gmail.com,  gaosong@loongson.cn,  yangxiaojuan@loongson.cn,
 aurelien@aurel32.net,  jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com,  jcmvbkbc@gmail.com,  berrange@redhat.com,
 lvivier@redhat.com,  suhang16@mails.ucas.ac.cn,  chen.zhang@intel.com,
 lizhijian@fujitsu.com,  stefanha@redhat.com,  qemu-block@nongnu.org,
 qemu-riscv@nongnu.org,  qemu-ppc@nongnu.org,  virtio-fs@redhat.com
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
 <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
 <87a64ki7zn.fsf@pond.sub.org>
 <47e0d3d8-607d-5e29-6780-c0a4364993a9@redhat.com>
 <87h6yrfjr4.fsf@pond.sub.org>
 <CAFEAcA-8tyYDMaZgYvhrG5G001HzgkCUoTUMbChDteJ+q-r8yA@mail.gmail.com>
Date: Tue, 22 Nov 2022 14:26:54 +0100
In-Reply-To: <CAFEAcA-8tyYDMaZgYvhrG5G001HzgkCUoTUMbChDteJ+q-r8yA@mail.gmail.com>
 (Peter Maydell's message of "Tue, 22 Nov 2022 12:44:37 +0000")
Message-ID: <875yf7ce75.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Tue, 22 Nov 2022 13:27:07 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 22 Nov 2022 at 08:58, Markus Armbruster <armbru@redhat.com> wrote:
>> I don't think complete detailed review is necessary or even sensible.
>>
>> Review should start with the Coccinelle script:
>>
>>     // replace 'R = X; return R;' with 'return X;'
>>     @@
>>     identifier VAR;
>>     expression E;
>>     type T;
>>     identifier F;
>>     @@
>>      T F(...)
>>      {
>>          ...
>>     -    T VAR;
>>          ... when != VAR
>>
>>     -    VAR = (E);
>>     -    return VAR;
>>     +    return E;
>>          ... when != VAR
>>      }
>>
>> What could go wrong?  Not a rhetorical question!
>
> The obvious answer is "you might have got your manual tweaking
> wrong". A purely mechanised patch I can review by looking at
> the script and maybe eyeballing a few instances of the change;
> a change that is 99% mechanised and 1% hand-written I need to
> run through to find the hand-written parts.

Define "handwritten" :)

If reverting unwanted line-breaks and blank lines counts, then I can
make two patches, one straight from Coccinelle, and one that reverts the
unwanted crap.  The first one will be larger and more annoying to review
than this one.  A clear loss in my book, but I'm the patch submitter,
not a patch reviewer, so my book doesn't matter.

Else, we're down to one file, which I already offered to split off.

> But mostly this patch is hard to review for its sheer size,
> mechanical changes or not. A 3000 line patchmail is so big that
> the UI on my mail client gets pretty unwieldy.

With the manual one split off, target/xtensa/ dropped as requested by
Max, and tests/tcg/mips/ dropped because its status is unclear (and I
start to find it hard to care), we're down to

 28 files changed, 81 insertions(+), 221 deletions(-)

This will be v2.


