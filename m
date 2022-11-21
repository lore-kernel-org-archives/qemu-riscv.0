Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox9ig-0006wE-Vc
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 11:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox9iZ-0006to-To
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 11:32:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox9iX-0002qT-A7
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 11:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669048339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKhDrLi6alu4xCgnvW9N5gSG8qTXkSQtKu9eFapv5O0=;
 b=QNo+OcszXO9HtT65a3N7GxZKtDYckC8xzOHUKd6TFaUvKY22q9iNrzxBERCMWGcJW/rt35
 bd47RQuHElRugh6jNPSgPRwcJn6anM1Yd4xMIpgfoD603GNzvEFXyllk8Yj4RAxlWcwTIt
 8xfhIzqzrnMgRCW1fPHOQ1AWor2Spp8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-ngmTDW9EPCiyZK3FB7sTAw-1; Mon, 21 Nov 2022 11:32:18 -0500
X-MC-Unique: ngmTDW9EPCiyZK3FB7sTAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37B983C0218B;
 Mon, 21 Nov 2022 16:32:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B2F11415121;
 Mon, 21 Nov 2022 16:32:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1961021E6921; Mon, 21 Nov 2022 17:32:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,
 fam@euphon.net,  kwolf@redhat.com,  hreitz@redhat.com,  groug@kaod.org,
 qemu_oss@crudebyte.com,  Alistair.Francis@wdc.com,
 bin.meng@windriver.com,  palmer@dabbelt.com,
 marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 yuval.shaia.ml@gmail.com,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 quintela@redhat.com,  dgilbert@redhat.com,  pavel.dovgaluk@ispras.ru,
 alex.bennee@linaro.org,  peterx@redhat.com,  david@redhat.com,
 mrolnik@gmail.com,  gaosong@loongson.cn,  yangxiaojuan@loongson.cn,
 aurelien@aurel32.net,  jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com,  jcmvbkbc@gmail.com,  berrange@redhat.com,
 thuth@redhat.com,  lvivier@redhat.com,  suhang16@mails.ucas.ac.cn,
 chen.zhang@intel.com,  lizhijian@fujitsu.com,  stefanha@redhat.com,
 qemu-block@nongnu.org,  qemu-riscv@nongnu.org,  qemu-ppc@nongnu.org,
 virtio-fs@redhat.com
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
 <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
Date: Mon, 21 Nov 2022 17:32:12 +0100
In-Reply-To: <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 21 Nov 2022 17:03:50
 +0100")
Message-ID: <87a64ki7zn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-List-Received-Date: Mon, 21 Nov 2022 16:32:27 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 21/11/22 15:36, Peter Maydell wrote:
>> On Mon, 21 Nov 2022 at 14:03, Markus Armbruster <armbru@redhat.com> wrot=
e:
>>>
>>> Tweak the semantic patch to drop redundant parenthesis around the
>>> return expression.
>>>
>>> Coccinelle drops comments in hw/rdma/vmw/pvrdma_cmd.c; restored
>>> manually.
>>>
>>> Coccinelle messes up vmdk_co_create(), not sure why.  Transformed
>>> manually.
>>>
>>> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
>>> manually.
>>>
>>> Whitespace in fuse_reply_iov() tidied up manually.
>>>
>>> checkpatch.pl complains "return of an errno should typically be -ve"
>>> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
>>> it visible to checkpatch.pl.
>>>
>>> checkpatch.pl complains "return is not a function, parentheses are not
>>> required" three times for target/mips/tcg/dsp_helper.c.  False
>>> positives.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>=20
>>>   .../user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
>>>   .../user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
>> [snip long list of other mips test files]
>>=20
>>>   328 files changed, 989 insertions(+), 2099 deletions(-)
>> This patch seems to almost entirely be huge because of these
>> mips test case files. Are they specific to QEMU or are they
>> effectively a 3rd-party import that it doesn't make sense
>> to make local changes to?
>
> They are imported and will unlikely be modified.

Not obvious to me from git-log.

Should I drop the changes to tests/tcg/mips/?


