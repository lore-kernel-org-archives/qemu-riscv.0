Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMTxd-0007eY-CR
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 08:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMTxc-0007e3-2c
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMTxa-00046F-JH
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l077ML8x2aUA3BfSYxSnF/pmWEsvNiSwJ/mn/qtcnMc=;
 b=OvuyTKh3KyRzid59vaBPaeViSPd2AFlrUmr2I5luZTGkShYnwD1DvCwrl2SFKVYvjpsIif
 AWr6EeKa90rVO3nKWRHlLrd/5X+hkXkxJelamnPevhE9+1PzNjvRWKJT6bZLg83h+LCLcJ
 OlE+jmIJTB0wtMe0vdASLNPvnBFapXM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-iyGpN8YgPiKfsf49FspL_w-1; Mon, 30 Jan 2023 08:12:30 -0500
X-MC-Unique: iyGpN8YgPiKfsf49FspL_w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DD93100F90A;
 Mon, 30 Jan 2023 13:12:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 629F7492B05;
 Mon, 30 Jan 2023 13:12:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6783421E6A1F; Mon, 30 Jan 2023 14:12:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Warner Losh <imp@bsdimp.com>,
 qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 kevans@freebsd.org,  berrange@redhat.com,  groug@kaod.org,
 qemu_oss@crudebyte.com,  philmd@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  quintela@redhat.com,
 dgilbert@redhat.com,  michael.roth@amd.com,  kkostiuk@redhat.com,
 tsimpson@quicinc.com,  palmer@dabbelt.com,  bin.meng@windriver.com,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
 <20230127100052-mutt-send-email-mst@kernel.org>
 <20230128052729-mutt-send-email-mst@kernel.org>
Date: Mon, 30 Jan 2023 14:12:28 +0100
In-Reply-To: <20230128052729-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Sat, 28 Jan 2023 05:29:47 -0500")
Message-ID: <87mt60b1z7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-List-Received-Date: Mon, 30 Jan 2023 13:12:36 -0000

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Jan 27, 2023 at 10:01:57AM -0500, Michael S. Tsirkin wrote:
>> On Fri, Jan 27, 2023 at 02:54:30PM +0000, Peter Maydell wrote:
>> > On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
>> > >
>> > > Also, why didn't you move sys/resource.h and other such files
>> > > to os-dep.h? I'm struggling to understand the rules around what
>> > > is or isn't included where?
>> > 
>> > The rough rule of thumb is that if some OS needs a compatibility
>> > fixup or workaround for a system header (eg not every mmap.h
>> > defines MAP_ANONYMOUS; on Windows unistd.h has to come before
>> > time.h) then we put that header include and the compat workaround
>> > into osdep.h. This avoids "only fails on obscure platform" issues
>> > where somebody puts a header include into some specific .c file
>> > but not the compat workaround, and it works on the Linux host
>> > that most people develop and test on and we only find the
>> > problem later.
>> > 
>> > There's also no doubt some includes there for historical
>> > reasons, and some which really are "everybody needs these"
>> > convenience ones. But we should probably not add new
>> > includes to osdep.h unless they fall into the "working around
>> > system header issues" bucket.
>> > 
>> > thanks
>> > -- PMM
>> 
>> 
>> BTW maybe we should teach checkpatch about that rule:
>> if a header is in osdep do not include it directly.
>
> To be more precise, make checkpatch run clean-includes somehow?
> Or just make CI run clean-includes on the tree and verify result
> is empty?

scripts/clean-includes isn't quite happy even after my series.
Offenders:

    ebpf/rss.bpf.skeleton.h
    subprojects/libvduse/libvduse.h
    subprojects/libvhost-user/libvhost-user-glib.h
    subprojects/libvhost-user/libvhost-user.h
    target/hexagon/idef-parser/idef-parser.h
    target/hexagon/idef-parser/parser-helpers.h
    tests/fp/platform.h
    contrib/plugins/cache.c
    contrib/plugins/drcov.c
    contrib/plugins/execlog.c
    contrib/plugins/hotblocks.c
    contrib/plugins/hotpages.c
    contrib/plugins/howvec.c
    contrib/plugins/hwprofile.c
    contrib/plugins/lockstep.c
    linux-user/mips64/cpu_loop.c
    linux-user/mips64/signal.c
    linux-user/x86_64/cpu_loop.c
    linux-user/x86_64/signal.c
    plugins/core.c
    plugins/loader.c
    scripts/xen-detect.c
    subprojects/libvduse/libvduse.c
    subprojects/libvhost-user/libvhost-user-glib.c
    subprojects/libvhost-user/libvhost-user.c
    subprojects/libvhost-user/link-test.c
    target/hexagon/gen_dectree_import.c
    target/hexagon/gen_semantics.c
    target/hexagon/idef-parser/parser-helpers.c
    target/s390x/gen-features.c
    tests/migration/s390x/a-b-bios.c
    tests/plugin/bb.c
    tests/plugin/empty.c
    tests/plugin/insn.c
    tests/plugin/mem.c
    tests/plugin/syscall.c
    tests/uefi-test-tools/UefiTestToolsPkg/BiosTablesTest/BiosTablesTest.c
    tests/unit/test-rcu-simpleq.c
    tests/unit/test-rcu-slist.c
    tests/unit/test-rcu-tailq.c
    tools/ebpf/rss.bpf.c

To support automatic checking, we'd have to fix the ones that need need
fixing, and add the remainder to the script's XDIRREGEX.


