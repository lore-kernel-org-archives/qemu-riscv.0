Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9105EC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 20:31:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8nhJ-0006tB-8x; Thu, 30 Nov 2023 15:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r8nhI-0006pb-Mr
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 15:31:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r8nhG-0006kM-EI
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 15:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701376301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KFoHugi6jgybVjDl52fW0YxT+ePBaAxcnqZf4SllrU=;
 b=fhdvEOJx3Puzl4tYDkHZC6B+2XgHZP4o1jVjkc47bJKWi37ginuMZ6uk7PxwuWvT/sD+w7
 R//V4jVx/hGbet1jOwN5g+EBMJ2K482iWwA/5X1s1/OFmbEYKjhnVFmkJ9m+2+60Y2eVsD
 jCU+MQtvnoHK0gbMThsLzBTHEyTyTAU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-88dqJ2RNNwmoiXaZzWJvUg-1; Thu, 30 Nov 2023 15:31:37 -0500
X-MC-Unique: 88dqJ2RNNwmoiXaZzWJvUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F70582BA82;
 Thu, 30 Nov 2023 20:31:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 768DF492BE0;
 Thu, 30 Nov 2023 20:31:33 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:31:32 -0500
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
Subject: Re: [PATCH 4/6] system/cpus: rename qemu_global_mutex to qemu_bql
Message-ID: <20231130203132.GB1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-5-stefanha@redhat.com>
 <01ebd72d-affc-4b03-b491-f40964520f1c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sn71hyyf1gpGKJP8"
Content-Disposition: inline
In-Reply-To: <01ebd72d-affc-4b03-b491-f40964520f1c@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--sn71hyyf1gpGKJP8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 02:44:07PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 29/11/23 22:26, Stefan Hajnoczi wrote:
> > The APIs using qemu_global_mutex now follow the Big QEMU Lock (BQL)
> > nomenclature. It's a little strange that the actual QemuMutex variable
> > that embodies the BQL is called qemu_global_mutex instead of qemu_bql.
> > Rename it for consistency.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   system/cpus.c | 20 ++++++++++----------
> >   1 file changed, 10 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/system/cpus.c b/system/cpus.c
> > index eb24a4db8e..138720a540 100644
> > --- a/system/cpus.c
> > +++ b/system/cpus.c
> > @@ -65,7 +65,7 @@
> >   #endif /* CONFIG_LINUX */
> > -static QemuMutex qemu_global_mutex;
> > +static QemuMutex qemu_bql;
>=20
> I thought we were using _cond/_sem/_mutex suffixes, but
> this is not enforced:

I'm open to alternative names. Here are some I can think of:
- big_qemu_lock (although grepping for "bql" won't find it)
- qemu_bql_mutex

If there is no strong feeling about this then let's leave it at
qemu_bql. Otherwise, please discuss.

Thanks,
Stefan

--sn71hyyf1gpGKJP8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8SQACgkQnKSrs4Gr
c8j+pAf/bHckak+kCTFY6THF9fWYuY9tKxDh1TAsmCqS02YPBAPs1z0YH+99X3km
es2S24gx5+JuX1lEM4Cq3AGZibmA2Vrs+TcKe6DyN6hT5mtNrfeoTcFLiUGNHFVx
s+czVZPIfsxatmrt9FobrI2Ih51wyLzqPPI9ibJTSbz849aMGdjCfB+///3zKHW5
JsvpwUhaL7gomsRHXZZSyQq9f/yJrxcl7BP/tM4eJhLul0Q/3xsdQsme8PS4ImLz
srpkocFet7WKPXnBwXpDaZ21znv5VvTybFpRqCXpFJlQoWwZR5m+bF/Jo1vdCKBU
R3KRE4Yg7YPFP70oH/H5T7bSCUiOKg==
=zmh7
-----END PGP SIGNATURE-----

--sn71hyyf1gpGKJP8--


