Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdsir-0002LR-Qf
	for mharc-qemu-riscv@gnu.org; Wed, 27 May 2020 05:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jdsiq-0002JO-AB
 for qemu-riscv@nongnu.org; Wed, 27 May 2020 05:51:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53691
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jdsip-00015P-7j
 for qemu-riscv@nongnu.org; Wed, 27 May 2020 05:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590573098;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0dAXNDQQ7XY7xee0kvINI/xiMyDCx/uG05SWgKOSh8=;
 b=fXUSXPbF17eIQ5VFP5/3/i0rSASpCL298mEcmPxciPb8kqiAXLt8erDHDCV9VndgzS+Oyw
 9UN79TwfGHom0xldeRLqp68sfI+6wknmDpkEV5konRwcVH82h7MeiUXLZLAVw8FSXbcyQC
 cek4yoMDzNx0M26k14kbNZ3lYWILuRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-Z5lKdVBsM8uO7ec5nHlBAw-1; Wed, 27 May 2020 05:51:30 -0400
X-MC-Unique: Z5lKdVBsM8uO7ec5nHlBAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BC70835B8D;
 Wed, 27 May 2020 09:51:29 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E6960C05;
 Wed, 27 May 2020 09:51:26 +0000 (UTC)
Date: Wed, 27 May 2020 10:51:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <Atish.Patra@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 1/5] hw: Add sockets_specified field in CpuTopology
Message-ID: <20200527095123.GH2665520@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200527054226.232103-1-anup.patel@wdc.com>
 <20200527054226.232103-2-anup.patel@wdc.com>
 <20200527084554.GC2665520@redhat.com>
 <DM6PR04MB6201A8060078D3539BFDE3688DB10@DM6PR04MB6201.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR04MB6201A8060078D3539BFDE3688DB10@DM6PR04MB6201.namprd04.prod.outlook.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 00:45:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 27 May 2020 09:51:40 -0000

On Wed, May 27, 2020 at 09:48:39AM +0000, Anup Patel wrote:
> 
> 
> > -----Original Message-----
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > Sent: 27 May 2020 14:16
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: Eduardo Habkost <ehabkost@redhat.com>; Marcel Apfelbaum
> > <marcel.apfelbaum@gmail.com>; Peter Maydell <peter.maydell@linaro.org>;
> > Palmer Dabbelt <palmer@dabbelt.com>; Alistair Francis
> > <Alistair.Francis@wdc.com>; Sagar Karandikar <sagark@eecs.berkeley.edu>;
> > Atish Patra <Atish.Patra@wdc.com>; qemu-riscv@nongnu.org; qemu-
> > devel@nongnu.org; Anup Patel <anup@brainfault.org>
> > Subject: Re: [PATCH v2 1/5] hw: Add sockets_specified field in CpuTopology
> > 
> > On Wed, May 27, 2020 at 11:12:22AM +0530, Anup Patel wrote:
> > > When "sockets" sub-option of "-smp" option is not specified, the
> > > smp_parse() function will assume one CPU per-socket and set the number
> > > of sockets equal to number of CPUs.
> > >
> > > This is counter-intuitive and we should allow machine emulation to
> > > decide default number of sockets when "sockets" sub-option is not
> > > specified.
> > 
> > I don't agree with this.  Having the semantics of the -smp option be the same
> > across all targets/machines *is* intuitive.  Changing semantics of -smp per-
> > machine will create a worse experiance for people configuring QEMU as the
> > configuration will mean different things depending on the machine choce.
> 
> Okay then why don't we default to sockets=1 in smp_parse() when "sockets"
> sub-options is not specified ?? This will make it uniform across machines.
> 
> Is there a reason to by default have sockets=max_cpus ??

IIUC both of these questions are due to backwards compatibility with
pre-existing QEMU versions.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


