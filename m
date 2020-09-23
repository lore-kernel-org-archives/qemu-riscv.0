Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kL6Sz-0006VT-JS
	for mharc-qemu-riscv@gnu.org; Wed, 23 Sep 2020 11:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kL6Su-0006Sc-JH
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2020 11:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kL6Sp-0003gk-S1
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2020 11:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600874027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FlU/OKWGsUcXAWijq0uSnuWl+UgM4drfHtrzAcT8ML8=;
 b=S5p+Iv7Y7SgEqJpRLMOaG8BMN+IustRCa8biV1z3oOinO3OgyDHzl4p6y9vEbjxxLwCLyG
 khU22xFka6ae145GJRpDS4R9KGhZOrkPmfbAtnVoDJ7lkC6CnoW0DzTD3LaV7LoUXerNIQ
 +ai2e9L8R+xc+8iE5I9sZJ8SelnuCN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-BSnw5gicMoaqzycugApOAQ-1; Wed, 23 Sep 2020 11:13:35 -0400
X-MC-Unique: BSnw5gicMoaqzycugApOAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C763186DD29;
 Wed, 23 Sep 2020 15:13:30 +0000 (UTC)
Received: from localhost (ovpn-113-77.ams2.redhat.com [10.36.113.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48F7F19D7D;
 Wed, 23 Sep 2020 15:13:18 +0000 (UTC)
Date: Wed, 23 Sep 2020 16:13:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, sheepdog@lists.wpkg.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 xen-devel@lists.xenproject.org, Huacai Chen <chenhc@lemote.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Juan Quintela <quintela@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Jiri Slaby <jslaby@suse.cz>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Liu Yuan <namei.unix@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Fam Zheng <fam@euphon.net>, David Hildenbrand <david@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3] qemu/atomic.h: rename atomic_ to qatomic_
Message-ID: <20200923151317.GA65166@stefanha-x1.localdomain>
References: <20200923105646.47864-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200923105646.47864-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 23 Sep 2020 15:13:52 -0000

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 11:56:46AM +0100, Stefan Hajnoczi wrote:
> clang's C11 atomic_fetch_*() functions only take a C11 atomic type
> pointer argument. QEMU uses direct types (int, etc) and this causes a
> compiler error when a QEMU code calls these functions in a source file
> that also included <stdatomic.h> via a system header file:
>=20
>   $ CC=3Dclang CXX=3Dclang++ ./configure ... && make
>   ../util/async.c:79:17: error: address argument to atomic operation must=
 be a pointer to _Atomic type ('unsigned int *' invalid)
>=20
> Avoid using atomic_*() names in QEMU's atomic.h since that namespace is
> used by <stdatomic.h>. Prefix QEMU's APIs with 'q' so that atomic.h
> and <stdatomic.h> can co-exist. I checked /usr/include on my machine and
> searched GitHub for existing "qatomic_" users but there seem to be none.
>=20
> This patch was generated using:
>=20
>   $ git grep -h -o '\<atomic\(64\)\?_[a-z0-9_]\+' include/qemu/atomic.h |=
 \
>     sort -u >/tmp/changed_identifiers
>   $ for identifier in $(</tmp/changed_identifiers); do
>         sed -i "s%\<$identifier\>%q$identifier%g" \
>             $(git grep -I -l "\<$identifier\>")
>     done
>=20
> I manually fixed line-wrap issues and misaligned rST tables.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v3:
>  * Use qatomic_ instead of atomic_ [Paolo]
>  * The diff of my manual fixups is available here:
>    https://vmsplice.net/~stefan/atomic-namespace-pre-fixups-v3.diff
>    - Dropping #ifndef qatomic_fetch_add in atomic.h
>    - atomic_##X(haddr, val) glue macros not caught by grep
>    - Keep atomic_add-bench name
>    - C preprocessor backslash-newline ('\') column alignment
>    - Line wrapping

Thanks, applied quickly due to high risk of conflicts:
https://github.com/stefanha/qemu/commits/block

Stefan

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9rZg0ACgkQnKSrs4Gr
c8hgKAgAgMxkkgpOvyrKNVjow73folqKA0ZhroVDQHEUsTa2UYiwbbbbNRLcYq0F
vaMQDzh9lx3hrohttFIS/rehi66qH4XW/k+tD6M4ACJbKA3QpL7N50aGEbrgTIRC
23cIU2FHbnqNoNraQw9xU3e1A5Ux7m/1hbNaK2uIFguwU6xo9X2CvUfQsEOcSUS6
afb0Krf0sN5LMMjGGnBuA7b6Fg9rrDNzBZvmZQkoFPkQEBoZWj4BGTyY76OhVnGg
Po6uwJZYi5xyX9wr4ESopGboCs7ZkDF2uLGNwTbC5kkDYurysefdfclYPotW5Jxr
kUPXGqzNlp5YT7HHoqpjtPu6bX44Wg==
=+ZBo
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--


