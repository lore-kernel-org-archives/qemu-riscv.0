Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVwKA-0003lB-SK
	for mharc-qemu-riscv@gnu.org; Tue, 05 May 2020 08:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jVwK9-0003j6-Ap
 for qemu-riscv@nongnu.org; Tue, 05 May 2020 08:05:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40198
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jVwK8-0006Wh-ME
 for qemu-riscv@nongnu.org; Tue, 05 May 2020 08:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588680320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZRMwJ0l3pA4bkiIht/Igryh6u3Owd0J32A4vjL/9UA=;
 b=XnPAorvHAG+czAMMza16/luLHbsSRlzdSHpKgB+wXgMcET7QR/PMc3RXT5lWQrIaipVJ8e
 E9XoJoZwcWySjoIV1N66IwrzRFFrjqbyxPG9X0vqWZPih3J1JutfhlDFFIm0A7seeTWL+6
 CFvqf6MEZYEPi1XYkYWSculan0NXCr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-sSC1G_5aPW-V_m9GQvYNXw-1; Tue, 05 May 2020 08:05:18 -0400
X-MC-Unique: sSC1G_5aPW-V_m9GQvYNXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C939D107ACCA;
 Tue,  5 May 2020 12:05:15 +0000 (UTC)
Received: from gondolin (ovpn-112-219.ams2.redhat.com [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8D506295B;
 Tue,  5 May 2020 12:05:05 +0000 (UTC)
Date: Tue, 5 May 2020 14:05:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>, Sagar
 Karandikar <sagark@eecs.berkeley.edu>, Eduardo Habkost
 <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, David
 Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 11/12] target/s390x: Restrict
 CpuClass::get_crash_info() to system-mode
Message-ID: <20200505140503.2adb9a8e.cohuck@redhat.com>
In-Reply-To: <20200504152922.21365-12-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
 <20200504152922.21365-12-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:38
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
X-List-Received-Date: Tue, 05 May 2020 12:05:21 -0000

On Mon,  4 May 2020 17:29:21 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/s390x/cpu.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


