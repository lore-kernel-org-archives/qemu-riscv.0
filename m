Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxAAV-0005hg-IM
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 12:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxA9o-0005b9-D9
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 12:00:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxA9m-0006II-Fr
 for qemu-riscv@nongnu.org; Mon, 21 Nov 2022 12:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669050028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x8+On0GBfdFR5F+9woJTFm6YXMnBIX2ME5vhixP8V28=;
 b=evojQxNQJux8/fPMDkTWWO1jjcltdXKvmHLqniFj8haEApkh6+2EXBAQUr4u3XCFqrMEHE
 7BrIVjXpahzNdEW9HdhFC3ze6XT6KYa3PIYR3Gjw8J9IcmST1k5RTJf0iobdhZcn1YMO/7
 +cm+wMHVFED3JBuiHIuG9Ia9on7JAVI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-HlECCpmRO26he42mW57V7A-1; Mon, 21 Nov 2022 12:00:27 -0500
X-MC-Unique: HlECCpmRO26he42mW57V7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 415BE858F13;
 Mon, 21 Nov 2022 17:00:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F4DE2027063;
 Mon, 21 Nov 2022 17:00:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D518D21E6921; Mon, 21 Nov 2022 18:00:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-devel@nongnu.org,  fam@euphon.net,  kwolf@redhat.com,
 hreitz@redhat.com,  groug@kaod.org,  qemu_oss@crudebyte.com,
 Alistair.Francis@wdc.com,  bin.meng@windriver.com,  palmer@dabbelt.com,
 marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 yuval.shaia.ml@gmail.com,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 quintela@redhat.com,  dgilbert@redhat.com,  pavel.dovgaluk@ispras.ru,
 alex.bennee@linaro.org,  peterx@redhat.com,  david@redhat.com,
 philmd@linaro.org,  mrolnik@gmail.com,  gaosong@loongson.cn,
 yangxiaojuan@loongson.cn,  aurelien@aurel32.net,
 jiaxun.yang@flygoat.com,  aleksandar.rikalo@syrmia.com,
 berrange@redhat.com,  thuth@redhat.com,  lvivier@redhat.com,
 suhang16@mails.ucas.ac.cn,  chen.zhang@intel.com,  lizhijian@fujitsu.com,
 stefanha@redhat.com,  qemu-block@nongnu.org,  qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,  virtio-fs@redhat.com
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAMo8BfKxve8=RKqT6S8XXy1E7hczF0VO9XXZeUpha_4xNSV6WA@mail.gmail.com>
Date: Mon, 21 Nov 2022 18:00:19 +0100
In-Reply-To: <CAMo8BfKxve8=RKqT6S8XXy1E7hczF0VO9XXZeUpha_4xNSV6WA@mail.gmail.com>
 (Max Filippov's message of "Mon, 21 Nov 2022 08:42:30 -0800")
Message-ID: <8735aci6os.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 21 Nov 2022 17:00:45 -0000

Max Filippov <jcmvbkbc@gmail.com> writes:

> On Mon, Nov 21, 2022 at 6:01 AM Markus Armbruster <armbru@redhat.com> wrote:
>>  .../xtensa/core-dsp3400/xtensa-modules.c.inc  | 136 +++++-------------
>>  target/xtensa/core-lx106/xtensa-modules.c.inc |  16 +--
>
> These files are generated and were imported from xtensa configuration
> overlays, they're not supposed to be changed.

Will drop.  Thanks!


