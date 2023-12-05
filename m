Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7156BC10F04
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 14:19:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAWGW-0007yK-KQ; Tue, 05 Dec 2023 09:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1rAWGV-0007xn-Gh
 for qemu-riscv@nongnu.org; Tue, 05 Dec 2023 09:19:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1rAWGU-0000ch-3x
 for qemu-riscv@nongnu.org; Tue, 05 Dec 2023 09:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701785949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W6zB6H5V1BahZshs0SoTSl0jmSvj1SEeDkIrcLa72Eo=;
 b=fFEAEYsT36WA6qs0a1JgQpZqyU2/S+Y+aYuPqLymu9IKNH14PpMJ7w4vIW9xG4cg5WCiok
 9IGtQBIiUxrZFGe8KqMpfHoqv7GAab9sMCss3BwRrrZ8cUk4y11uQLx7IsWjkxp4BjpVp5
 QauLOIutop72Gdie18XCADmflWk5XPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-s7UeaCfIPzupkkme2mlSHQ-1; Tue, 05 Dec 2023 09:18:59 -0500
X-MC-Unique: s7UeaCfIPzupkkme2mlSHQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BC3085A5B1;
 Tue,  5 Dec 2023 14:18:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8C9F2166B33;
 Tue,  5 Dec 2023 14:18:48 +0000 (UTC)
Date: Tue, 5 Dec 2023 07:33:36 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL 0/4] Misc fixes for 2023-12-04
Message-ID: <20231205123336.GA1851038@fedora>
References: <20231204152524.37803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+l0CA1IAYU/JcXZ5"
Content-Disposition: inline
In-Reply-To: <20231204152524.37803-1-philmd@linaro.org>
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


--+l0CA1IAYU/JcXZ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--+l0CA1IAYU/JcXZ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVvGJ8ACgkQnKSrs4Gr
c8jORQgAk2Wqm80Na5SARE6T4zf/RJbFEnt1QyHoOOfua4cJWpQbUb6X2JCbwvlG
QivPH85Fy2wN5x2FY1zKAmBFk+n/KEkNwVUk0ZZy5c1e0PFsz4y27xiMHPCtmIrQ
6/FX9gyns3N8ZF1DiWKKgZp07/TuCwHQIjw0fLCfc1U3OLW8MIWD+SDQnQ7SRmI1
8MKIGvAWMfTWaHc3hE1E9Y68ZC9pQldkL6CL4ql+xUMDRfDN/31ZJqbrqZTZIXF0
g9MZXfdiSlzYbiacQjJbCeCndXed1sU5mMKeAS5I+Q0Zdq2oeriUqYZNdYX+nGr6
AtivoRwCD5b7SUCNn2KfB1D9SlqhVA==
=rFwe
-----END PGP SIGNATURE-----

--+l0CA1IAYU/JcXZ5--


