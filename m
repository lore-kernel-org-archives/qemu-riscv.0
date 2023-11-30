Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7604DC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 20:44:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8nsq-0004xt-1t; Thu, 30 Nov 2023 15:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r8nso-0004wo-JQ
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 15:43:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r8nsl-0008UW-KG
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 15:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701377014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNAnS8dhB7e4TvDt7MCxzeAFcs3pq2oyNt9JbDuu0+0=;
 b=XQsADhPo9zzCyI4BfNmmG5MHeS7sHsgVA5kZfbtrXlyUw02+B6YwL6YBCgbQaWfqsnX/1Z
 t69HTR8FXzXonnxOzWr8yVu3RbJoqFpRFY40GJxIJ2BJC0tQ2NP3RR1s7psIC0XjU48ur1
 Ppo36AlZ/evJSjWH08ldvQjMQYky2wk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-YVQAL4REMrW4yB-eXJoi0A-1; Thu, 30 Nov 2023 15:43:32 -0500
X-MC-Unique: YVQAL4REMrW4yB-eXJoi0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13067828AC0;
 Thu, 30 Nov 2023 20:43:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D84C0BDC0;
 Thu, 30 Nov 2023 20:43:26 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:43:25 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Huacai Chen <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liwei1518@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Stafford Horne <shorne@gmail.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leonardo Bras <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
Message-ID: <20231130204325.GE1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
 <ZWjr0TKxihlpd1jm@x1n>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SBmcOIqLLg4zQdMA"
Content-Disposition: inline
In-Reply-To: <ZWjr0TKxihlpd1jm@x1n>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


--SBmcOIqLLg4zQdMA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 03:08:49PM -0500, Peter Xu wrote:
> On Wed, Nov 29, 2023 at 04:26:20PM -0500, Stefan Hajnoczi wrote:
> > The Big QEMU Lock (BQL) has many names and they are confusing. The
> > actual QemuMutex variable is called qemu_global_mutex but it's commonly
> > referred to as the BQL in discussions and some code comments. The
> > locking APIs, however, are called qemu_mutex_lock_iothread() and
> > qemu_mutex_unlock_iothread().
> >=20
> > The "iothread" name is historic and comes from when the main thread was
> > split into into KVM vcpu threads and the "iothread" (now called the main
> > loop thread). I have contributed to the confusion myself by introducing
> > a separate --object iothread, a separate concept unrelated to the BQL.
> >=20
> > The "iothread" name is no longer appropriate for the BQL. Rename the
> > locking APIs to:
> > - void qemu_bql_lock(void)
> > - void qemu_bql_unlock(void)
> > - bool qemu_bql_locked(void)
> >=20
> > There are more APIs with "iothread" in their names. Subsequent patches
> > will rename them. There are also comments and documentation that will be
> > updated in later patches.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Acked-by: Peter Xu <peterx@redhat.com>
>=20
> Two nickpicks:
>=20
>   - BQL contains "QEMU" as the 2nd character, so maybe easier to further
>     rename qemu_bql into bql_?

Philippe wondered whether the variable name should end with _mutex (or
_lock is common too), so an alternative might be big_qemu_lock. That's
imperfect because it doesn't start with the usual qemu_ prefix.
qemu_big_lock is better in that regard but inconsistent with our BQL
abbreviation.

I don't like putting an underscore at the end. It's unusual and would
make me wonder what that means.

Naming is hard, but please discuss and I'm open to change to BQL
variable's name to whatever we all agree on.

>=20
>   - Could we keep the full spell of BQL at some places, so people can sti=
ll
>     reference it if not familiar?  IIUC most of the BQL helpers will root
>     back to the major three functions (_lock, _unlock, _locked), perhaps
>     add a comment of "BQL stands for..." over these three functions as
>     comment?

Yes, I'll update the doc comments to say "Big QEMU Lock (BQL)" for each
of these functions.

Stefan

--SBmcOIqLLg4zQdMA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8+0ACgkQnKSrs4Gr
c8jJmAf9E8P/Xu7G6FqCGvOsGt/mlsqbLE31vNsiYxVDEuJJ4a39lBYM8XOY3zUI
Gg064yxhG8tJGG9m/NXlySw6Sspev3/nD4NPnrVvUGbS7OGjFL9L4oeHzgeK/ude
U2mtVSBxhVHvx08ya0nKtF3i0ghiSWa+/X83V03smz5ZuMNU1ZXTAzSCp54dwQCH
nO4Q4Y7nQxE57jSy8rB5HTwxFpmfjfXlzYpF+3rYGj+pjy7vOEuD8jdGBZ3+ts9x
Cca0JUsQNEHbcUesyE4ToH5KQHOFUQKalbc+knFcT8JuoGXX3MwuS4mp22wi7Gv6
LDSh2bymbDqhY4xQU5BomaihozS0ww==
=QeIi
-----END PGP SIGNATURE-----

--SBmcOIqLLg4zQdMA--


