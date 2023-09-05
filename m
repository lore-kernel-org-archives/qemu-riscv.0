Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F0EC83F3E
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 15:45:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdYDR-0003AD-9Z; Tue, 05 Sep 2023 11:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qdYDP-00039e-TX
 for qemu-riscv@nongnu.org; Tue, 05 Sep 2023 11:43:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qdYDN-0006R2-8z
 for qemu-riscv@nongnu.org; Tue, 05 Sep 2023 11:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693928620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6s8//+/Gdm7BdyAUWTQYfQUByLn0FTr02vmOUEy9LRU=;
 b=EAk8K/YEOstfWlUot4wjydOKtJ2HnrBzguitVm+ghCsYmLK3jjcLkCHZyAhqAyCqMEuGtP
 P90nqqWFMJKwBmmo8MUZsTKJe/mPe4f8i8iXpdOXEdscuGtb1XG11rS/iLoPXY8TKkwqdr
 g5AQ/kDf6M3rZza4M8K1yZFhAzE6zTM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-4JZkDLrXNrudVAr9BG_Avw-1; Tue, 05 Sep 2023 11:43:36 -0400
X-MC-Unique: 4JZkDLrXNrudVAr9BG_Avw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F09C028237D0;
 Tue,  5 Sep 2023 15:43:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8492D1460FE5;
 Tue,  5 Sep 2023 15:43:34 +0000 (UTC)
Date: Tue, 5 Sep 2023 11:08:40 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL v2 00/40] Misc patches for 2023-08-31
Message-ID: <20230905150840.GA286488@fedora>
References: <20230831135642.75413-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WQgvziynjXNvFRKq"
Content-Disposition: inline
In-Reply-To: <20230831135642.75413-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--WQgvziynjXNvFRKq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--WQgvziynjXNvFRKq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmT3RHcACgkQnKSrs4Gr
c8gkvAf7BcrO9DMOmNJBV7xki1hIpzff5MHTdau6Rlam7B7E9EiYbzHaJq5V5TXL
NtO8U1Uh574q+JynlDyHhqYjjEao+0goCOXwUfTQeRlnbA1fD94MwLKLyfMwIR+O
WMKs7iGx8so/rhref/23kdtInAOAb1R3GMv+ZHpOCNyEErkhwUHaX6CmhSdpnrYC
DGMx6U34l10aI/hzYwRU9vwQM2PngmFPoHRR4MxqWZI7l/74c8DV83HN5tCrF31d
kPyoYRbyv6k4XbAtat+H9RDWoACQfAeBiPsLc25TAoNbI6uOjspOLa0MlvEogbAr
OAzpV4Loi7mDs+rSAATz1JJnTM708g==
=Y4m6
-----END PGP SIGNATURE-----

--WQgvziynjXNvFRKq--


