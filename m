Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jY5Vg-0006e0-M9
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 06:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jY5Ve-0006Z1-Fs
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 06:18:06 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36534
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jY5Vd-0002O8-K2
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 06:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589192284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uohFe/CHE9N14X4nOXOgWiZ9U3xHrL7OAGJhDPnCVU=;
 b=N4B2iYwFcf+RcSlnps3ybMcfL0i2GaTg6MVueHpeUA+fIQa7Y+eFW9A28plfn5PWC5obwG
 TJ6q52U+pmWBBvHaElKR6fqMBlyRbr0SsPsGQLLmYNLolbUBV7jFceIfuRfhPBSBpLVB3o
 qGFMZwyZX1tyNrtLg3L7HA4YfcjGSNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-IfgDxwMvOJmNuH2c8r3lzQ-1; Mon, 11 May 2020 06:18:01 -0400
X-MC-Unique: IfgDxwMvOJmNuH2c8r3lzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B6B18FE860;
 Mon, 11 May 2020 10:17:57 +0000 (UTC)
Received: from gondolin (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 036769323;
 Mon, 11 May 2020 10:17:47 +0000 (UTC)
Date: Mon, 11 May 2020 12:17:45 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max Filippov
 <jcmvbkbc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Stafford Horne <shorne@gmail.com>, Roman
 Bolshakov <r.bolshakov@yadro.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-s390x@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, Aurelien Jarno
 <aurelien@aurel32.net>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>, Richard Henderson
 <rth@twiddle.net>, David Gibson <david@gibson.dropbear.id.au>, David
 Hildenbrand <david@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 02/11] sysemu/accel: Restrict machine methods to
 system-mode
Message-ID: <20200511121745.42cea0ab.cohuck@redhat.com>
In-Reply-To: <20200509130910.26335-3-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-3-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 01:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 11 May 2020 10:18:06 -0000

On Sat,  9 May 2020 15:09:01 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Restrict init_machine(), setup_post() and has_memory()
> to system-mode.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/sysemu/accel.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


