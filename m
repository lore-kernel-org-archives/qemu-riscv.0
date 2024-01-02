Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C41C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 15:34:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rKgmJ-0001eU-LW; Tue, 02 Jan 2024 10:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1rKgmH-0001c6-QG
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 10:34:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1rKgmG-0005eZ-33
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 10:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704209639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qivEXDFa8JGXsGjfK5660gJbyc7eHqwbc8ku83Ng7G0=;
 b=Geey2z44a2F/RjAZMYmAnybc804LvCsIlRnI/tPKOL23Tn/1Eod4MCD/OFMZl8Vae7uw1f
 5WlvBrTMi6aUXYeTIVcqQv7kjWwaOsRsqVFJK/kuuMyudNyqHZoFq0efy/F3YHaUjO7u3N
 I8dWS6XF7EhPA7y30+xNN5YwBB8J/1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-pzkIouvUPDeibrT9BgRP0w-1; Tue, 02 Jan 2024 10:33:56 -0500
X-MC-Unique: pzkIouvUPDeibrT9BgRP0w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0700881F02;
 Tue,  2 Jan 2024 15:33:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79635492BFA;
 Tue,  2 Jan 2024 15:33:46 +0000 (UTC)
Date: Tue, 2 Jan 2024 10:33:45 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paul Durrant <paul@xen.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander Graf <agraf@csgraf.de>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Fam Zheng <fam@euphon.net>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Leonardo Bras <leobras@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liwei1518@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Stafford Horne <shorne@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Eric Blake <eblake@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Halil Pasic <pasic@linux.ibm.com>, xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v2 1/5] system/cpus: rename qemu_mutex_lock_iothread() to
 bql_lock()
Message-ID: <20240102153345.GA485043@fedora>
References: <20231212153905.631119-1-stefanha@redhat.com>
 <20231212153905.631119-2-stefanha@redhat.com>
 <389fff8c-9f5d-4b6b-acd2-bc3e2110a9b3@daynix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DI3ersSYWO3ysvwX"
Content-Disposition: inline
In-Reply-To: <389fff8c-9f5d-4b6b-acd2-bc3e2110a9b3@daynix.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.178,
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


--DI3ersSYWO3ysvwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:37:00PM +0900, Akihiko Odaki wrote:
> On 2023/12/13 0:39, Stefan Hajnoczi wrote:
> > @@ -312,58 +312,58 @@ bool qemu_in_main_thread(void);
> >       } while (0)
> >   /**
> > - * qemu_mutex_lock_iothread: Lock the main loop mutex.
> > + * bql_lock: Lock the Big QEMU Lock (BQL).
> >    *
> > - * This function locks the main loop mutex.  The mutex is taken by
> > + * This function locks the Big QEMU Lock (BQL).  The lock is taken by
> >    * main() in vl.c and always taken except while waiting on
> > - * external events (such as with select).  The mutex should be taken
> > + * external events (such as with select).  The lock should be taken
> >    * by threads other than the main loop thread when calling
> >    * qemu_bh_new(), qemu_set_fd_handler() and basically all other
> >    * functions documented in this file.
> >    *
> > - * NOTE: tools currently are single-threaded and qemu_mutex_lock_iothr=
ead
> > + * NOTE: tools currently are single-threaded and bql_lock
> >    * is a no-op there.
> >    */
> > -#define qemu_mutex_lock_iothread()                      \
> > -    qemu_mutex_lock_iothread_impl(__FILE__, __LINE__)
> > -void qemu_mutex_lock_iothread_impl(const char *file, int line);
> > +#define bql_lock()                      \
> > +    bql_lock_impl(__FILE__, __LINE__)
>=20
> This line break is no longer necessary.

Will fix in v3.

Stefan

--DI3ersSYWO3ysvwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmWULNkACgkQnKSrs4Gr
c8gQ1wf/SKDGDIkJDmyj8M85Uyj3OSfk6tILO0qMqPCHK2Xyw3+EA0ugnFsOQ0eT
UcvEcmAyA0hewn7VKrk4Ge1wuPQ6Qm9DgLNb6oojftMAxktuhOAwC8VRaYiUFIF/
JP46P0qatEeghim4KwM4VV8EGGClPZU0vVsAQ/6rAxs2ZWbgBMPFfg9TSspauGWY
4tObr3E/T3RO4aajdJMcobO9ocG3TTdJAGwcOY6nGHnfS+DE/+a2yr4NwmQrxgqS
jcmYNPM+uSCzilu3csBqEtYtklAsVkArXGkf0pcSb73VmfgeBdHlIRupD0aCq3SE
4rE39ETbAHOxe0+sS7oasRYcUNKBxA==
=P1kw
-----END PGP SIGNATURE-----

--DI3ersSYWO3ysvwX--


