Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A92DC4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 14:23:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0jS8-0002bi-Lp; Wed, 08 Nov 2023 09:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r0jS7-0002ae-BR
 for qemu-riscv@nongnu.org; Wed, 08 Nov 2023 09:22:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1r0jRy-0003i1-Sg
 for qemu-riscv@nongnu.org; Wed, 08 Nov 2023 09:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699453354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9zqZN1TmCYfXbnstueXxaQOLMGx7hGZPWIhTXGDeicc=;
 b=S15Y0+JINqcUKCwzagCA3l/E1FmmIBMTSVN0aSaj606QelcPxEqLbBtXTPfbbV5pZXOiVc
 x5AmIvZmWqFfkQPGuAiSHaZ7GnY/T82/O8CNiHK+sKLg02c9DdlHfcE1EAQRYUF/J7F2LV
 9SjVb/rWmZdQelF78Ueu2t2gRn1grnY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-520-uqhO5C0XPlyYbsXHZYvp6w-1; Wed,
 08 Nov 2023 09:22:27 -0500
X-MC-Unique: uqhO5C0XPlyYbsXHZYvp6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC1EF1C0F2E0;
 Wed,  8 Nov 2023 14:22:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27474492BFA;
 Wed,  8 Nov 2023 14:22:25 +0000 (UTC)
Date: Wed, 8 Nov 2023 22:19:33 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL 00/75] Misc HW/UI patches for 2023-11-07
Message-ID: <20231108141933.GA1062171@fedora>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DH9pVl2yFZidxGJ/"
Content-Disposition: inline
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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


--DH9pVl2yFZidxGJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--DH9pVl2yFZidxGJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVLmPUACgkQnKSrs4Gr
c8gO9wf9G16dTrkIDu9mGXtMOvPn1A8QNnmngZ5fnEa0ATHy3HG+b6PRDq2aCN4K
9ips04RaPDNDCFccLXlbo6IDJ3MzQIa6d9IGMhMCy0Nqj257Vo5gARuZFxK/ObUZ
1YF/o9pnkSB/zuyHZPLmX1BWfLJNtFwZSyX15YdwvrjuxxTTmzLelyItoOhEzQER
E1tMVeQxM7uX6XEnwv6a3Hlf9XMRxiWbxRY4u+GoE9zYSjJ4W3SsX5G5TFfJXyRI
lUoYjJDXmv/Rs9neELUXLjZDQ51/9qNKf5p2X3m+hNM0JyKHeXG8aKmtMz3en+pw
iLbnu88ioIpjsXZXzmzHkFLYMdEbYg==
=dOGQ
-----END PGP SIGNATURE-----

--DH9pVl2yFZidxGJ/--


