Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiGw4-00034L-RU
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 11:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oiGw1-00030g-GU
 for qemu-riscv@nongnu.org; Tue, 11 Oct 2022 11:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oiGvz-0000Zw-Jt
 for qemu-riscv@nongnu.org; Tue, 11 Oct 2022 11:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665501162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHX8szJU5lcx5EEtgywgG95dJJ6buvOr4N4lK8qFRng=;
 b=g4h03FFkW1oL+XrY/BzbGZs8pjdNtoW8kQzG77+JSI0fNloXbre0XokG2CgFbYF3dCur3L
 9NQY34sgX5vnT3s9Ej7L1hXI/1Vh/HJ/UQDQLCcewf9YbBpVPyNXOD5OD88yNei2QqoJcI
 fnI6dSBxaEj2mJZxbH4+fCfO6cQMJ88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-pcPQJl3tMVegkmptjmZ4CQ-1; Tue, 11 Oct 2022 11:12:39 -0400
X-MC-Unique: pcPQJl3tMVegkmptjmZ4CQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7867101A528;
 Tue, 11 Oct 2022 15:12:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41B7D492B05;
 Tue, 11 Oct 2022 15:12:37 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:12:35 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 viktor.prutyanov@redhat.com, Greg Kurz <groug@kaod.org>,
 frankja@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/10] Dump patches
Message-ID: <Y0WH4+1zi8SmJqtq@fedora>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BAQDXEqVhTaktHoJ"
Content-Disposition: inline
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 11 Oct 2022 15:12:45 -0000


--BAQDXEqVhTaktHoJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--BAQDXEqVhTaktHoJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNFh+MACgkQnKSrs4Gr
c8jGSgf9GgMdODAWykAqQVDjYL02ZPZ1OCJzdqT1xtcY+HQz7v+UtpCL0Q3+14LG
CDxobk6SgXBUTQCIRcHroJRnG4HYshQNTboLlUjKoiMN3jM7e4NExPyTMKpFKlFI
PhQnD2fjUEfvTsWE1vdwKwIMsVr6eTes21kW/igOUE+FAbvABCciMjwA6FCqYN3+
V8hfUfoN2+t2I8Q5gCgEJDoRzjmvD3JIu7DrDHBW7NGGtfSsKeddyZ/xfkBv1E9O
S5Brz/HpZqm1MO3pIlSFpTgMi/oKC+7r5LVUvFqqP3hKp2LE23+XagiUtxYYVtS1
3ivn5b/bjEutjhszMd0M6Z3xpIZ9pw==
=V0Rp
-----END PGP SIGNATURE-----

--BAQDXEqVhTaktHoJ--


