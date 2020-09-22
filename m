Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKdWe-00062J-S4
	for mharc-qemu-riscv@gnu.org; Tue, 22 Sep 2020 04:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kKdWZ-000614-7f
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 04:19:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55444
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kKdWV-0005hf-1f
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 04:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600762778;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4YxfviHUp394Z95tLmiMsBjGp7nI/wBJIRQLvk3IHGM=;
 b=be79KkH4M/Ow01ocpnmTSKRWFsYXcKVHI/q9M/9j93hYknt8KA2SunYCoEdT8u6lWFS8h+
 I56H3fzpPibLm/AGCjVQaJJWePV4xZaAuLXnxQIHu/wT8qGI4OQHgjny1mZVtARnqFs5fQ
 fxTy5ftR+PKvRskl97GUYCv51agH72s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-sAd04_3bMH6jFWidZ6f72A-1; Tue, 22 Sep 2020 04:19:34 -0400
X-MC-Unique: sAd04_3bMH6jFWidZ6f72A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C107D57053;
 Tue, 22 Sep 2020 08:19:29 +0000 (UTC)
Received: from redhat.com (ovpn-114-64.ams2.redhat.com [10.36.114.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D54905C225;
 Tue, 22 Sep 2020 08:18:52 +0000 (UTC)
Date: Tue, 22 Sep 2020 09:18:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, sheepdog@lists.wpkg.org,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alberto Garcia <berto@igalia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Paul Durrant <paul@xen.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Peter Lieven <pl@kamp.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Liu Yuan <namei.unix@gmail.com>,
 qemu-riscv@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 John Snow <jsnow@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, xen-devel@lists.xenproject.org,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
Message-ID: <20200922081849.GD1989025@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200921162346.188997-1-stefanha@redhat.com>
 <c8892b73-6cee-9fd3-54b0-289149926041@redhat.com>
 <52b8a46e-ab9e-1645-163d-497122ece907@redhat.com>
 <8610ca0e-0b3f-6d95-43b9-e2e49571e311@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8610ca0e-0b3f-6d95-43b9-e2e49571e311@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 01:57:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 22 Sep 2020 08:19:43 -0000

On Tue, Sep 22, 2020 at 08:56:06AM +0200, Paolo Bonzini wrote:
> On 22/09/20 08:45, David Hildenbrand wrote:
> >> It's certainly a good idea but it's quite verbose.
> >>
> >> What about using atomic__* as the prefix?  It is not very common in QEMU
> >> but there are some cases (and I cannot think of anything better).
> >
> > aqomic_*, lol :)
> 
> Actually qatomic_ would be a good one, wouldn't it?

Yes, I think just adding a 'q' on the front of methods is more than
sufficient (see also all the qcrypto_*, qio_* APIs I wrote). The
only think a plain 'q' prefix is likely to clash with is the Qt
library and that isn't something we're likely to link with (famous
last words...).

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


