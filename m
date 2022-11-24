Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyHA8-0001kl-0x
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 13:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oyHA5-0001kL-U3
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 13:41:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oyHA4-0006i8-GD
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 13:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669315283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3DIOND7g7nqW80+wxiQB1jbm/Ise7wlcYffTQ38szhM=;
 b=AT61qf5HTilqtOvIG2xeU3FLl/HLasKKS2gu81v+BlVY3oJh/4pFPDEiBt1Z2TBKUFRcFh
 1TQFApqx36oNLQZImqyDo4iySYY8+TNrQhZrns0xH5SJl4hXHSv0u89Sb4RwycWJLuLXO1
 oNoEWk36SGGanSiV0mu/xi3rqXAotQc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-EuY_r2jzM5GeqCwYQ-htWQ-1; Thu, 24 Nov 2022 13:41:21 -0500
X-MC-Unique: EuY_r2jzM5GeqCwYQ-htWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B33113810787;
 Thu, 24 Nov 2022 18:41:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 154374A9254;
 Thu, 24 Nov 2022 18:41:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DAB7221E6921; Thu, 24 Nov 2022 19:41:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: <qemu-devel@nongnu.org>,  <qemu_oss@crudebyte.com>,
 <Alistair.Francis@wdc.com>,  <bin.meng@windriver.com>,
 <palmer@dabbelt.com>,  <marcandre.lureau@redhat.com>,
 <pbonzini@redhat.com>,  <yuval.shaia.ml@gmail.com>,
 <marcel.apfelbaum@gmail.com>,  <mst@redhat.com>,  <quintela@redhat.com>,
 <dgilbert@redhat.com>,  <pavel.dovgaluk@ispras.ru>,
 <alex.bennee@linaro.org>,  <peterx@redhat.com>,  <david@redhat.com>,
 <philmd@linaro.org>,  <mrolnik@gmail.com>,  <gaosong@loongson.cn>,
 <yangxiaojuan@loongson.cn>,  <aurelien@aurel32.net>,
 <jiaxun.yang@flygoat.com>,  <aleksandar.rikalo@syrmia.com>,
 <berrange@redhat.com>,  <thuth@redhat.com>,  <lvivier@redhat.com>,
 <suhang16@mails.ucas.ac.cn>,  <chen.zhang@intel.com>,
 <lizhijian@fujitsu.com>,  <stefanha@redhat.com>,
 <qemu-riscv@nongnu.org>,  <qemu-ppc@nongnu.org>,  <virtio-fs@redhat.com>
Subject: Re: [PATCH v2 1/2] cleanup: Tweak and re-run return_directly.cocci
References: <20221122134917.1217307-1-armbru@redhat.com>
 <20221122134917.1217307-2-armbru@redhat.com>
 <20221124161511.73b50353@bahia> <20221124162403.7d45f4fb@bahia>
Date: Thu, 24 Nov 2022 19:41:14 +0100
In-Reply-To: <20221124162403.7d45f4fb@bahia> (Greg Kurz's message of "Thu, 24
 Nov 2022 16:24:03 +0100")
Message-ID: <878rk019h1.fsf@pond.sub.org>
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
X-List-Received-Date: Thu, 24 Nov 2022 18:41:26 -0000

Greg Kurz <groug@kaod.org> writes:

> On Thu, 24 Nov 2022 16:15:11 +0100
> Greg Kurz <groug@kaod.org> wrote:
>
>> On Tue, 22 Nov 2022 14:49:16 +0100
>> Markus Armbruster <armbru@redhat.com> wrote:
>> 
>> > Tweak the semantic patch to drop redundant parenthesis around the
>> > return expression.
>> > 
>> > Coccinelle drops a comment in hw/rdma/vmw/pvrdma_cmd.c; restored
>> > manually.
>> > 
>> > Coccinelle messes up vmdk_co_create(), not sure why.  Change dropped,
>> > will be done manually in the next commit.
>> > 
>> > Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
>> > manually.
>> > 
>> > Whitespace in tools/virtiofsd/fuse_lowlevel.c tidied up manually.
>> > 
>> > checkpatch.pl complains "return of an errno should typically be -ve"
>> > two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
>> > it visible to checkpatch.pl.
>> > 
>> 
>> Hi Markus,
>> 
>> Yeah these positive errno values have been sitting there since the
>> beginning. It was dead code until I hijacked the synth backend to
>> implement qtest for 9p. I didn't care much about the return value
>> of the two culprits at the time since both are passed to assert(!ret)
>> right away. For this reason, changing the sign should be easy :-)
>> 
>> I see that checkpatch.pl considers this as an error. I'll post
>> a fix. I guess you'll need to rebase on this fix for your patches
>> to pass CI.
>> 
>
> Or maybe I can fix the issues detected by coccinelle as well and
> you can just drop the 9p bits from this patch ?

Up to you!

>> Anyway, for 9p:
>> 
>> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!


