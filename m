Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBCCC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 20:37:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8nmQ-0000x3-8m; Thu, 30 Nov 2023 15:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r8nmB-0000ny-VM
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 15:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r8nm7-0007Qu-Kj
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 15:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701376602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eYEi0Y5+QQuaOwHuJk++/9L4d3OIIjWT68mwc8kKwmY=;
 b=DYNo4o9L1jOGWSW21vmP5B0aeclD48gJzr3EGPvrJtAfSnmkXB7xWKZcXlE7X/tep0hycJ
 47ySx7tcLfQ4mg086QUQACU++raPR/ECpoFFDdNcUAYWxargE7OGdH1I4ECC5jdkRp8nuV
 sKu826sMyg6OevBYX2onep1eVm4Ivb8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-SIexcsI8MJKCO3SfmX55Dg-1; Thu,
 30 Nov 2023 15:36:38 -0500
X-MC-Unique: SIexcsI8MJKCO3SfmX55Dg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3AB4280666F;
 Thu, 30 Nov 2023 20:36:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B9DD2166B26;
 Thu, 30 Nov 2023 20:36:34 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:36:33 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
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
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leonardo Bras <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 5/6] Replace "iothread lock" with "BQL" in comments
Message-ID: <20231130203633.GC1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-6-stefanha@redhat.com>
 <9c305a84-fd86-42fe-98ae-9297d480acd6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ADMBXqBOX1KM7dkn"
Content-Disposition: inline
In-Reply-To: <9c305a84-fd86-42fe-98ae-9297d480acd6@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--ADMBXqBOX1KM7dkn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 02:47:49PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 29/11/23 22:26, Stefan Hajnoczi wrote:
> > The term "iothread lock" is obsolete. The APIs use Big QEMU Lock (BQL)
> > in their names. Update the code comments to use "BQL" instead of
> > "iothread lock".
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   docs/devel/reset.rst             |  2 +-
> >   hw/display/qxl.h                 |  2 +-
> >   include/exec/cpu-common.h        |  2 +-
> >   include/exec/memory.h            |  4 ++--
> >   include/exec/ramblock.h          |  2 +-
> >   include/migration/register.h     |  8 ++++----
> >   target/arm/internals.h           |  4 ++--
> >   accel/tcg/cputlb.c               |  4 ++--
> >   accel/tcg/tcg-accel-ops-icount.c |  2 +-
> >   hw/remote/mpqemu-link.c          |  2 +-
> >   migration/block-dirty-bitmap.c   | 10 +++++-----
> >   migration/block.c                | 24 ++++++++++++------------
> >   migration/colo.c                 |  2 +-
> >   migration/migration.c            |  2 +-
> >   migration/ram.c                  |  4 ++--
> >   system/physmem.c                 |  6 +++---
> >   target/arm/helper.c              |  2 +-
> >   target/arm/tcg/m_helper.c        |  2 +-
> >   ui/spice-core.c                  |  2 +-
> >   util/rcu.c                       |  2 +-
> >   audio/coreaudio.m                |  4 ++--
> >   ui/cocoa.m                       |  6 +++---
> >   22 files changed, 49 insertions(+), 49 deletions(-)
>=20
>=20
> > diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
> > index 69c6a53902..a2bc0a345d 100644
> > --- a/include/exec/ramblock.h
> > +++ b/include/exec/ramblock.h
> > @@ -34,7 +34,7 @@ struct RAMBlock {
> >       ram_addr_t max_length;
> >       void (*resized)(const char*, uint64_t length, void *host);
> >       uint32_t flags;
> > -    /* Protected by iothread lock.  */
> > +    /* Protected by BQL.  */
>=20
> There is only one single BQL, so preferably:
>=20
> "by the BQL"
>=20
> >       char idstr[256];
> >       /* RCU-enabled, writes protected by the ramlist lock */
> >       QLIST_ENTRY(RAMBlock) next;
>=20
>=20
>=20
>=20
> > -/* Called with iothread lock taken.  */
> > +/* Called with BQL taken.  */
>=20
> "with the BQL" (other uses)

I will try to change these for v2. It's a pre-existing issue though
because there was only ever one "iothread lock" too.

Stefan

--ADMBXqBOX1KM7dkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8lEACgkQnKSrs4Gr
c8inmQf8CHG08Gjf/Xbq1d507Sf6BOzXT42zcBsMdkGeul6WorzG8oHfr1SMVJgi
Fkex2GIeIAH3TjLTtiXePxp/7MXVrArmRxUltKaaZZAcD48aA8VXeOylS3pnZnU+
2cqukgamf6tOSIc43sr1ZX06y154qL7xAMQ8Xl0sUu3ERaJob0bzyfPKf2xgjnas
wVfsXUS7nEcRMJVi94oT9ST1WpJPbA9yDVyVX3LwtX0KECWoYIiN9or7jTlP2TnA
9/GXVa9I8R/eA0P2xLU2RpfNNNY9A9+MZvgHSU75u9C9jN4/CR59W8EjyBTl+/fA
KHaDBsL7B4GbwgONA8VDLiAbIN/g3Q==
=Ause
-----END PGP SIGNATURE-----

--ADMBXqBOX1KM7dkn--


